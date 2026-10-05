Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0997CA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 14:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 008BD60688;
	Mon,  5 Oct 2026 14:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhQvGfzwQOiw; Mon,  5 Oct 2026 14:26:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CBE4D6067B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791210374;
	b=IKYTLNkUq6XZkZdX0FuATy+gebIyZYczw4BQcBfxV1kTOdC0hjwpBrvpITN4Fe8bYTG/
	 Zg9ogx4WjOeDbQIj1QKV0ygYe2eK1+vHSpPMBr/B4ac/vyfHMHXhdy5z88U7YOhEacHH8
	 JRnEJUUsGVQAP3ux6jAoyDVzmqoNkNn8UyqrxoOwWN7yoSJE6F0Sv3bNUea5tKutu0Qcy
	 Zyv/AfPXg3l9XYgpsWMVoom2J5i10xN6X1BO/i+/ziuVr0r7AE+6S5GvC0Q9mcP0f6zqQ
	 WBIjSk+25nM0zpiUipDZVVjZw7MYst+SaHOrOhraaAcKcylI8bhcZRAqSi82qFw+eow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791210374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YcBk4Zw3axptdNcNS+/NOEb44mikol9Ws24QltkFUMo=;
	b=l7xTniObNr+yq0Bu4WgGx3N4/rq8VuM4MrIT19en1Ohu8k1kSJJ/4qgWK0HkJRAIdpbz
	 oOU6P9zVGgqjUagMcY2iM/Gs5mHJckTrhynux3fVkuIjg5q38YyQh4n2sq2wlQXVxgNlv
	 zvby2GkzzE1nq3GBSCJ7p5pW9pYuCexipwKwjNGzsSyZjAXPiXT8D3UNB9Wj8MmLltXEt
	 NQfkt6t+OOGfMY2YiCV+m4LPPHvTgTroOSDwwB3B8cyakl3+90UgWldtdzLU6vQR7uENH
	 RzMrh9Xo2FHVAHSKiS0xe1sITynRktw8uM6wEGoa2nCsJ0I+bjw2Sb8Za0Bx0Qaf4Tw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791210374;
	bh=YcBk4Zw3axptdNcNS+/NOEb44mikol9Ws24QltkFUMo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JMEvmMcD3jnSEUfL1bLEN99T9gyFX9sV3E0v22KEfkmrVmFGMOQkcNsjOjnMEgHeF
	 /meAa1ui0voYYRsv0mPqQLU1WUn43Bre4kyV1OPE9Yd4VjS0ozZQdbGX3Svzz9sjo2
	 cLyqcAFI7ghv8ScDElFO69Ksoez3nF2jbesfXVg0GCSux0JwbqwgsWirZd0XCKMegM
	 ZmqQ/ri8U8ke5YRVkbeS/socwntRi0hyd2yfhnSvn/GNxln8KloMoO+bE7oZTdRKGB
	 Z5s9S4f2pwUGNWf62hB6jjKFfwITDKmDJTYMIA7bm8cqQGhtyXJVc/ZxqeZgMKSYYQ
	 CRwR3WeudNbeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE4D6067B;
	Mon,  5 Oct 2026 14:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA17338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 14:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2048040100
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 14:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFt9pLiXitdv for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 14:20:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 03B6C4007E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791210025;
 b=bruprZzoe6QH/0mRLH35nZqgVm4yEPCjSfhd1gHpMQpzqVFlXwyrDwDP2noozXPMlmMd
 72QMKuHhZSiZXFLgpTwTOpPyIAKw5O4Dto2YDPSQXlliA7+05mUlkT0SfT92qg0SF8eJm
 +dbliLQXEhFn7KOnsNvL/phs3BGlq7w4trnPa2AAOZ7v7/qk7Xu1KNE7baCQCM2QOtKsw
 l+WjVFX1aBCuY6Y54LXDdE9zrT3LOo/H0NhodzJgCEoOb8uwlegcXt2Zp7NrhIrbI400A
 Inu5QFTAeQYWiOgaynukYnLeBfPAaRvvAViGX1WkVnpIUXe553iJyrknHsRuhJB9PkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791210025;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=VNYhn2x3ZShxGZ2HktBmDZbKIt0qzNHdlEMKZvuY+ZU=;
 b=jxDGSj+/Pk2EMdRKcTAYpUgWUIUHuwdRdfhgVkYUcXwdleYwRla4LR8Vxw+sTrCJfrfz
 Je799wC7JkHOvB/koA1utIwoWIQ+4UcXZXpjNn5nX99O/xYeChh0Jek7KKgjV83NKWnDK
 a0XBkrr+/GRTXqjm/FcbJk6BGxUBTbbPD4u8zYjpy1yXV6ysEwdtYvGKSWb8JFTB3fiFq
 OJSLM+oFbuUoh0q8/QUOgZd4/n/YSa/fEdXoaeIxLvwU9mITI962ailXXIyLIQAXs3i8d
 ES87ZCcLujx/gOGZSYx9XxNtHZ8K+MAJZOiKJLqfCYrmjXz/x2lkjqgezQ9lGBn2dHQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=cTahI6BD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03B6C4007E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 14:20:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so332240266b.3
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 07:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791210022; x=1791814822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VNYhn2x3ZShxGZ2HktBmDZbKIt0qzNHdlEMKZvuY+ZU=;
 b=yezuslyAykGVS2LX0Doge79ZQgwh+Wq7fNSjk+mGb9q6P/Bmo2EcgCuj0WMF1lOYNh
 IUUcRTOrA4rYS7iEpa3hyuq+5lH3AzvBWzw/XF8vtYs4O1Nkp8nU8QZJSYdoaAQNvSA+
 5HsOZ1ZGTXoPG2exQS9MMpClmgEI2d5cSKRvGEASRPilgAP1UdJifBgm2JIKw0xyw6k9
 GJIlvS1ZtV5zwXphcaWipSgklRKgzQC93ZKqZcbLl7eH2UOU+uiXEwkiwqD4Xs6YQ0mC
 mJ8nQrqceBJ296jjixIlTzJJYPU+p9Csk9DXBXlxBcEpUSXTxKdWIegIYKe3/kfv1qpd
 XW0A==
