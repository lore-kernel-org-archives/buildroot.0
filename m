Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1DBCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5741D40A59;
	Sat,  3 Oct 2026 02:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXBZWf68VJNR; Sat,  3 Oct 2026 02:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D4E640A4A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994420;
	b=ew8prUN16748erz5EHg1/vppNi8Nyk27Lfmm+YkV+sD7f2LbUyNm/T5Ej0uG4clLRXRo
	 J09Z6+X/7jsDTQ7xNwZw3s5b4WvQj2/xHo58uG56PI3wvTvccg1VMpsbAOAZxiYllQQpk
	 McYlAIdYst22ZP7rutyOEpKJYrfj/xL8jUfxoRLgDzf98r5teh56qh/OlSmP+LPKYnH5Y
	 A6JfO0+d66T9k6pFKXY/hjBYvnajY+YUWoNVUn/tFgZHnWByU8E4hqZbAsKvdfaDpYcaP
	 rp0rUyffH7uc0QSsNs6l53+zPPCkv/QVMfwzfXfz7lzulZqMOu43zWB9LWGLiMp+ZEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F1Rmd43FAiZig9kA5MzPk+SfPjhRFEoTZmBD7Y/b3BI=;
	b=cSZJ2sFOcAobLO2A6B4vwLDsKJLilW29++K3aFs313/pxeCPO6LLhj3gQvFM1LWKJrWf
	 yRYRyXJQlgHYJIC0geJGTBzFKySZUhLjwcAXjszVVSiKwW/bdHEbCTHhV+3KAcZrRBZHa
	 96enWjbh7e462Vc05+4hUYOJlbGbZrsKQJVhor+l5Ao6CF5X1Gb6Jpg6nB050fAuJJhgq
	 VsGjnfVcOuxMuvTpF/0C/4K24YLN8xgnO7reQNBH9qMa5GnWYyofu/voBWusVwrwQiFTH
	 flNyh2rA0NwCTBqpZ4DsFsH1d62RiUjkVrX2frAEaoO8sTk/Acf7GDVUu2JAgxzH21w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994420;
	bh=F1Rmd43FAiZig9kA5MzPk+SfPjhRFEoTZmBD7Y/b3BI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fJ4n4LY+nu/Y4Tp0ONs95viYR52htCmmgG2Guu7g0mnMVwQxY+tN8SABGCNEwUYON
	 TIimZhtmtSjLDi97D6uJWYnjOWreOv4BbSUmPezRpn1mTocHBmo7O676+bEGUQJXrC
	 blBBZUHdZXU7LB/CrDGaeA29xW9WJI1NDbsJvGfxL415eOFpz/XODdNONqPw7MgX3f
	 uB9JP0iHB7U/SdiaCAhncOKtQo0v0DFWvSkrJwMDACaO6lFoquzglg9gKRTad3EGxW
	 BDJ8dX1pZfa8EDRG52uYD8F6P7m4be5e0e2QlRQgGDN/NmnevKfbgw2OYS1hQ5TZIt
	 gYl7HFUdTJefA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4E640A4A;
	Sat,  3 Oct 2026 02:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A81522E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DE858128D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3H3yoNiFybz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9CB2D81248
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994418;
 b=YOHBhOrWjTtsNhAsi9I9iBTRrGGftXyyFzqGyr3FfI0rU8co36HWQ7mrI336SEHwWGCC
 LcGqt2yoRLzFxB4ro18HJbi4/T8Sitfk1xPlyKCZRD5+viAXFo6oPp8ewUM96zV/FxtHR
 b6MFzD+8T/OIPfJSTbWQmpg/GR6d3srOSbiy8fB2nhOOxDjAFKIFtdemncxLd8zLL/7kO
 LlXbU+8Cf+xYz0xRT29dxJTjMjF224pMUv8qQRQnM1P51OgO9Nd3PYWJiBxR3FCvojoG4
 jbg8JlkuOJKqK3V4u06qIjrJrtIIwmxblOJxVdPBDQnpv0ANKEDkOokeQr3ngtPvejw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994418;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rt3o6c0xzoyjjEkZOTSi16A33WuVmPOsey6DMfOcLp0=;
 b=iWakfBT1vZVnyhOnGsUCN7g00cRYLl+8AuQv3EDcdzCA2zcRGg53YwPgRoAjXvsNK7Pu
 dRuBCr8fftT1RBV+sd6V9BzeKTt9+zK9QTGQQepnx9PKb92Fa3HU50SnkTVOAkPpU8LPx
 fpyFVWgZG0lk/D2TFIz3QCg+9tTHnCKGetZIr0OqI1vlcLcsoEsYfqv1JWjmwThrA45+d
 c0vti+rmjsKC5yr8YkobA2yLl08nVbOwUwKOIk1T/wdDvkzyTs4gR8XoyTtBEaRl+5iET
 VKMT5MJ0GbbuOZwBrPKvU8TjNQEvsA/AuIEWhvu8YNZ/Pc3NbEQW/sda12QMwl3oEUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dDuFsbmC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dDuFsbmC
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CB2D81248
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:26:58 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-81ba09a5d23so399554a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994417; x=1791599217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rt3o6c0xzoyjjEkZOTSi16A33WuVmPOsey6DMfOcLp0=;
 b=dDuFsbmC4/6RBSXDxy94oYvbiGI4oUA3o4QpxOPcVQ70isEorDdarHdClMIO7jAMUG
 x5Xvnn0Lp7gAJyfQfwcKOaLOA1xNMtJ4hsONFULMMR4esOOnTqAjigVqSjaszUCGujaS
 dTkVpbNgxKQrmhMu83NIYBP9UKr7EjBXscitzzjhfINuWPnsY3JXdqwC+BQpZQiWF7Ym
 LyEXztHcztryVZhRDtctIlXnD1steQQPS8m0pzjImwxz6eB020avXj9UZidAoBJTBrG3
 tEedEVOh7GSyszKCSq1LAHXHFhy0HxpYxQf584biDpmeWqDmp3d/3nQKYLUaSqY3KZNW
 /yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994417; x=1791599217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rt3o6c0xzoyjjEkZOTSi16A33WuVmPOsey6DMfOcLp0=;
 b=n8HgrxJ0frOH0XAysmObENGq5cH7rdZrEMr/p6YBWJ2UwL35jKOJEvNkLFcW/A87sf
 59wT2uPxfN4YJKx0Crl0wMyyUH+q61taqlQ7I4RHUPH3VXODr+NXGlELOPuMlkuE0qFs
 QasR/Z3jgx5KOxQ608p3Cd/aMuYfIpZtyrm0nXxE2zGTIWCZ+msLjhxMpnnidMW3nRRd
 rlORkcspIZYa/HJ2Bz68T8joE6AzaF3UBZwwiWh8DJlRycSgh7q2N8fP8+rwHziojMO/
 PdESDPGDDwQOpXQqa3SRKMH8aOS5TFux6F8ek9hPB4HS9hNRu9k3aSznc65641l3/xlH
 L6aA==
