Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1339BD2ECF5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 23:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0F141C79;
	Mon, 19 Jan 2026 23:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75ELXQEHF0aS; Mon, 19 Jan 2026 23:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DA641C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768864734;
	bh=ePOr95d41aBtVgXeqo+lLhg5cfnKnhts4cB/ZwtgZZ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZY1kG36ixABCxG/KcwpLpU9AfibPpghvHsdLj5sWaIiplhR0/Xi63YAFzVOhaD5I2
	 6aL7tAYXbFuAaNsnid2RbNugH34MmZslZ+bjG5CoAVg+CmmYMit1hgLd2a9ivjtwen
	 yEGAOSKzWt/BarDBqcgcjvnyW9mnX9qbp74Mntyi2p0wuVQiP9VL0TigrpVaKOf5PG
	 NDhIR/aeE+9NIkTc6VLTBzneGZ1jTKzKrBEJtv7kbS+HHvDYAg/GgkjRyK5DvsjnEw
	 CcYKHGbFeb1wDQghIkx9dCAmQbxHrwEa8QKOFI9nocJFa71W2KgyxaL6ywyke4lwNv
	 LbZIAkBG38sjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DA641C6F;
	Mon, 19 Jan 2026 23:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B6C82A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F28241CE1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7skKeMUzU1dh for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 23:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 025DD41CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025DD41CC3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 025DD41CC3
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so31240755e9.1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768864728; x=1769469528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVf0r3du8bmc9TLV8PyxJU8rWRjkC1O797HovGJxwGk=;
 b=X8yBQj13C+Bd8sRMkOtMf5b9QQ8hNhDF27qpnZZUP2CDsuwIEtHEARiXSN6R6WCkAP
 7ndjuNTLQVBdzYg/j1vmRAbNIdDMwUAPLxZRsUa9rO1Y/TkuMK6XdcXOWk1ruhpvlbAQ
 qHZpIlkGwhxcrZFASAgTDSJIOXP1FmFTyi3MSftRQUaYl0rgC7uaO37Q94GB+blhKHD2
 ztQOWBIe1MPyMStRSkoQ+kl7oIJzi4dJvZFzlVWYu59OAJj40QTSEy6Z3bINXHvmT2AT
 RlCXm2YqgGBlVZhNd3u+yPUXQQBYSH3Hx4GSOZ6wDWclNjFrRBpaapCgOYv+kSHKDYiu
 MTBw==
X-Gm-Message-State: AOJu0YwD0GB1+wfguazbD39TZo6YKcfGGHLHmMpZiy+A1Ram4VcSlwX9
 4NzZCkdzvoPRI3r9CARfyZ+pQJkrXzA0nWpbSCVjH9PeOctg1fN6whJg2wLcMA==
X-Gm-Gg: AY/fxX7n7KVGuFaWFRJSyuhcVoUoa4oxhBciZkzksgQ3MvYdSRQlBEU3akobyZPVnZQ
 HL5V9vEIjOLUkL51ioD7//iSwflETvo4IWSJRA0ffEOJzWt6ouB2eDApP2oQUL7iOoslfzKJrha
 99HwFWC95bNVkhd1WmQqt8FfCl753MZdm/PmkdbcuP3GNmX1qBko38Ou/Pei35h8EoqV92rvVEl
 9f5CXkrwwgiQuXoBXVLBeOqnuu8BswKLHgx6eAKAUZRw4RhyfT3i/8CTF2dJ5Jt0QlqTMnMIhpU
 6Yg4shv9B8XLKvH/8avCQVXZn+1MTIy/WA4tHGpsejIFMUzci6dX9A/e3GEQQruQPdD+eEcTmJn
 lE9CRXVq/AYBQmOraaaxZc6zGeRkFiDMuwXkrO8tZiqwFG3LlsFldQ3Ycvr9TxWjfZiUI3SVtX7
 cPCtWOeYmSv7FkGIk=
X-Received: by 2002:a05:600c:3495:b0:477:7975:30ea with SMTP id
 5b1f17b1804b1-4801e343a9fmr166917035e9.29.1768864727647; 
 Mon, 19 Jan 2026 15:18:47 -0800 (PST)
Received: from localhost ([37.163.185.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f429071a2sm270181925e9.11.2026.01.19.15.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 15:18:47 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 00:18:18 +0100
Message-ID: <20260119231830.32276-2-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119231830.32276-1-mattianarducci1@gmail.com>
References: <20260119231830.32276-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768864728; x=1769469528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVf0r3du8bmc9TLV8PyxJU8rWRjkC1O797HovGJxwGk=;
 b=dFctkViOQHPd8CqSQKDTFDY4la1BM0+QzKRWZngwWS1JZJZUPGtrGDYtuT/1covnE3
 i9Ih9d09yh4MiGVkGKYrbMrhF1QLb4gSONgoKU2/NE665uVSgg+sanDM4B1RYt4B7vhr
 1xmFfnS6byxuGUGQrlTs/iw+TelJFoWJCLY/xvb3K5G3ee+xe3BpIVebJJjvCAL4sISY
 QRT2xHq8TZgBmEsg/Qs5pKtA0sL0QAIhB4GJnaU2pjhYAVe9uJTBMzAzHRWFdMz+CbV6
 3xb1DCnNtlHMu+qYyLZN/E0qAMSnKvhckfiTXmbicfz5XgXEynbdfwHLsqFlGZ3y3Dhn
 9DNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dFctkViO
Subject: [Buildroot] [PATCH 2/4] package/gensio: add udev optional dependency
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
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Udev is an optional dependency used to directly control cm108 sound
device gpios. It is enabled by default since version 2.6.3:
https://github.com/cminyard/gensio/commit/c1b5c0a214b85026f1d8c97bd79aae038fef733b

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index ac8fd61eff..e928a4dde9 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -34,6 +34,13 @@ else
 GENSIO_CONF_OPTS += --without-mdns
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GENSIO_DEPENDENCIES += udev
+GENSIO_CONF_OPTS += --with-udev
+else
+GENSIO_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
