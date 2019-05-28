From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 28 May 2019 12:15:37 -0500
Subject: [Buildroot] [PATCH] package/gcc: don't build a toolchain for
 powerpc with spe ABI with gcc >= 8.x
In-Reply-To: <20190526201542.18904-1-romain.naour@gmail.com>
References: <20190526201542.18904-1-romain.naour@gmail.com>
Message-ID: <CANQCQpZsSvHghgi6B1zvgENbXp4FyEi9+HCx5hJTr54QgMd7KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Sun, May 26, 2019 at 3:15 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> The powerpc*-*-*spe* support has been deprecated in GCC 8 [1] and has
> been removed in GCC 9 [2].
>
> While building with GCC 8, the build stop since we don't provide --enable-obsolete
> option.
>
> For now, keep powerpcspe support in Buildroot but only for older compiler
> up to GCC 7.
>
> Note: Although we can't select Glibc for powerpcspe since commit [4], this
> support has been removed for the next version of Glibc (the upcoming 2.30).
>
> [1] https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> [2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b31d0348ddada49453e3edaaf93a423fdc61dc79
> [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=a053e878494080f7070cf92890e546057236c9c9
> [4] https://git.buildroot.net/buildroot/commit/?id=5777e3ffd99132a57e3d29659850eec14b1625f8
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for sending the patch.  I hadn't got one sent out after I ran
into this while attempting to build an updated e500v1 toolchain.   To
bad we've hit end of life (products still viable with these processors
into the mid 20's)...

> ---
>  package/gcc/Config.in.host | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 8e22a4c155..b477fe56e7 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -66,6 +66,9 @@ config BR2_GCC_VERSION_8_X
>         bool "gcc 8.x"
>         # Broken or unsupported architectures
>         depends on !BR2_or1k
> +       # powerpc spe support has been deprecated since gcc 8.x.
> +       # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
> +       depends on !BR2_powerpc_SPE
>         select BR2_TOOLCHAIN_GCC_AT_LEAST_8
>
>  endchoice
> --
> 2.21.0
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
