Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8285E73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 11:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B540407E2;
	Mon,  2 Feb 2026 11:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wSko51Zombf; Mon,  2 Feb 2026 11:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4AA3407E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770030255;
	bh=0Bc/EDf1xEdIGft5J+TpIpk0xSxR+CAK/WWAjjTBmGI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XDMDeZncCQTo7lQFfEROEf8AIQscSXV5iKOrcPHZHHm+ouI7yR7WjtkppiO9aX6fg
	 ml4x6lCmjf6RAfojbXcUE2UzgQJsVlGvmO3wAxXaK8s8OZy86O0SjS78RCfXSqx30T
	 sqEE3erkNyUkyrflk0rioUwJ9ENqJscOhN6i46JN0OMnsALHPmRT/M9zr3GQE0bPel
	 +3ZAdKkd90iPeLsRbUs7YF7xtGe33XDQA8o9/YHT9spjYk+X63Bde0smL8t8Q6m9BC
	 eCVsh3igCOC3rpEtbKLtDK07LkACHY6GbFvVnCgvWZ2I+2vs3IeRQwhnWGsmy3Ybk6
	 gUYsrmJVkTyMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4AA3407E3;
	Mon,  2 Feb 2026 11:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41749149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318C260B75
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OJM_7IvkFWv for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 11:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 172F960B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172F960B4B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 172F960B4B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 11:04:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so3780202f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 03:04:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770030251; x=1770635051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wP3MaGXRvEEXnPrzvbo024Ywhuv4GFjsj+7RAStQ8Dg=;
 b=Qe+Ge2KTGitIq7iSp5tl+JChVnlndhC+LrtYnkRYwlyROcfkWUZKxlgmzhMTvu1F8e
 bOV8/XRsbN2SlZXvXLTC2Bw/4igewAq9XZqmFTCFXbNzsVmF2uEXTSlXzq0PMwSC5AH7
 EaPfM4WmX7lXs8bEIY9yk1KUW71LEnADFdSkU9SWBJqkv/HqL1D8IDdm/pOXR86+dRdj
 zJ8vZ1xebnTmTT8Cf4jxCIqHGaqUCbp779mvuRzqJiPmEkn/T2UAfIuTsG0dxiF9p6RO
 iX+XR8433zMifNaR/hU6lGmww4wsmbIE/vaCmc5l98Zf5CxmAeqKy0M9W08e9mepyv3k
 4/Lw==
X-Gm-Message-State: AOJu0YyLhjTSsocTLWa0U7vK3wl3dh6+89kY3XmxNUHDccobVSiolFz4
 LWIpcp+719v1IIh5BO6aLSTKxvEazSZMFANDQISv1y8MbjAyrV4my3Li5hTpZUwhupTLqZv9747
 FtBdw
X-Gm-Gg: AZuq6aL7Sd5tORahm7PhNbcrUfU9KNRYbWUPoznDlFdw9Hyz52mVtnWaNN2BFvUsBAl
 btC2ugrq2+pNsVyJNQWtvrw2mlTd4q6FppUKJr6YUR503V9G7WoVID+dQZrmTTLMR/1y/+qAs1m
 Gnxxntm+Y3vzjbQVRTKqzioyJpbB5FXuppZY7oPHbkQPl+XOJsWFpPiBnACt24ywY8yYjNHZBxQ
 u5+Ui+lVKtmUZcBITtN6XMUcOK9NuuhUjI/eNXrsM2OjC/8vvojUjlb1vfoQIQuTCvy/ZB4mmpz
 bdkClCJZNWxC32B8BanpTMDnEM9AY6yYdb3JofOyg+EjMXDN1vVN9moTHoxfsVo/ZGRACN1+wKj
 WE0JlWsM9NFxP3oG9mwCmB2d7Lmc7wj7qrS933HV1HNzIr/+91X6YjdYPENBqr4hP2xlP6TftjN
 MEtecnl4Rrs+JlgSeAMj3GvuTPXUdFj/NyttttEnVK8y7dL6Af
X-Received: by 2002:a05:6000:4305:b0:435:729a:eb6f with SMTP id
 ffacd0b85a97d-435f3a7a4a1mr16483966f8f.19.1770030250575; 
 Mon, 02 Feb 2026 03:04:10 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e476dsm42529877f8f.4.2026.02.02.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:04:10 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	thomas.perale@mind.be
Date: Mon,  2 Feb 2026 12:03:38 +0100
Message-ID: <20260202110338.383494-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770030251; x=1770635051; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wP3MaGXRvEEXnPrzvbo024Ywhuv4GFjsj+7RAStQ8Dg=;
 b=cFXGFBOi498aPbhHLBHwGIz58fqnWSCSu7wG3XPs4y+N44TXoa5p59HDOHim8Y/DaC
 kLG2V8xwcDJQ1sOJ5PqI2Vtip/bsKbKWLqzaGkEDEUSjLQgpb8OeTGcvoIXrp57ULH5V
 iILNR+Au3mypOiIFjPtPCzFgdXqT+aLEWoUF1NDBagBiPBpaiuvZGoomu48MhYmS10e7
 Km0j3AyFvN7Exg2jSnZyMs1Wd5aLv7yL+hlBXyp+07BuDwhzV3zr3raR9dgpf4nFUe9o
 W4juDlj6SR88aJ/X3L0EiENRGIf0XrtL+ncobxUctPcvro3CasWpByyqXqUW3GQ7NEzo
 Onlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cFXGFBOi
Subject: [Buildroot] [PATCH for 2025.02.x] package/php: bump to v8.3.30
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a bugfix release for the 8.3 branch, backporting some fixes from the
8.5.2 release, mainly memory safety related.

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.30

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 02ebf1b0f6..dc5f0e7a3c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
+sha256  67f084d36852daab6809561a7c8023d130ca07fc6af8fb040684dd1414934d48  php-8.3.30.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 37dabdcd1a..d184186cee 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.29
+PHP_VERSION = 8.3.30
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
