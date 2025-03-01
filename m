Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF630C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A86A684C7D;
	Sat,  1 Mar 2025 15:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0SC25IAyLYN; Sat,  1 Mar 2025 15:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE26084C6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE26084C6B;
	Sat,  1 Mar 2025 15:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63E5768
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5370C607CD
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq9nOMniq6fF for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 83E9A60017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E9A60017
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83E9A60017
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:48 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso32335435e9.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841546; x=1741446346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bnIbGKcVACsEZr6sPew3GqTE6ha9fF3LuUjAl6ZBQZs=;
 b=W8zZOAz+OtZ97tCcasGZhtVpJcmTd4F3mZNxu5aVjHr7m4qACzHUkmdeG95HOLjHtt
 ZczlmHLMvVuRftd8aBc0zLpDKKbJJfY1wmYZ8eKcwFezM1LVg8dBaUCrQfWhK//C8A+v
 d1RdzOYzIOx0mCo5UrcY5XS25BlBeFwQJvHsO11ZDN9Q55uBkobdeXo1NAfDU8mKtXms
 vchzmEQQGvRw3eto7oz5kzAlPIOencR4srXIP4SZybXfVE537CcxYBhY/Q29TxrSBjgA
 4S3iht5RhTXVFKsPVkwY/RohOudtlMgih7Ilzs8xUdhXlUFYKjTs+a8zeLjC/XwNTszc
 MCBw==
X-Gm-Message-State: AOJu0YzSJt7eQOZAJ5cw0nqvnsyfuy9P5hvZ793eP1vNzz7qjLta4Xcr
 qdv5w/NOP1Qe6EUkuOXtIcsa+H9Gw3KFKba8vCvNhHhhkcvbXAst6L3FQw==
X-Gm-Gg: ASbGncszVrXgkyg2T1FEZlUrx5vzwcfvdhfryH3fR4FyaAzorhx6LWhj4eRnWmAqffq
 Ai0bsDoysh52PgT6xJVDNXCHMEuY3LgQi/9hd6jWW5ahchDCjswofQB60wYBfnLKHQN6cSvluRv
 MsGS/3+rwRNBxjLAlyKxKjb1BDXa4SJ0ZlSqCIOq8124mczgfu2IkXUprhf79D434hhWd8+BCe2
 TfklZ31dN4WKlVOX9ZgcXw8WUylGiZobSsYQ36pzuzf1SAnj4wa7seHdBOzPN8pzlOzi9VYEQWK
 e9kw8+f9fIpTDrhE3hqb7ZsTTwKFtc223clCSPoE68qXfIuiKF0gk8A=
X-Google-Smtp-Source: AGHT+IGksL27YXfkRwtLFoJ4JqogAWl3R8OzWNl8k6KuBQ3LhhmoY6ud2b5MXuiDkRTBi8vpF9RbnQ==
X-Received: by 2002:a05:600c:4e92:b0:439:94f8:fc79 with SMTP id
 5b1f17b1804b1-43ba665be43mr87712035e9.0.1740841546142; 
 Sat, 01 Mar 2025 07:05:46 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:45 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sat,  1 Mar 2025 16:05:39 +0100
Message-ID: <b583ec300376e548aa474691e08d8486dff91a16.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841546; x=1741446346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnIbGKcVACsEZr6sPew3GqTE6ha9fF3LuUjAl6ZBQZs=;
 b=H2KpFD1MUf/zxx8EetJ4uHPWSOmDLhURm9W/ail8dtE8crTMBmgJ/9S0Iw2Vnu780z
 NvWG8l4B4ZMSMvSiLe2XmtxSY27P3jiFowgm+JLjyFizbqctGBZfUR8xZNjYxHbUvRVD
 tu2aUrLBXTr9SuPRYGeddKmoJOFl92QVOROrhzGrdrtLGe/6SW4wwlTVG76OGggWyFll
 IVeenMjp5p24dMJfOuHIP50jGsG/8eYOKzES0JqguZs8nbk36vkLui/sWod6rQYSOzK2
 MQ6VvPBEcMSFozgfKvJpaLyQOZE+XNwPCNphC53aJnX8aQ4PqIRZ/Qmn7KxI/VYhfKah
 2WNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H2KpFD1M
Subject: [Buildroot] [PATCH 4/9 v3] package/slirp4netns: needs TUN support
 in the kernel
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

slirp4netns needs a kernel with TUN support, so enable that and the few
options it depends on.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp4netns/slirp4netns.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index ffcd334ab6..5923957c25 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -12,4 +12,13 @@ SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
 
 SLIRP4NETNS_AUTORECONF = YES
 
+define SLIRP4NETNS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
 $(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
