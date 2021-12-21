Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DEDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 12:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F69940990;
	Tue, 21 Dec 2021 12:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atljY-Vcp9HQ; Tue, 21 Dec 2021 12:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A5D240988;
	Tue, 21 Dec 2021 12:50:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0EA1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C00740901
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A29SB2ogAwpk for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 12:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C789408FF
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 12:50:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v7so19406508wrv.12
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4aSQvmC52em/8sEYOWsrroCaWw0X3Hvt92E0flcEPg0=;
 b=idUAuSYYRu7B2Ndah5JFFMevaqx3KsBl2y8uHhWbrMGfRGoLHIrN0xYxZAiCDBG48w
 hp6HGNtSoNGceM8rjfwX7YmngDxi4XkGjtzp1/J9klEW4VdIBn7xfk4LSXtcCGEhBtmV
 r82bxUnxzNfdL0bXBdajlzJxlehMTGF6SkOJ9ZuRToUnXGSvFANxByyFfvRwWA82sXOA
 lrKC0yxN38i3tI9saFhaIpOGLeEGynSRCXpUXOsEG3WjBS8xtuxtLb1STo/ic2i2RPg6
 h/VGUFyC+Dn6OyMfqkumK9XWk3o1fnmL1wXmnRqQh1vA2PccSO632Dn/6UGe5YDEJRMe
 3Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4aSQvmC52em/8sEYOWsrroCaWw0X3Hvt92E0flcEPg0=;
 b=n7ocK6lpFiwGOil7pIXkInMXgad0A7CyXH5h8Qg+z7Y0EqeoXar+BrEZQDNTuTnbv4
 /kCshEXljtnxETP81bdfu8Q9yWUicYz+mmq15LZdtw1Lnn2HcUDDBVTl8CyuheTkslBF
 8iZC7zoJu32StBwJgES945k4SQoZVd5OjCYgPZ5ZOCdTfRq6hE7Ayw0sDKovrcJC23Np
 VR8f1UFv6gqqgOcPY7HeTKt/Wx49qfoCuSA7w2pDJabVCCMnTYbzliPWzHTJ+/gHnhVJ
 dG7uPzOP/RS4x1OrkTcFR7+M1gkgR5Ryc9N9LVSVw2Jg7t8PyIqersAIJQBj0uz+vIBY
 Oj5w==
X-Gm-Message-State: AOAM532OJDE7qx1FvgeqbXeft44fe1W+PZNnk/t+LbliTQtOA2S0HnIT
 L1mP8vok1oaV76pwswmnKA8DvSi9aBC+7g==
X-Google-Smtp-Source: ABdhPJz7VguxFa6vH+7/r1Ib+UI6Dprly83wtOqlqCT3O5jYjPSOfiP5+Jn6aTthPdgyekBlZrQV2Q==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr2557259wry.495.1640091035470; 
 Tue, 21 Dec 2021 04:50:35 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id r11sm17997271wrw.5.2021.12.21.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:50:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 13:50:03 +0100
Message-Id: <20211221125003.27322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.4.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 9eb1eb467b..632919dae6 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.3/gupnp-1.3.1.sha256sum:
-sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.3.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.4/gupnp-1.4.1.sha256sum:
+sha256  df70fe8321bfc53cadb6860edcff2e0dc456ec81899b463f41723684803d1408  gupnp-1.4.1.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 7ee67d3382..02d9b289e0 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 1.3
+GUPNP_VERSION_MAJOR = 1.4
 GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
