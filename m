From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 16:05:27 +0200
Subject: [Buildroot] [git commit] triggerhappy: bumped to 0.5.0 to fix
	systemd unit
Message-ID: <20170507140555.DF949827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e23b1c9bb74bf1edf3f71d5c1e6e5e364e0821a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps the version of triggerhappy to 0.5.0
The systemd unit supplied by buildroot assumed that filename
globbing was supported by thd. But this was just recently
added. So with this version bump usage of "/dev/input/event*"
is now possible. Systemd Unit is adjusted accordingly.

eventtable.h patch was removed as this was patched upstream.

This patch fixes bug #9836.

Signed-off-by: Michael Heinemann <posted@heine.so>
---
 ...h-use-correct-array-sizes-to-fix-building.patch | 66 ----------------------
 package/triggerhappy/triggerhappy.hash             |  2 +-
 package/triggerhappy/triggerhappy.mk               |  2 +-
 package/triggerhappy/triggerhappy.service          |  2 +-
 4 files changed, 3 insertions(+), 69 deletions(-)

diff --git a/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch b/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch
deleted file mode 100644
index 80f2640..0000000
--- a/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From d3cfa80631a7e314fee9b2e0822e403fcf2a5c5c Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 31 Jul 2016 10:28:43 +0200
-Subject: [PATCH] eventtable.h: use correct array sizes to fix building against
- 4.7+ headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-During the 4.7 development cycle, commit 9a9b6aa6a8 (Input: add
-SW_PEN_INSERTED define) got added, which has the same numerical value as
-SW_MAX:
-
-+#define SW_PEN_INSERTED                0x0f  /* set = pen inserted */
-+#define SW_MAX                 0x0f
-
-This breaks the build as the SW_NAME array is sized using the SW_MAX macro:
-
-In file included from eventtable.h:21:0,
-                 from eventnames.c:11:
-evtable_SW.inc:17:1: error: array index in initializer exceeds array bounds
- EV_MAP(SW_PEN_INSERTED),
- ^
-evtable_SW.inc:17:1: error: (near initialization for ???SW_NAME???)
-
-The arrays should be sized using the <foo>_CNT (which is MAX+1) macros
-instead of <foo>_MAX.  These got added during the 2.6.24 development cycle,
-so it should be safe to do so unconditially:
-
-commit 7b19ada2ed3c1eccb9fe94d74b05e1428224663d
-Author: Jiri Slaby <jirislaby@gmail.com>
-Date:   Thu Oct 18 23:40:32 2007 -0700
-
-    get rid of input BIT* duplicate defines
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- eventtable.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/eventtable.h b/eventtable.h
-index 349d9d7..7cd99aa 100644
---- a/eventtable.h
-+++ b/eventtable.h
-@@ -8,15 +8,15 @@
- 
- #define EV_MAP( N ) [ N ] = #N
- 
--static const char *EV_NAME[EV_MAX] = {
-+static const char *EV_NAME[EV_CNT] = {
- #include "evtable_EV.inc"
- };
- 
--static const char *KEY_NAME[KEY_MAX] = {
-+static const char *KEY_NAME[KEY_CNT] = {
- #include "evtable_KEY.inc"
- #include "evtable_BTN.inc"
- };
- 
--static const char *SW_NAME[SW_MAX] = {
-+static const char *SW_NAME[SW_CNT] = {
- #include "evtable_SW.inc"
- };
--- 
-2.8.1
-
diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
index 17eefdb..5a1d767 100644
--- a/package/triggerhappy/triggerhappy.hash
+++ b/package/triggerhappy/triggerhappy.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6b01497377e522c368818c5f6c726362f42530e3dc24a01c6d77b1b4d6068308  triggerhappy-7e5abc69f215678e93a6b999524981c8b40bdcd9.tar.gz
+sha256 1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index a57f1a7..9f74c48 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRIGGERHAPPY_VERSION = 7e5abc69f215678e93a6b999524981c8b40bdcd9
+TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
 TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
 TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
diff --git a/package/triggerhappy/triggerhappy.service b/package/triggerhappy/triggerhappy.service
index 8449c1c..8431afe 100644
--- a/package/triggerhappy/triggerhappy.service
+++ b/package/triggerhappy/triggerhappy.service
@@ -2,7 +2,7 @@
 Description=Triggerhappy daemon
 
 [Service]
-ExecStart=/usr/sbin/thd --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --user nobody /dev/input/event*
+ExecStart=/usr/sbin/thd --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --user nobody --deviceglob /dev/input/event*
 Restart=always
 
 [Install]
