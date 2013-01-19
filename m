From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Jan 2013 14:52:33 +0100
Subject: [Buildroot] [PATCH] httping: remove redundant 'override CFLAGS'
	patch
In-Reply-To: <87ehhnudd9.fsf@dell.be.48ers.dk>
References: <87ehhnudd9.fsf@dell.be.48ers.dk>
Message-ID: <1358603554-6869-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

It is not necessary to override CFLAGS when CFLAGS is passed through
the environment rather than as an argument to make.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/httping/httping-override-cflags.patch |   53 -------------------------
 package/httping/httping.mk                    |    4 +-
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 package/httping/httping-override-cflags.patch

diff --git a/package/httping/httping-override-cflags.patch b/package/httping/httping-override-cflags.patch
deleted file mode 100644
index a3cf59d..0000000
--- a/package/httping/httping-override-cflags.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 66f5811dd45fa27a7bfacf946dfefd16d765bb4d Mon Sep 17 00:00:00 2001
-From: Gilles Talis <gilles.talis@gmail.com>
-Date: Mon, 14 Jan 2013 11:48:00 -0800
-Subject: [PATCH] allow CFLAGS/LDFLAGS to be overriden from command line
-
-Ensure required CFLAGS/LDFLAGS are appended to those provided in command line
-
-Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
----
- Makefile |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4c4f6a8..fdbb4cb 100644
---- a/Makefile
-+++ b/Makefile
-@@ -19,7 +19,7 @@ TARGET=httping
- DEBUG=yes
- WFLAGS=-Wall -W
- OFLAGS=-O3
--CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\"
-+override CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\"
-
- PACKAGE=$(TARGET)-$(VERSION)
- PREFIX=/usr
-@@ -48,19 +48,19 @@ DOCS=license.txt license.OpenSSL readme.txt
- # TFO=yes
-
- ifeq ($(SSL),no)
--CFLAGS+=-DNO_SSL
-+override CFLAGS+=-DNO_SSL
- else
- OBJS+=mssl.o
--LDFLAGS+=-lssl -lcrypto
-+override LDFLAGS+=-lssl -lcrypto
- endif
-
- ifeq ($(TFO),yes)
--CFLAGS+=-DTCP_TFO
-+override CFLAGS+=-DTCP_TFO
- endif
-
- ifeq ($(DEBUG),yes)
--CFLAGS+=-D_DEBUG -ggdb
--LDFLAGS+=-g
-+override CFLAGS+=-D_DEBUG -ggdb
-+override LDFLAGS+=-g
- endif
-
- ifeq ($(ARM),yes)
---
-1.7.4.1
-
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 4c4d755..45478cf 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -16,11 +16,11 @@ HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
 	DEBUG=no
 
 define HTTPING_BUILD_CMDS
-	$(MAKE) $(HTTPING_MAKE_OPT) -C $(@D)
+	$(HTTPING_MAKE_OPT) $(MAKE) -C $(@D)
 endef
 
 define HTTPING_INSTALL_TARGET_CMDS
-	$(MAKE) $(HTTPING_MAKE_OPT) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(HTTPING_MAKE_OPT) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
 define HTTPING_CLEAN_CMDS
-- 
1.7.10.4
