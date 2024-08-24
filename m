Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07926C5320E
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 10:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 457604022B;
	Sat, 24 Aug 2024 10:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXf5HV4vPmDj; Sat, 24 Aug 2024 10:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3576402A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3576402A8;
	Sat, 24 Aug 2024 10:36:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F32361BF288
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 10:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E18184022B
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 10:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4pXBpX-_DaA for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 10:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEB1140132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB1140132
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEB1140132
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 10:36:45 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f3e9fb6ee9so31825591fa.3
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 03:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724495803; x=1725100603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYU3Xth++oFPt++rZHQq6zu3Z7nkxKsX1D17LjK4TGs=;
 b=wbUUap9+T9VHNt7hNIFSrV8wh5l+2PwvHjSMha42r+JVG3Zpu/85BB7OGISsGlOwOG
 MJAhlS428ZytDcemek53u8+fIrstVvM3bSbwZAQl0QdrYTLpLPWjxTjNSfjb2pEK0AD6
 z9lB3okGTRxjIdP5n7flJXAO15obkaF0IsYo7EupOB5vKk5znWRrzYGg/ZHQvFnslVAt
 eWrlB9uuSFoKsNxwJFnMpR1Oq/XfAtdS5AOE/Z03IE0UqgKTG5d7a0ENCReB86dfj4d7
 9vo41tUwQXkd4kuBbvvscaVxK96lu4iyb3oSh5Fnph+LwiNQhxC5pdpijij9lrgzo/KI
 FwIQ==
X-Gm-Message-State: AOJu0YzmMEkRWSu6ODJUWeR0b4oh4eS5b3HBIU29o1W78PLL68yZNhuG
 yIp02Nx7YravueKvJJ8EAz7NSy0bQDCIYK1UsuXoeCve3NoSIwEarQnAzft9f1Dg6NDgImTsXYq
 qr80=
X-Google-Smtp-Source: AGHT+IEp2W1gqQ+KLDvmpm+3A32BzB0qOKF0MUaq9AGIBORMLkRhQTInWD3kkLeri1Wqipm/4lahGw==
X-Received: by 2002:a05:6512:1048:b0:533:1cb8:ec6e with SMTP id
 2adb3069b0e04-534387858b2mr3957876e87.33.1724495802807; 
 Sat, 24 Aug 2024 03:36:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4378e4sm381883866b.109.2024.08.24.03.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 03:36:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 12:36:34 +0200
Message-ID: <20240824103634.1955431-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240824103634.1955431-1-dario.binacchi@amarulasolutions.com>
References: <20240824103634.1955431-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724495803; x=1725100603;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYU3Xth++oFPt++rZHQq6zu3Z7nkxKsX1D17LjK4TGs=;
 b=gtK6IvKr8uQ/88z4yIvnUMpqogCinfTRy3D0OT3uZCuVdFKUtpfyqQPBO9kxFKyHAv
 HquKnc6YLQO1odqIcbGZ8KmXdco11DY/FVvWMKqv4XM9P9hfh2RPhMHUB92SJfi41tXa
 SuMvobjTtn/F+i2n6YrP5PfNer7A0dRS3WKbk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gtK6IvKr
Subject: [Buildroot] [PATCH RFC 2/2] support/download/check-hash: warn when
 an hash check is skipped
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This highlights that the hash check for a file has been intentionally
skipped.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 support/download/check-hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/download/check-hash b/support/download/check-hash
index d18ec8b134e8..173df8fc6fa4 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -108,6 +108,7 @@ if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
     *" ${base} "*)
         # File explicitly has no hash
+        printf "WARNING: Skipping hash check for %s\n" "${base}" >&2
         exit 0
         ;;
     esac
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
