Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE78CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B7460EA9;
	Sat,  3 Oct 2026 15:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2CcY55SeVal; Sat,  3 Oct 2026 15:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97F1660E9E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042927;
	b=jUUTFcTJOvkwuEBOazJa3BHdlyNWfsIcjo5NtvIHAtGVGUX7R1FQP09yIOfpOsH2Lzx+
	 7LlqeR7U74KMwwz4x0mbdFqTb908A4GGwOklFP4NN22Z95IsUTUIuP9Wvs9pB2kC076Le
	 YDRQQ17scXIV9BrA7XZc+i5xsf1IpetHRUKhnenR8FKDYtRjN9ZxpxDaE4WtMup4E2lWC
	 ugrKb9D6VTyI/XrNhsY7yXQXhz6YLnEjJlyhg5jSYKNsV3gt1PUJf5L0BQ4ZryvbHduno
	 0KWRagEACgkIs1K37PFzPBfkdUhVv0mjR0nYCPn8ZyOM+jIg95byMrTtMmZQY/PgzDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4wilOft9VlOSbBv3g435/In+SL1laOzlr4uKGmnkfys=;
	b=hWNbgVpfoHYmOhDaaPx8SuzAbMX88raAa+rgJZ9mlh4sJoq8CK3j1Q/ohWKm2PZTrVQs
	 eorDyihDfMHUBot3nJJ+Q8x0b4g6Z85EUpK4PGbAoph69nA9LeqngOBziMD5siqXv0dtd
	 1Wby6BgdfoBNr55pIWRXRXybhiVzylN/I1StllgWsxjbCH6g/+XsfCYO0DZIBX6J556lq
	 mGkvqWsRTYUEkyXYpAeX28fX1zxuccf5DdV8xFClj+/T3GS2BB0Mlqu5MQ/9p0lc3ZuP6
	 JaO+mZliFw50ZR0McdwaH0wzgfvkZYFBhDvM8KYLDTnwBXOt05wwWl4ZQQvS3HPzQmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042927;
	bh=4wilOft9VlOSbBv3g435/In+SL1laOzlr4uKGmnkfys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=imxiW+E+hf2UDOuLEJbvelhDIm/QEX7f2euWAVFctXahJD248BLpMg67Sgz0cyL4U
	 rh3REvuRBvPB/QI4yyO4LWVGp0coEJjbGLn+Y1f6RvrxvWsnW6+U7IZBEu2VESdVp9
	 r4d/SDOeWk3WnDEZ8gkmR27OvNgRCsY9/blRtlw2CrarUkprDeBznmYqMJ2/3Zn76l
	 NBMSvr451M1GSj7BEBtsPKYNFW9pjCTOiPZEGk2YZ5/uT6+19N6CAnbagxHPZuCyAK
	 R9rEAQ+kKtuXJfbazsLo47Rj+AFJ0O+EjI/lRbdKDpvENga+JvQ3Ji6eXvgwxAR9sa
	 v/VCJ3Sg1aNZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F1660E9E;
	Sat,  3 Oct 2026 15:55:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5151D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F152B400CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJbu76momS9H for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4E485400AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=nKzCytcjlrScLIuMesGU/WhcP3o2Rx6/+acYMr8mz4Lt0+oIsgn1USMvP0ughHYHQZrW
 hOeH37asZwLPFMOcacJ7j5z7mDpqAqhiPnPkhyLhP6RiH+oP1C5rdCYnr+7+aaols5cqb
 D25ks0LmI392oREI0thUfT9gAlprlnaXALtY/HIfDFJmctao21fLXVk9IFopWbiym4WTO
 C8h/t168vZ0vDmRw/YTCBJhAGj0hoIKZsX5QkSUIRyLVSo2cf2+kxJ6m63dxsYaoAUgKp
 5VMQXxTKQBKum6C5PROCNh8ceRLKblqJPrSrziIiN/kCxM5Dqt+6rSDnu6swsjnRQYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Aa9/opf9ZkLf/eRAZeGBWqIUwF55srrRy+T5lFFdkr4=;
 b=cUitPxnOBQRyJcWpISZT8wWo4YogTFWtxyFMV51LcAH1nc20wwinlK8a3pvqkR/bMvN8
 ENFViK/8H0WW16rsSULxiLZwX9drNGmWe4gPbnb4nkt4i6slBcdLnjdqspb/YmYS/Yd/0
 CUimBTa5/IVJex2Cey3T7fvkfdfvHk8cCcN0+J8XRgY283BPaddWGtYKZswV3YQQ7u+b0
 TJdq+5zN8ckzpSLT8AUBBPP2w6ABGcRJ0PwayYrcQefmHw2+yANm9iO0b7HUgh+ZgRhI1
 rgNzXwmoLz7K7eRt7oKzzoFmoRYWQbEdRG3T4jrA7adfdVWL2sWcdk5Xm5SHGWjjoLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E485400AD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E00488806; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b27c1a81cce6c15e8b00743c61f68d61565df19c
X-Git-Newrev: 9a4717aa87e6978775505e11d6f7ec66cd06bf33
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.8E00488806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump version to
 1.43.103
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7242409584309019952=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7242409584309019952==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a4717aa87e6978775505e11d6f7ec66cd06bf33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Raphaël Mélotte <raphael.melotte@mind.be>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index fdeb9291ee..fe438a9e80 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  6a8e7551f86c8701377928541b1a9f4b  botocore-1.43.1.tar.gz
-sha256  270d6357d662550fdb84973ec247e02bece0b6283d90bf37319c7753515336e4  botocore-1.43.1.tar.gz
+md5  9e7a3210cc146e77aec1c7cd6652ee94  botocore-1.43.103.tar.gz
+sha256  8c7f220e09f3b7ec99c59c716aa66cf6f5b2b57fd8731544054f3778aa744c6a  botocore-1.43.103.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index ff892c60f8..0226e1c2b6 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.1
+PYTHON_BOTOCORE_VERSION = 1.43.103
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/03/b7/416ae6f1461d6fec3b3aaffc4759371319c71a21f7ab4c3106ee574fda8d
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3c/83/acbee6f2e3b1f02de935fef0c48a387511bf979149dc6b44466aaafba6a5
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE

--===============7242409584309019952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7242409584309019952==--
