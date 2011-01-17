From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] bash: build after busybox
Message-ID: <20110117202413.9C4538A6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0cce9228a1bcf1c228a75da366d110cf52c0d39d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure bash builds after busybox when it's enabled to override
busybox's /bin/sh symlink with bash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bash/bash.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index d7bb699..2bcf0c4 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -8,6 +8,11 @@ BASH_VERSION = 4.1
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses
 
+# Make sure we build after busybox so that /bin/sh links to bash
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+BASH_DEPENDENCIES += busybox
+endif
+
 # Save the old sh file/link if there is one and symlink bash->sh
 define BASH_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-- 
1.7.3.4
