Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55421C02184
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14EC241177;
	Tue, 14 Jan 2025 07:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_Y98S0bIhiP; Tue, 14 Jan 2025 07:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98E141197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98E141197;
	Tue, 14 Jan 2025 07:30:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D87C3B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BD040572
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrVkkQPNS7qO for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE6004017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6004017B
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE6004017B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:02 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6f6cf69so8632703a12.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839800; x=1737444600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6W3nODG3NK0/wGntxjp4dHdq3Jn4Wq3QIuyxFugW680=;
 b=V+G8s+zldnzUWQjqLpeZy/eTFVl8jK5lP+SDkc+i8yvc5IF6P7stznPvyR8A7E2Cam
 93MgfWClVVPzUPav2ZNqG7jcI3IJzYs8OSmpaM6DhhnuAIPc9EduHAHSqKuh4Lra/yFs
 Ajfs0P/+FlOPxS9RzdqXOPHQ2xtB+gG8xk3goWclxZjQI2FBg2QawzyAoV7hFyLy0IVE
 soEA5ukngiezJI/HUCZ+2EsGZK0zFLYYovbPDj9WFohM0arsqq9zUwjKfBd4RoxoWpoc
 q+1X9ExR4lQ3r/YqNvVzQAKhLlmN545RZxFHGm0lbrylnTMGuhnJv40ipHnDSS8asQ3V
 u/mg==
X-Gm-Message-State: AOJu0YzURDKB5y87CXPmq9i0FIdqV54ls6BZFhKIqwGxl5i9QIziZXDT
 sxQS93liASxlq3EH4wMFrVPlghOES59NL/dMbmj0/5IAdcIb17AFOY2qug==
X-Gm-Gg: ASbGncsbt2L1hHIYV2VLJLK0doKy5UQ/TuMTs4Izqkddi1XrWS/U9OdGei1269alHM4
 CwePbCX8yUTvgrLUm6tXvZ1QYcjESL4CN2I7KUlMHh5HmEjRFPrf23rAKb7ZfqR49zy+XWhPO5X
 53skKfm0SDT6LN5OZegXLyBOFUyyoq/XYfcYEYHl+CemG+/E8bdLd0/Cb+d4irk4T80/QKU6Ord
 WIFWWKmQFROAo7NZgr/o1gg4TbTL5uCdCSpoZw7LvEhkIk3niKFY0uASefq8I/uSRUG7D0bzw==
X-Google-Smtp-Source: AGHT+IFDglO/KRavNKOwXL504iEwvEa9t0z6zgjasHG/JC91erInbFWlLghOLqSR9DItCMzmQioSRQ==
X-Received: by 2002:a05:6402:210f:b0:5d2:b712:fbcf with SMTP id
 4fb4d7f45d1cf-5d972e4864emr18987569a12.21.1736839799894; 
 Mon, 13 Jan 2025 23:29:59 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:29:59 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:41 +0100
Message-Id: <20250114072947.284965-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839800; x=1737444600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6W3nODG3NK0/wGntxjp4dHdq3Jn4Wq3QIuyxFugW680=;
 b=ml6IfJbRaeokEXQ9ApReSIETj2WF3l7Kx4ZztqwnR9rwO7KFBP4Cvv7IIcQv6fthwq
 7v2V6ju5abh753ZIG5EfQS6utxDw36R1ZVVMDkbzmUh4RhD+E/lnIA8PvENCBvGjKCqS
 ntIfHx/ipDoGPh4ioNGgW086ehvMWtz7j5WXjJhhHWMv0vdcEf++OrOxiFbV2CY70KQd
 gX7FsJbu/R8hxgIcHO30ugkUeceaRcNeqWc+LX4SCkYWtq4crpvi2lCsO7wbYB0i/e20
 N4NjfuJjj9dZ3Mj00DmILYOxzknXO4J7CT4kE8O6/dUzac/Y3x6GA8vIHZhw3OcfapFb
 KmYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ml6IfJbR
Subject: [Buildroot] [PATCH v5 1/9] package/libyang: bump to version 3.7.8
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

The LICENSE hash has to be updated due to copyright year change.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v5:
    - meanwhile project version updated to 3.7.8
    - skip patch that add a libyang patch that is now in mainline

 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..c1110bc238 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  0b75f2afb60c6b94f0f881cd2112663482b81e9800328f95c6ec862b000e59e9  libyang-3.7.8.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..0d4a5843b0 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.7.8
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
