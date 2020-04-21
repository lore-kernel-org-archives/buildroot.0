From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 21 Apr 2020 19:26:36 +0200
Subject: [Buildroot] [PATCHv2 02/12] gitlab-ci: check generated config files
In-Reply-To: <20200421172646.3340666-1-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
Message-ID: <20200421172646.3340666-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the script added by the previous patch to check
generated config files.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/pipelines/137597966

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 1 +
 .gitlab-ci.yml.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fa8e077a07..0d06a1b7cf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -47,6 +47,7 @@ check-package:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
+        - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 6b09730a65..413c6d2956 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -47,6 +47,7 @@ check-package:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
         - make ${DEFCONFIG_NAME}
+        - ./support/scripts/check-dotconfig.py .config ./configs/${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
             make > >(tee build.log |grep '>>>') 2>&1 || {
-- 
2.25.3
