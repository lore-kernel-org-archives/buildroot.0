From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:39:40 +0100
Subject: [Buildroot] [PATCH] package/libselinux: fix build on old glibc
 with <fts.h> incompatible with LFS
In-Reply-To: <20191128180502.230424-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 28 Nov 2019 19:05:02 +0100")
References: <20191128180502.230424-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736e7f54j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > glibc versions prior to 2.23 have a <fts.h> implementation that is not
 > compatible with large file support, causing build failures such as:

 > In file included from selinux_restorecon.c:17:0:
 > /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 >  # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"

 > Prior to commit 3fce6f1c150dbe4be58d083008ca8dbe7257836e
 > ("package/libselinux: fix the build with Python 3.8"), we were not
 > passing PKG_PYTHON_DISTUTILS_ENV in the environment. But with
 > 3fce6f1c150dbe4be58d083008ca8dbe7257836e, we are now passing the
 > PKG_PYTHON_DISTUTILS_ENV variable, provided by pkg-python.mk, into the
 > build environment. While this is part of fixing the build of
 > libselinux with Python 3.8, it breaks the build because we are no
 > longer filtering out the -D_FILE_OFFSET_BITS=64 option from
 > CFLAGS. Indeed, while we do so at the beginning of libselinux.mk, it
 > gets overridden later by the addition of $(PKG_PYTHON_DISTUTILS_ENV).

 > To avoid this, we pass CFLAGS/LDFLAGS *after*
 > $(PKG_PYTHON_DISTUTILS_ENV) has been added. In practice, the
 > CFLAGS/LDFLAGS passed by $(PKG_PYTHON_DISTUTILS_ENV) are just
 > $(TARGET_CFLAGS) and $(TARGET_LDFLAGS), so we are not missing anything
 > specific.

 > Fixes:

 >   http://autobuild.buildroot.net/results/ef6ff91086a094eb25b145d66d072c6d2fc60154/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > This is an alternative solution compared to what Fabrice proposed in
 > http://patchwork.ozlabs.org/patch/1185307/. In Fabrice's proposal, I
 > am not a big fan of the split of PKG_PYTHON_DISTUTILS_ENV into two
 > variables, the split is a bit arbitrary, and seems to serve only the
 > case of libselinux.

 > So for now, I think a solution that affects only libselinux.mk is
 > probably more appropriate.

Agreed.

 > +++ b/package/libselinux/libselinux.mk
 > @@ -13,13 +13,10 @@ LIBSELINUX_DEPENDENCIES = libsepol pcre
 
 >  LIBSELINUX_INSTALL_STAGING = YES
 
 > -# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22.
 >  # Set SHLIBDIR to /usr/lib so it has the same value than LIBDIR, as a result
 >  # we won't have to use a relative path in 0002-revert-ln-relative.patch
 >  LIBSELINUX_MAKE_OPTS = \
 >  	$(TARGET_CONFIGURE_OPTS) \
 > -	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 > -	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
 >  	ARCH=$(KERNEL_ARCH) \
 >  	SHLIBDIR=/usr/lib
 
 > @@ -54,6 +51,14 @@ define LIBSELINUX_BUILD_PYTHON_BINDINGS
 >  endef
 >  endif # python || python3
 
 > +# Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc
 > +# 2.22. We set CFLAGS and LDFLAGS here because we want to win over the
 > +# CFLAGS/LDFLAGS definitions passed by $(PKG_PYTHON_DISTUTILS_ENV)
 > +# when the python binding is enabled.
 > +LIBSELINUX_MAKE_OPTS += \
 > +	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 > +	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \

Fixed the:

package/libselinux/libselinux.mk:60: remove trailing backslash

And applied, thanks.

-- 
Bye, Peter Korsgaard
