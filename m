From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:40:27 +0200
Subject: [Buildroot] [git commit] haveged: for sparc we need generic
	clockgettime
Message-ID: <20150809094033.1352C817E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef3d0426f360696686689541e11aa8f467c43a03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes autobuilder error:
http://autobuild.buildroot.net/results/5b8bbc30f347140309ab2f81e1fe50f517356a3e/

As sparcv9 assembly is used, we need to enable generic clock_gettime
for sparcv8 systems.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/haveged/haveged.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index c68f766..66d69a6 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -9,6 +9,10 @@ HAVEGED_SITE = http://www.issihosts.com/haveged
 HAVEGED_LICENSE = GPLv3+
 HAVEGED_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+HAVEGED_CONF_OPTS += --enable-clock_gettime=yes
+endif
+
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged
