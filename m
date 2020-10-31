From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 21:42:38 +0100
Subject: [Buildroot] [git commit] package/pax-utils: needs wchar
Message-ID: <20201031204917.E60D38366C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04739c78e61c5f6aef96e653d7658adabea0eb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pax-utils uses asprintf() since version 1.2.4 (commit
9c0ec154d782795daa3b7d2ae273bbda2b36ae83), and recent versions of
gnulib make use of wctomb() in their implementation of asprintf(),
causing a build failure.

While it seems to be an issue in gnulib, let's for now mark pax-utils
as being not available with !wchar toolchains.

Fixes:

  http://autobuild.buildroot.org/results/613840edba8ea161bb900f3b56d8d3605961c78f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pax-utils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pax-utils/Config.in b/package/pax-utils/Config.in
index 58100e482a..ebcca98500 100644
--- a/package/pax-utils/Config.in
+++ b/package/pax-utils/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PAX_UTILS
 	bool "pax-utils"
+	depends on BR2_USE_WCHAR
 	help
 	  ELF related utils for ELF 32/64 binaries that can check files
 	  for security relevant properties.
 
 	  http://www.gentoo.org/proj/en/hardened/pax-utils.xml
+
+comment "pax-utils needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
