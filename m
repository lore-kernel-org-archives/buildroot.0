Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32D1C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA5A60E71;
	Sun,  1 Jan 2023 23:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA5A60E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bR8klQB8ZSte; Sun,  1 Jan 2023 23:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B6AD60E82;
	Sun,  1 Jan 2023 23:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B6AD60E82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2BA1BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A06660BFC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A06660BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KosSsLrdy5qL for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19DDA60B2C
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19DDA60B2C
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:40:18 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n8so17047426oih.0
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+nkDLlzfPU0LrJK/i/fpfMcZvYbLCFqZTirGmwrfOU=;
 b=eUcx8k7qCyRVZZrQN/fQtzagsEK37Wd5ar8Dtt58kcorr5kMeK7VJCMV31uxMAhFZE
 fB0Ah3KSDwVZSmWQhfiCEjS8qO9OFXqI73jGfppsjPYq6Ln4i6gj+Dm2JnU8t94V8ZJj
 vQcCECWCyfJSpiyGF2gdmCZLWJucPADxF4t0PbXCR4VqCD1ocEj4qgAUyKlz4G1qy7c1
 So4qqwjd146KyKFrm7h7v92FXn145I2kUHk11C+8ocCY6037kXFxDr603baM0ET27cCW
 J5DaRWDj7NDWjtCiOjoSVSpeuICyqfqMydTLzJ0e+ZI39HaEIgukC4iyFstYt0ZGo4jo
 Jlrg==
X-Gm-Message-State: AFqh2ko9gEqBxvp/ctCJ5SMnwxeUwZFOToGuWixjgexYPswRqtlEcx/L
 YDVZhZZROSZfxK3Pl2/7SRtwLSRb/hw=
X-Google-Smtp-Source: AMrXdXtlOsQf12kTkSShS+KttIhaQypeTNqhqkFym6WKyTP6DL5f/qxVmKdaXn695o92V4u27f8roQ==
X-Received: by 2002:a05:6808:d4b:b0:35b:ae91:db53 with SMTP id
 w11-20020a0568080d4b00b0035bae91db53mr29682007oik.42.1672616417707; 
 Sun, 01 Jan 2023 15:40:17 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:40:16 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:52 -0300
Message-Id: <20230101233653.487175-29-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+nkDLlzfPU0LrJK/i/fpfMcZvYbLCFqZTirGmwrfOU=;
 b=G4+Le+Emnf/BKan22mLsZdmcHyc7TgiLbUbcsp2tD3iLSTFdBAUCz7aTtfk1wg3Z6I
 cnG3hCRyZX831eDUT8ZwYlLCaSAw3BIjon9/I1HpPWptwQJKw0lkbd8gENPN58Di+5qw
 KYuW2yEjQUzkWcqDptfsbex3Tv7ZDqtUoeNKZPaeragD87qgq7IuMYOoiU8nadhWLzOb
 ZqDM+S+54eZaNMpVBN8B78enVzmvL+OfQ5RnNsHErkyVrJF2g9HM5EnqNex0c/4NwgPM
 +ce5kX7aiqP0ApT8f/2fBNF7XobAOH7uxDpYDXN6jqWchaYRe9ZlYOdOmUtYtDPbjZRU
 KLBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G4+Le+Em
Subject: [Buildroot] [PATCH 28/29] utils/check-package: warn about disabled
 install
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a package defines one of these variables:
<pkg>_INSTALL_IMAGES_CMDS
<pkg>_PRE_INSTALL_IMAGES_HOOKS
<pkg>_POST_INSTALL_IMAGES_HOOKS
it also needs to enable <pkg>_INSTALL_IMAGES.

The same also occurs for <pkg>_INSTALL_STAGING.

And yet <pkg>_INSTALL_TARGET is a similar case, except that it defaults
to YES, while the other two default to NO.

