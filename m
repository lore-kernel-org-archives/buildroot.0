Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A93CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A1A413C5;
	Thu, 18 Jun 2026 12:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nGO414ty9o4; Thu, 18 Jun 2026 12:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D82413B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787001;
	bh=x2n4azCZF8jcDiCH3pZhuy909HYERudgpq2nLXI65pU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XfFP7KbWAtLwtxTdHC6DO8rxfsONNd/TSC9pg0WkS+KHTU5O7wu6CX7EnMw8Y0u41
	 JGl6676Wf5DZ2ItRQ7u5iUasyffgLiui1OAjpVqaYqGVHaxJButj0vvS7XE30OOMyC
	 Jp+kzAgT/y5SlMoRc7kH0T5/LkNNQDfGxRtqjWWnyl3t4Ag+zinnswXwvOlFHEN0qj
	 RS9wDj9OA/tFsK6XwCBCG990v7PDlWjh8SzgI7ZH72XgQIlTnXVQfFnFL7c//wCQgj
	 bfS/O8coLuHNIgGfTdJe6PJdn3EvO2F5YjnD92vm1cvIHTf69vvnb4E+hQqH9HQTTX
	 Zgv6j5PGJbQdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D82413B9;
	Thu, 18 Jun 2026 12:50:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD834131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB9A610DF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfIGHTT6YYxg for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:49:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56BDD60A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BDD60A97
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56BDD60A97
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:49:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1828627951; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBj-0000000CJtQ-2g1I;
 Thu, 18 Jun 2026 14:49:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:52 +0200
Message-ID: <20260618124835.2935850-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=F5ububF/x1tVnVpmDYN8w2keSb09+a+NkbJ4/lZU8zBPoz0S6YdJgpJ9HAccjLawAqDj0aY5MBCkbQIaaeDDqPCz/gedVnwzs8KftPcxVz+ues1hWPAZa/CXnauZwsGJGgK/rYC4anmR/AKQiOm0Y0AuLR3IL7QikYSverJEvjKupGSn2RaFaNuuKShEFA68G0pmX2GsPqQUVFgAv81doe1kLYntbEbPElWFKXMmYGoDQF/xzAVeBbkO86tEF4RQcnaxvfHQqK2AcwGYyjIFIg8aFJwMa+acM+nb7GolXDixdAOpsAHeDnoLRxp6qXzmjUrueLVklrwTsxIKzF9w2g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=E7SYl7v6upo1O8D8DioryG9Jj+frDg0+rY/pQKVmJvI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=F5ububF/
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 01/29] support/testing: infra: add
 assertRunNotOk()
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are a number of runtime tests that checks that a command fails as
expected, so add an assertRunNotOk() similar to the existing assertRunOk()
to handle that instead of open coding it everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/basetest.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5fa902a77f..9b3eef6fa8 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -150,3 +150,14 @@ class BRTest(BRConfigTest):
             0,
             "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
         )
+
+    # Run the given 'cmd' with a 'timeout' on the target and
+    # assert that the command fails; on success, print the
+    # faulty command and its output
+    def assertRunNotOk(self, cmd, timeout=-1):
+        out, exit_code = self.emulator.run(cmd, timeout)
+        self.assertNotEqual(
+            exit_code,
+            0,
+            "\nUnexpected success: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
