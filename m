From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  8 Apr 2014 10:13:26 +0300
Subject: [Buildroot] [PATCH] openpgm: needs host python2
Message-ID: <5e6d3d5d078accc9ba17a52b314cfe8e3badfefa.1396941206.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_PYTHON3=y host python symlinks to python3. This breaks the
version_generator.py script. Make sure we have the right host python version.

Fixes:
http://autobuild.buildroot.net/results/01f/01f886a073439c0639ed93e596b68bcadf1a5824/

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openpgm/openpgm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
index 3ec5c77e28c4..ccfa5909fb00 100644
--- a/package/openpgm/openpgm.mk
+++ b/package/openpgm/openpgm.mk
@@ -15,4 +15,10 @@ OPENPGM_SUBDIR = openpgm/pgm/
 OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
                    ac_cv_file__dev_hpet=no
 
+# version_generator.py needs python2
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+OPENPGM_DEPENDENCIES += host-python
+OPENPGM_CONF_ENV += ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
