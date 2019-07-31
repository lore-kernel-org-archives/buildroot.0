From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:02:28 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/unzip: update
 security and bug fix patches from Debian
Message-ID: <20190731215947.32682889A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcbcf011aee2635aeae4a48e1773185de2af2c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fix the URL and add three new patches. Quoting changelog [1]:

unzip (6.0-24) unstable; urgency=medium

  * Apply two patches by Mark Adler:
  - Fix bug in undefer_input() that misplaced the input state.
  - Detect and reject a zip bomb using overlapped entries. Closes: #931433.
    Bug discovered by David Fifield. For reference, this is CVE-2019-13232.

 -- Santiago Vila <sanvila@debian.org>  Thu, 11 Jul 2019 18:03:34 +0200

unzip (6.0-23) unstable; urgency=medium

  * Fix lame code in fileio.c which parsed 64-bit values incorrectly.
    Thanks to David Fifield for the report. Closes: #929502.

 -- Santiago Vila <sanvila@debian.org>  Wed, 29 May 2019 00:24:08 +0200

[1] https://sources.debian.org/data/main/u/unzip/6.0-24/debian/changelog

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 009c59a261fa9acb9e52894603ee819d5522840d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unzip/unzip.hash |  3 +++
 package/unzip/unzip.mk   | 29 ++++++++++++++++-------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index fbf2615ad6..0c384d006e 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -13,3 +13,6 @@ sha256 ea04cfc8b7ca3b3c03117da0d891870b8c542d26188ef5593fd7e479f4f29f4e 17-resto
 sha256 1872ffdd4d82edd7b1e62c469642bf16a1ca12dd26d41bd3f0b44f0f7602eb63 18-cve-2014-9913-unzip-buffer-overflow.patch
 sha256 60840ea8f5d11a276972fb5b43652cdd49a9ed93b2cc0586ad309bf52104b012 19-cve-2016-9844-zipinfo-buffer-overflow.patch
 sha256 4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437 20-cve-2018-1000035-unzip-buffer-overflow.patch
+sha256 df3b0eeea8dcc161a2565e306b5dda13d27de43145e198baaf0eab822321ee7e 21-fix-warning-messages-on-big-files.patch
+sha256 2cf5a89e921da99e883bcde0ea03e2c77ae9185f57efaf35e7d43bc24353cfdc 22-cve-2019-13232-fix-bug-in-undefer-input.patch
+sha256 c8e82c80fc7760f90567118a465e4cfa1b8e5d0a5723f9c70e3d21247e550615 23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 43e90125e6..2887b7b288 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -11,18 +11,21 @@ UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
 UNZIP_PATCH = \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/07-increase-size-of-cfactorstr.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/08-allow-greater-hostver-values.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/09-cve-2014-8139-crc-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/11-cve-2014-8141-getzip64data.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/14-cve-2015-7696.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/15-cve-2015-7697.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/17-restore-unix-timestamps-accurately.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/07-increase-size-of-cfactorstr.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/08-allow-greater-hostver-values.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/09-cve-2014-8139-crc-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/11-cve-2014-8141-getzip64data.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/14-cve-2015-7696.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/15-cve-2015-7697.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/17-restore-unix-timestamps-accurately.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/21-fix-warning-messages-on-big-files.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-24/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
 
 $(eval $(cmake-package))
