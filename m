From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:30:25 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] jimtcl: explicitly set
 --host / --build
Message-ID: <20171126213855.76DB07FAD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd2c5e9150bd0469c048f2c4a6087711e9b82d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Fixes:
http://autobuild.buildroot.net/results/d13/d137680bf1c0ebfacef635cb2f0fc14524759143/

Otherwise the (handwritten) configure script uses a config.guess script from
2010 to figure out the build host, breaking builds on ppc64le hosts.

The result of --host / --build is only used to detect if we are building for
Windows or not, which is why things are working on x86(-64) build hosts
without specifying --host even though we are cross compiling - But this may
change in the future, so we better pass the correct values.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 962561a57521dc778df99904aff06c6d1bc435ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index cdbf8ae..313970d 100644
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
