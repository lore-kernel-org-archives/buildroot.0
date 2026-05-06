Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4B1CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AE641052;
	Wed,  6 May 2026 22:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxtzIMK0xDu9; Wed,  6 May 2026 22:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F94641053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106858;
	bh=DDQzMa7WYDOpzVOWi//MCIFkfZeSfkrQUZlq+leuRWs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yau97HY1USAOl+idGZYQYt4xZ5kwsouoHHFKdH+WUsrrNzza3hoUHDQ/6tg7mTcAz
	 NS4J/A/7Lbk8rBaOV+WdKLi2uQe/fmKovlFy7eEtPrNQNjiC1qCXxY3Dlhch7bCHXM
	 cViva4T9UvtFRyByZvVA0biQCzTNUPr3X88iX+z9PUjU9G0e7vg2XDUeFIllEZftSD
	 iAJ80W21+WnJyd+olL6/0A3/hrnNEfO0c2NiE7L3p01/5T55nOCkKZU6KsqxyWnne3
	 gtXpJ6VoGA5APeNfZ0ZDWU8rNhw5/5MXBWHmx2T1Nok804nKZUaRi8XAd94jqoIvLo
	 PQKNxKbA7K+rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F94641053;
	Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1101C317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B8383592
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqrJC-B9Zg6X for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A7D783438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7D783438
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A7D783438
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:13 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7dbe437b072so127364a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106852; x=1778711652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jZGLgAfr/nGEaysmbVjG3CrcOBA5Ox/S66iys4xcazA=;
 b=qcixjqaGSNl9GHW9HUATnIvlOXQ9vYBHvv0LoqjWGUkJpryjvHVwkgMgJsxhm/pf9T
 BacP1Vj5OGyUiuS7S3R5y264oVXWmMLNKg/OIzv435utyxaCGxM4FiWb+26Gh8zgt28G
 qdGy6y9p0P70og03/ZRdwcPT0QipJObNJjUywTQuwxwr5f8tXXPVvfNL/ZJJcgj9FzsS
 2BkRnaXsZq8F5P3K/E/v90h4kFmloAAS14jCO6pVr9jOfRGaOQ7WMxCSXT4a0auyOYTz
 JcWrqisZrjtZxuCZPXewKWLw7H/VYJosvJgV63qZ/k0D81kfBXFyDk9Hv7RmnAMbWmQl
 wbrg==
X-Gm-Message-State: AOJu0YyVHf02Am2FOhzu7w5wy9uQEeGMA3eJdeHc6BKxfY5cmvNZNaGf
 LHYLDmIjiyd5/0rEPISodkJRDlXr24inbpnVwksBZd6LO0s115jbn7+zpyTRnnMd
X-Gm-Gg: AeBDiev58Y6mzlqmUAcwRgCtPBior0dMoGJLmdR1V9iDwDwaYisVj6atrlkAnJkY0P0
 tzzal0D+uXJmNCwK3njtHnq/BepKlSC9QVWvZm2LydXzIinjMD/faypkFRPYkalCIDCzsgAU+dE
 ayGKpW/pnlid6Y2+Po2zL4mv7nS77cE1T2Hgwzgzl7y57M/AyGiJdul98A2hfOBcFsG1eRnN/bD
 gSwPZLEZ4vsd7wBU/K/R0Zp8HFsT6U65rVoIUBxa43Xk7bmiWfXJMm8PJGufXitWK2zStnDIe/u
 KGxTuunCLL1at5zvUhJujvHTZ72XbA1bW7aIGcghVZHoHChrqAWCtzNHN8E6wyib9KF3xw5RODp
 d+v2k+Pxt3aWqZ+HWp5x+ENDiaxZcaYNW3r24EFCvYrs4M3NCBWsk+YuQzSo2oaUEAFeH3g7Wly
 XtUe7ESCQjokz82E0m9OIZvnYf1DVT0U+mtVagYC3E/9lrBLGLYsNmKgq+THyomPsASF4YrDhVM
 xzvYesYIF6Y5z/U91fxuSXl0AAV3mCzDsMgCn6yceheKNXX7K5yyXrlNnrpJldVgf+JdoJmBYXJ
 wdhjQBA=
X-Received: by 2002:a05:6830:921:b0:7d8:b269:e99b with SMTP id
 46e09a7af769-7e1defd48f0mr2644090a34.17.1778106852177; 
 Wed, 06 May 2026 15:34:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:24 -0600
Message-ID: <20260506223341.1759760-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106852; x=1778711652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZGLgAfr/nGEaysmbVjG3CrcOBA5Ox/S66iys4xcazA=;
 b=M8cJGKYv89xvquiGgLg08ma6H4535RmSjqhDIZaEYbysT+vGlQcMyPKAOEYQ4C79JA
 KdPoOR1k7fc3T3gysHJNeUe55CaLtjxfhGEE7iZKSjxy2keAbM6DHZg4yEOOufF/IQ9Q
 oVl44WKypYlxwNMHboQB/tn/OS5cWyGCuGKEA5AmXf7DjyVh0KzNC0CHW6w9PCSV9ouW
 NK11Add8txhtryStpf+S56FJf09Ari0N9VqgyFLsRZYRmTYwHYnb41mjZCind1BEZnCn
 I0vidWCt4DKEIrjUnJnOciYl0C5n2PTUuxY+MwFHovZ067RXXbjh3CDTNz9MhNFA6vPJ
 ddUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=M8cJGKYv
Subject: [Buildroot] [PATCH 23/40] package/parprouted: preserve /usr/sbin
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
 package/parprouted/parprouted.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/parprouted/parprouted.mk b/package/parprouted/parprouted.mk
index a0425d92cd..7e2343fab0 100644
--- a/package/parprouted/parprouted.mk
+++ b/package/parprouted/parprouted.mk
@@ -14,7 +14,7 @@ define PARPROUTED_BUILD_CMDS
 endef
 
 define PARPROUTED_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/parprouted $(TARGET_DIR)/usr/sbin/parprouted
+	$(INSTALL) -m 0755 $(@D)/parprouted $(TARGET_DIR)/usr/sbin/parprouted
 endef
 
 $(eval $(generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
