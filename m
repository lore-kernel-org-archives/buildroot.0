Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D3CDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82B0B60F13;
	Thu, 12 Oct 2023 10:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82B0B60F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwQ3FJmoTmm9; Thu, 12 Oct 2023 10:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD550614A4;
	Thu, 12 Oct 2023 10:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD550614A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 684B11BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C5660A77
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C5660A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_AADtpgolNe for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:45 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50CC5608D8
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50CC5608D8
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b2f73e3af3so120717666b.3
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106763; x=1697711563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqiOUqmeVwQd4TBUsxTeLr9exRV6AiaDw+M8dsrW95o=;
 b=Pu9UifGHX/hVLoDXwcZvhYlshj/38FrS6fURZvpOzC2obXEYnfvLNTffV9y/IhG83X
 J5r1+gdeD9/N5F1egO77KJT1xpqorq6SOygmQ6dYsu+ggeWOQF1qDv7Sth1DJzVbcNQ2
 jxky/fxD8pc2gcXe9K0+jSZpuH6VWCln00qViSBAu5lO45Ddmgnf0uqBFprx1DCa2QZL
 QX8Zjic0Xa+6GP13116iaenX5I4fxhF1w5uUs6edbisXTjWY2/Q+jTVzBUluqrjeGdRi
 NTC5dT0J/2Rl8tEr5cf1sCfJRSl1dzOcHFvZKN8d0Jfg/FoHKqvVlE4uWnsO1DEkL/Rl
 YITw==
X-Gm-Message-State: AOJu0YzzqwF3f2YWrP2FDoeOfNNit0zvY1U5SpiTCvBIdIsRrZYENlJb
 9wRs+4NVRORZc+GYy2uA0ueZoCeFHaspTXkKnJm7jQ==
X-Google-Smtp-Source: AGHT+IHM22LlBceI9SDTZD21J9lGJg0d3079V1+MfJltgLtahp8TNt7dsDX2O/sdAHPRv8NYH2INtg==
X-Received: by 2002:a17:907:7850:b0:9b9:ae5e:79ae with SMTP id
 lb16-20020a170907785000b009b9ae5e79aemr17456172ejc.60.1697106763237; 
 Thu, 12 Oct 2023 03:32:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:42 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:04 +0200
Message-ID: <20231012103210.2915871-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106763; x=1697711563;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqiOUqmeVwQd4TBUsxTeLr9exRV6AiaDw+M8dsrW95o=;
 b=iUkpLA5gRtVToz0jxFpWhiLbacvQuFMQFeoRLQdMbhbXvp+KI3sw2Yqg+mq3ovUDaz
 JRkqbSF84eizP2WEx+4LFAI7opXE837MEq3yo+UGn2Ed2NIqG2zIr3v0PBMxKvbhmR3z
 l4wLJQ5S2ehOXhRFgHHVGh3c35e2ZY0/wwYi4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iUkpLA5g
Subject: [Buildroot] [PATCH 07/12] package/polkit/selinux: Add buildroot
 polkit policy
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a basic policy necessary for polkit to work properly in enforcing mode
without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                 | 1 +
 package/polkit/selinux/buildroot-polkit.fc | 0
 package/polkit/selinux/buildroot-polkit.if | 1 +
 package/polkit/selinux/buildroot-polkit.te | 5 +++++
 4 files changed, 7 insertions(+)
 create mode 100644 package/polkit/selinux/buildroot-polkit.fc
 create mode 100644 package/polkit/selinux/buildroot-polkit.if
 create mode 100644 package/polkit/selinux/buildroot-polkit.te

diff --git a/DEVELOPERS b/DEVELOPERS
index 5f4b7320ba..f7506da57a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -40,6 +40,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/openssh/selinux/
+F:	package/polkit/selinux/
 F:	package/refpolicy/selinux/
 F:	package/systemd/selinux/
 F:	package/sysvinit/selinux/
diff --git a/package/polkit/selinux/buildroot-polkit.fc b/package/polkit/selinux/buildroot-polkit.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/polkit/selinux/buildroot-polkit.if b/package/polkit/selinux/buildroot-polkit.if
new file mode 100644
index 0000000000..8db3562fa5
--- /dev/null
+++ b/package/polkit/selinux/buildroot-polkit.if
@@ -0,0 +1 @@
+## <summary>Buildroot polkit rules</summary>
diff --git a/package/polkit/selinux/buildroot-polkit.te b/package/polkit/selinux/buildroot-polkit.te
new file mode 100644
index 0000000000..3cc244868c
--- /dev/null
+++ b/package/polkit/selinux/buildroot-polkit.te
@@ -0,0 +1,5 @@
+policy_module(buildroot-polkit, 1.0.0)
+
+#============= policykit_t ==============
+allow policykit_t security_t:filesystem getattr;
+allow policykit_t selinux_config_t:dir search;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
