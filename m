From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 20:42:22 +0200
Subject: [Buildroot] [git commit] lbase64: compile with -fPIC
Message-ID: <20171006184939.F2C4F8118D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28be052f6dc280ab8469d543af23e76016afc6bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some architectures (e.g. x86_64, MIPS, microblaze, or1k) require to
build with -fPIC to build a shared library, but the lbase64 build
system doesn't add it. Therefore, we add it in CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/b56/b567096cbfdb89b1895924051265c56204ffb512/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: write commit log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lbase64/lbase64.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index fd78a6c..0225fc6 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -12,7 +12,8 @@ LBASE64_LICENSE_FILES = README
 LBASE64_DEPENDENCIES = luainterpreter
 
 define LBASE64_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) so
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" -C $(@D) so
 endef
 
 define LBASE64_INSTALL_TARGET_CMDS
