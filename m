Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413A1C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 20:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A15811BF;
	Thu, 10 Sep 2026 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9z1jpv_aLwp; Thu, 10 Sep 2026 20:11:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D5B02811C6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789071074;
	b=FVOmDCgmFlYojUx1Qb46wRiLu/5LknaHgEtSykofm3rUwq0SUP2LTJpfGaNzwID3+v/W
	 MfIzd94J/gyQmseeKp+HvZOv9EJ0nyrWZUQAa4C8Xjq8vWewTlMiKKxe1+a8PNcSoMs06
	 DrZGKLacl93SFyMe77PSia5Qh9LV3b2wJ2m9YKxxOtT5bNs7BblcQNoOvmIIi52gksPnU
	 26xJ9J9I1cwf6Dn3lbkv2TVuO4bffQWTS2Z/VJODYoXZZ5sRRyZS0V3rPmmMT9Gqurws8
	 ivpkS3HZVV1SviMtIAp677fz4BkPNj4aJXGa8rVERTStjIp0073eB7Yb0niU030rETQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789071074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4bgrc006DPdj2DGrMLu9aDyMA2VLuX+z0ABcQZ90tTc=;
	b=FKdAJfaud0Xl6GOD5BQv91MnfStqeskdgMyiMrTzunXOPyGiiBg9gSjHa1Ki4HGReb6N
	 bnV+GrLTKQwrchsN95exg4AuGYMLnlodZ40/r8/590n3+uto7A339+lDaodMKsXEhy9Tt
	 RC4jsIL5m5jNFqLYamLJJfsON68hRXEYOiSKuGimBRp/T+BxNv08vhNcqHJ+bgK/KRowQ
	 Ms0eGr/2wuEvJCNXBy3N3UPNSh2tRbMlJFY9Tkpxt/PDUUYOErEbZXm850LlMIc6uVlX3
	 X5F5JcWgwqz5sa9D6lm9Gu38bG9Esd9q1D6kdJBB5k2KlBuiCJUx+/L2U596X8v6hLA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="Es/XPH89";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789071073;
	bh=4bgrc006DPdj2DGrMLu9aDyMA2VLuX+z0ABcQZ90tTc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NlHFJA9pnI5DxJqyjMCEunq0R4vZQHSufJX6qCh/L1dKdxN3CzLuE8XWAY7WgcWja
	 LfQFu2AX4VIQ1cHXOMwm+RZNph6Bd+pNFFME9543OXAZyhOxeLuPxEmn9ozUs549mL
	 10AEpjwBiFA2xcjosLsoSOXuUAbdqLvMjfAAiRD8sB7D1RVWU3KQAgZtsONGmtrJBd
	 z9qpUafLUevxd647MnOjsudVIBo9kjrYltw2g4KNP+9Se5YJ9KZuQz3kLtyaZds2kO
	 XXS1WqaBnySmH1s4l5279Qo8g08VKKnP1FIu7afvx4XkBYqCjBV1sKpO3UNfsDcE2Y
	 igTkfWJyrPHtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B02811C6;
	Thu, 10 Sep 2026 20:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA08514D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F35A811C6
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHDMLI4MRl_y for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 20:11:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D5C8811BF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789071071;
 b=cICeMu328N6zEUmFP32u2h+LMjJFTdX9YUj6kKngwc+XhqGSR8C4of27seiK2LqaF+9C
 Q8/EXLc/iE2+D300VXxRIJZiALG7+7lRv+ZZfkmlyOncK7wOJUpTcUFQ8Fn/hXohji8a2
 88iyACPizXAlgL989DozRUcPA+2VJkG83l8UBHfgw1b0hb1XV9+JUsikqGPJktKWNUOY/
 2JzGvR3Sc05jHgt7mSQS+yWbsCJqy6ih2REQAm6zV3we3oVViSgSn8YkJ6cjSvs/ZFGK2
 CWTUi8MEqCgs/GfXfUS1eEfcorNLxslkAniJj+igqsNIo8S9v2wIxAlFuXBXtduoOtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789071071;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=HRnwh3K9KxbosaXtRMcTpvxe28uqibB1LTyat1crB6w=;
 b=VRIpBCRYcZIvSxZyHrQN/j55l3yRlvhKChl3l9ie41g+XxdhoV8VC8lM9sxWVGcS92jS
 7XmS4J6BcMT7VQlae6NLXUtp5WD8VEFI/qZ8WSjtz1XQxh+4Tr+QMXWEVGE7I38WUHcDL
 e7DPuISNthDuMoIiWCfRXzCrDNqCiDYFgUxEGwLCNMwb4k017JjwbtxjY8rzRZE65NX1g
 Ix5FkMrMe/kGZ4sdKkjrKvKXGaHrdZP6MEKqf71zsw5mXHqNAb3cBFTAgmtS3fFo/un2z
 OpfRt5kz2hfGbohgkTlOCPxq+bF7OqyvZbIQV45nxyHjNF7gXYGexX/ZIHk0xDMkUEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Es/XPH89"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Es/XPH89
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D5C8811BF
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789071066;
 bh=HRnwh3K9KxbosaXtRMcTpvxe28uqibB1LTyat1crB6w=;
 h=From:To:Subject:Date:From;
 b=Es/XPH89u2y5n+LNzcgJ2yw5keNjpx/Zh72dn6u3hR+j1XKGLhhSpg4A59bDGo/0K
 QQFDEmUgK63aMFrOsFV5qiK3As5wYvC9zYVntl8TNSoD3VBp8n9nyrPHZt6eqGupHY
 oFTgpJYkELzoBXI4etkla7gSut97ddgbMFKRWSJ7B8UHf9Z2Fpty4YvlkJ70PXAUXn
 0idQSoga5CaXvYTYK/uGhohrG5Y/LBxXc0ELIjlpevLQU5i7wQTYBSd/0INcDONdFz
 LkHPJ1TZdOgs0Bf0UMltubpi2WUBZEIMfNxxAHtuEEctDt0/+DUMUsQo5OYx/kIrPk
 OyFjrKEZB5hkQ==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29D9AA4C3C0C
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 22:11:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52014)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4l6v-000000004ur-34Jw
 for buildroot@buildroot.org; Thu, 10 Sep 2026 20:11:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 22:11:05 +0200
Message-ID: <20260910201105.2543208-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/xz: security bump version to 5.8.4
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

https://github.com/tukaani-project/xz/releases/tag/v5.8.4

- lzma_alone_decoder(), lzma_lzip_decoder(),
  lzma_auto_decoder(), and lzma_microlzma_decoder(): Fix an
  invalid memory access after memory allocation has failed and
  the application reinitializes the existing decoder to decode
  a different file. This bug could at least result in a crash.
  This is tracked as GHSA-5qpq-xqfv-j9pg. CVE number is pending.
  (Also in v5.2, v5.4, and v5.6.)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d8ad85198932bc421166413ecf9cc821917c56a9

 package/xz/xz.hash | 4 ++--
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 488a3d55dc..270ac748db 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
-sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.4
+sha256  3340ae48f88665abc78d71dc43446fb3f7e70b48fd59844ac0e14958cef6e00b  xz-5.8.4.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 056c168057..c3232966ee 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.3
+XZ_VERSION = 5.8.4
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
