Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E7CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334C440F55;
	Sat,  3 Oct 2026 07:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfssCNcCJ29g; Sat,  3 Oct 2026 07:13:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 408D840F47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011606;
	b=r7b24f2bUdG90vX5blFRNrU17AC8nb3Ga9z59GTCjyyqon5dZDsOtwOq/unO0me3m1Bh
	 9t/SGW1zXNT/KAxt2XidTGeHzVxZZgvWGzgDD35AAaHLn+5IkYugT+x8ee1RVZ6pxJDw9
	 aJvvzIdMEK5HHojlca5j57JtSZ08ooV4yMONHtzRva01UpL7auxzMlWQIto2vWhxbXSHQ
	 f/wMuU1VBLXduzT8+97OHqWaXU5dMq1+m0s16rULuIFokizwSWV2m0Blc2+2eGG4XBNqj
	 rOqd28W+KdGxR4IkWZaFbzcxRa8DdnJsTHghkZmhWiqZ/rW+///4sjIqde6Se3pXFeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1NdjchjNFqBv4eIHWZK4Gp2m5SLtWHks2UEeFejsLdQ=;
	b=PVlLUixXFgoIcqIv/44rg17lhxFPg0ewUcaX5CPfUdHekMItG2O3hWtn4q9RSELyeIEK
	 5C3El44OVrsPcDwJqhuIMdayAw0D+f5utDku1Bry3OyCUzdGuf3ClkgoYsnds0KgqiEGV
	 8GUkkbaapxJ5npqcMiUwQRXNFUSenpOdLusexyHgFVhmlCnWfDt/Lx0KsbWJZpi/m4bL1
	 Yg8FJOV5Gpr8mK6Mogl0drgY1+esP2AJfNYPfhsM5pP/IEW8dwQ69u+GOBbTyArP5ELRQ
	 ZI7+WuFa7SgEpX3i+5OR9PhLVEebXIM+OpwRlh1RvNWGegYBgMWvEoiRiyiYPy9vD5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="M/kuEIn4";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011606;
	bh=1NdjchjNFqBv4eIHWZK4Gp2m5SLtWHks2UEeFejsLdQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G3MFYPSQ2N1u0V19y7+15EL0aeSctESfuwcbJBEygaCn8aNh7/hWleOX/LJb8q2aY
	 LLftJEg+dAdJRpX3EAN1W3BGe9IIPv0ikUaA9nhYXhgSbDe7IIR////ASxqqlONTAO
	 q5e1fVuo0QV0Qn1Hcy2mUtHpxdnnhzesR/OVYPLH7QPH73mFILEk6DdVIRatYW0Kih
	 ExdIXDe1aepajd5qB+0WdzeLiz97vPQ1W8y0HAw0LIxMClrFs0vM4Qkr5HLa0xbLOo
	 sOdO5xFBJELAwp9mLeHB848Qhj2sFk7abm9j08zE+eoCcJFFy4aTUsNjz4Rp/8xCV0
	 8tn/Fqu5OBPPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 408D840F47;
	Sat,  3 Oct 2026 07:13:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A24D263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106E440F47
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZvSZfk02t9q for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:13:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 21AD540F46
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011604;
 b=dSy2QN+g+9Fz7WbgnrBCSMr/8ipWsTgwgEbH6b09K363zoW8II68X6MgjCiqrI4HuXv+
 USKPNZS5Q0d/oSAn/wWmt/R0+I4S3YsbKX7aZ45/gpnuLchR6aVN9rVOJBdKbzZGHkzoS
 dBVOqD0euZ2KXL4wwC/VYLNMZMhagaRtxH3ULTd+tTBl+SqY5wtvOPL3r7n5qvLFQf857
 EkqNiVy5jNFxHOpikkBc6EbwW+igeVneLLs9g1DSgzejN0V8I7myT81j/rOG2MOPS47V4
 d3eNaOyjTh1cB6EXpUlKJA5Brw58nSUEb2WUuvs9pt7l4N8S6nK0ew4sS5atz/KdRLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011604;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FPmk1BiWnCR6zQEMzdaxjB29+V9Strrz+1Is7x8Grtg=;
 b=GYAdy6WrdYDfvPhrsy/SgMo6cveBsRbatSFca2YyusnKo8rZrpz+lltScIweZVKMShYK
 ahv8fxjGP1FhBKT81SQ8G4NGIiUXcOElzIRBdUiv5bq7HlWtKb4H07wv61G/FqZPPZBmV
 RFgCCV1pR/l4z3kY3TECoyg0fdjbZJB5qMEh023/ekbSstRerrS8Aej2XwqWoI2xmo0rM
 AwucHfsJwfCLIuGXHSieuoV5b+/nHYVVVghYLgeSBRkTsVbPe30Ybls1H1JW2W4n0+TMV
 YuYucZbVsABExxh3TrIh3PmndnvdVGGXv3bW0ubs2U6oi5pqqmsGtCvnuYpvSbToPYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="M/kuEIn4"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=M/kuEIn4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21AD540F46
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=FPmk1BiWnCR6zQEMzdaxjB29+V9Strrz+1Is7x8Grtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=M/kuEIn4lii3e3Ee1QI9AYw+2Ng6fGX4uFXlE7j17/EG6V2OhWJ/V6YxW4YeqFozX
 fosCLcoWwAov0wDror/ozAmBWY8lVKGzMiCyuAV2jb+rVU+L15HIJlBUaL0J1RmA95
 ArSQM0rSzW2sP/DOK65jA4II9LpoFjcERjHc5SGzdB04HAokCK0aduvgFCPqVhu2ZL
 zC2q1T4rX6PzWBdsTBv4XV/ljzi+vSzmvuUZ46jleeJ9K2wBUi6UwcQu2UmpkpNorQ
 rJL2iIaKiDnDCFcd27hAklO1fJggQ0ildGhSLliTalDHrfHbnSAd5usbqFQtpyORV7
 zwzjPemynck+w==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 85gWzOfxTuMG0n3WwccCG547Jni+Y3QJSIJQV+oYqbHpiSGVEwHeLhZgbr49GHf59/39ja8wzVC
 +KalR9F5Xw/MSWqV0ywFnCSJElI/cxe0lIVbyW27oM6NKwq0Biy8Dawi/oyDsLdawOKCBuWQekK
 DCu9+yuq1QxVrreV2aFi1fzAcS+b4D8eevyRdJIcpDkl5IYT35ksHSNtJhp3NAWLOj4ZY4Jd+QN
 SsGf2Lm6oTetKKLFOImEycnEasDmDce/+Gk5e7bRj+xLGS4FxsAkx+ycIDsR+BBh8Foaf6aS3ls
 WmPM4yzp1kL+OSt+AYIX7UwbfAXWPH4DKsYwBa7hfqPXwKK+iiXp4O0lYg4TZ8cYPcj+HipIKkm
 ELMnhI30zWmTqpCfIOwf6esuadXJ4DipPIETKon2a1EszKzMM53/ETlGqDnLHw+oUQH9ROiwKD/
 3AW64pFM8wx6UpRNrhBeQlizyjKulsrcN0+aF0s+pSWcFE9dzn3uKgEio5JY0s8LFja4jE1x4d8
 p4K5hzR/fGHd9cw3gTd7yq5pPsvbuCDPhZXeIVm+Tkj3mFPzofj07h3wgrD64Uyhp7zDWXBL3eR
 arSEoFNzqkKETWB1+6Qgvcwug9IowUvyGrbSee9gfo1XMEri+22AtV6KJ7r4T9Ht
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82CF1A4C5444;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-21Ka;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:07 +0200
Message-ID: <20261003070128.1295458-95-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 095/114] package/python-trio: bump version to
 0.34.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 79146dc1a2..a6ef3cbceb 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  e778db1205fa2ea00dac9340471b8f1d  trio-0.33.0.tar.gz
-sha256  a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970  trio-0.33.0.tar.gz
+md5  19217ef09ab5a871de7b6165da677e34  trio-0.34.0.tar.gz
+sha256  63b9485408bdfdde544fced107045a8c0086cdc4bd0ef2f797b9e0dd111b964b  trio-0.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 4211dbb313..05f288642e 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.33.0
+PYTHON_TRIO_VERSION = 0.34.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/92/dc/a2d25ed73ad49cfd79bf18d262577c3731c98e382284e28d522f49a0df35
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
