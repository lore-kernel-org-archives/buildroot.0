Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022EECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E5B40F4E;
	Sat,  3 Oct 2026 08:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IghQIo-hejxO; Sat,  3 Oct 2026 08:45:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B9D5340F50
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017105;
	b=pIw9RsdSUNCndyPNUrQce82hZ5u8DBSZdRpd2MUKKAEmU9qX4xQpe23o3lYt/7PteHFh
	 PTRyen2DLXiXtOirOR/W6ksYszqHTtnIFCaT9qz+TjUGKYjnEz/j3i904hIJyvIW33zBX
	 XzgD5FPKToEuuo4A5yt4BtHqt2w7iW1QWJ2hkb6K9gbayJ/0qMVFeQCDHERh/7R7Lj3Q3
	 awSwQpzV0N0mePVX3gP7k2PuaeUPclnnwfFnAMfrMZ7NYiZHKQaO2z9snD9kE7lzcxA7q
	 Y97sm1p+Uiet/kuorTW/vXlotG74en/2ehsLQvC8ceB+1WNHYhQhVOHzcvyvZzMHVQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017105;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6RUHwfpiWS5tW0KxEckPQZeWcwlukBiYCiQPfPZsdKg=;
	b=eAxKlqzbCyalaVUZXB1JC+ycEeWHFNEWbx84mo59q1wngCYVnWUcjUMNFBsXmfbsYq6S
	 jWmSNOEbgyx1VShU2y9WlDfxIGcAKyEoFpuEYiK/KMmHFo6gXwJkDz5xNS+xvSGRYD0eO
	 KgHuaeOFbT5SYYNC9ifh/LYCnBNwGHIS9DCsMNxd68Itrvx9wM7+JvfIjiXiCHYyN5Tn4
	 OjZimO5N+OtccBBUZA2MiqrlQExbEotIYuZ/N1jkI1P5y3kvb7Gv0O9y6Ff/rtMFdu1cW
	 lKnpux/J39XVPJyVOx2HUBhOpXQMBXsos0Aeah4I/jYEQLw1H0w/z5PRQEtKZZ0vfSg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017105;
	bh=6RUHwfpiWS5tW0KxEckPQZeWcwlukBiYCiQPfPZsdKg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jfBcptAqcaXiUXbv+os+68ZK7P5g24ZkaG8v7pgXvKuBmpPAy/vX9xRviNlR4Zo/E
	 X+/Mf/g4eFqcSeXsjKLYHlxBd7dglET4fK35Pe9i2ikedzMOVfhR8smUN4+HpJ5wmL
	 RAedZTu08bM+ca8Ffp0j5uvq3PTDRtEEUUTV5RYDNsfHI/SLIA1DtqishpYiJxxQjH
	 P7goU10r5jpH30LhA1d2baZKZ/a5Su14ymj3bjlWEgsGVqtCcT710q0ZsK7VDp2XN3
	 DW6qC7N7CaGkqCkr4+5/OstZUKbkcpE3j9AaEpi+L8gBAOvk/34A0CbJg/GiwdCDEX
	 f/YT+nC1Oz4Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9D5340F50;
	Sat,  3 Oct 2026 08:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2E0432F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F016A40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocJS8nTc_Nba for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1466540059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017104;
 b=IPQLEXKhhLyYLUYr8ESwYHtrPeCWfl9AYOc9t7SfTM9LrU8NInoes9+Xzxn1Jg21Se71
 OZzIT9cVZIDFVseThtgqy6zyGsnGsEhzKYKuDz2R2tg5lPdOPPVoJB1mpR0FFdr1GAfoC
 pEJjQB1tV/f2gEL5t48BTCP3LgRxsZgbFCjrnlfbpRP88NinQAcq+M7Nbko83LCJDaWsS
 1DhKGIh/0Ab2TlWBOrwf8HvTSJCQ3f9heFF6cQGtEH062uAc3WSOYVZYR4I5lLDTObik0
 IIFvhBiHmyeGJ8soA2Ns+LD22Bl1kItTsycriD90FrsqCOm4bik1OC4Th9MC5uGCF7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017104;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=f2iiAhDxLLdWn6jLLgonfDX26A4uBIO0qI77Io7K2U4=;
 b=iX5CdPgwIMK8jBJiSujiFQCHtsq51fdKbKeg/oGJFm4Kab101AbNqwPv/DtdBRMkyrsl
 oDHvvhTlMnFEHdTeqsqlo59hXDnwFqR9PsXc7qXpkr97tbhpUIBMO57kQsSYWBe24nuaN
 J/NoyYGLjhg4ZTac6Ya5IOLmKk57fQnar59umm3DgCr8lEmUmIbXcw3GAb+6Nb5wMrIFj
 MtYMkVtGqDlp0LtWHUCxy4RiMcu7rEgeqCL8c2taU7fip8j381lOcYlDiqpSH9oNuh0Hz
 0EgnAsiavwA0JKwpHLkCuiB9cVCJe+nc4qAPH5RBuPTRDwzi6mRMmbQV8Z7mEm8/bgw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jxY++QVy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jxY++QVy
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1466540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:02 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-81ae6aefdceso487209a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017101; x=1791621901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=f2iiAhDxLLdWn6jLLgonfDX26A4uBIO0qI77Io7K2U4=;
 b=jxY++QVyfiL9eLc5yV56ekH8q9CEx5yKmLPhLP6nKhG3wW2ovwgttjYJ0WbV8A0/Na
 ZqzSdoS7j4T1jmnEaeZBolkQ8XbQp53dPcANN4gauKYack0ZVomTLqnlWE59ckgC6wvY
 oMzdsGiI2GmuyJBGOA5qLikUkKtf1hoOUsoSaPH2J2cM1MUST8zE2bARKEY1R++BG34K
 3/ebecECJp/7G4oGfxxg4Kuz72os2QaZivJDs6mZbhxA9QuqC7L+n9azTjjIuM9Uo4Jc
 f41Sq6NvDGtXVqPrFla3lL/ihsKr1R9lC8p6d/g+KiRUnUgAqmef7qZGEhvzYTTrRA3W
 5Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017101; x=1791621901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f2iiAhDxLLdWn6jLLgonfDX26A4uBIO0qI77Io7K2U4=;
 b=qm1PU0AxjiCx8r99vO8azpK8b/sOUXRiZChoeqt4vNwbsceYFzaQFRV+B9khPVQc1U
 vd3Q1gaIOitVEbj7xrmYH11aFSaea0qPHVQCXE5OpIF3LZAZjuBdwBkiFVtMGw1onc5F
 JW8OssEkErDAuiFExmZvk8FJTauK260JgtS4NYcbE5yg3azr7fuTruRRa5n2aoC4pI5Z
 1zB8mk2XFtmOcT+b+bwVHP3Vel89LTma0wkH9CekwmXFa+22DCK75b+3MG0HJefXwnkZ
 +xC0V/Iwr8sFOYk9Yq6nnQaO8WmBZ03lRALc8xAnltNioRn76pSWToUWFpsEfXM6LLZH
 VZgw==
