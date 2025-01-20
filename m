Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C6C0218A
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 07:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C749A81E1D;
	Mon, 20 Jan 2025 07:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FwYo7Zi51Xcy; Mon, 20 Jan 2025 07:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7DF881E22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7DF881E22;
	Mon, 20 Jan 2025 07:18:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 239DE959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048EB40160
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJeYtCad_MoU for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 07:18:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C713400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C713400AC
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C713400AC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 07:18:02 +0000 (UTC)
X-CSE-ConnectionGUID: rC8HH1oVTfuzgFfUd7Ifjw==
X-CSE-MsgGUID: b8beaO+IQHaS5Biru6EAGA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 08:18:00 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jan 2025 08:18:00 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 20 Jan 2025 08:17:58 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Jan 2025 08:17:58 +0100
X-CSE-ConnectionGUID: dMgjk5+ISE2AoqNwQoljlw==
X-CSE-MsgGUID: xgvRMQPaT/K6frAbntBFiw==
X-IronPort-AV: E=Sophos;i="6.13,218,1732575600"; d="scan'208";a="241075076"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 20 Jan 2025 08:17:56 +0100
Message-ID: <b8090988958a71953ab904d2f33af498536a280c.1737357470.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737357470.git.yann.morin@orange.com>
References: <cover.1737357470.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX307.corporate.adroot.infra.ftgroup
 (10.115.27.12) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1737357483; x=1768893483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gcgDM3RTLwnlH/wWaqAXKuvj2DvWjm4XR1YKD0LN4h4=;
 b=LD2qF6cWTJ44gU0kUdIhxEJ2qDzMzTFbBb1tvDkUwBd7FHJKJSuz2q3y
 r5TAM89hwdY6FIpBlSeEeSDl/qvWNtAZqagqPLM4FTa9NPE//Tx/lKrY+
 F3yEWqZ9D9BIhRakh+241kPOdr+rq61qXkPHoiTLW96/gxvOAgE3OJdYO
 j/U+66udfexnZ8YLAsEIi9HSlhH97um8sFGeag1057omVq6WtdUMVkyZ+
 pWG7J1i4yjUW/CsuxlCoATijaozz0eQgwi7mFnWNRxL+tyggnVyl5WkQv
 kqBPbEj4BOaSYXPBkunkgmB3XeHP0anlWfD/lkzTDm8FOpi2YyZwZVX0z
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=LD2qF6cW
Subject: [Buildroot] [PATCH 2/2] support/testing.utils: check patch on stdin
 to get-developers
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

Since commit d10d22221f93 (utils/get-developers: read patch from stdin
when it's not a tty), get-developers accepts to read a patch fromn its
stdin when it is not a tty.

Add a test for this.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .../tests/utils/test_get_developers.py        | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 701c3acb1a..195e421332 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -13,26 +13,32 @@ import unittest
 import infra
 
 
-def call_script(args, env, cwd):
+def call_script(args, env, cwd, stdin_data=None):
     """Call a script and return stdout and stderr as lists and the exit code."""
-    # We need stdin to be a tty, not just a pipe or whatever
-    m_tty, s_tty = os.openpty()
+    if stdin_data is None:
+        # We need stdin to be a tty, not just a pipe or whatever
+        m_tty, s_tty = os.openpty()
+        com_opts = dict()
+    else:
+        s_tty = subprocess.PIPE
+        com_opts = dict([("input", stdin_data)])
     proc = subprocess.Popen(args, cwd=cwd,
                             stdin=s_tty,
                             stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, env=env,
                             universal_newlines=True)
-    out, err = proc.communicate()
-    os.close(s_tty)
-    os.close(m_tty)
+    out, err = proc.communicate(**com_opts)
+    if stdin_data is None:
+        os.close(s_tty)
+        os.close(m_tty)
     return out.splitlines(), err.splitlines(), proc.returncode
 
 
-def call_get_developers(cmd, args, env, cwd, developers_content):
+def call_get_developers(cmd, args, env, cwd, developers_content, stdin_data=None):
     """Call get-developers overrinding the default DEVELOPERS file."""
     with tempfile.NamedTemporaryFile(buffering=0) as developers_file:
         developers_file.write(developers_content)
-        return call_script([cmd, "-d", developers_file.name] + args, env, cwd)
+        return call_script([cmd, "-d", developers_file.name] + args, env, cwd, stdin_data)
 
 
 class TestGetDevelopers(unittest.TestCase):
@@ -174,3 +180,9 @@ class TestGetDevelopers(unittest.TestCase):
         self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
         self.assertEqual(rc, 0)
         self.assertEqual(len(err), 0)
+        with open(abs_file, "r") as fd:
+            patch_data = fd.read()
+        out, err, rc = call_get_developers("./utils/get-developers", [], self.WITH_EMPTY_PATH, topdir, developers, patch_data)
+        self.assertIn('git send-email --to buildroot@buildroot.org --cc "dev1"', out)
+        self.assertEqual(rc, 0)
+        self.assertEqual(len(err), 0)
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
