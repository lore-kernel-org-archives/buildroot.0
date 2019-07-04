From: Atharva Lele <itsatharva@gmail.com>
Date: Thu, 04 Jul 2019 23:52:41 +0530
Subject: [Buildroot] [PATCH v2] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <87a7duz52y.fsf@dell.be.48ers.dk>
References: <20190702173559.4423-1-itsatharva@gmail.com>
 <87a7duz52y.fsf@dell.be.48ers.dk>
Message-ID: <1831896.i2y51H8qiE@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, July 4, 2019 11:58:21 AM IST Peter Korsgaard wrote:
> >>>>> "Atharva" == Atharva Lele <itsatharva@gmail.com> writes:
>  > Since we use --xattrs-include='*' to include all extended attributes,
>  > tar creates a PAX formatted archive. The archive metadata captures atime
>  > and ctime of files. To fix this, GNU recommends that we pass this added
>  > argument to tar to create binary reproducible packages. Setting of mtime
>  > is handled in fs/common.mk using touch on all files.
>  > 
>  > Diffoscope output pre-change: https://gitlab.com/snippets/1871111
>  > Diffoscope output after change is blank i.e. binary reproducibile rootfs
>  > is created.
>  > 
>  > GNU Recommendation:
>  > https://www.gnu.org/software/tar/manual/tar.html#SEC147
>  > 
>  > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
>  > 
>  >  fs/tar/tar.mk | 4 ++++
>  >  1 file changed, 4 insertions(+)
>  > 
>  > diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
>  > index 4c6327ace8..f6d11baa84 100644
>  > --- a/fs/tar/tar.mk
>  > +++ b/fs/tar/tar.mk
>  > @@ -8,6 +8,10 @@ TAR_OPTS := $(call
>  > qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS)) > 
>  >  ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
>  > 
>  > +ifeq ($(BR2_REPRODUCIBLE),y)
>  > +TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
>  > +endif
> 
> It would be good to add a short comment saying something like
> 
> # don't store atime/ctime
> 

Definitely. Will do in a v3.

> Is there any use case for ever storing these in the rootfs, or should we
> just do this fix unconditionally?

Personally, I can't think of a reason why we'd want to store atime/ctime in 
the rootfs. I think they got included when we added --xattrs-include='*'

Arnout, Matt and Yann: any thoughts on that?

-- 
Regards,
Atharva Lele
