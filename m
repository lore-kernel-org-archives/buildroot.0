From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun,  5 May 2019 18:53:59 +0200
Subject: [Buildroot] [PATCH v2 7/7] gitlab.yml.in*: enable Qemu gitlab
 testing
In-Reply-To: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557075239-30667-8-git-send-email-jugurtha.belkalem@smile.fr>
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
index 5586767..b7902c1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -46,6 +46,8 @@ check-package:
 .defconfig_base:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - main_dir=$(pwd)
+        - ./support/scripts/qemu-boot-chg-defconfig.sh "${DEFCONFIG_NAME}" "${main_dir}"
         - make ${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
@@ -54,6 +56,7 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
+        - ./support/scripts/qemu-boot-checker.sh "${DEFCONFIG_NAME}" "${main_dir}"
     artifacts:
         when: always
         expire_in: 2 weeks
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 33cb665..8bd43a4 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -46,6 +46,8 @@ check-package:
 .defconfig_base:
     script:
         - echo "Configure Buildroot for ${DEFCONFIG_NAME}"
+        - main_dir=$(pwd)
+        - ./support/scripts/qemu-boot-chg-defconfig.sh "${DEFCONFIG_NAME}" "${main_dir}"
         - make ${DEFCONFIG_NAME}
         - echo 'Build buildroot'
         - |
@@ -54,6 +56,7 @@ check-package:
                 tail -200 build.log
                 exit 1
             }
+        - ./support/scripts/qemu-boot-checker.sh "${DEFCONFIG_NAME}" "${main_dir}"
     artifacts:
         when: always
         expire_in: 2 weeks
-- 
2.7.4
