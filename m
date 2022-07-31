Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2602C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27CE740FBD;
	Sun, 31 Jul 2022 19:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27CE740FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaHIzbc90djo; Sun, 31 Jul 2022 19:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D32C400CE;
	Sun, 31 Jul 2022 19:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D32C400CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0621BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B95414E6
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B95414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s5-M0CbhtEe9 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 306EC414E4
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 306EC414E4
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:35:51 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id w129so4600356vkg.10
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=F+ULQwsVVoF2s4jgmtRfmsSLzLVtAPh6CAAS+P4FlmU=;
 b=dup4K1n2ZOt1aA/BlTbA/g+gfYly+8GX/iB5BlxZ/obhoAMpFgHbjV3tXDIXwWgcxU
 Oc1npwQCCuwshVbifQtnFnvM9AxAkpWevjr0YcsEUVrAlBoxUuYBW5bHh2YSyK8EVoy1
 2YoajJJaL6gVt0zc1oG68JKp0oKvE0BalTFi4HbwjduQhzRnIyzEKViqW1SAI7bxtG7y
 JfbABoFkx0ov9xbbSRB6n3OVt/ZZPCeNdYlpmf4Vsggg15+iMJHfVXBBh7RNEPYDZ3Gm
 ZhNO9oyiZ2+aN6/r0oMGVZuQWg/Edtf29skT/6S+OfMo6GDfiln5SkERGYRfTQr2L48c
 dxQA==
X-Gm-Message-State: AJIora9qEVdivyTy0iwJA5lfZsN3NhlZAHATr4t2pOwfRazLyReGSnZz
 PjkauX2jCusWvPQS0Qcqydjl0WiDgN0=
X-Google-Smtp-Source: AGRyM1vZbMEaIZIgQstII6zt3JPbpqlp4v26HFS6OEcE/xtZQNQyraj7J1fW4Kyukt4IjG8Ey/byKg==
X-Received: by 2002:a05:6122:221f:b0:343:f3d4:87cb with SMTP id
 bb31-20020a056122221f00b00343f3d487cbmr4836569vkb.13.1659296150022; 
 Sun, 31 Jul 2022 12:35:50 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:35:48 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:09 -0300
Message-Id: <20220731193521.1217825-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=F+ULQwsVVoF2s4jgmtRfmsSLzLVtAPh6CAAS+P4FlmU=;
 b=mU+jeZAVpXtOMVcttzUplrl9HL4ZP8pA99LfwNjk/D+9qjTUoI3ejLtv2aEx9bX42p
 8iZjyoANJR+a5lLJ7Dw47sSBLdrQAFfyL/Hzt+2JbYTrGaZ8ok2lAIAZxPan/ngC0z8P
 Wl7X9GW+oU1x3gXUXztKZ304Dv/NGfGE5uh0PuIui60jHEabCGpK4tV0OilVtAoqR3t7
 tIpBW2/GHjw5rO/6AAVjvphoRHQoWNGWkiCFp6Fcn4RSIgr09GYGYZ2n+u/FGPMnj/5H
 bnKYCbV/svlWlr2lS0IVDhMme0ZYptNKEmA+0ZtB/zCl6v0pKOpFysq1TT2p4AUFjs1L
 G8QA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mU+jeZAV
Subject: [Buildroot] [PATCH v2 02/14] support/testing: test check-package
 ignore list
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

Extend test_check_package to also check the ignore list functionality.
Check:
- the entries in the ignore list use relative path;
- an entry in the ignore list actually ignores the warning;
- an outdated entry in the ignore list generates a warning by its own,
  preventing the ignoring list to grow indefinitely.

For this to work, add 3 test fixtures, listing entries for an
pre-existing file in the br2-external used in the test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none
---
 .../utils/br2-external/.checkpackageignore    |  1 +
 .../br2-external/package/.checkpackageignore  |  1 +
 .../package/.checkpackageignore_outdated      |  1 +
 .../testing/tests/utils/test_check_package.py | 31 +++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/utils/br2-external/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore
 create mode 100644 support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated

diff --git a/support/testing/tests/utils/br2-external/.checkpackageignore b/support/testing/tests/utils/br2-external/.checkpackageignore
new file mode 100644
index 0000000000..efb7680173
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/.checkpackageignore
@@ -0,0 +1 @@
+package/external/external.mk PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore b/support/testing/tests/utils/br2-external/package/.checkpackageignore
new file mode 100644
index 0000000000..5f4a5e1187
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore
@@ -0,0 +1 @@
+external/external.mk PackageHeader
diff --git a/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated b/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
new file mode 100644
index 0000000000..1df59f3bed
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/package/.checkpackageignore_outdated
@@ -0,0 +1 @@
+external/external.mk Indent NewlineAtEof PackageHeader
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index c70ba02324..f21b9e939f 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -75,6 +75,12 @@ class TestCheckPackage(unittest.TestCase):
         generated = int(stderr[1].split()[0])
         self.assertGreater(generated, 0)
 
+    def assert_no_warnings_generated_for_file(self, stderr):
+        """Infer from check-package stderr if no warning was generated and fail otherwise."""
+        self.assertIn("warnings generated", stderr[1], stderr)
+        generated = int(stderr[1].split()[0])
+        self.assertEqual(generated, 0)
+
     def test_run(self):
         """Test the various ways the script can be called in a simple top to
         bottom sequence."""
@@ -201,3 +207,28 @@ class TestCheckPackage(unittest.TestCase):
         self.assert_file_was_processed(m)
         self.assert_warnings_generated_for_file(m)
         self.assertIn("{}:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)".format(abs_file), w)
+
+        # br2-external with ignore list
+        topdir_path = infra.filepath("tests/utils/br2-external")
+        topdir_file = os.path.join(topdir_path, "package/external/external.mk")
+        subdir_path = infra.filepath("tests/utils/br2-external/package")
+        subdir_file = os.path.join(subdir_path, "external/external.mk")
+
+        w, m = call_script(["check-package", "--ignore-list=./.checkpackageignore", "-b", topdir_file],
+                           self.WITH_UTILS_IN_PATH, topdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_no_warnings_generated_for_file(m)
+
+        w, m = call_script(["check-package", "--ignore-list=./.checkpackageignore", "-b", subdir_file],
+                           self.WITH_UTILS_IN_PATH, subdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_no_warnings_generated_for_file(m)
+
+        w, m = call_script(["check-package", "--ignore-list=./.checkpackageignore_outdated", "-b", subdir_file],
+                           self.WITH_UTILS_IN_PATH, subdir_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: Indent was expected to fail, did you fixed the file and forgot to update .checkpackageignore?"
+                      .format(subdir_file), w)
+        self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update .checkpackageignore?"
+                      .format(subdir_file), w)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
