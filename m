Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8987C021A0
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FC884198C;
	Sat,  8 Feb 2025 14:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5Em2tZWUkkZ; Sat,  8 Feb 2025 14:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A62142869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A62142869;
	Sat,  8 Feb 2025 14:23:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 185F51B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 562E7607C0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF0UDdGaqu6q for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9160B607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9160B607CA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9160B607CA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso19596015e9.3
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024613; x=1739629413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jpzH2x8auNpbLWQKpHHZSfWELCBl0ss6OUX4KCVy5zs=;
 b=dmitRm4slpsCDq3Vyzzuvmv5ADJuN1pbDdcKRnTCHqbp69KRk5hOXIVXnOyhJD+Zhb
 4t2TIkwhn24CdFGGygGjm3EMIYrRj0d0n9Txlfz91R2+00oIGfC1SPKkta8EzDxGjfPd
 PlxEX3D44gPrbbHXK7I3CKrSIyOHdcwAhJuRcGIfIHqiTPyUNen08b7mdwl76/lSzaux
 GVtqlzPk+6A9bgbdww+ntJzJy60MeoWaDUz7msrlOxvBczK1eeL9mbV1DmLfIS2NwS16
 WrP4UGgeGkTzNaQCjeCH5P9v7G5kwxulTkqJA9SqNP3mHZpTLCqj7AFh1IAPU0LY5/3B
 qTeA==
X-Gm-Message-State: AOJu0YwIxJvyK1J7svlQr5413bT5DithT0a3fb0lQqEWkZKcIYSaqiMk
 jaeHzs6+rcy2q4wV8fC1QvzSJGWHh9xfQ9yfejH9gDOM37Fce8h6HtKuk1BknsTJyi8UisoLnJi
 a
X-Gm-Gg: ASbGncucLkFbhQOYHK+zTC2GN58egYg3d7Qc+Ii2HVdoZJsX0ukDbmYUfXpdqfpT8K3
 Kf8INsZrPy+i6whYCq1R9YqUx3Xy7gwGC/zP+fNGSha8S/STnNcCCmxusgaM5A1o1+Ni2ZST8CM
 XEKa2snvjE6lx8ffQJ0GojnSyHOZ4iY4+st/MpjJd3E38z7O56NKli4Bry/j5bvJYnAT2Cin8Dp
 +M0L3NA75/4dJR+zupXdo3WsNzR8UCMUL+NPfizeZODNex+kk0TYkLbhVBeX05rrP63L8Q4+bpD
 +hnTO31fu3w0VeFbn9J+2bcGeEm2nILGn/8EGA8a9e25MDVmHgiJXFmoTb1wDxhVD0mCTmV5YmH
 9or2iY6i8yJFM
X-Google-Smtp-Source: AGHT+IFGuenpLIPlZpkBpAtL+WW/wtIwzjr0gQ+rrPFpS4bzVVM2oa5pmUgLE8d0c/H3l4mRKTrNWg==
X-Received: by 2002:a05:600c:1ca9:b0:434:f7e3:bfbd with SMTP id
 5b1f17b1804b1-439249a4058mr55928755e9.23.1739024613653; 
 Sat, 08 Feb 2025 06:23:33 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:33 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:22 +0100
Message-ID: <20250208142327.418271-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024613; x=1739629413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpzH2x8auNpbLWQKpHHZSfWELCBl0ss6OUX4KCVy5zs=;
 b=Mu+7kTIEdELBrKpcA6qC0fYro+3I8PD6Suaxyd8QjwSKmSxdDcv7+YtGxM24f6XlC0
 YmBaVIBqC2Xw9TigOZFV7DE72LXFJs8T9YfwwGB3n80oqXP+UlZG+6Gs7908/n50QcfL
 DOiHUWhY/P8wFrQFmb4aLQymsDNeclFth50N4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Mu+7kTIE
Subject: [Buildroot] [PATCH 06/11] package/kodi/br-kodi: fix shellcheck
 SC2086
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Shellcheck 0.9.0 now report SC2086

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kodi/br-kodi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index b776b5d96c..2467afed30 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -35,4 +35,4 @@ while [ ${LOOP} -eq 1 ]; do
             ;;
     esac
 done
-exit ${ret}
+exit "${ret}"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
