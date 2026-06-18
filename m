Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C3ECD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3686D413F4;
	Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEyFxtnEzeaj; Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9528C4148D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787026;
	bh=dK9pqDC5goRGOPYAHC8a3YGq3XzvZEZ4MhwW/c9PcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oXQbgcyA9pwho5ow677hlLcCStFRtDa27piIQIQ2MmWzAlu4d3WgniGeklfM2xChL
	 tRm3HsIK2uYYxxSH3EgppnECGB7mOJVmtNZxEtoP51uzU7TtFjJifIgBbEcQGvlQEu
	 CreWLaZbQCC+fVJuovbEIqBPgN9u2R7AsX15v0i9sv2y0Auxr3fPsRqaYjMvxuz8H8
	 xM4ZL1CuRPzyZqNUwpNnqLOjisIYPxaJ+kyTSlWRFdHhSItKF9w0z4yKyskyxLXvgh
	 Q+W3YhTuNTAmawLMhhLOdzy5h38FUUbkE2Zh3Y5XUhbAr3kvJ545qFJ8DTVJEkGFEt
	 F6WoCB5Wz8Ibg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9528C4148D;
	Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24ED1131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0954B413E5
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVmSrxH_E3n5 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E16B8410EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E16B8410EE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E16B8410EE
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1439251277; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBr-0000000CJvJ-1ecQ;
 Thu, 18 Jun 2026 14:49:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:07 +0200
Message-ID: <20260618124835.2935850-16-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=G18HtedUayGXQynoELSe3BlMPEOQzGzytyc+8lSt8CWCDWDPf2T+IT+muLi9WoRk6ET7Skb53LVJoBe+irZnFk+SvAnqA7o8eQv9Rx5Ne3CLL/cidG9ul+EiwEkJExKVhrTVI4uq6oouM5ZN86uvX+c7tmzJayfXCEziyP2pats8osE+ecmYrxje2fruHsupapKxb7nL+vtOeiBHJCeVkr3aG3JhL2ANdtpK3nMkJR5rCmUc0qA804J8+3B/rY3L5W7TlA1Z/cSFrHm4mH6UsBCPizlNTW4VLqd1G5HsbWcq7PqWJaBGduee/vQuLpX6fSl1/irpDQtBQ12pGZzWHA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=M0GNHRi+Ow32PV4Q5AevZiNNmshI5duyxRgIPomJhaI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=G18HtedU
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 16/29] support/testing: test_libgpgme.py: use
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_libgpgme.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
index b497891249..5d0ee34aa6 100644
--- a/support/testing/tests/package/test_libgpgme.py
+++ b/support/testing/tests/package/test_libgpgme.py
@@ -31,8 +31,7 @@ class TestLibGpgme(infra.basetest.BRTest):
         # We did not create a gpg key yet. We should not be able to
         # list our key.
         gpgme_listkey = f"echo LISTKEYS | gpgme-tool | grep '{gpg_userid}'"
-        _, exit_code = self.emulator.run(gpgme_listkey)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(gpgme_listkey)
 
         # We now create our gpg key.
         cmd = "gpg --batch --passphrase ''"
@@ -66,8 +65,7 @@ class TestLibGpgme(infra.basetest.BRTest):
 
         # The output encrypted file is also expected to be different
         # from the input plain text file.
-        _, exit_code = self.emulator.run(f"cmp {plain_file} {enc_file}")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(f"cmp {plain_file} {enc_file}")
 
         # We now decrypt the encrypted file using gpgme-tool commands.
         gpgme_dec_cmds = [
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
