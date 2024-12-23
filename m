Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB73E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7ED780E98;
	Mon, 23 Dec 2024 07:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ijRvhGgxnSS; Mon, 23 Dec 2024 07:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BCEE80E65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCEE80E65;
	Mon, 23 Dec 2024 07:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 371C3D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 184FF415F0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yDYUKySc1afg for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EE8E415FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE8E415FA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EE8E415FA
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:25 +0000 (UTC)
X-CSE-ConnectionGUID: J0dZ8jRiSietu9IKSynZww==
X-CSE-MsgGUID: KetDxD2gRhOif3tkHRO9mA==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:23 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:23 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:22 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:21 +0100
X-CSE-ConnectionGUID: mMeiexgTS2OG7GItycowmQ==
X-CSE-MsgGUID: QuU31E1FTP+TJzSN/MYbww==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237508153"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 23 Dec 2024 08:27:17 +0100
Message-ID: <44472fd9b7706002e24636430c4ddbf2ea040f41.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938846; x=1766474846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M3V/P2SSzZf9lAAGjEJFZ9v53EV0LfsVwETE6KamRP4=;
 b=T8uTfp4rQmTEIiWPEiYAis7D1Lbd8ZTWutlHbWA6gstePrAM0lswgspZ
 vLnhNiIQVODsRBBovyvaVvpv4lLZ0B8eZJHxcTshuPqcVdpwfz/ucKO6g
 Fl4HzuokMglNNAqy+MJiAIoFcWz5wYx16klUjoDXikmQgb+kZ9Z6/ZQpW
 sRsWGUkFYQkYfm1VQ9llszMyt8Wz3lCHkmzd5Ix7Gcm03lbqx/jPM2lQr
 no72Rt1inTFt9n0xVAW7DONM+Vbjox/GWfK7x8015vM3UDP1UA+av21yu
 pMyWc5y0OwJQCjdGLNDcT5GFtMn7tpMGxJlVdGbnmJkwNDVtTr7dT3eE6
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=T8uTfp4r
Subject: [Buildroot] [PATCH 2/5] utils/get-developers: use parser.error()
 rather than canned print+return
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

parser.error() reports a nice error message, that also displays a short
reminder of the available options.

Adapt the test-suite accordingly: previously, the error string was an
exact string in the stdout list, while it now is a substring in one of
the strings in stderr. The exit code changes, too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Julien Olivain <ju.o@free.fr>

---
Changes v1 -> v2:
  - fix test-suite (Julien)
---
 support/testing/tests/utils/test_get_developers.py | 12 ++++++------
 utils/get-developers                               |  6 ++----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index ffc01f6ce7..3ec4edeadd 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -41,9 +41,9 @@ class TestGetDevelopers(unittest.TestCase):
         # no args, with syntax error in the file
         developers = b'text3\n'
         out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("No action specified", out)
-        self.assertEqual(rc, 0)
-        self.assertEqual(len(err), 0)
+        self.assertIn("No action specified", "\n".join(err))
+        self.assertEqual(rc, 2)
+        self.assertEqual(len(out), 0)
 
         # -v generating error, called from the main dir
         developers = b'text1\n'
@@ -150,9 +150,9 @@ class TestGetDevelopers(unittest.TestCase):
         # no args, with syntax error in the file
         developers = b'text3\n'
         out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers)
-        self.assertIn("No action specified", out)
-        self.assertEqual(rc, 0)
-        self.assertEqual(len(err), 0)
+        self.assertIn("No action specified", "\n".join(err))
+        self.assertEqual(rc, 2)
+        self.assertEqual(len(out), 0)
 
         # patchfile from topdir and from elsewhere
         abs_path = infra.filepath("tests/utils/test_get_developers/")
diff --git a/utils/get-developers b/utils/get-developers
index 33980366d6..8e5796beaf 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -40,11 +40,9 @@ def __main__():
     if len(args.patches) != 0:
         action += 1
     if action > 1:
-        print("Cannot do more than one action")
-        return
+        parser.error("Cannot do more than one action")
     if action == 0:
-        print("No action specified")
-        return
+        parser.error("No action specified")
 
     devs = getdeveloperlib.parse_developers(args.filename)
     if devs is None:
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