So warn when a package defines a install command or hook that will never
be called because the equivalent flag is not set.
Take into account that some special cases have <pkg>_INSTALL_STAGING
defaulting to YES.
Also only warn when the script can determine for sure the flag to
install is disabled. So if a flag that defaults to YES is overridden to
NO inside a conditional, consider it may be enabled.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Running on current master:
package/ima-evm-utils/ima-evm-utils.mk:24: never called because IMA_EVM_UTILS_INSTALL_STAGING is disabled
---
 utils/checkpackagelib/lib_mk.py      |  89 ++++++++++++++++++
 utils/checkpackagelib/test_lib_mk.py | 129 +++++++++++++++++++++++++++
 2 files changed, 218 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d9f254ca32..2bb56a5084 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -32,6 +32,95 @@ def get_package_prefix_from_filename(filename):
     return package, package_upper
 
 
+class DisabledInstall(_CheckFunction):
+    END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
+    START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
+    PATHS_WITH_INSTALL_STAGING_YES = [
+        "package/linux-tools/",
+        "toolchain/",
+    ]
+
+    def before(self):
+        _, self.package = get_package_prefix_from_filename(self.filename)
+
+        self.install_images = False
+        self.all_images_cmds = []
+        self.IMAGES_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_IMAGES_HOOKS",
+            r"_INSTALL_IMAGES_CMDS",
+            r"_POST_INSTALL_IMAGES_HOOKS"])))
+        self.INSTALL_IMAGES = re.compile(r"\s*{}_INSTALL_IMAGES\s*=\s*YES".format(self.package))
+
+        self.install_staging = False
+        for path in self.PATHS_WITH_INSTALL_STAGING_YES:
+            if self.filename.startswith(path):
+                self.install_staging = True
+                break
+        self.all_staging_cmds = []
+        self.STAGING_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_STAGING_HOOKS",
+            r"_INSTALL_STAGING_CMDS",
+            r"_POST_INSTALL_STAGING_HOOKS"])))
+        self.INSTALL_STAGING = re.compile(r"\s*{}_INSTALL_STAGING\s*=\s*YES".format(self.package))
+
+        self.conditional = 0
+        self.install_target = True
+        self.all_target_cmds = []
+        self.TARGET_CMDS = re.compile(r"^\s*(define\s+)?{}({})".format(self.package, "|".join([
+            r"_PRE_INSTALL_TARGET_HOOKS",
+            r"_INSTALL_TARGET_CMDS",
+            r"_POST_INSTALL_TARGET_HOOKS"])))
+        self.INSTALL_TARGET = re.compile(r"\s*{}_INSTALL_TARGET\s*=\s*NO".format(self.package))
+
+    def check_line(self, lineno, text):
+        if self.START_CONDITIONAL.search(text):
+            self.conditional += 1
+            return
+        if self.END_CONDITIONAL.search(text):
+            self.conditional -= 1
+            return
+
+        if self.INSTALL_IMAGES.search(text):
+            self.install_images = True
+            return
+        if self.INSTALL_STAGING.search(text):
+            self.install_staging = True
+            return
+        if self.INSTALL_TARGET.search(text):
+            if self.conditional == 0:
+                self.install_target = False
+            return
+
+        if self.IMAGES_CMDS.search(text):
+            self.all_images_cmds.append([lineno, text])
+            return
+        if self.STAGING_CMDS.search(text):
+            self.all_staging_cmds.append([lineno, text])
+            return
+        if self.TARGET_CMDS.search(text):
+            self.all_target_cmds.append([lineno, text])
+            return
+
+    def after(self):
+        warnings = []
+        if not self.install_images:
+            for lineno, text in self.all_images_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_IMAGES is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        if not self.install_staging:
+            for lineno, text in self.all_staging_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_STAGING is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        if not self.install_target:
+            for lineno, text in self.all_target_cmds:
+                warnings.append(["{}:{}: never called because {}_INSTALL_TARGET is disabled"
+                                 .format(self.filename, lineno, self.package),
+                                 text])
+        return warnings
+
+
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
     CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 56cd8bc391..d59bfe917e 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -37,6 +37,135 @@ def test_get_package_prefix_from_filename(testname, filename, expected):
     assert [prefix_lower, prefix_upper] == expected
 
 
