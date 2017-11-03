From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  3 Nov 2017 23:28:37 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: explicitly set --host / --build
Message-ID: <20171103222838.3974-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d13/d137680bf1c0ebfacef635cb2f0fc14524759143/

Otherwise the (handwritten) configure script uses a config.guess script from
2010 to figure out the build host, breaking builds on ppc64le hosts.

The result of --host / --build is only used to detect if we are building for
Windows or not, which is why things are working on x86(-64) build hosts
without specifying --host even though we are cross compiling - But this may
change in the future, so we better pass the correct values.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index cdbf8ae477..313970d94a 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -42,6 +42,8 @@ define JIMTCL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CCACHE=none \
 		./configure --prefix=/usr \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
 		$(JIMTCL_SHARED) \
 	)
 endef
-- 
2.11.0
