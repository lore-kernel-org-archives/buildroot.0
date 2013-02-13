From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:06 +0100
Subject: [Buildroot] [PATCH 5/9] manual: faq: add workaround to avoid
	rebuilding the buildroot toolchain after each clean
In-Reply-To: <cover.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
Message-ID: <e5a14b33f5b34b4fbfd5c5b3e2b1077c7ef91573.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/common-usage.txt        |  1 +
 docs/manual/faq-troubleshooting.txt | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index c7f511a..b36965f 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -20,6 +20,7 @@ all sources that you previously selected in the configurator
 You can now disconnect or copy the content of your +dl+
 directory to the build-host.
 
+[[daily-oot-build]]
 Building out-of-tree
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 8b0882a..f367275 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -147,3 +147,37 @@ Using the internal Buildroot toolchain backend
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 These toolchains are currently *not relocatable*.
+
+However, it is possible to build a toolchain using the internal Buildroot
+backend in another location (see xref:daily-oot-build[]), then use it as an
+_external_ one to prevent from rebuilding it after issuing +make clean+
+(see xref:faq-avoid-rebuild-toolchain[]).
+
+[[faq-avoid-rebuild-toolchain]]
+How to avoid always rebuilding the toolchain?
+---------------------------------------------
+
+When using the internal Buildroot toolchain backend or the
+http://crosstool-ng.org[crosstool-NG] one, runnong +make clean+ not only
+remove the built binaries, but also the whole toolchain.
+
+It is possible to prevent this by, first, building the toolchain in a
+place different from the one  where the images will be built.
+
+To do so:
+
+1. Build the toolchain somewhere:
++
+----------------------------
+make toolchain O=/path/to/toolchain
+----------------------------
++
+1. Use this pre-built toolchain as an external one in a new and clean
+   build (see xref:external-toolchain-backend[]) with a different output
+   directory than the pre-built toolchain one.
+
+This way, you will not have to rebuild the toolchain after invoking
++make clean+.
+
+However, the toolchain should be regenerated after any change of the
++Target Architecture+ (or its _variant_), or done in the +Toolchain+ menu.
-- 
1.8.1.3
