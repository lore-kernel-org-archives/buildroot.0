Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5879CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D3A60AA5;
	Tue, 21 Oct 2025 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8dmcWFb3uac; Tue, 21 Oct 2025 12:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A885260A8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A885260A8C;
	Tue, 21 Oct 2025 12:04:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7438870A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6378340538
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x39Dgp4IwAyK for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7132403B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7132403B1
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7132403B1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:04:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so36264325e9.1
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048241; x=1761653041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mOXdyxHNAx0rXRZRrbG6aEhrep1bw9XVcK4LZw2/n0M=;
 b=ovJ/L/GIUEnK0GF6bwv2dGNND+uJpFR714V+8IuvLFH9xydTtNdbCdjuwKxq8dHZ1F
 KhYQ7KENv5qkb+yze6u/Zs2sVh9X8o0rEzb7iCo4ipM5GkxO1UbcVPGsfLKDjR5Xipqu
 Ewd7JH2rkbV0QWWJmgBsRwetgeJJ/Lc8JOghjf1LDzyqOeq5GTYO9HlFAnt9b/shTT7e
 7gW+izDJ22v8MUr03kgEC3WeeHDykqK8kUOP7468G7Twz3Au72LlkZfKlWiQbb+aYBan
 NwibAm+bAcc0EV2ZBzhnua5dhZt8dbQTWpe360BtqQBGMtnoXmVciyL8SLbgy0SGb7sG
 vshg==
X-Gm-Message-State: AOJu0YxWme6ikC6FlEjHgetGRQvWD8pEkDy87RtkOpZQ5DU4tbzIZ5sl
 fFOAzHf+ijiVApCzT6CjKfKHA3hphWjrSlfdlYe9D52cqOU2D9ezUaSYbNocAQ==
X-Gm-Gg: ASbGncsR8e9IwJ0ZxKd1epoOzsdSRs8WV9iUnKV8OpidAMTHwSX3qrkZiEuhoEHrK8M
 5amBYhB4XduY3jpbUDluPN723WcGQpBzVKWRoa6qfkh+KhFxTRnjntzHZl94vnds5Z9SKvwtGex
 cRHJXsA2wqdTFfS/Dsd11EV2rU0X9Tz1CVveGiUppddYzD/h6pddzKHYFJuMjoKNgHDeshJHat8
 IjNBSnA7PAsHL5iu6kEwfW/6o8sGOqWIdxN1hrq3Ueno9GdD4tyKXwTZ7hbAnWMcs9cI0zdJj0k
 29RvUjsQCaOfp5fwBIe0j625uiFCHmY7+KqoUCJj03LhQ3bEdd4Puw5vdDsHdk0Ggqf4YT7hjIp
 FbgeWj53NUVMWz1Dw+rZ5neeFWTsZ8ZB49Y0W9J96mbDbpLkwODj/BVC9atETDjT17B60oU1S6I
 FlgQ==
X-Google-Smtp-Source: AGHT+IH5PZ26XBT76D48zPZu+EzJadl6UEkKSN0CT/bNWn8cFZ8/bY8rUM5EJlpJ/1OvcpFx1xoCXw==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-47117925db7mr110978065e9.39.1761048240515; 
 Tue, 21 Oct 2025 05:04:00 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:04:00 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:40 +0200
Message-ID: <20251021120342.483933-4-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021120342.483933-1-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048241; x=1761653041; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOXdyxHNAx0rXRZRrbG6aEhrep1bw9XVcK4LZw2/n0M=;
 b=B3i4J23oBaoTsx0scbQAXJfpAhBX6XlokqoomYVjvO+K3Twl1bK6ABbixt3R5n8zVE
 ZlPwU5V7qLCk/L+r7N68Z+ZMuRXqfn8HkgHjkpgviBkoRohqy4Vdcpr8P0XGzX5g1/Vs
 MpEapgHYXBcONJrr/lbQYiErxM4SQRMhonezc4KuY9ak5aHwLNGi9vkMow/f0qfv8nER
 q5r2W9GDxgc0W9JdHRCjVkDYeEparbkw0frNFBo6B8goE8Ib4CF7srgAlLTplP8vVr6G
 b3eQYF+5gDklID7kmrXg0mJgXQiNnrOF9HeL3X6s4A/SVZvl6gTr8E7KjksqEwq2dsJj
 F7Tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=B3i4J23o
Subject: [Buildroot] [PATCH 3/5] package/dpdk: make drivers selectable
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

Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all drivers (-Ddisable_drivers='*/*')
  - list  : pass to -Denable_drivers= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 14 ++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 5e8f2e001b..5de1c63937 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -50,6 +50,20 @@ config BR2_PACKAGE_DPDK_ENABLE_KMODS
 	  legacy uio/kni). Upstream marks this option as deprecated
 	  and it will be removed in a future release.
 
+config BR2_PACKAGE_DPDK_DRIVERS_LIST
+	string "Comma-separated drivers (e.g. net/virtio,net/ixgbe)"
+	help
+	  Controls which DPDK drivers are built.
+
+	  Values:
+	   (empty): use DPDK defaults
+	   none   : build no drivers
+	   list   : e.g. "net/virtio,net/ixgbe"
+
+	  To list all drivers found in the DPDK source tree:
+	    find drivers -mindepth 2 -maxdepth 2 -type d \
+	    ! -printf '%P\n' | sort
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 30d5bcc9ca..9333a67c31 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -47,6 +47,15 @@ else
 DPDK_CONF_OPTS += -Dexamples=
 endif
 
+DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
+ifneq ($(DPDK_DRIVERS),)
+  ifeq ($(DPDK_DRIVERS),none)
+    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'
+  else
+    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
