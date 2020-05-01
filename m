From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:27 +0200
Subject: [Buildroot] [git commit] package/pkg-utils.mk: rationalise kconfig
 option mangling
Message-ID: <20200501133530.7D39D90D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=653afb764a3a571b1357953b3c7e24261c9f4a41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have three macros that may mangle a .config file. All
three are modeled after the same pattern: removing the existing option
from the .config file, then adding the new definition for that option;
all three also implement that pattern with the same commands: sed and
echo.

This is all good so far, because it was simple enough, and they always
worked on a file passed in parameter.

However, we're soon going to change this file parameter to make it
optional, so that the file will then be auto-deduced for the current
package. In that case, the file to sed and echo into will be a more
complex structure than just the parameter.

As such, move the actual mangling down to a helper macro, that is called
from the three existing ones.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 66504d0be2..e1f3eafd62 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -11,20 +11,18 @@
 # package, and more.
 #
 
-define KCONFIG_ENABLE_OPT # (option, file)
-	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo '$(1)=y' >> $(2)
-endef
-
-define KCONFIG_SET_OPT # (option, value, file)
-	$(SED) "/\\<$(1)\\>/d" $(3)
-	echo '$(1)=$(2)' >> $(3)
-endef
-
-define KCONFIG_DISABLE_OPT # (option, file)
-	$(SED) "/\\<$(1)\\>/d" $(2)
-	echo '# $(1) is not set' >> $(2)
-endef
+# KCONFIG_MUNGE_DOT_CONFIG (option, newline, file)
+define KCONFIG_MUNGE_DOT_CONFIG
+	$(SED) "/\\<$(strip $(1))\\>/d" $(strip $(3))
+	echo '$(strip $(2))' >> $(strip $(3))
+endef
+
+# KCONFIG_ENABLE_OPT (option, file)
+KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
+# KCONFIG_SET_OPT (option, value, file)
+KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
+# KCONFIG_DISABLE_OPT  (option, file)
+KCONFIG_DISABLE_OPT = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $(1) is not set, $(2))
 
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
