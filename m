From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:30 -0500
Subject: [Buildroot] [PATCH 05/10] package/flex: ignore CVE-2019-6293
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421204235.5956-6-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://security-tracker.debian.org/tracker/CVE-2019-6293

https://github.com/NixOS/nixpkgs/issues/55386#issuecomment-683792976
 "But this bug does not cause stack overflows in the generated code.
 The function and file referred to in the bug (mark_beginning_as_normal
 in nfa.c) are part of the flex code generator, not part of the
 generated code. If flex crashes before generating any code, that
 can hardly be a vulnerability. If flex does not crash, the generated
 code is fine (or perhaps subject to other unreported bugs, who knows,
 but the NFA has been generated correctly)."

Upstream has chosen to not provide a fix
 https://github.com/microsoft/CBL-Mariner/pull/312

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/flex/flex.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2d00969662..85da5ddae8 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,6 +10,9 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_CPE_ID_VENDOR = flex_project
+# bug does not cause stack overflows in the generated code and has been
+# noted upstream as a bug in the code generator
+FLEX_IGNORE_CVES = CVE-2019-6293
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 HOST_FLEX_DEPENDENCIES = host-m4
 
-- 
2.17.1
