From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 09:46:19 +0100
Subject: [Buildroot] [git commit master] qt: Re-enable workaround for
	building on x86 for x86 target, also check for x86_64
Message-ID: <20100118104253.14E91772DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc41dc5b8fbb637902dfaa0171deb5d6c63909e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: combined x86 + x86-64 logic, simplified]
Signed-off-by: Ormund Williams <ormundw@panix.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a3a466a..78b2eec 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -352,6 +352,16 @@ endif
 
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
+# x86x86fix
+# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
+# host. It's unclear if this would happen on other hosts.
+ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)
+QT_CONFIGURE+= -platform linux-g++
+endif
+endif
+# End of workaround.
+
 # Figure out what libs to install in the target
 QT_LIBS=#empty
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-- 
1.6.3.3
