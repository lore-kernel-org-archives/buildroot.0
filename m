From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:30:38 +0100
Subject: [Buildroot] [git commit] trousers: Pass "-mno-compact-casesi" when
	building for ARCv1
Message-ID: <20161123223045.4187380E5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4cd8ceb9cfa908f3cdf0fffb94f1c854ddd24c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compact casesi patterns don't have a reload version. This causes build
failures of "trousers" package for ARC.

Current patch disables compact casesi patterns for ARCv1 (750D and 770D)
via passing "-mno-compact-casesi" option when compiling "trousers".

This change is a temporary workaround and the feature is going to be
fixed in the next ARC toolchain release version.

Fixes:
http://autobuild.buildroot.org/results/d2c/d2c16d8ba022b070c4dbeba5e7ea41f14d706691//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trousers/trousers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 3d9e0ba..4fc9499 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -18,6 +18,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TROUSERS_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_arc770d)$(BR2_arc750d),y)
+TROUSERS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-casesi"
+endif
+
 # The TrouSerS build system attempts to create the tss user and group
 # on the host system. Disable the user checking feature as a
 # workaround.
