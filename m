Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0524C79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 284A460604;
	Sat,  5 Sep 2026 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAeTp27cI8P1; Sat,  5 Sep 2026 20:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B755A60600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788639595;
	b=htqlSB+wGe+8+2aM6Cshp0W48oi49UKeiDVkRLMLm2ZjPNojPqQHOkT+SV9IxloRtDc0
	 T8ilK9ZuZPP1QS/1cbRBZtqtbWRWGnMD7ixQxVER+IiGJ4kq4ljnbaNsYyWKYsvmMmo+z
	 obONmuwJKhftXdlzMXUxhecmTPrEhJfXSvuDPp4ot0lrJ2jK0Qs+x9GIBZt6svq8HFRh7
	 +Y1UQ8djk1Mh1yc9PcXMVpBGIEZAFyIB5r/j3FFbcQtWznb4+Oah4X35W8XX70WQlJXdn
	 To6RuFiwjiTMCWLnl9b0HV7Rg5izzYCqCQYfWiRkfKVc5e7JenaHq/YUgAc8eHEqVzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788639595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nOLdgYNs4Sc/Sfi8YKG/VUxMiKnde8nNXnKQfetC240=;
	b=RMZXJGH0kSLJuchcEoz495al02O/04lcQgoNKfi9pCgd0VyO/PMOYWbmrJy+GzUb1xzd
	 PFxfy8m/Uve+NrVYkOSSj3jn18t5CMmSV7IFdjjbBI9WJg6IdXZvYozjyjdZGceSJziB/
	 jKtVy93/NiJ4ENyDrtxY2XzKJmDbolH+psDgbmYWXJeaLxNq3Lse3GQeOakUOwmorTySm
	 5T0BE2ht03oAvIb71Z64+0yr9waR7TAHA8rcW80ZWUWiOGWhFlkWA4ub/Mq7zmxEieNoF
	 iwjH8+XxgYLy9PLtU4julaXzJxHxBiltu2YIFEsH0zg2tMu3hTnCLPkIIsD5fIuPkqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=MNvnt+Lr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788639595;
	bh=nOLdgYNs4Sc/Sfi8YKG/VUxMiKnde8nNXnKQfetC240=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SKAEz2engdWJNwnxlZFtBqZN2OUNDYXV0doTwsBNLpj5SGR1RN7dd4wnBbwS7KMJQ
	 FqNycFyvUsjOS2TWiBt8ANFShh0hTEUPEae8QZhWv7Y7rotbFwRFlDLIn4XoGkqTF2
	 DHKliyYJc+Mb00qTw1Neg59HQZcnVLxvewtgpUHd7s6P16Pm15LH5kvAEHunXqjDSm
	 RLLvKHh3KFD+JNs4tnXrJidT3QmQrgtFqXvCbwnIJN6KDNGlCTfsepPwvMpKhLUMoA
	 TtMpzLaVRwDTV+jeTGVNeApN5+/+p9Ts8VvyJoUMjAnZDN2xGN0wx+Fyw8JR/2N6Ey
	 XZ0TP7RhqG3Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B755A60600;
	Sat,  5 Sep 2026 20:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DED105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7546160600
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbr5HOGC_dX4 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 20:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97FDB605FC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788639592;
 b=KUPBtKaXVxEAJsj4BHN7AGP6QXRgAKkbLy4+m0lVq1HYymz591/tRtHbtUgXAjbKdCMv
 YyFE9znyxeCIhCbXlMKxaGd5xTjRHx4I44/kIoi/F15nH5W6dmqmUMCqKDGJZttDpGiRN
 eavXoRkmXHIGCbcp3XztGtI9O0ohCDCM/Pf3oTga5lPlEOU78miYf9/A2k91PqERa6Iwc
 wHt1Elsd1/4oX7GBUOkfCNd3BqXVVhWSrWXZ9qUqqkJIX3jyjjfJNRFR+51yLvzzGSKvJ
 Pso4m3OeV6h/veI+k6CTDpjhZr9dc8HtIBwqGWhsKJjizdFQgPXfHBZ15f+2Y9tjAew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788639592;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=HUqFjEDqrfojzOcwl2KhtOSr1Qg+oZflfK3kSL4Lopk=;
 b=FoYJI/cQzVAcsCp4cqYEvtbFWLq2gskF/6iMkryL7DLAKas3qQtqOY4b6U8IrKd2KTWd
 PBCbehbGlvFqKL97pU9Qr1eIhAV0kv7vOSOcKQhI5wGf5OY211G6d+Et4JMwoM74kYDtm
 nshmM3dy0mybRiHZd0Svfttbkb896P+mP48ehHbApu45jzh46wQ8p2sEpMWiR/T6JLRRG
 MlB+NFTZA9XnJTONRVtEnsUbe8lj1hgnmldYsTcsEmYW5nA1+3pl7Z6lQeCFCUiwY1PkE
 TKUNiK4IRGxWVuWaIOtCm1oX7vazQEf5bIfFH2wZaMNgw669GWH2rnerSYeFKrxwKTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=MNvnt+Lr; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=MNvnt+Lr
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97FDB605FC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 20:19:51 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=MNvnt+Lr0NGZqHVORhoPkRmRM+wB+cKylMEy/pavjWIYZ0ElPJGbu0gRCEW6CdjMB56VfrMAPC4J22HU3VsxAabnDmtxI1LtWB5KRlcstzdWCtJ0f6vGW4CdpApvt8nezFqlAV0kxQ7CHZDCBbvndL00ftd8Jg1sodELAmaRLnFT56rIFpWiBHcDU8RIUGeoXzag/Gfmfp0DvOngR0LoZf5RL90lSV9PiweG/n1w3LC12vHQPBgNp8GQNEfPIQcu53whgutS7AH3Bh9knOMV79h9Yf0YzWTziVxprhP8qfbaHZ8Dt7aGpxZe+vNyrQnVlLaomJ/ic4Z2UQZrNpw5pA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=QuQgw1/thnqDUkV9c2t9Ql34HBpZg42kfG/kPQqG9Bw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 135283780; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 05 Sep 2026 20:19:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1x2wrb-00000009i9y-0xE0;
 Sat, 05 Sep 2026 22:19:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 22:19:41 +0200
Message-ID: <20260905201943.2314688-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/agec: bump version to 1.0.0
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

Largely a bugfix release.  Fixes an encryption issue if the cleartext was
exactly 8KB + N*64KB long.

https://git.sr.ht/~min/agec/refs/1.0.0

Drop now upstreamed 0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch:

https://git.sr.ht/~min/agec/commit/7a529662f9c113ca284c99161b32278f17e278da

Upstream renamed the agec-keygen utility to agecgen, so update the test to
match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mor-do-not-set-eof-for-35-byte-files.patch | 35 -------------------
 package/agec/agec.hash                        |  2 +-
 package/agec/agec.mk                          |  2 +-
 support/testing/tests/package/test_agec.py    |  6 ++--
 4 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 package/agec/0001-io.c-isarmor-do-not-set-eof-for-35-byte-files.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
