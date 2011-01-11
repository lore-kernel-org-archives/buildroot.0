From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Jan 2011 14:40:47 -0300
Subject: [Buildroot] [PATCH] bash: build after busybox
Message-ID: <1294767647-8269-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure bash builds after busybox when it's enabled to override
busybox's /bin/sh symlink with bash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
