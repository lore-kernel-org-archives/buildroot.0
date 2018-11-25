From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:51:24 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] traceroute: fix 'no rule
 to make target -lm' error
Message-ID: <20181125204815.665EB88316@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d25b7d630c1c06a46ebe98fb5603c06fa89b7ce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fix the following build error:

make[3]: *** No rule to make target '-lm', needed by 'traceroute'.

Fixes:
http://autobuild.buildroot.org/results/dde63672e1de1d4ba036331ab127ccc8ff044444
http://autobuild.buildroot.org/results/4efb67e6a29c3dd784676d30a1051f9f0c2a6c80
http://autobuild.buildroot.org/results/7ac23a3959aec22297695899c0f76dbbc4e114d3
And many more...

As explained by Arnout, this happens when host-make is built (E.G.  when
glibc is built on a machine with an old make version) because the traceroute
Makefiles have a target with a dependency on -lm, and make automatically will
look in make's $prefix/lib directory for libm.so / libm.a to satisfy this
dependency.  From the make info pages:

   When a prerequisite's name has the form '-lNAME', 'make' handles it
specially by searching for the file 'libNAME.so', and, if it is not
found, for the file 'libNAME.a' in the current directory, in directories
specified by matching 'vpath' search paths and the 'VPATH' search path,
and then in the directories '/lib', '/usr/lib', and 'PREFIX/lib'
(normally '/usr/local/lib', but MS-DOS/MS-Windows versions of 'make'
behave as if PREFIX is defined to be the root of the DJGPP installation
tree).

Our host-make is configured with prefix=$(HOST_DIR), and $(HOST_DIR)/lib
does not contain libm.so / libm.a, causing make to error out.

Work around it by pointing VPATH to $(STAGING_DIR)/usr/lib, so make will
find the (target) libm.so / libm.a.

[Peter: extend description based on Arnouts investigation]
Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 49dd099650c21950c8bf957eee3d67b1b20fdcbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/traceroute/traceroute.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index d01c62d5ea..367e3c7ad2 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -16,7 +16,7 @@ TRACEROUTE_DEPENDENCIES += busybox
 endif
 
 define TRACEROUTE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) VPATH=$(STAGING_DIR)/usr/lib $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