+DisabledInstall = [
+    ('ignore comment at beginning of line',
+     'any.mk',
+     '# very useful comment\n',
+     [[]]),
+    ('install images disabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK  \n'
+     'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\t\n',
+     [[['any.mk:1: never called because ANY_INSTALL_IMAGES is disabled',
+        'define ANY_INSTALL_IMAGES_CMDS\n'],
+       ['any.mk:3: never called because ANY_INSTALL_IMAGES is disabled',
+        'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK  \n'],
+       ['any.mk:4: never called because ANY_INSTALL_IMAGES is disabled',
+        'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\t\n']]]),
+    ('install images disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_IMAGES = NO\n'
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_IMAGES is disabled',
+        'define ANY_INSTALL_IMAGES_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_IMAGES is disabled',
+        ' ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_IMAGES is disabled',
+        '\tANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n']]]),
+    ('install images enabled',
+     'any.mk',
+     '  ANY_INSTALL_IMAGES = YES  \n'
+     'define ANY_INSTALL_IMAGES_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_IMAGES_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_IMAGES_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install staging enabled (default for toolchain)',
+     'toolchain/toolchain-any.mk',
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n',
+     [[]]),
+    ('install staging enabled (default for linux tools)',
+     'package/linux-tools/linux-tool-foo.mk.in',
+     'define FOO_INSTALL_STAGING_CMDS\n'
+     'endef\n',
+     [[]]),
+    ('install staging disabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK  \n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n',
+     [[['any.mk:1: never called because ANY_INSTALL_STAGING is disabled',
+        'define ANY_INSTALL_STAGING_CMDS\n'],
+       ['any.mk:3: never called because ANY_INSTALL_STAGING is disabled',
+        'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK  \n'],
+       ['any.mk:4: never called because ANY_INSTALL_STAGING is disabled',
+        'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\t\n']]]),
+    ('install staging disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_STAGING = NO\n'
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_STAGING is disabled',
+        'define ANY_INSTALL_STAGING_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_STAGING is disabled',
+        ' ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_STAGING is disabled',
+        '\tANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n']]]),
+    ('install staging enabled',
+     'any.mk',
+     '  ANY_INSTALL_STAGING = YES  \n'
+     'define ANY_INSTALL_STAGING_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_STAGING_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_STAGING_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target disabled (explicit)',
+     'any.mk',
+     'ANY_INSTALL_TARGET = NO\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     ' ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     '\tANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[['any.mk:2: never called because ANY_INSTALL_TARGET is disabled',
+        'define ANY_INSTALL_TARGET_CMDS\n'],
+       ['any.mk:4: never called because ANY_INSTALL_TARGET is disabled',
+        ' ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'],
+       ['any.mk:5: never called because ANY_INSTALL_TARGET is disabled',
+        '\tANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n']]]),
+    ('install target enabled (explict)',
+     'any.mk',
+     'ANY_INSTALL_TARGET = YES\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target enabled (default)',
+     'any.mk',
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ('install target possibly enabled (conditional)',
+     'any.mk',
+     'ifeq ($(condition))\n'
+     'ANY_INSTALL_TARGET = NO\n'
+     'endif\n'
+     'define ANY_INSTALL_TARGET_CMDS\n'
+     'endef\n'
+     'ANY_PRE_INSTALL_TARGET_HOOKS += MY_HOOK\n'
+     'ANY_POST_INSTALL_TARGET_HOOKS += MY_HOOK\n',
+     [[]]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', DisabledInstall)
+def test_DisabledInstall(testname, filename, string, expected):
+    warnings = util.check_file(m.DisabledInstall, filename, string)
+    assert warnings == expected
+
+
 Indent = [
     ('ignore comment at beginning of line',
      'any',
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
