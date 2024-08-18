Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A36C5321E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD61E40247;
	Sun, 18 Aug 2024 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJt3rDpCB2oa; Sun, 18 Aug 2024 20:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402B340215
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402B340215;
	Sun, 18 Aug 2024 20:31:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD2F91BF41C
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA5BA400BF
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 20:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8foMblMPiZmw for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 20:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2CBD40021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CBD40021
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2CBD40021
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 20:31:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso44801251fa.2
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 13:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724013100; x=1724617900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4qGjJlgwr9zjFDNM9MB+6BON+ZN0YaHZddD9tryitw=;
 b=chWFCEi19nl2vjTXWEmsarjcq71HTEWAx4XUKf9428rvKzSiqoMgs9CHy3eaW6sF1Q
 e3U+UCl0PxX4PxL5S6MZdxD8ot+ZVQkANdQVmzRVXgvurhyZHRkP+J//5BFtxXDUWmc0
 JA0Bsk/CAGHFELPhq8J0jZwWijT7xHp19TrDWqZhg6xlBZQli4XigzcRpNFrbP7YOm1l
 63RyN3f3fSRGD+5LEbJYJcCnJbcQFntzoClLRqdbir1OlmAQXIMUlRzHg7BVXJyz8Nrc
 5lhvbokQnyJQvgON1Q112BM204HQ9JTToyS7Dw2eNGEZZRv8PzS/QqFce4uAsIPJ1MXN
 ExaQ==
X-Gm-Message-State: AOJu0YwDjzejH0YwQ/vmzTayY4JjKunwgKD8Z8+e9m5Thlu2yQQxbzru
 b2IrM2ad3O10WhMQBhjKITeZh0k6UgkH2OP42IoCtlTOFRlMGKrLrSsH5bm/YR4=
X-Google-Smtp-Source: AGHT+IFTmFDHfxjUI2VVLZ7Acf6+K2m4ySbEEv67I8UH0kiv33nD2BB53XIINHAlDV/mqvRIQMAgNw==
X-Received: by 2002:a2e:7e12:0:b0:2ef:205d:4847 with SMTP id
 38308e7fff4ca-2f3be60d6f3mr56755301fa.46.1724013099831; 
 Sun, 18 Aug 2024 13:31:39 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-2f3b746cd4bsm13023451fa.11.2024.08.18.13.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 13:31:39 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 23:31:30 +0300
Message-ID: <20240818203134.1512793-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240818203134.1512793-1-geomatsi@gmail.com>
References: <20240818203134.1512793-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724013100; x=1724617900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n4qGjJlgwr9zjFDNM9MB+6BON+ZN0YaHZddD9tryitw=;
 b=Lx0UkDQCiS35eufGmzjB72ERR3Na2LTiDDGkEs6ntNkzgbbvoUcy1as+wP7seN+i9h
 oyynkgbwQN1TgmQoRs2BowlT0VsDMZNOMBsJcz4bjAOehaUFpRllT3cDP5gCJEF6Vu1e
 A4/nIunzu4fj6C6nezvQE5H17yJGQNZ+ZTKR/4sPMoR6J2K5ujZoTpRmuvMZ41q43qyi
 NDE2ONimVtFqIrM4ut36pvPag2HP9dO/GtP2Hmoc3jgm2pkfdgemRytjnLQ6957ohjBe
 tPLKZvaWXw5V7m64h+RnvWXpABE1nPDePj3LhnpRr5uC+kFvBcqKUOMdWjT/sWrvKwEB
 YFtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lx0UkDQC
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: revert upstream
 commit to fix brcmfmac
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Revert the upstream wpa_supplicant commit 41638606054 ("Mark
authorization completed on driver indication during 4-way HS offload").
That commit breaks WPA2-PSK and WPA3-SAE for brcfmac driver in upstream
Linux kernels. For details refer to the hostapd mailing list discussion
and redhat bugzilla:
- http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
- https://bugzilla.redhat.com/show_bug.cgi?id=2302577

Alternative option would be to disable offload in brcmfmac driver
adding "brcmfmac.feature_disable=0x82000" to Linux command line.

Final decision is not yet agreed upon on the hostapd mailing list,
but reporter and maintainer are inclined to revert the patch. So this
change adds revert to Buildroot to improve user experience for such
boards as Orange Pi Zero Plus2, BananaPro, and others. Later on the
patch will be updated according to hostapd upstream changes.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...orization-completed-on-driver-indica.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch

diff --git a/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
new file mode 100644
index 0000000000..89954eb7c5
--- /dev/null
+++ b/package/wpa_supplicant/0001-Revert-Mark-authorization-completed-on-driver-indica.patch
@@ -0,0 +1,55 @@
+From 170d8a433308ee39f87af94acaef461f8e80b67b Mon Sep 17 00:00:00 2001
+From: Janne Grunau <janne-fdr@jannau.net>
+Date: Sun, 4 Aug 2024 13:24:42 +0200
+Subject: [PATCH] Revert "Mark authorization completed on driver indication during 4-way HS offload"
+
+This reverts commit 41638606054a09867fe3f9a2b5523aa4678cbfa5.
+
+Signed-off-by: Janne Grunau <janne-fdr@jannau.net>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Upstream: not yet sent, ongoing discussion http://lists.infradead.org/pipermail/hostap/2024-August/042893.html
+
+---
+ wpa_supplicant/events.c | 25 ++++++++-----------------
+ 1 file changed, 8 insertions(+), 17 deletions(-)
+
+diff --git a/wpa_supplicant/events.c b/wpa_supplicant/events.c
+index 49917f7aa..bbb3a3eda 100644
+--- a/wpa_supplicant/events.c
++++ b/wpa_supplicant/events.c
+@@ -4327,23 +4327,14 @@ static void wpa_supplicant_event_assoc(struct wpa_supplicant *wpa_s,
+ 		eapol_sm_notify_eap_success(wpa_s->eapol, true);
+ 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_PSK) &&
+ 		   wpa_key_mgmt_wpa_psk(wpa_s->key_mgmt)) {
+-		if (already_authorized) {
+-			/*
+-			 * We are done; the driver will take care of RSN 4-way
+-			 * handshake.
+-			 */
+-			wpa_supplicant_cancel_auth_timeout(wpa_s);
+-			wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
+-			eapol_sm_notify_portValid(wpa_s->eapol, true);
+-			eapol_sm_notify_eap_success(wpa_s->eapol, true);
+-		} else {
+-			/* Update port, WPA_COMPLETED state from the
+-			 * EVENT_PORT_AUTHORIZED handler when the driver is done
+-			 * with the 4-way handshake.
+-			 */
+-			wpa_msg(wpa_s, MSG_DEBUG,
+-				"ASSOC INFO: wait for driver port authorized indication");
+-		}
++		/*
++		 * We are done; the driver will take care of RSN 4-way
++		 * handshake.
++		 */
++		wpa_supplicant_cancel_auth_timeout(wpa_s);
++		wpa_supplicant_set_state(wpa_s, WPA_COMPLETED);
++		eapol_sm_notify_portValid(wpa_s->eapol, true);
++		eapol_sm_notify_eap_success(wpa_s->eapol, true);
+ 	} else if ((wpa_s->drv_flags & WPA_DRIVER_FLAGS_4WAY_HANDSHAKE_8021X) &&
+ 		   wpa_key_mgmt_wpa_ieee8021x(wpa_s->key_mgmt)) {
+ 		/*
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
