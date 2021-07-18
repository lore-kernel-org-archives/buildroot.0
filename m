From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 13:57:10 +0200
Subject: [Buildroot] [git commit] package/libsndfile: fix c99 check
Message-ID: <20210718112343.6BA7B87E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=bf5bbc1dae38b67fa4092f706ced0e1fd0a86331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of libsndfile to version 1.0.31 in commit
8c600fda64f48c16d20588336dd7ac6a32241c6a, the check for c99 contains
"include <wchar.h>" although the package itself does not use wchar
functions outside Windows-specific code.  This patch forces the
detection of c99 for toolchains lacking wchar.

Fixes:
http://autobuild.buildroot.net/results/62c/62c07e66491e2fcf32d3921f8286ec1293591194/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsndfile/libsndfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 69530c98ed..c955b9d088 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -15,6 +15,7 @@ LIBSNDFILE_CPE_ID_VENDOR = libsndfile_project
 # disputed, https://github.com/erikd/libsndfile/issues/398
 LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 
+LIBSNDFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
 	--disable-alsa \
