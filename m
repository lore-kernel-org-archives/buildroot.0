Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A74CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 16:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAD934065B;
	Sun, 12 Oct 2025 16:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lOeI3BOlpEL; Sun, 12 Oct 2025 16:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5EE14066E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EE14066E;
	Sun, 12 Oct 2025 16:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9845BBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E4A80B74
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwWEy2u-Xr1W for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 16:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D9680B6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64D9680B6D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 16:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DB9686919; Sun, 12 Oct 2025 16:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 16:11:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51cfb92e6d89476e7318b209ade4f805a5ec529f
X-Git-Newrev: f6c7a7be36d1ac2c905b776aa86b93a15051ca43
X-Patchwork-Hint: ignore
Message-Id: <20251012162137.4DB9686919@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: add option to set
 policy booleans
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f6c7a7be36d1ac2c905b776aa86b93a15051ca43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Policy booleans allow adjusting certain policy rules at runtime
(including whether changing policy booleans is allowed). The new
option allows setting their defaults at build time.

A monolithic policy (like built by package/refpolicy) does not support
persistent changes to policy booleans, so changing the defaults is
required to make changes across boots. Adjusting policy/booleans.conf
after "make conf" is intended for that purpose [1, 2].

[1] https://github.com/SELinuxProject/refpolicy/pull/355#issuecomment-792758725
[2] https://github.com/SELinuxProject/refpolicy/blob/4d97523c71603b12e92cf1b80cd0e01ac75bc067/README#L186-L191

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/refpolicy/Config.in                | 13 +++++++++++++
 package/refpolicy/refpolicy.mk             | 10 ++++++++++
 support/testing/tests/core/test_selinux.py | 18 ++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 242d7f34e0..f330c685ab 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -121,6 +121,19 @@ config BR2_REFPOLICY_EXTRA_MODULES
 
 endif
 
+config BR2_REFPOLICY_SET_BOOLEANS
+	string "Set policy booleans"
+	help
+	  Set default values for policy booleans before compiling the
+	  policy (see policy/booleans.conf in the refpolicy
+	  README). The value of this option is a space separated list
+	  of either plain names (to set that boolean to true), or
+	  "name=(true|false)" pairs (to set the given value).
+
+	  Boolean values can still be changed at runtime if the policy
+	  permits, but such changes cannot be persisted with a
+	  monolithic policy.
+
 config BR2_REFPOLICY_ENABLEAUDIT
 	bool "remove dontaudit rules from policy (debugging only)"
 	help
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 698f38f738..c5d8ce3b57 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -107,6 +107,15 @@ define REFPOLICY_CONFIGURE_ENABLEAUDIT
 endef
 endif
 
+# Override defaults for policy booleans. name=(true|false) will result
+# in the given value, just a name implies "true".
+define REFPOLICY_CONFIGURE_BOOLEANS
+	$(foreach b,$(call qstrip,$(BR2_REFPOLICY_SET_BOOLEANS)),
+		read -r name value < <(echo "$(subst =, ,$(b))"); \
+		$(SED) "/^$${name} =/c\\$${name} = $${value:-true}" $(@D)/policy/booleans.conf
+	)
+endef
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
 		$(@D)/build.conf
@@ -119,6 +128,7 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
 	$(REFPOLICY_CONFIGURE_ENABLEAUDIT)
 	$(REFPOLICY_CONFIGURE_MODULES)
+	$(REFPOLICY_CONFIGURE_BOOLEANS)
 endef
 
 define REFPOLICY_BUILD_CMDS
diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 683a424d6f..e72431211d 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -51,6 +51,24 @@ class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
         self.assertEqual(out[2].strip(), "buildroot_test_t")
 
 
+class TestSELinuxSetBooleans(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+        """
+        BR2_REFPOLICY_SET_BOOLEANS="user_dmesg user_all_users_send_syslog=false"
+        """
+
+    def test_run(self):
+        TestSELinuxInfra.base_test_run(self)
+
+        out, ret = self.emulator.run("seinfo -x -b", 15)
+        self.assertEqual(ret, 0)
+        # lines follow the pattern "name (true|false);", plus indentation
+        bools = dict(line.strip().rstrip(';').split()[1:] for line in out[2:])
+        # both of these booleans have the opposite default in refpolicy
+        self.assertEqual(bools["user_dmesg"], "true")
+        self.assertEqual(bools["user_all_users_send_syslog"], "false")
+
+
 class TestSELinuxCustomGit(TestSELinuxInfra):
     config = TestSELinuxInfra.config + \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
