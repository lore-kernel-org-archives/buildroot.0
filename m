From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:47:58 +0200
Subject: [Buildroot] [git commit] icu: fix usage of libicudata on ARM EABIhf
Message-ID: <20140629104815.161079D106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffa73248c6e1405f5bbd2e7a1c78e21c55fb9f68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libicudata library was linked as a "data only" library using the
-nostdlib -nodefaultlibs flags, but this causes problems when using
the library on ARM EABIhf systems. Removing those flags fixes the
problem, and is the solution used by Debian, see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457 for all the
details.

[Thomas: fix commit log and title, add more details to the patch
description.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../icu/icu-004-link-icudata-as-data-only.patch    |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/icu/icu-004-link-icudata-as-data-only.patch b/package/icu/icu-004-link-icudata-as-data-only.patch
new file mode 100644
index 0000000..d970e8d
--- /dev/null
+++ b/package/icu/icu-004-link-icudata-as-data-only.patch
@@ -0,0 +1,35 @@
+From d5d0c4bb7cc9aa4a132ec0bea13255aee50c1cf9 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+Date: Fri, 6 Jun 2014 14:55:58 +0200
+Subject: [PATCH] Don't link icudata as a data only library
+
+This patch cames straight from Debian. It fixes an issue when
+libicudata would not have some flags indicating it's EABIhf, causing
+applications linked against libicudata to not start on EABIhf
+systems. Getting rid of the -nodefaultlibs -nostdlib flags solves the
+problem, and is the solution that is used by Debian, see
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
+---
+ source/config/mh-linux | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/source/config/mh-linux b/source/config/mh-linux
+index 531a3b2..5a2a7c4 100644
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
+@@ -21,7 +21,9 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+ LD_RPATH_PRE = -Wl,-rpath,
+
+ ## These are the library specific LDFLAGS
+-LDFLAGSICUDT=-nodefaultlibs -nostdlib
++#LDFLAGSICUDT=-nodefaultlibs -nostdlib
++# Debian change: linking icudata as data only causes too many problems.
++LDFLAGSICUDT=
+
+ ## Compiler switch to embed a library name
+ # The initial tab in the next line is to prevent icu-config from reading it.
+--
+2.0.0.rc2
+
