Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F47C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C4E605EC;
	Sun,  6 Sep 2026 09:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8liVxgkYm74E; Sun,  6 Sep 2026 09:20:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CD4AB605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686441;
	b=lGGRPOL0BSe2eMvuS2l78wr8vpyumY3kIxEZUVskoi1A8qeC3MRZGqHx4P0A74hBvaN+
	 Q7dZs0Rv2+r8rfUcnpMq9k9yhp+SIRZhZ5vA6Z8MiopLkxrAheSCWy68jIQnsFbR7Cgk3
	 qn55kxTyzNOVz5eg5wcqvHkBbYnTIHTEDO2sfu8ecY18TkhvDkGRivHJGTmH7ZX6of+x2
	 pdGP/UUN2RunziiZ+aF67ESizXyTBEIhMHWwcWo8i7Mg2Dp6MpKGoYeOP6p320kTT/Qat
	 nk0F7avj2eghSAUfwdht0nni9z5j9jK5PcptAVao8Mcn24BygZETxGCP3jsxRPfr8kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8YFUaz1Q9GmAsgwK46+6zO4sn29iPr93biPdNYVbesA=;
	b=EmF+MDL2L0XClqhKwyxoAkFQfuiTzAud0wvFRGqlh7A8Zb5ss4ig7rI35iwmrb17eHQr
	 hJg8Lahn/AJlH/LJuAguM/AgFWCHfqEZ9+dUYzkUsUCgJZVHfMFl3OvAJPAMeSa60kZ5x
	 oageLwStBSJ4qQ+/BEVZZJNf4dyMMuvZt3/UMrx41a3Yu2EbiN7y+i7XcCY2ioFlBhhh7
	 F+t6I7bM7Ro7Yb63Anz7Jt/waaDCXdpf7uCUkxNXZUzBmTX6uWU5PgxQbnBiCPP4Rp/00
	 9jX6vN1vuppxI1H557LqV/nJ4dlcXDhQZvapNaD5gen9mXywPF847aKcCH4AgzraIiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686441;
	bh=8YFUaz1Q9GmAsgwK46+6zO4sn29iPr93biPdNYVbesA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mzcJ+EwByBA9vttc2vUAYzQfTbOXwxnEuRGc3QjfoCbGA3ebWcsy8LWnXuXbHe+Pa
	 D07P1o2g3wQ+8DJ0O5pt3KI5Svd4xwq1Ti1CtWHhTI/+/h4u/GMAgpKPABExfwlz91
	 VEKBI9OyLZyO2PZEoh6/JBf1mQfiAXlTM3umSexNgG73zH61oaFIkVsDI+p23cAfGr
	 SxH5Rw5TFTlU1rDf7pOa6rY9Fo8ejTkgCdLJh/wN3xK5K6BlLboKEqOLt7eO+NJqD8
	 7mnbsRDS/frlE02mq4wuGfBUf1HJBpj2kEIqdS08BWjqHr09Dlps0VkUYFCyAJY44V
	 vYI1flqsHxYfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD4AB605FF;
	Sun,  6 Sep 2026 09:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA09118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 207EB4008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSkrfzIKxgXM for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:20:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3385D4007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686439;
 b=EgdzILDSwsET9CDdySdlvaT5pKHw3Q7d+/1wgdlxMzKZDgD2P4BRFyVR11j097JbLOeI
 fKv7KldZUe3cwl0bd6rDV6joGRXeSwc9KQJnp+qM1v5APgnpm77E6IXzolVpRq15DuqKa
 FQ2uWhWMxGVPIkdZ5EWml7uGNRCLvO7WB1d79mzyk2lnxIJTmATioCUrP6o50XlOl0NN1
 HieG72QVgU76MQaA2vxAGcLLFxJb3wZnuc218uhw0CCNPiSVsJ9xVPu6XpqD+IdIENbYX
 JkcFAciIS9ZGm3hMgFOxK0v6OLBufDguSvoiuzOlHmfKLbDeaZM5rFcfANA4bcnF70g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686439;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gb5nw8LY7jCfJWkCAyDWXj5Mm0Sya0023QytS4Z/ny0=;
 b=qRm1QncyJy/KLVzmVuMyJnOObNTVFeNrPVg2TWHlIGBMv4P6Txljsg1PugEV7kkQrn6F
 nXNP+ZmLx+xljvOMoFnv8tYMeSxRhptMIKHT8cvExwCZIg4jw5yY4kB7L6yUIcOQzdH/u
 lfuYsDZMnPytSDWBDvny/+a0CVnKZPW+EY9/PyogfXID7munhFIQhyqiKpK8dFNvhscq/
 dQogB3matmKadk4AnLn3BrjRIY8YsfU6XXSSOXbWXdHF4q1A+qqRf65lhB5AygAdoEfb9
 /PzQhDcoEKBf+G9kJ6dLNyrtE194QedXWnff22oSqHPHJBYe24X9ZKjbqoMxW0qz2zw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3385D4007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:20:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD8D3952BF; Sun,  6 Sep 2026 09:19:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 11:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5c0a76751a7e9ba1a8816da68218db9e1379eb9
