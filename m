From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 29 Mar 2015 09:35:34 +0200
Subject: [Buildroot] [PATCH 2/2] boost: use -j only when is PARALLEL_JOBS is
	defined
In-Reply-To: <1427614534-32460-1-git-send-email-fabio.porcedda@gmail.com>
References: <1427614534-32460-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1427614534-32460-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When top-level parallel makefile is being used the PARALLEL_JOBS is
empty but the b2 command of boost does not accept a -j without an
argument so don't use the -j option when PARALLEL_JOBS is empty.

Fix install failure:
Invalid value for the '-j' option, valid values are 1 through 256.
make: *** [/home/tetsuya/buildroot/br2/output/build/boost-1.57.0/.stamp_staging_installed] Error 1

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/boost/boost.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 56a6c34..a8f5c9a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -23,6 +23,10 @@ HOST_BOOST_FLAGS = --without-icu \
 	iostreams locale log math mpi program_options python random regex \
 	serialization signals system test thread timer wave)
 
+ifneq ($(PARALLEL_JOBS),)
+BOOST_PARALLEL_JOBS = -j$(PARALLEL_JOBS)
+endif
+
 # coroutine breaks on some weak toolchains and it's new for 1.54+
 BOOST_WITHOUT_FLAGS = coroutine
 
@@ -121,7 +125,7 @@ define HOST_BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 $(BOOST_PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -130,7 +134,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define HOST_BOOST_BUILD_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 $(BOOST_PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--ignore-site-config \
@@ -138,7 +142,7 @@ define HOST_BOOST_BUILD_CMDS
 endef
 
 define HOST_BOOST_INSTALL_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
+	(cd $(@D) && ./b2 $(BOOST_PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(HOST_BOOST_OPTS) \
 	--prefix=$(HOST_DIR)/usr \
@@ -147,7 +151,7 @@ define HOST_BOOST_INSTALL_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
+	(cd $(@D) && ./bjam $(BOOST_PARALLEL_JOBS) -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
2.3.4
