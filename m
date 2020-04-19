From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:40:32 +0200
Subject: [Buildroot] [git commit] package/efl: fix build with poppler and
 gcc 5
Message-ID: <20200419132616.65ACA8F1B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9a4208f6288829494f7727127c2dc19df8fb5cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-std=c++11 is needed to avoid the following build failure with poppler
and gcc 5:

/home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:40:37: note: C++11 'noexcept' only available with -std=c++11 or -std=gnu++11
/home/naourr/work/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/poppler/cpp/poppler-page.h:70:10: error: 'unique_ptr' in namespace 'std' does not name a template type
     std::unique_ptr<text_box_data> m_data;
          ^
Fixes:
 - http://autobuild.buildroot.org/results/3428b9017168db9239756dc06cdaa5ae004cab97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
