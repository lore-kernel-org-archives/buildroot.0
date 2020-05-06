From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:45:14 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/efl: fix build
 with poppler and gcc 5
Message-ID: <20200506055036.761CF90EAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a474a68632048773e5367d50489d58fda5803d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit d9a4208f6288829494f7727127c2dc19df8fb5cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
