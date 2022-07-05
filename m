Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02470C43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87BFB40327;
	Tue,  5 Jul 2022 07:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87BFB40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHz7UOgnx1Lj; Tue,  5 Jul 2022 07:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 977DB404C9;
	Tue,  5 Jul 2022 07:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 977DB404C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0916C1BF9B5
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D19944176C
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19944176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn841bHFPn37 for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8EBD41763
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8EBD41763
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z19so14110045edb.11
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfWCxSgYwqIh9O3bxJaS3BSLgdhGOqg5CgJ7XyOxv/8=;
 b=PWvuGo6SLyxuJrcn60cO6dkACDM7U09ushR6+yZ87nbQ6AK7SRgoIkraWRALAgsaeb
 aB/VmhrJPIbGf6B5NUova38NE4afzH5ztN8E7SdXi7QvAA9KnG/SoutQZF3FQseUuH9G
 bhIvszYF5LA0RRXfCDaTIirrLxoTg2VNpjqA1YvAw4AIGqMSLIaDz1HgTBfNvBANzqzu
 5INN1UnYkIx0PuZo3EIPvpL5QFkcspRjR+2Tttl+ELSWhfsurwHC56wcyH49mwynFcg7
 0qKwC9PrNEcGXC1GOQ8iwlRpzaM6XAksEMuPDIuzMva1ePfXrbY698LAL7ZsLUOvIYQp
 VPyQ==
X-Gm-Message-State: AJIora/zK95spF65JPjh/9cc0heXqgMHYarW0sxlUkdKu+zpRTxPocT8
 cVlL1/L2fdgaVDwP7R3MXlp6OLanebleuw==
X-Google-Smtp-Source: AGRyM1sns+WBkdIwOg8VVAUZ0KaHxix63xfS5LZ4bsIQOPxkU/0cIzpJfeSmGnQCL7fROr5fHrJ92Q==
X-Received: by 2002:aa7:de88:0:b0:435:9a54:168a with SMTP id
 j8-20020aa7de88000000b004359a54168amr43349403edv.73.1657006337048; 
 Tue, 05 Jul 2022 00:32:17 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:16 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:05 +0200
Message-Id: <20220705073206.1442280-5-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705073206.1442280-1-angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfWCxSgYwqIh9O3bxJaS3BSLgdhGOqg5CgJ7XyOxv/8=;
 b=jpEkUN5d782Uiql3/qnnm0k7gQbKr1NTt+CFZGUzoqF2hYUFkoXY5JiMnGx7wJJP0P
 nP/mAFhSgpesSnXKAohV2aOQFXx3NdY8nxlCMo5UEvqXZyeZHl5yRIbTEel4jmRgzI38
 EqvTPjyJtKjoQ0B+M/gvGqhCCF6Y8L9q0+uLU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jpEkUN5d
Subject: [Buildroot] [PATCH v3 4/5] package/ifupdown-scripts: add wifi
 configuration when enabled
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
Cc: br015@umbiko.net, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a proper wpa-conf line to the interfaces files to let the system
bringup the wifi interface and the related wpa supplicant.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changes:
v3:
* add "|| true" lo let the command exit without error when
  BR2_SYSTEM_CONNECT_WIFI is empty (me)

 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..ebaf234143 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
+		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
+			echo "  wpa-conf /etc/wpa_supplicant.conf" || true; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 define IFUPDOWN_SCRIPTS_DHCP_OPENRC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
