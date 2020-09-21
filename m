From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2020 23:08:42 +0200
Subject: [Buildroot] [PATCH 2/2] support/scripts: handle scheduled pipelines
In-Reply-To: <cover.1600722514.git.yann.morin.1998@free.fr>
References: <cover.1600722514.git.yann.morin.1998@free.fr>
Message-ID: <d01c55362b599b6b41c5e914f46644ac4088e243.1600722514.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently only handle triggerred pipelines, i.e. pipelines that
have been created via the PAI with a token.

However, the weekly trigger is not a trigger, it is a schedule.

Unbeknownst to us, it seems the behaviour of scheduled pipeline has
changed, and they are no longer treated as a triggerred pipeline, and
the corresponding variable is not set; instead, the scheduled property
is reflected in the CI_PIPELINE_SOURCE variable, that is aptly set to
'schedule'.

Use that to recognise our weekly scheduled pipeline.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index faa52e85b2..01d850d09c 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -52,6 +52,9 @@ gen_defconfigs() {
     elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
         # For pipeline created by using a trigger token.
         template=base
+    elif [ "${CI_PIPELINE_SOURCE}" = "schedule" ]; then
+        # For scheduled pipelines
+        template=base
     else
         case "${CI_COMMIT_REF_NAME}" in
             # For master, next, and maintenance branches, only check the defconfigs
@@ -94,6 +97,9 @@ gen_tests() {
     elif [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
         # For pipeline created by using a trigger token.
         run_tests=true
+    elif [ "${CI_PIPELINE_SOURCE}" = "schedule" ]; then
+        # For scheduled pipelines
+        run_tests=true
     else
         case "${CI_COMMIT_REF_NAME}" in
             # For the branch or tag name named *-runtime-tests, create a pipeline.
-- 
2.20.1
