Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B8CCD343F
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3A383521;
	Wed,  6 May 2026 22:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9wZ3vc32Fvf; Wed,  6 May 2026 22:34:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A34B9837C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106877;
	bh=WloCn/lQcxrThgcJrJbtJWApG+gDOgQHL3IkSxqPfxY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PQ7ciW9NEZW7FTCEewAfEUxOj0wTKdej2kEq15PI2lSheMLKQDFAsPHHMlTxd0vR5
	 dcy+5zy/xPTML8ecMjwF68LNloWeMqmrPgL2CrnVp7/qM51JjuE/pqdaBSdvgt905M
	 KeNxzNP+qRaUV7v4DPJRKgWDMIYHvg44UrX53aUtvARvrYmQgdZIzmioyRn8ajOPe0
	 hj7RGDnH75uxnzVnam/jT7ecJ1pZe2v+e1wjnIIURFq9O1OeVu55RBrAv0gpJr1Hd5
	 u/lNKX4lbo14FuMp09hxaNTNBCjNb5oQj/G5dL7CkvEgBoePhU0kDH9s97ZjlwKh2k
	 EtFaPU9Oj3N4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34B9837C4;
	Wed,  6 May 2026 22:34:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21896280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13F8C60FE2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dmwTgqqEI1U for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0531560FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0531560FE4
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0531560FE4
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:31 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7dcc9b506d9so211687a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106871; x=1778711671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X063oil2uUY46hHH+0NRMoDVEcv9fPh2zQb8qU0TZuw=;
 b=sDR4S7op2takDY724aoMnMRdmxozwch+ZH0/a2+5lwZ0f0W4S+WkrEc5dAnZVT+czC
 lBtaKduBcfCAUr82OgI6bpXNKIPdmsLAjGz4Hwpq4vNCjpcsMfn0cAv0B/P4o4LycEhM
 W8Mxb6CkU9VfYFhaGufnXPwzs6vhq9arG5Oo5rYPHqgWsGN6ZWBOUssYJiLctwNdUYNy
 vUsWJxTKIOnSTMVmweFmerJHaOcj+TdzO1v3Rhi2tBNkB+909OU9GP+R37M7ytGRqgOG
 m+e7G7X1qq+g4RUSltC6ma4ntuKz91GoAVFlsCsCSZJwXyJhz3aqmgl3BSeMQ2vbdkY1
 OAxA==
X-Gm-Message-State: AOJu0Yw6KmSWpf5NfMTY4VXJfBc8BQAAW6SbUSP06dmfSWmeEcKBitRx
 Gegm/6eaXP1iL0AaT0yBg04weMmkRq56btouIJs8lz9nLid8yIKEXCCeNJY63EBh
X-Gm-Gg: AeBDiesTSEQ+ebvUDmQ68NIuo41MsrBK9x3rExBGqKtF9D+6o0+zchicPPI1pkENZ1G
 Fl/uZ/qkAbBTAnXGw/Yv/BVy/4cJZ7id50Fxpk/hGisy7I3BfMW0dzsh6hZLwAjdXETVerLIWCw
 61HgDyZX0oj2gsjiJ/nCfUqlBNDLmMwlQQgzPtJuELW/TVP6mHe3V9W0MQY9+dmY6qL4Wec73Vc
 mmH2qrS5cQWh7wYCkOyxOg2Qkmv0TI7ItM2i7CVqM84skyY0iAxFv6CMQbdI7fcho9eeWYCLmtw
 gGU7EWoDSQPORPP3IfEslzDHK5rotSwFAIracyNeEgls7iVTksBv2IDRSyasE4LJ6ZzmVFmzV8M
 rqyamwT8zdWe8NhihoLiNIgcB9DBc+lGBpJUs4gqqgvS3i15BZkiHVV5x7eu1w9XHHkGBu2fUrs
 GOLe9qYZ2D9uA3xDN4qNhcKf3yU42kr1FtxZxcxn3Ebm9hYVCmQsgZfekE5FEAGYtu96Elv8QVs
 xua3d9/TQJD72SIbr8iuO612emc7jO5A4mctFp1UYWf3kMQHoc+ygMVccVXzVSTpf/GcpXj56Fv
 nXuwbkS/QDSDAMsjuA==
X-Received: by 2002:a05:6830:d0c:b0:7df:5fc:3fd5 with SMTP id
 46e09a7af769-7e1deefacb4mr3100670a34.1.1778106870678; 
 Wed, 06 May 2026 15:34:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:41 -0600
Message-ID: <20260506223341.1759760-40-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106871; x=1778711671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X063oil2uUY46hHH+0NRMoDVEcv9fPh2zQb8qU0TZuw=;
 b=cAhFQtstwO8bfQxwrmAXiV1r2y/q47oLMsxzXN+KiYovpgILgzt5UYW3FEQBsQvIKS
 59QbaHflFs4d+d4kINchWUjZCCCemZSWl7zy5CYPKqK2/apDjsQaXEUsP7E0kb9wZvkA
 qfLblSjDNY3xIsFa8pwakf6XVSLl8GTYi8bTbelKppjT0HpBj42KQvaA+gVCPhoJJMyj
 yQnwn+xLeXHuWDtRGv07T4atWWToXN63kNFThHeo3a372OzCmxVf42RpXWTx4lO99twI
 DcJMFQesB55yOAjQO67gtPbctQg4hMU8lbnKu3YoQrf1ndWrVe4X6yHAyZy7lNKAWFOY
 zuJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cAhFQtst
Subject: [Buildroot] [PATCH 40/40] package/wpa_supplicant: preserve
 /usr/sbin symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index fe4bc34d55..a0f7922f24 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -245,14 +245,14 @@ endef
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CLI),y)
 define WPA_SUPPLICANT_INSTALL_CLI
-	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_cli \
+	$(INSTALL) -m 0755 $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_cli \
 		$(TARGET_DIR)/usr/sbin/wpa_cli
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE),y)
 define WPA_SUPPLICANT_INSTALL_PASSPHRASE
-	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_passphrase \
+	$(INSTALL) -m 0755 $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_passphrase \
 		$(TARGET_DIR)/usr/sbin/wpa_passphrase
 endef
 endif
@@ -281,7 +281,7 @@ endef
 endif
 
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
+	$(INSTALL) -m 0755 $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
 	$(INSTALL) -m 644 -D package/wpa_supplicant/wpa_supplicant.conf \
 		$(TARGET_DIR)/etc/wpa_supplicant.conf
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
