From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2020 22:39:37 +0200
Subject: [Buildroot] [git commit] package/keepalived: ipset support only
 makes sense when iptables is enabled
Message-ID: <20200815203327.22514855CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97b3e2be0cb53415ab20ba4ae0d8638c087f7819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In keepalived, ipset is only used when iptables support is
enabled. The configure.ac script is quite convoluted, but one can
clearly see:

AS_IF([test .$enable_iptables != .no],
  [
   ... testing for iptables ...
    if test $USE_IPTABLES = Yes; then
      dnl ----[Check for ipset libraries]----
      SAV_CPPFLAGS="$CPPFLAGS"
      CPPFLAGS="$CPPFLAGS $kernelinc"
      if test "${enable_libipset}" != no; then
      ... testing for libipset ...
    fi
  ]

So, the libipset library is only tested and used if iptables is
enabled. This is also visible by the code that shows at the end of the
configure script which features are enabled:

echo "Use iptables             : ${USE_IPTABLES}"
if test .$USE_IPTABLES = .Yes; then
  echo "Use libipset             : ${USE_LIBIPSET}"
fi

Once again, the libipset support only makes sense when iptables is
enabled.

However, the configure.ac script also has some logic to detect if a
--<something>-libipset option is passed while iptables is enabled:

AS_IF([test .$enable_iptables = .no],
    AS_IF([test .$enable_libipset != .], [AC_MSG_ERROR([disable-libipset requires vrrp and iptables])])
  )

The error message is quite misleading because it is in fact displayed
as soon as a --<something>-libipset is passed not just
--disable-libipset.

In the context of Buildroot, we are always passing a
--<something>-libipset, regardless of whether iptables support is
enabled or not, which makes the build error out:

configure: error: disable-libipset requires vrrp and iptables

This commit fixes that by enclosing the libipset logic inside the
iptables condition. When iptables is not available, we pass
--disable-iptables and that's it, nothing else is needed. When
iptables is available, we pass --enable-iptables *and*
--enable-libipset or --disable-libipset depending on the availability
of libipset.

This has been tested successfully with the following combinations:

 - keepalived, without iptables or libipset
 - keepalived, with iptables, but without libipset
 - keepalived, without iptables, but with libipset. In this case
   libipset is obviously not used.
 - keepalived, with iptables and with libipset. Both are used. Note
   that you will not see the keepalived binary linked with libipset.so
   in "readelf -d" because keepalived dlopen()s the libipset.so
   library by default.

Fixes:

  http://autobuild.buildroot.org/results/a1712b2cc3ad878e6876325ec7d4c434d0d9d11b/
  (case with --disable-libipset --disable-iptables)

  http://autobuild.buildroot.net/results/4567e3b0a0510e8a615781178ff5bbbd835a92c3/
  (case with --enable-libipset --disable-iptables)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/keepalived/keepalived.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index df1ab6d306..1a42d0c880 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -32,16 +32,16 @@ else
 KEEPALIVED_CONF_OPTS += --disable-libnl
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+KEEPALIVED_DEPENDENCIES += iptables
+KEEPALIVED_CONF_OPTS += --enable-iptables
+# ipset support only makes sense when iptables support is enabled.
 ifeq ($(BR2_PACKAGE_IPSET),y)
 KEEPALIVED_DEPENDENCIES += ipset
 KEEPALIVED_CONF_OPTS += --enable-libipset
 else
 KEEPALIVED_CONF_OPTS += --disable-libipset
 endif
-
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
-KEEPALIVED_DEPENDENCIES += iptables
-KEEPALIVED_CONF_OPTS += --enable-iptables
 else
 KEEPALIVED_CONF_OPTS += --disable-iptables
 endif
