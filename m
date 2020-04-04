From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Apr 2020 23:32:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: fix build with poppler and gcc
 5
Message-ID: <20200404213245.1519848-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-std=c++11 is needed to avoid the following build failure with poppler
and gcc 5:

/home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:40:37: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11
/home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:70:10: error: 'unique_ptr' in namespace 'std' does not name a template type
     std::unique_ptr<text_box_data> m_data;
          ^
Fixes:
 - http://autobuild.buildroot.org/results/3428b9017168db9239756dc06cdaa5ae004cab97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/efl/efl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f1e69f8a23..d8364ed76f 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -257,6 +257,8 @@ EFL_CONF_OPTS += --disable-image-loader-webp
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER),y)
+# poppler needs c++11
+EFL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 EFL_DEPENDENCIES += poppler
 EFL_CONF_OPTS += --enable-poppler
 else
-- 
2.25.1