X-Gm-Message-State: AFuF++m5fxA0lw/I+DyTpmXh8/OS4Z+2AgBgn4FvirexjGG8tDTHEcHr
 L9WegfRYQNB1pLmjey7gGf6jcBziGFPk+FA508ttsDK/+/9RjYephp+HKlPj9Q==
X-Gm-Gg: AYBFou1z1f/6hal3bDJPJiObJ12cXtXOUTvzl92B/Cz40SfhSsET+0QuhGY4z0fgtTT
 BGB471syONUdq1oSqslFTHPXv9hatYQA+sUaxjCYp4nWCrwC411NR7aJanjJh7HX0uC5JnBF/ro
 l/OWLo5HgJDPezLM+N9/2fnFnts/9Vf8gzfdO9rKCS9cfDKAao7G+Roohplq3oXzO3lKiGZcCEG
 LbggdLhtIztdyQq0aZ/Xf1p7hjXfB3dxRonIIT5tUPn9nc0xQjVXfAgWVuQbMfOmS1W3Q7wV4rJ
 vPJe3UjmfYWNa6b8ro8W9g5GBAy5oh8R0x7W03DSj/o4XBA38evni2jTgPWtMT/dwyUWBRDyU1n
 YsOYXlzayfqpfOwnkZoAuHsVPyGbb6/npmWZ+hYCc+K7HbQVWEcoNWJa8KWpuI4Mqy8J9azA6VM
 GNzZN6TVNxaER1/ycL7FwuaT35D1Lc5LXfSJOLp5eJ+SoF6n2Eikb0RZQy4+HXEiyukq9kPH+/s
 zBjnJt/GGdMcjm0TvedrJJKczDt8cxbf4nQjRmd3uIglio0W32dUALpyghSlp6xcgcWDptWp247
 cY7EdYGN27JBi/+BlwESQw5z2tBLYGYEZeNzDUIK4sjDggBDPskA7Fms4D1aFwnFsWxW1RjDsq/
 prOOMIvUKClfWbxBEE++hBAz6kC9Ll5Rd55VX8l13oA==
X-Received: by 2002:a05:6830:44a6:b0:81f:acdd:bd0c with SMTP id
 46e09a7af769-823fca26dbemr1172511a34.12.1790994417229; 
 Fri, 02 Oct 2026 19:26:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-822793967f7sm4572502a34.8.2026.10.02.19.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:26:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:26:53 -0600
Message-ID: <20261003022654.418138-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-typing-extensions: bump to
 version 4.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index c86b6716a8..61c3c92e63 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  079e529d0b271647f3ec2720aee8fc65  typing_extensions-4.15.0.tar.gz
-sha256  0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466  typing_extensions-4.15.0.tar.gz
+md5  7758284b826ec6ca6b722e7891bbd10d  typing_extensions-4.16.0.tar.gz
+sha256  dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5  typing_extensions-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index d181b973a5..d1c0c4f694 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.16.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
