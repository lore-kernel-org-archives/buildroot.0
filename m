From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 22:14:45 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openjdk: set PATH
 before calling make
Message-ID: <20190623201503.89D94826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80dcda334c493678c435066e81c82a4bd68eabd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

PATH must be set to $(BR_PATH) thanks to $(TARGET_MAKE_ENV) before
calling make otherwise build fails on:
/bin/bash: gawk: command not found

When build fails, config.log contains the following line:

configure:13709: checking for gawk
configure:13725: found /home/buildroot/autobuild/run/instance-3/output/host/bin/gawk
configure:13736: result: gawk
[...]
ac_cv_prog_AWK=gawk

Fixes:
 - http://autobuild.buildroot.org/results/43c5d08f599e8f44b59a576d243ae1c7b27de7a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 10aa85ac8a399cf03e7c59c849c97e0265a29377)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/openjdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 318e4bade3..91a00870c5 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -109,7 +109,7 @@ endef
 # Make -jn is unsupported. Instead, set the "--with-jobs=" configure option,
 # and use $(MAKE1).
 define OPENJDK_BUILD_CMDS
-	$(MAKE1) -C $(@D) legacy-jre-image
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) legacy-jre-image
 endef
 
 # Calling make install always builds and installs the JDK instead of the JRE,