X-Gm-Message-State: AFuF++m+ei3xA8SodDl0KABaLwz9K8whZRDmM6aKCGjFvgdKzU6ZRWoX
 l6dz4Ft5yY0jOgYevR8q9A2zZobWI/iHy/tbPhRrXjHtHpNRfdhJrlxhw4fqew==
X-Gm-Gg: AYBFou2aArukQPtMAsIJqmKaYnOVS1Pw4FkyvRubq6KpZPm/NhaBd9x6E+lQ+5jYxUu
 Pamo7tXC2w+Jq49+gIfHym0Ul0UGhonZRT3TE/V+52UtFuMLrwiR77v17X5edGSbBJXEJoG7cgL
 lch7AQcqhMC/7lS1LLbI/HB9lQr+CRaHMZSI6mWkHaYQBEVL+fz3GrgTC9CdA6uXwEmp3gYWgN7
 ywNxsgL6MPC6VqInqZeF0OOnGGgES36B/Swk/9rGaNhBipT6tp8lGmmugEGz4GdvsA/DYhssFyW
 dEC7fgtNGHQvlR5IdBbPvw636Lo9wM+fEqEJHbuvhpbHqrUTYAQ//WDluOXXs96Z9dNcO167YUo
 lIzk+cNF19TJleb0S9cuJLgiYYhyJIxBo5uXz96HGzrI+K+zyPqRzJGcs/u2qYf1bTteMz7tRie
 vGw1ZMg3SY/aTw/1UBO3zLrX/Z9O7daE83IN9eHEKKzHUS7ceswotg/lUGte4HCa4bSSPjvHzBY
 d/ZLfFMxIWrv3WrTx3vB6RW8A9AFBjBpJx4OuHxHGJ0Sjdc/977Hs1Gu4lbco5vYW18J9JvwidQ
 WjEOkfZNEMIgjU3PtCc8bMi+MXCqfXoUuhsVmVpgKWqmokpGJPkiIUiXOb3NPxHcp7uPj82aZ7f
 FW3+20NVls7yjESf6vvT15TfsJneobwLEVMgFm6gKZw==
X-Received: by 2002:a05:6830:25d3:b0:806:ab05:c1dd with SMTP id
 46e09a7af769-823f9d9575bmr2152605a34.4.1791017101307; 
 Sat, 03 Oct 2026 01:45:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:49 -0600
Message-ID: <20261003084453.545653-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cachetools: bump to version
 7.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/tkem/cachetools/commit/1b704d0bd4b1656109f20905d76f1564a185afd7

Add the host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cachetools/python-cachetools.hash | 6 +++---
 package/python-cachetools/python-cachetools.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index aa44ad61ba..30d162f443 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  1501ed3542a4ea9212d74e3bf5974bdc  cachetools-6.2.4.tar.gz
-sha256  82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607  cachetools-6.2.4.tar.gz
+md5  6e88355ee27dd4c21a817cebc3c3c6b6  cachetools-7.2.0.tar.gz
+sha256  bcac1a1b8da6909994a2957238a57b8140dab7c5c5c69a43669654fe87a33c1d  cachetools-7.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
+sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 0804e0f2a5..19d4a6877f 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 6.2.4
+PYTHON_CACHETOOLS_VERSION = 7.2.0
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/bc/1d/ede8680603f6016887c062a2cf4fc8fdba905866a3ab8831aa8aa651320c
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/29/2c/3f18755527b03ca9ff6be724bd5370cb777c76a87f17301377cf04a4729b
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
+PYTHON_CACHETOOLS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
