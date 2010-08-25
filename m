From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] Detect early if an UTF-8 locale
	is needed
Message-ID: <20100825153143.58BE289016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=01c1279f9f8764520aeb683fc3f269f928f3e3d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check in toolchain/dependencies/dependencies.sh if an UTF-8 locale is
properly present on the system before trying to build a locale enabled
toolchain. As this test is only needed when a locale enabled toolchain
is going to be built, we pass the configuration file path to the
dependencies.sh script so that it can grep for the current value of
various options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.mk |    1 +
 toolchain/dependencies/dependencies.sh |   12 ++++++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index d500424..b334811 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -16,6 +16,7 @@ endif
 dependencies: host-sed $(DEPENDENCIES_HOST_PREREQ)
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		HOST_SED_DIR="$(HOST_SED_DIR)" \
+		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index b3822ef..b47e9d8 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -152,3 +152,15 @@ for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio p
 	exit 1;
     fi
 done
+
+if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
+   grep ^BR2_ENABLE_LOCALE=y       $CONFIG_FILE > /dev/null ; then
+   if ! which locale > /dev/null ; then
+       /bin/echo -e "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
+       exit 1 ;
+   fi
+   if ! locale -a | grep -i utf8$ ; then
+       /bin/echo -e "\nYou need at least one UTF8 locale to build a toolchain supporting locales\n"
+       exit 1 ;
+   fi
+fi
-- 
1.7.1
