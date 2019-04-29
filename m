From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:26 +0200
Subject: [Buildroot] [PATCH 7/7] gitlab.yml.in: enable Qemu gitlab testing
In-Reply-To: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556555546-9246-8-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Used to launch qemu tests for various qemu
architectures.
Neverthless to say that this file skips any other job
different from qemu (only qemu configurations are
runtime tested).

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 .gitlab-ci.yml    | 3 +++
 .gitlab-ci.yml.in | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e9869be..5884716 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,6 +37,8 @@ check-package:
 .defconfig_script:
     script:
         - echo 'Configure Buildroot'
+        - main_dir=$(pwd)
+        - ./support/scripts/qemu-boot-defconfig_config.sh "${CI_JOB_NAME}" "${main_dir}"
         - make ${CI_JOB_NAME}
         - echo 'Build buildroot'
         - |
@@ -45,6 +47,7 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
+        - ./support/scripts/qemu-boot-checker.sh "${CI_JOB_NAME}" "${main_dir}"
 
 .defconfig:
     extends: .defconfig_script
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index ad61643..ac5ba57 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -37,6 +37,8 @@ check-package:
 .defconfig_script:
     script:
         - echo 'Configure Buildroot'
+        - main_dir=$(pwd)
+        - ./support/scripts/qemu-boot-defconfig_config.sh "${CI_JOB_NAME}" "${main_dir}"
         - make ${CI_JOB_NAME}
         - echo 'Build buildroot'
         - |
@@ -45,6 +47,7 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
+        - ./support/scripts/qemu-boot-checker.sh "${CI_JOB_NAME}" "${main_dir}"
 
 .defconfig:
     extends: .defconfig_script
-- 
2.7.4
