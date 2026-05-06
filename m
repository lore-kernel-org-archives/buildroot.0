Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E73CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C73140CED;
	Wed,  6 May 2026 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDoXUjq79y3K; Wed,  6 May 2026 22:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D394104D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106864;
	bh=Vi/cWdex0c6tsV8vUYVKs/finZ69XeE10eXupH+/VG8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K86QL97ThZJ8MLp2z3VBBk3PlNgtU5zvGBOzOCQAI9Gl+rGUQZKqt/c4ZRHxwSSVl
	 C85bMFQ2gBKVPBTKLA2vkjJEvo+w/YKwqKuCq8IvVzp/cgF1wXOI1u7b+pXmtpvdOz
	 TMLJdJtE97gxJna98pV3HP6gWerVxQm6rNwGZiAxzC08QBPpaj4joEfdoUPpDdFFGx
	 zmv5iLnS+8u8rF5J29yn4PfqkkW1+oOxlMJI+oON1ZlM7tgmtx/gCLCV4K0h+LoT2r
	 npjoyOCe4WeUCqXHvXHdV3aVfgokQDNx/5VzjIMxom5ftolfgJdqcqgQ4C8J9WpQ8E
	 79XQbDY0HTHXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D394104D;
	Wed,  6 May 2026 22:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE33280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CBD2406F9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCXsD_q4DU59 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 666C8406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 666C8406F3
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 666C8406F3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:19 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7de46b8e432so213323a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106858; x=1778711658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d0ap0/6R/4impKJqBDtjfDdsCmwoC0Ma8p6x/Vz+DpU=;
 b=XZOVH+uMQMKo4kBVv6cLIGxsS60e47A4Psp7v5ydUNEpr1tvyhTcRMlZEc3D1BRyLw
 NSebjb+iV1aXdddQE5mwskvpJDtcyNLVcO82D/OSZL9u5jK7Styzu389mLcuH7rK4Msi
 fCI6PyNFQ4x10HprW5IXkTfaCeZoZzSntLiqDrUZUDbB8fNrAHkVZbHOyEgkukhEDNpT
 GmsbBHIvgsV2feo4GD+oyhdxS/KTF7AYK9LFY7E2gs3CDB+2NemQFhF8JipgFGjX/3PR
 DdCyTMn6WR+YLmYbR7krpn6C6LpKa0NaFRZrI7lBYqHI0+ua8zTCGFsiqelAfnQc7KqS
 he3Q==
X-Gm-Message-State: AOJu0YxChb3cZxlpQvE3dLabbLgsg1TOVZqXtgdnKdkaQ8zVIr/qmqe4
 uvuaM/RzOlfYyTxHU68n2jkpIPTdhUtKJn4Vcl8KXI5dpzDt18fY/2gDNt76nLDB
X-Gm-Gg: AeBDiespuX4OM5Vy3O7b9qlvGNrRAosuWsnLy0yhEVRxileWrWSDUxrwzccj32bjQRc
 9BTFl3xvtvy2gbj+505EYz0jIZEZUazxCpM9C5R+dzqMUoOGJ4qbLAG7Svob6qNTAaDHWLTqH61
 9uuV7f5F6J8eG/c+/vrtIUT5mKk+Q1HRkkpcgADzaejRzyzR4Cyhb+4LK0j2db9daHbN7BJ70wM
 VfS+7P//Yf5xdWJMLfr5yNTwn+FoZLjW/LFN89jpQa+dR/06skQ5VS/kv4Qq1ImYMSx1U73UDXL
 pRPHJmJr9FEfD3UbMvotp8u0jtJNEtfi8ZQWlbcsNZah5ETyVTMDOAynr20nIwKSYGA73tQ8MpE
 /mjLvW9k5k8USpLhuDcdCTRTkTuBhkb5AEyKTNZijiBrfR8afZO3SdC9elKpkEqTlTcb++j84+9
 SPGlvbHB4kilxgw3OzKv+EZPX4Ei9HcigEKAkeKPUSgbrY5mz0go4Oiy7xWebxFbTudaEArMLSh
 cSpkDolbi6b9AwO7bXXLmbOFx0ra43xXwliHUbJJVnqz+OdzYN8rzgVf+qxfDNL4AwdivgaUS+s
 f//rS1btdueCEkGdH0voHylQe8gH
X-Received: by 2002:a05:6830:6f86:b0:7dc:c338:d23d with SMTP id
 46e09a7af769-7e1df072b3bmr3154316a34.14.1778106858082; 
 Wed, 06 May 2026 15:34:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:30 -0600
Message-ID: <20260506223341.1759760-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106858; x=1778711658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d0ap0/6R/4impKJqBDtjfDdsCmwoC0Ma8p6x/Vz+DpU=;
 b=DJhrEGDZKdb37dHU5DFGZvN9Mm4PkVxpW0UeHJMSGKogr9a0AsM054LAinmY1ux3WS
 la61lBAaAVfDz26F5TvBfJCFJAFJsSTrjmmprtVBFAf8PSGelHgTaCBBGCS0uY1oPi/d
 nrdad4vPJF8phANOQMBncvvy2an86BAxmfFbWSUX578gzVMTq/iK2/srzfHqc3RgxUNZ
 wGXDrl9CRrKrpkrYgQ8fMSkClgvPIGEF9luM8DVsXXPc0eNglERllWMRoVquRvt/EBjz
 wiZR7UuanhKNNWwTaqse7Q0NzWL8lVX53YztKa/g/l5XsAC2EFMmBSWKqm2ujWpYeYZd
 n/Qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DJhrEGDZ
Subject: [Buildroot] [PATCH 29/40] package/sredird: preserve /usr/sbin
 symlink
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
 package/sredird/sredird.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 723c10acd6..68f276a8ae 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -14,7 +14,7 @@ define SREDIRD_BUILD_CMDS
 endef
 
 define SREDIRD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
+	$(INSTALL) -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
