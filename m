Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B54C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 13:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8416D608A6;
	Sun, 13 Feb 2022 13:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhWsJH4_s5v0; Sun, 13 Feb 2022 13:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2233607CE;
	Sun, 13 Feb 2022 13:55:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9B51BF2F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 13:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E6D40360
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 13:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=balena.io
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvS-2f_tsUGH for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 13:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C992640159
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:55:48 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id o5so12808510qvm.3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 05:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=balena.io; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiUryMrlR/wUXcYHKbUhb8AdzADVmIKO/qnRl8HMBHA=;
 b=Bd8cTytJCJFeglEiREXwZQHKCLPNHg3XE8lNOebEMvu2mEpc2AuFkT5Mg0CiEjS7dy
 EFMaZip/wOPQ8a3rxRKkkyoQCv7qiIZ/aVhUSiJop3rIfJaFkcciqF/Wk3L76Fyw9deZ
 HmtYyHEaK2YSvzhz9nw79/gX0lm+LrJq3HJ8/QG0bqX94CyXCM1Zfuc8pyvj36mPzHeA
 /315A0x399a279ZfjaMhtkK/O/s+/gEjCwTfYQgMAUqfRmXYfLjrmxiiqmetoISxRFEz
 Mb0x8+so8XNhz2nbYJnDuCJ+vSJ7cCwS0xDLiF4iWJX1bL3UOolcKgg52dsbpqTW1Gew
 VGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiUryMrlR/wUXcYHKbUhb8AdzADVmIKO/qnRl8HMBHA=;
 b=N8hfaDLBZHZott7UmzyWHmAtbsJKt92Fik0nQADZOuAXfGJqMiYDMccnxXcq5YDk+z
 OjEprk8TBvJJzmWoYKmRUHoJY4er3i0t/J7+5eCRUnQtNEkdx9i0rcSOqFLUXnUmw31n
 bGSIvig36sy5tszbgubSSlNFDhg8mXeMRlX1PRLPi/DDMDYI8v/luWrB+9SGk83GG1y6
 VIz8mJkOp5I3MEgW5z+ZdePfWow+eG67+dT3gOWHiK6Cji2ik6jFD7C1TZZ2jZ9JyIvN
 /juv6T+58ex8KCLtgzNoDOZpDy5ChYEx4SbPZrxEiJ/GkBnjZpgSQ7ZKEDljl4mU79Vd
 hnLw==
X-Gm-Message-State: AOAM531vt5viDEtIrcd2CgT8JFcyJO9vv8cYgIzGALCJu6u5haedWq3M
 H4/wZw90H7XHbt2wT81VMig8b/QC1Vo2mh8Z
X-Google-Smtp-Source: ABdhPJzrFcUBoWnpFxif2UxqPCyGVgsdLNkmhi0qXPnYR2e6JUubh1MUP7Y/pqE1fDqK/BliGKNiAQ==
X-Received: by 2002:ad4:5941:: with SMTP id eo1mr6653966qvb.50.1644760547538; 
 Sun, 13 Feb 2022 05:55:47 -0800 (PST)
Received: from xps-13-9369.lan (198-48-234-199.cpe.pppoe.ca. [198.48.234.199])
 by smtp.gmail.com with ESMTPSA id
 v5sm14755480qkp.70.2022.02.13.05.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 05:55:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 08:55:40 -0500
Message-Id: <20220213135540.49983-1-kyle@balena.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.15.0
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index ca6fe174e0..99caf7dd3d 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.14.0.tar.gz.sha256
-sha256  6ef91cbf02d5299eab39328c0857393de7b4885a2fe7233ddfe3c124ff5a89c8  unbound-1.14.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.15.0.tar.gz.sha256
+sha256  a480dc6c8937447b98d161fe911ffc76cfaffa2da18788781314e81339f1126f  unbound-1.15.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 61fdc5389b..1e6e0d99d7 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.14.0
+UNBOUND_VERSION = 1.15.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