X-Gm-Message-State: AFuF++lxW5yC0ETBYME9wZeYqSDPsDlT+Wk1I3Z5EjNhzyoTJW83NiEw
 rVyObEIUDOOskNSgcIIKCfbRLGO25jDRQY2g8i7tW+igDL1+xfETsuyQCucLgA==
X-Gm-Gg: AYBFou3EoeFUjoNN/SMceduBUrlwGG+1cB2p73QFVv9GvNKUC3g7G0cWyKD/RFWDd0U
 nUYwPDBjPTLrpVSh48K6NAqMMiUIMc0GqnxnSwoqb4NcSAvv7yjRAO/+XBnbGHb/3SAtNbdXI57
 NfP+pXRWmvhhj8Kb4eHp4njxAFp9fsqTBnIt2i/WjsCpwc+PBsv4lTcM/lVHAcvA7gFGp5kitGl
 ZcBdBCbaKCVWg3OJemd1rX8gkbuuIFyPA2uPUdFY6vD6/PlghuA37g4/k4g5+pwsljwF+SPj8yG
 CI1akL0ZRYopZinmx9gZLu8PGZvKXA4/mkFqs2d15mKfYzd6kiwugKY+A8mkPPhSmANp2IigLMu
 pnX7uQyiEve+Coj3T1EFx5T53rKA5IEypKMyLrkvxfnjSl6zqLzu3ZgUZNcIJbpnKZa8y8syDJz
 /7hhRKY7gH1ENZs2hWo8jEp7K6CmFqTMHxTrGOzQaEX2vkvbkj+6MiMJhxRk9Z8vOsn3+31vVce
 UY6m3ysgMtLUrR8lnsIofNQAIVyPwjyP/WMW1MKHu9DrTU=
X-Received: by 2002:a17:907:7210:b0:c26:24ed:39e5 with SMTP id
 a640c23a62f3a-c2e6ed1cafemr636197666b.18.1791210022209; 
 Mon, 05 Oct 2026 07:20:22 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c31562da4b3sm86995866b.35.2026.10.05.07.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 07:20:21 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:20:18 +0200
Message-Id: <20261005142018.829730-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt5/qt5opcua: fix build with mbedtls
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

qt5opcua builds the copy of open62541 1.0.0 bundled with qtopcua,
which only supports the mbedtls 2.x API. Since commit 3481a9643f
("package/mbedtls: bump to version 3.6.3.1"), the build fails when
mbedtls is enabled:

  3rdparty/open62541/open62541.c:49457:27: error: 'mbedtls_x509_crt' has no member named 'key_usage'; did you mean 'ext_key_usage'?

Disable the mbedtls feature of qtopcua, so that the bundled open62541
is built without encryption support, as it already is when mbedtls is
not enabled. Pass the option unconditionally, as qtopcua detects
mbedtls automatically when it is present in staging.

Using the open62541 package instead (-system-open62541) is not
possible: qtopcua 5.15 includes the amalgamated open62541.h header and
uses the open62541 1.0 API, while the open62541 package provides
version 1.3.15 with separate headers.

Fixes:
- https://autobuild.buildroot.org/results/1f06b1efdde65fcd99ff79a63ed01b749788dec8/
- https://autobuild.buildroot.org/results/30852221a9d89d4720c4d6aa003f0eac4b8289aa/
- https://autobuild.buildroot.org/results/d2270d4f3cd54d036a20cfd0df556eac45e34a0d/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/qt5/qt5opcua/qt5opcua.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
index ef51abddf8..7195f267fa 100644
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ b/package/qt5/qt5opcua/qt5opcua.mk
@@ -12,8 +12,8 @@ QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3
 QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
 QT5OPCUA_SYNC_QT_HEADERS = YES
 
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-QT5OPCUA_DEPENDENCIES += mbedtls
-endif
+# The bundled open62541 1.0.0 only supports mbedtls 2.x, so never let
+# it detect mbedtls
+QT5OPCUA_CONF_OPTS = -- -no-feature-mbedtls
 
 $(eval $(qmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
