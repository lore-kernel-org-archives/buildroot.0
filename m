Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBC0C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 08:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E65468134C;
	Tue, 16 Jul 2024 08:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k95ZUrcrukg4; Tue, 16 Jul 2024 08:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A618134E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A618134E;
	Tue, 16 Jul 2024 08:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0CA1BF3D6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0739F8134E
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 08:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVxhU2jTDP5O for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 08:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAB9F8134C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB9F8134C
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAB9F8134C
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 08:57:52 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa6c4so6890360a12.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 01:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721120271; x=1721725071;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUqVcIBISpXisE5JVB5t2aeEZdc91cgmXVDwtGlPXOI=;
 b=vG/JivZpJHTNG4BoJvnSlpxhAP2vendkB6/jS0b1OtTqDfZRed09hTAqos2UL350Tp
 KMz1z46hkM1scycTrCqRZ47Gy4E5QYX4gpnJdwnD5Izx23BxAQtyG4eeiT5OHGtSHZxf
 1GVG2KZNSTFFxEfg2MobvBT8PpEQBEyEiKD/KY7fhi02xT7QxZy/dHPheASQCJG6RG49
 7c4bKX0UZReWFVNeTsNE0YCyg+NxGIabpH0n46HEJOyjvEvoe7Zx3GB3p6uTwvyFwwPq
 7wRur1FACLKt7rzUr5ANzuTSb6qQkYkqTVPuvHN7+zAnRJeMauhFD0N58843Tn9j1yCV
 g27g==
X-Gm-Message-State: AOJu0YwEuCn+k3WxvS1iG0uMVdBPsRqoK/emQM5QdzSJyraIu308rCBL
 jglVN9j67IYZezcKs2spCV5NgXuz81uK/mGbxwbEO1zsNLj1y2bJju3pyMvn
X-Google-Smtp-Source: AGHT+IHRUBXpnImnYS1utx1iYuFzo+5jopVuNssJjsl6EBokoDUd6DhNVnsWNWqGor/eaQ7ihCagzA==
X-Received: by 2002:a17:906:2b12:b0:a77:9d57:97ad with SMTP id
 a640c23a62f3a-a79ea46d6ecmr100696866b.40.1721120270306; 
 Tue, 16 Jul 2024 01:57:50 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7ff8c9sm282951266b.162.2024.07.16.01.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 01:57:49 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 10:57:45 +0200
Message-Id: <20240716085747.490549-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721120271; x=1721725071; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yUqVcIBISpXisE5JVB5t2aeEZdc91cgmXVDwtGlPXOI=;
 b=d+lBz/pNDJqmuXAQMaxm9bm74w644cPZ8gnBYrvF6Arca4e1fxv89to4PZBIwNO4wQ
 ECbrNaFCifp0OIH8vjYNWASpzs8C8lpRV8vQ180TdUEWKdn6fNf+ur9j4IuSBd4lEM83
 EAwak/Zm8q6BBNuubuB+9vASQQLl5cnDzy/dsnMkymVrI+YHnniv+2AwM+MyoTJQrGeU
 VBAybd3WjbywYm9MQbq9fCqmyNIGlNBz7ts5Fpqbn+g/tXbH2sBmYuYCoN1IM9FY3pnF
 FQvmiBCyxLmhYkOc022ztLHZb7Zx/W/KSGdUtQGTrhqpgmOh/ls7DzxDtduuzCdmmZND
 Qh9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d+lBz/pN
Subject: [Buildroot] [PATCH 0/2] package/syslogd: bump to v2.6.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches upgrade sysklogd to the latest feature release and exposes
a new configure setting to tune the internal DNS retry delay.

Release Notes: https://github.com/troglobit/sysklogd/releases/tag/v2.6.0

Best regards
 /Joachim

Joachim Wiberg (2):
  package/sysklogd: bump to v2.6.0
  package/sysklogd: new setting

 package/sysklogd/Config.in     | 12 +++++++++++-
 package/sysklogd/sysklogd.hash |  2 +-
 package/sysklogd/sysklogd.mk   |  3 ++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
