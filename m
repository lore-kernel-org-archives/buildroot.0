From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:11:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: test for SYSV IPC
 support
In-Reply-To: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
References: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
Message-ID: <1fec0204-e9a3-412f-a52c-3e8c30c47261@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/09/2019 05:58, Matt Weber wrote:
> fakeroot can be built to either use SYSV IPC or TCP for message passing.
> 
> A bug was discovered where Microsoft Windows 10 Services for Linux
> doesn't include support for SYSV IPC MsgQ.  This patch adds support to
> detect this case and automatically build fakeroot to use the TCP
> transport instead (It is assumed a TCP transport would definitely have
> more overhead then MsgQs so the default wasn't changed to TCP).
> 
> Fixes
> https://bugs.busybox.net/show_bug.cgi?id=11366
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>


 Both applied to master, thanks. But see below.

[snip]
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 4aa27a1b0c..2c1e4ea1c5 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -8,7 +8,7 @@ FAKEROOT_VERSION = 1.20.2
>  FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
>  FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
>  
> -HOST_FAKEROOT_DEPENDENCIES = host-acl
> +HOST_FAKEROOT_DEPENDENCIES = host-acl host-automake host-autoconf host-libtool
>  # Force capabilities detection off
>  # For now these are process capabilities (faked) rather than file
>  # so they're of no real use
> @@ -16,6 +16,22 @@ HOST_FAKEROOT_CONF_ENV = \
>  	ac_cv_header_sys_capability_h=no \
>  	ac_cv_func_capset=no
>  
> +# We apply a patch to detect the availability of SysV IPC Message Q's via
> +# autoconf since some hosts may not have that feature implemented, and
> +# fakeroot defaults to that unless explicitely told otherwise.
> +# This means we need to run autoreconf after patching.
> +# The source tree seems to have a custom bootstrap script to do this however
> +# and it does some non-standard things, so the built-in _AUTORECONF hook does
> +# not work out of the box.
> +# Instead, we replicate the useful bits here, and then run the autoreconf hook
> +# explicitely.
> +define HOST_FAKEROOT_BOOTSTRAP
> +	test -d $(@D)/build-aux || mkdir $(@D)/build-aux
> +	test -f $(@D)/ltmain.sh || (cd $(@D) && exec $(LIBTOOLIZE) --install --force)
> +	$(AUTORECONF_HOOK)
> +endef
> +HOST_FAKEROOT_PRE_CONFIGURE_HOOKS += HOST_FAKEROOT_BOOTSTRAP

 All this complexity isn't needed, you only need to create the build-aux
directory in a post-patch hook. So I changed this into:

+# 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
+HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING

+define HOST_FAKEROOT_BUILD_AUX
+       mkdir -p $(@D)/build-aux
+endef
+HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX
+
 $(eval $(host-autotools-package))


 Regards,
 Arnout

> +
>  FAKEROOT_LICENSE = GPL-3.0+
>  FAKEROOT_LICENSE_FILES = COPYING
>  
> 
