Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4ADC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B948D40B48;
	Sun, 24 Jul 2022 05:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B948D40B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0Esn6ksJE60; Sun, 24 Jul 2022 05:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 647AE400EC;
	Sun, 24 Jul 2022 05:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 647AE400EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 486C61BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2397083A47
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2397083A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlMt819pg2JE for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F6483385
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21F6483385
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:31 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so6373613otu.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9t6Q2ovKQL5Y7NsqsBFKOq7yBIDgQyDCVrxCmiRU9+E=;
 b=E3d3eHvAuAPysmULmQNPWkxHNjirj/rTub2jrXiYDwdDL/Xi3sDsYc8lxF31zDN71q
 ZovQ59f3dBNsdqYWTuRCE8Mmp7y4doW9MM2uDpaGPAaAocyaNuKLmMQ/RYXUnHMhGN4r
 zEwleYc8mduevWGQpmdYlbItoksayquYZFlPoVLGlKJrBUUbohbExy/SLZVwA4R0V6oL
 RfXiObjpEgWQwDyG1ugbOk+RbAMS0qA2XL7j4554idptbxze+nMDLdgm7yMHRbANX6Df
 F9+G+mQuxpv0an9+nGo0Bx4f5zVRvEy1341CVBZVvH1yxvCSgX73osGOA18IMtu7tpvh
 IZSA==
X-Gm-Message-State: AJIora/5+S+Gt6mXFLz35fon3EHdHd/3bKrLvQgTMnx/cx1m0FEiYjUh
 LGFnHTEQfhrwAbFxDkSUs9WjeUmLzRU=
X-Google-Smtp-Source: AGRyM1tbQj3SueVfEYYbRlIERQR6QGaF/Q95jOfh6jxsTJT/ovI0RUPNGGoZNYmN363RZqieSyprhw==
X-Received: by 2002:a9d:538a:0:b0:61c:b88f:569d with SMTP id
 w10-20020a9d538a000000b0061cb88f569dmr2838489otg.85.1658641830192; 
 Sat, 23 Jul 2022 22:50:30 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:29 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:00 -0300
Message-Id: <20220724054912.2354219-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9t6Q2ovKQL5Y7NsqsBFKOq7yBIDgQyDCVrxCmiRU9+E=;
 b=CWmQpEsXZQ+s5K71Xr3jxiHhcEL50JovfptT6lFB8q78ut/Z/TjW208gOBVKbCA8DS
 kmyfKzr9oW7Ns+8KexkOIlFCUTJrGYsHTAeZlSw3jacg/iHyoh1A5ryiBWfsOcmTqu98
 veS013SPUJfCNCZ/mE0z9AVR+agJLbNh/wsdGEGwU7loTJqmoYHR7OrbI1um3SsC26Ei
 zqVg48oi7GnytVsRmkt/eBsbjzlgnFNydiz+igeuDkboHDWesQNFnL0uVckeLXYi2DYQ
 gB9lRXcsvp4fGCBL0ODFb7t5Nb89CSXoPnf1/k3VEvBUZbJH2BZce8UGyJfvWyCI2uww
 9J5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CWmQpEsX
Subject: [Buildroot] [PATCH 04/16] support/testing: test check-package
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
