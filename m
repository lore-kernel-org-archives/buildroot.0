From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 16 Feb 2015 16:12:17 +0000
Subject: [Buildroot] [PATCH] make: disable the 'load' operation for static
	builds
Message-ID: <1424103137-425-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable the 'load' operation for static builds since it needs dlopen and
friends. Otherwise it will fail with an error message like this one:

load.o: In function `load_file':
load.c:(.text+0x2a8): undefined reference to `dlopen'
load.c:(.text+0x2c4): undefined reference to `dlerror'
load.c:(.text+0x308): undefined reference to `dlsym'
load.c:(.text+0x33c): undefined reference to `dlopen'
load.c:(.text+0x35c): undefined reference to `dlsym'
load.c:(.text+0x380): undefined reference to `dlopen'
load.c:(.text+0x39c): undefined reference to `dlopen'
load.c:(.text+0x3a0): undefined reference to `dlerror'
load.c:(.text+0x42c): undefined reference to `dlsym'
load.c:(.text+0x470): undefined reference to `dlsym'
load.c:(.text+0x48c): undefined reference to `dlerror'
load.o: In function `unload_file':
load.c:(.text+0x63c): undefined reference to `dlclose'
collect2: error: ld returned 1 exit status

Fixes:

  http://autobuild.buildroot.net/results/9e3/9e39039b6db79a46990cd9bdcb179289e38d9f31/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/make/make.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index 20469ba..d643fb0 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -11,4 +11,9 @@ MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 MAKE_LICENSE = GPLv3+
 MAKE_LICENSE_FILES = COPYING
 
+# Disable the 'load' operation for static builds since it needs dlopen
+ifeq ($(BR2_STATIC_LIBS),y)
+	MAKE_CONF_OPTS += --disable-load
+endif
+
 $(eval $(autotools-package))
-- 
1.7.1
