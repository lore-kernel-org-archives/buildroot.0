From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Aug 2016 06:23:35 -0500
Subject: [Buildroot] [PATCH v2] lxc: version bump to 2.0.3
In-Reply-To: <8623D021-CE57-4D72-B22A-D757B61BE234@gmail.com>
References: <1470935670-9376-1-git-send-email-matthew.weber@rockwellcollins.com>
 <8623D021-CE57-4D72-B22A-D757B61BE234@gmail.com>
Message-ID: <CANQCQpZAjLk6DGDucUWdA2m3zc3_xMp7PFABm0vEAVGxpKXONw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khem,

On Aug 11, 2016 11:56 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
>
> > On Aug 11, 2016, at 10:14 AM, Matt Weber <
matthew.weber@rockwellcollins.com> wrote:
> >
> > From: Judd Meinders <judd.meinders@rockwellcollins.com>
> >
> > Removed IPv6 and werror configure.ac patch(s) as
> > changes where incorporated upstream.
>
> This should be tested with musl.

Will do.

>
> >
> > Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >
> > v1 -> v2
> > [Thomas
> > - Removed AUTORECONF as configure.ac patch removal eliminated
> >   need to regenerate configure script
> > ---
> > package/lxc/0001-drop-werror.patch                 | 16 --------
> > .../0002-Fix-redefinition-of-struct-in6_addr.patch | 43
----------------------
> > package/lxc/lxc.hash                               |  2 +-
> > package/lxc/lxc.mk                                 |  4 +-
> > 4 files changed, 2 insertions(+), 63 deletions(-)
> > delete mode 100644 package/lxc/0001-drop-werror.patch
> > delete mode 100644
package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
> >
> > diff --git a/package/lxc/0001-drop-werror.patch
b/package/lxc/0001-drop-werror.patch
> > deleted file mode 100644
> > index d2a8673..0000000
> > --- a/package/lxc/0001-drop-werror.patch
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -Don't do -Werror it breaks builds on some scenarios with trivialities.
> > -
> > -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > -
> > -diff -Nura lxc-lxc-1.0.4/configure.ac lxc-lxc-1.0.4.orig/configure.ac
> > ---- lxc-lxc-1.0.4.orig/configure.ac  2014-07-04 10:31:19.821029891
-0300
> > -+++ lxc-lxc-1.0.4/configure.ac       2014-06-13 14:07:45.000000000
-0300
> > -@@ -560,7 +560,7 @@
> > - LXC_CHECK_TLS
> > -
> > - if test "x$GCC" = "xyes"; then
> > --    CFLAGS="$CFLAGS -Wall -Werror"
> > -+    CFLAGS="$CFLAGS -Wall"
> > - fi
> > -
> > - # Files requiring some variable expansion
> > diff --git a/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
b/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
> > deleted file mode 100644
> > index b48ece3..0000000
> > --- a/package/lxc/0002-Fix-redefinition-of-struct-in6_addr.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -From 245bba9aadf8e7aea487b6fbd851f86c75524552 Mon Sep 17 00:00:00 2001
> > -From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> > -Date: Thu, 19 May 2016 21:51:27 +0200
> > -Subject: [PATCH] Fix redefinition of struct in6_addr
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=UTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -struct in6_addr is both defined in the C library header <netinet/in.h>
> > -and the Linux kernel header <linux/in6.h>.
> > -
> > -lxc_user_nic.c includes both <netinet/in.h> and <linux/if_bridge.h>.
The
> > -later one includes <linux/in6.h>.
> > -
> > -This breaks build with the musl libc:
> > -  error: redefinition of ?struct in6_addr?
> > -
> > -As lxc_user_nic.c does not use any references from <linux/if_bridge.h>
it
> > -is safe to remove this header.
> > -
> > -Upstream status: Pending
> > -https://github.com/lxc/lxc/pull/1029
> > -
> > -Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ----
> > - src/lxc/lxc_user_nic.c | 1 -
> > - 1 file changed, 1 deletion(-)
> > -
> > -diff --git a/src/lxc/lxc_user_nic.c b/src/lxc/lxc_user_nic.c
> > -index 87780ca..0cb38ba 100644
> > ---- a/src/lxc/lxc_user_nic.c
> > -+++ b/src/lxc/lxc_user_nic.c
> > -@@ -41,7 +41,6 @@
> > - #include <net/if.h>
> > - #include <net/if_arp.h>
> > - #include <netinet/in.h>
> > --#include <linux/if_bridge.h>
> > - #include <linux/netlink.h>
> > - #include <linux/rtnetlink.h>
> > - #include <linux/sockios.h>
> > ---
> > -2.8.2
> > -
> > diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
> > index 7470101..3dee7fc 100644
> > --- a/package/lxc/lxc.hash
> > +++ b/package/lxc/lxc.hash
> > @@ -1,2 +1,2 @@
> > # Locally calculated
> > -sha256
 9588ad1b04e114ee7370f690c65131e28098b28d2521d97c73557d11897ed0be
lxc-1.1.5.tar.gz
> > +sha256
82df40a0cdd44639ee677d560be95348de48afa93a10a20e959dadb4431ee8d6
lxc-2.0.3.tar.gz
> > diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
> > index 8190969..b1cd385 100644
> > --- a/package/lxc/lxc.mk
> > +++ b/package/lxc/lxc.mk
> > @@ -4,13 +4,11 @@
> > #
> >
################################################################################
> >
> > -LXC_VERSION = 1.1.5
> > +LXC_VERSION = 2.0.3
> > LXC_SITE = https://linuxcontainers.org/downloads/lxc
> > LXC_LICENSE = LGPLv2.1+
> > LXC_LICENSE_FILES = COPYING
> > LXC_DEPENDENCIES = libcap host-pkgconf
> > -# we're patching configure.ac
> > -LXC_AUTORECONF = YES
> > LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
> >       --disable-lua --disable-python \
> >       $(if $(BR2_PACKAGE_BASH),,--disable-bash)
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160812/4ace6ae1/attachment.html>
