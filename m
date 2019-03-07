From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 7 Mar 2019 17:23:36 +0100
Subject: [Buildroot] [PATCH] package/python3: require util-linux' <uuid.h>
Message-ID: <e5b1510a81bda096dacc133276f1ff2643131dcc.1551975775.git.jan.kundrat@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this dependency, a top level parallel build fails for me (-j24):

  /home/ci/build/build/host-python3-3.7.2/Modules/_uuidmodule.c: In function 'py_uuid_generate_time_safe':
  /home/ci/build/build/host-python3-3.7.2/Modules/_uuidmodule.c:15:5: error: unknown type name 'uuid_t'; did you mean 'uid_t'?
       uuid_t uuid;
       ^~~~~~
       uid_t
  /home/ci/build/build/host-python3-3.7.2/Modules/_uuidmodule.c:32:5: error: implicit declaration of function 'uuid_generate_time'; did you mean 'py_uuid_generate_time_safe'? [-Werror=implicit-function-declaration]
       uuid_generate_time(uuid);
       ^~~~~~~~~~~~~~~~~~
       py_uuid_generate_time_safe

I *suspect* that this is due to host-uboot-tools which provide
/usr/include/uuid.h and which gets accidentally picked by python3.

There's a bugreport [1] upstream which at leeast appears to be relevant.

[1] https://bugs.python.org/issue32627

Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
---
 package/python3/python3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ef2c4857d8..dcec210674 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -40,7 +40,7 @@ HOST_PYTHON3_CONF_ENV += \
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
-HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi
+HOST_PYTHON3_DEPENDENCIES = host-expat host-zlib host-libffi host-util-linux
 
 PYTHON3_INSTALL_STAGING = YES
 
-- 
2.19.1
