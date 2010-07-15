From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Jul 2010 12:46:15 +0000 (UTC)
Subject: [Buildroot] [Bug 2221] Qt does not compile (dependencies not taken
 into account?)
In-Reply-To: <bug-2221-163@https.bugs.busybox.net/>
References: <bug-2221-163@https.bugs.busybox.net/>
Message-ID: <20100715124615.4644882A57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2221

Luca Ceresoli <luca.ceresoli@tiscali.it> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |luca.ceresoli at tiscali.it

--- Comment #1 from Luca Ceresoli <luca.ceresoli@tiscali.it>  ---
This patch seems to solve both Nataraj's and my issue.

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e2ebbb2..4bfd67a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -115,6 +115,7 @@ QT_CONFIGURE += -no-gfx-multiscreen
 endif
 ifeq ($(BR2_PACKAGE_QT_GFX_DIRECTFB),y)
 QT_CONFIGURE += -qt-gfx-directfb
+QT_DEP_LIBS+=directfb
 else
 QT_CONFIGURE += -no-gfx-directfb
 endif
@@ -273,6 +274,7 @@ QT_CONFIGURE+= -qt-sql-ibase
 endif
 ifeq ($(BR2_PACKAGE_QT_MYSQL),y)
 QT_CONFIGURE+= -qt-sql-mysql
+QT_DEP_LIBS+=mysql
 endif
 ifeq ($(BR2_PACKAGE_QT_ODBC),y)
 QT_CONFIGURE+= -qt-sql-odbc

I could compile buildroot, but I'm not sure this patch really solves the bug.
Given this is a precedence problem I could just have been lucky with make.

In fact the value of QT_DEP_LIBS is used only once (line 608):

 qt: $(QT_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4

Which does *not* force make to build the libs before libQtCore.so.4.
According to the makefile, the unpack/config/compile and the following
libQtCore.so.4 steps do not depend on $(QT_DEP_LIBS).

Am I missing something?

Luca

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
