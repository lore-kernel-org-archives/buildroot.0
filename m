From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:17:49 +0100
Subject: [Buildroot] [git commit] httping: don't override optimization level,
	correctly disable debug support
Message-ID: <20130120202432.DA96F82750@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9cbc45b92d760c1c7651ae48bf8d29e55533e32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The httping makefile by default appends -O3 to CFLAGS, overriding the
optimization flags set in Buildroot, so pass OFLAGS= to disable this.

The DEBUG=no argument has to be passed on the make cmdline and not in the
environment to take effect, as it is unconditionally set in the Makefile.
Notice that it shouldn't be passed to 'make install', as that otherwise
will try to run the host strip program.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/httping/httping.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 45478cf..e92be61 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -12,11 +12,10 @@ HTTPING_LICENSE_FILES = license.txt
 HTTPING_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
 	SSL=$(if $(BR2_PACKAGE_OPENSSL),yes,no) \
-	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no) \
-	DEBUG=no
+	TFO=$(if $(BR2_PACKAGE_HTTPING_TFO),yes,no)
 
 define HTTPING_BUILD_CMDS
-	$(HTTPING_MAKE_OPT) $(MAKE) -C $(@D)
+	$(HTTPING_MAKE_OPT) $(MAKE) OFLAGS= DEBUG=no -C $(@D)
 endef
 
 define HTTPING_INSTALL_TARGET_CMDS
