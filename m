From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:36:15 +0200
Subject: [Buildroot] [git commit] package/yaml-cpp: build shared library if
 needed
Message-ID: <20200421192149.5E7508BE54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f2ba910b519a195622ccc56a8fe6c04995524e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

yaml-cpp builds only a static library by default, this will raise a
build failure with upcoming mongodb 4.2.x as reported by Ryan Barnett
due to mongodb linking with a static library that obviously will miss
-fPIC

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yaml-cpp/yaml-cpp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 906e554ed7..beb8d6f55f 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -15,4 +15,10 @@ YAML_CPP_CONF_OPTS += \
 	-DYAML_CPP_BUILD_TESTS=OFF \
 	-DYAML_CPP_BUILD_TOOLS=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=OFF
+else
+YAML_CPP_CONF_OPTS += -DYAML_BUILD_SHARED_LIBS=ON
+endif
+
 $(eval $(cmake-package))
