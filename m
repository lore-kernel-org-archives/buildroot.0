From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2019 08:28:21 +0200
Subject: [Buildroot] [PATCH v2] fs/tar: explicitly set extended header
 values to ensure binary reproducibility
In-Reply-To: <20190702173559.4423-1-itsatharva@gmail.com> (Atharva Lele's
 message of "Tue, 2 Jul 2019 23:05:59 +0530")
References: <20190702173559.4423-1-itsatharva@gmail.com>
Message-ID: <87a7duz52y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Atharva" == Atharva Lele <itsatharva@gmail.com> writes:

 > Since we use --xattrs-include='*' to include all extended attributes,
 > tar creates a PAX formatted archive. The archive metadata captures atime
 > and ctime of files. To fix this, GNU recommends that we pass this added
 > argument to tar to create binary reproducible packages. Setting of mtime
 > is handled in fs/common.mk using touch on all files.

 > Diffoscope output pre-change: https://gitlab.com/snippets/1871111
 > Diffoscope output after change is blank i.e. binary reproducibile rootfs
 > is created.

 > GNU Recommendation: https://www.gnu.org/software/tar/manual/tar.html#SEC147

 > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Added comment about mtime handling
 > ---
 >  fs/tar/tar.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
 > index 4c6327ace8..f6d11baa84 100644
 > --- a/fs/tar/tar.mk
 > +++ b/fs/tar/tar.mk
 > @@ -8,6 +8,10 @@ TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
 >  ROOTFS_TAR_DEPENDENCIES = $(BR2_TAR_HOST_DEPENDENCY)
 
 > +ifeq ($(BR2_REPRODUCIBLE),y)
 > +TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
 > +endif

It would be good to add a short comment saying something like

# don't store atime/ctime

Is there any use case for ever storing these in the rootfs, or should we
just do this fix unconditionally?

-- 
Bye, Peter Korsgaard
