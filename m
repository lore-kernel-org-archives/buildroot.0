From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 23:11:55 +0100
Subject: [Buildroot] [PATCH] pv: fix minisetlocale related build failure
Message-ID: <1392934315-27932-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pv configure script is somewhat stupid: if it cannot find the host
gettext tool msgfmt, it concludes that gettext is not available, and
provides its own minimal version. Unfortunately, this minimal version
conflicts with the available target gettext. We fix this by ensuring
that host-gettext is built if gettext support is enabled, by adding it
to the dependencies.

Fixes:

  http://autobuild.buildroot.org/results/d30/d30db79190f2cf8953751d55a5d34644f60daec4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pv/pv.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index ab5190a..0ba8f5f 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -9,7 +9,13 @@ PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = Artistic-2.0
 PV_LICENSE_FILES = doc/COPYING
-PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+# pv configure script is somewhat stupid: if it cannot find the host
+# gettext tool msgfmt, it concludes that gettext is not available, and
+# provides its own minimal version. Unfortunately, this minimal
+# version conflicts with the available target gettext. We fix this by
+# ensuring that host-gettext is built if gettext support is enabled;
+PV_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext)
 
 # While 'pv' uses autoconf, it does not use automake for its
 # makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
-- 
1.8.3.2
