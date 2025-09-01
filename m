Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F459CA1006
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457DD415AB;
	Mon,  1 Sep 2025 09:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lfn10hUivTJ; Mon,  1 Sep 2025 09:01:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC9F441596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC9F441596;
	Mon,  1 Sep 2025 09:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BE1169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC96861309;
 Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O65jDNS10GCP; Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECDC960DF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDC960DF8
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECDC960DF8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3d19699240dso1314805f8f.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717297; x=1757322097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ngPawNH/UkZC71LaNo+shypriZF8SYYEYWcyMC+HP38=;
 b=VV9CKSLgcSExQtblq0dgD1MUiuj7v8Xojmcz7tZVCCN/bsEd2yVq6pOWVcjhDA9PCh
 cSj+4oTzn7V5xwoi76mt3ZkJuCc6ISJuD2XR+0PN7oOluk3K4Azwk0yXO/gVSTHtN5Wu
 vqTzGNYyBcw8q1kBI8eCaJGfnJeiaMuNC4qI4SGXJzckzATa7nFPkGcHCJapqR9We8yj
 w6UdXNTM8EZ+RMm4MXHOzaNJGeNf21+zQ7VNRivAA/Kkp1oy/4Ozoawg16baEPbLQmY2
 oLf/wo6kPhP/xANZ45DqjIYVr69sMaqzT1wBE2FKEaVRCONXCBYTw6bCZgfYNUCELpKz
 yqmg==
X-Gm-Message-State: AOJu0YzHZe7isVVD9eW7FRPrhDYUAuohHp89lowOzDXhd+eAJe3s7cJR
 hLRsINQgu/3rpgxjh1wOi59B4eXY+slFD4NypXkYnfFnU4SwVm9XBEYFh4CRHQ==
X-Gm-Gg: ASbGnctRk6Bknf6lxxIWhnoM1co2mCxd52gy/kbU55DNGikkRdYcRuVBYDUp6e3xXvl
 SFNtQTGDs15H42SPSdBV5cIvUd2BzdQI1V6uH3HqCiXAUGwnyXzHs2/HWE3StC0vrCRD6A5Mg86
 evFTEam3TI4YuilEIIkpISNEkR4FUqD8Yt9gQ0x9OQn2NLHvazxrU/rMZeP8/gkuGbJKtuqjpZ1
 9MkuhU63PWXwazPu19PygRXu3trYi+49cBkc/9RzQgiJqxvkou3x/8aR+9MAyOYwiXJh1bRqy1U
 wMH4/YiWBHpprdv6byYwe9n//IHstb3c7yBnRUX/wOiyY1aB+LTbRKxKDDyP5ilRAzFRFLsUXB4
 50YcjIJubY8yVXBQ+24Ity9lXDzc2H9Pf
X-Google-Smtp-Source: AGHT+IFC7xtKQkvIFn+1yjkYTvxlxi6fEL8fs3VvL8A9ySk9CnEcefElcrkgFrElqAI71//p+jn6hw==
X-Received: by 2002:a05:6000:40dd:b0:3d4:13c4:af73 with SMTP id
 ffacd0b85a97d-3d413c4b319mr4684694f8f.12.1756717296862; 
 Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:25 +0200
Message-ID: <9008287f0fbfe1e24704cfbec471bfa97d3f7fdd.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717297; x=1757322097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ngPawNH/UkZC71LaNo+shypriZF8SYYEYWcyMC+HP38=;
 b=irCbX3bZo4UwKsgQwcL+vYh05AVgMGwpUCOyBjwxLx09gj/IhDHVgylGSzOYWoez6k
 xGI1uHTp4RNFet7h3eY576/Y39jerSy9TK+PNqUSHmCGqNdGKb1J4wRXEuked6NSxqr0
 UcZYknCLrTzFxPzuRgDRq6eNmqgqEJ5jXQqVVfA63+2J9aZ3UAf4I0BbePXOJED1Sqjf
 G3jbKFKMAOyGKAGHX1Ihzc/l8c5kfR6gnCZKHeNlzJ/6puvQGH4Af0BWcfV49A8BwQgP
 yDajlH/IFCp+qpeocywLOukHx2e/PvRsdwcTVZPlNBfF1Z1hH/N00ioN4GUSNen6N9b1
 Hfag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=irCbX3bZ
Subject: [Buildroot] [PATCH 16/18 v3] package/net-tools: no need for
 ifconfig+route workarounds with merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With a merged-bin setup, there is no need to move ifconfig and route, as
they would already be in the proper place.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/net-tools/net-tools.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index 0468a00bf0..344abee8b3 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -42,10 +42,16 @@ endef
 
 # ifconfig & route reside in /sbin for busybox, so ensure we don't end
 # up with two versions of those.
-define NET_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
+define NET_TOOLS_INSTALL_MV_BINS
 	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig
 	mv -f $(TARGET_DIR)/bin/route $(TARGET_DIR)/sbin/route
 endef
+endif
+
+define NET_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(NET_TOOLS_INSTALL_MV_BINS)
+endef
 
 $(eval $(generic-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