X-Git-Newrev: 4a242e9e7ae40d8f3ecf27b76e0cee69eef78c36
X-Patchwork-Hint: ignore
Message-Id: <20260906091937.BD8D3952BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agec: bump version to 1.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a242e9e7ae40d8f3ecf27b76e0cee69eef78c36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Largely a bugfix release.  Fixes an encryption issue if the cleartext was
exactly 8KB + N*64KB long.

https://git.sr.ht/~min/agec/refs/1.0.0

Drop now upstreamed 0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch:

https://git.sr.ht/~min/agec/commit/7a529662f9c113ca284c99161b32278f17e278da

Upstream renamed the agec-keygen utility to agecgen, so update the test to
match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-isarmor-do-not-set-eof-for-35-byte-files.patch | 35 ----------------------
 package/agec/agec.hash                             |  2 +-
 package/agec/agec.mk                               |  2 +-
 support/testing/tests/package/test_agec.py         |  6 ++--
 4 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch b/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
deleted file mode 100644
index fa4af2a9c0..0000000000
--- a/package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eb8ccfe5bb32273226d80236caab7a9386d71071 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 18 Jun 2026 15:12:38 +0200
-Subject: [PATCH] io.c: isarmor(): do not set eof for <35 byte files
-
-Encryption is silently broken for <35 byte files since commit b374d8de5a
-("stop reading after first EOF"), as readall() sets the eof flag when it was
-unable to read the entire 35 bytes in isarmor(), causing bread() to return
-EOF and ignore the <35 bytes already read.
-
-Fix it by only setting the eof flag in isarmor() if nothing could be read.
-
-Upstream: mailed to amin@firemail.cc
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- io.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/io.c b/io.c
-index 15ed4f7..2773022 100644
---- a/io.c
-+++ b/io.c
-@@ -128,8 +128,7 @@ isarmor(Ibuf *b)
- 	nr = readall(b->fd, b->buf, sizeof(armorfirst) - 1, &b->eof);
- 	if(nr == -1)
- 		return -1;
--	if(nr == 0)
--		b->eof = 1;
-+	b->eof = (nr == 0);
- 	b->size = nr;
- 	if((usize)nr < sizeof(armorfirst) - 1)
- 		return 0;
--- 
-2.47.3
-
diff --git a/package/agec/agec.hash b/package/agec/agec.hash
index 0b6982f913..66fb259424 100644
--- a/package/agec/agec.hash
+++ b/package/agec/agec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97958ff82eaa6aa89328f4319d585e362130168c478cf6a85ba3f4d05e453669  0.1.0.tar.gz
+sha256  7f52eb6ca021f6dd6313e1b0798d5d363edf868d0b987eb56d7039c4fce01f70  1.0.0.tar.gz
 sha256  f7f37a8bb7d993825b10f5ce2838c1c452d902eda63cd180fdabc7c3a5dd0341  LICENSE
diff --git a/package/agec/agec.mk b/package/agec/agec.mk
index b9a3d0b5f1..ccc600a58e 100644
--- a/package/agec/agec.mk
+++ b/package/agec/agec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGEC_VERSION = 0.1.0
+AGEC_VERSION = 1.0.0
 AGEC_SOURCE = $(AGEC_VERSION).tar.gz
 AGEC_SITE = https://git.sr.ht/~min/agec/archive
 AGEC_LICENSE = 0BSD
diff --git a/support/testing/tests/package/test_agec.py b/support/testing/tests/package/test_agec.py
index 45fd0fbf69..2551355931 100644
--- a/support/testing/tests/package/test_agec.py
+++ b/support/testing/tests/package/test_agec.py
@@ -11,9 +11,9 @@ class TestAgec(infra.basetest.BRTest):
 
     # generate keypair in file and return pubkey
     def generate_keypair(self, filename):
-        self.assertRunOk(f"agec-keygen > {filename}")
+        self.assertRunOk(f"agecgen > {filename}")
 
-        output, exit_code = self.emulator.run(f"agec-keygen -y < {filename}")
+        output, exit_code = self.emulator.run(f"agecgen -y < {filename}")
         self.assertEqual(exit_code, 0)
         pubkey = output[0].strip()
         self.assertNotEqual(pubkey, "")
@@ -36,7 +36,7 @@ class TestAgec(infra.basetest.BRTest):
         encrypted_file = decrypted_file + ".age"
 
         # should output a valid looking keypair to stdout
-        output, exit_code = self.emulator.run("agec-keygen")
+        output, exit_code = self.emulator.run("agecgen")
         self.assertEqual(exit_code, 0)
         self.assertIn("public key:", output[0])
         self.assertIn("AGE-SECRET-KEY-", output[1])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
