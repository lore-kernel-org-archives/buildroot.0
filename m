From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Jul 2019 08:23:07 -0500
Subject: [Buildroot] [PATCH v2] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <20190702173559.4423-1-itsatharva@gmail.com>
References: <20190702173559.4423-1-itsatharva@gmail.com>
Message-ID: <CANQCQpYU16Lw36=Mov_A0bowwGq_G-3HY4EnC1hrdYG3HzA4NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva,

On Tue, Jul 2, 2019 at 12:37 PM Atharva Lele <itsatharva@gmail.com> wrote:
>
> Since we use --xattrs-include='*' to include all extended attributes,
> tar creates a PAX formatted archive. The archive metadata captures atime
> and ctime of files. To fix this, GNU recommends that we pass this added
> argument to tar to create binary reproducible packages. Setting of mtime
> is handled in fs/common.mk using touch on all files.
>
> Diffoscope output pre-change: https://gitlab.com/snippets/1871111
> Diffoscope output after change is blank i.e. binary reproducibile rootfs
> is created.
>
> GNU Recommendation: https://www.gnu.org/software/tar/manual/tar.html#SEC147
>
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
> Changes v1 -> v2:
>   - Added comment about mtime handling
> ---
>  fs/tar/tar.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> index 4c6327ace8..f6d11baa84 100644
> --- a/fs/tar/tar.mk
> +++ b/fs/tar/tar.mk
> @@ -8,6 +8,10 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
>
>  ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
>
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
> +endif
> +
>  define ROOTFS_TAR_CMD
>         (cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
>                 tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
