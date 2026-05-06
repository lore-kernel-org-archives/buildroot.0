Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70ABCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DEC341030;
	Wed,  6 May 2026 22:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an_FKphHifpu; Wed,  6 May 2026 22:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C2D4101B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106834;
	bh=jpEaqEwLNyx1JEbmzFb6eutUuyRnOLTbl9eEnyUhBZ0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ch0N9FNGapN1KQ1ZE7Ju9HSFC0sfIxyjF71BUOTgNcf9vOtXaLNOXwDR07XJQeSDl
	 Xj/3+pEre7IpxRpaEyj5+pvsfgIUL0Wkmn19gv+cTuixabs+SjR018EEJKHefLdKXy
	 px3ES67ZCvg4UVM3uyZWtt0+jVNe5GCp4PgEzMZ55hvBoxFxdQlwAenVpBQp7t60Hd
	 1CtLlmyZXIdtvje3X8zTgX1/K3dKaj54XvksqVwT4hFokYqY2Bdy3HJaXnjt4kDqWJ
	 bWc0h8nVBB/GycI0p8QrAN09Y/Km5SGmGex6cdTmLcOfJNtgJ9k7d0L/NL6vfSxIT/
	 nfOp5eXaB0JNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C2D4101B;
	Wed,  6 May 2026 22:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40267317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 264A64101B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqyF3jGZVQdE for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 763424101A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 763424101A
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 763424101A
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:51 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-7dbccf6a23dso198370a34.2
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106830; x=1778711630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JB8rBvK6ATcPb/0sHtXsstdlQn95v/Behr8C4grLGUM=;
 b=ahDrtHKoFk0C7HHDnBcT1igK9M4WTfErX0c4L5KtFXJATkxIo2MLDjgrSJF2gnF/78
 rCS9Kt2f0UA8GTil6A9ojmFzTTq8Y10jIRJp7oBNAuYPS71VInmxehCPJpr6KwwQo7Nl
 3ktp9ZQo/W6UIqVRe92OCV3l0NchsP3kCc2rvZmsi2c6tJaEZcjwIXm6fQJ/ujQHDuwd
 GxYfV2iMAeuJ8/xEnievcqo8ogUmozKvOjN+dZWPrlE5LOas//nolXlqdJZv1ZjgYzYO
 q9YTgB2Uo+AHm+SLb4eE84BkjHpI5EqopjEUZNimQ/IPVLuVxpbytEdeMOfug+cG4wpR
 sIVg==
X-Gm-Message-State: AOJu0YyH5BXdrXx5pDS6uuR+NSe+RFCTGoxeo/21p+PYUUS29BPVtc+p
 XPmp0bJ0tXQwJCTOMT6Fbmh2GE9eF0URaoflW23iw1ffGHwTopRkpqRy9VLGK/Je
X-Gm-Gg: AeBDievSgEegybogjpGFYXumTcLbm5UvwAL35jS805Hhycz3t8oR25BUfoY5ypqa/7Y
 FgyDcvCsvjOPG7n+pvvOWh3FnSwk38+IQ6IYNM9bfQds/JtVrcUYACPahLsqfovJSu/QeLWak9D
 clIKrDg1KS/SMJ95TOus7AUlOKuxv89J/IGbvAQZW7t9iaqfrN2cTkEZdNry9WJP2+VzdvYG2uA
 Pxaho6XhcCIxLp07LctwVvT4Nzen5l4IavvMITpLg2ypJFeORoOAQ3VrUoEovAR7FVGymZ1XiEY
 997QaJkvhOH8SerQqzbJMkE6NeUx7/qz3BNlPLTN8T4p7QMvikAYLuUuT9m0E9MAoCCHoLQbmK3
 rtb2O6fOvlwk/V1KedBksnBE613FbOEz/W+uMNQLYDOuEwFSehIpB52GhogEytY1yuR01bnWJPh
 Ees0LeTPUqNb0Zism16hNtoOz/NpqHo/HAKuuLsof+yqpn8j4imwsdxMR6UazeaC3kSObcuUjIi
 GnqXGSSQCvxwONDzQyLJ3Zs/49Fy+PuFepeBFzLA//jxOSKLqiWv8PCRWsnhmrHdIkB3+C1S1FR
 Ex/XiJE=
X-Received: by 2002:a05:6830:67d1:b0:7d7:d60e:650a with SMTP id
 46e09a7af769-7e1df108bb5mr3047066a34.23.1778106830155; 
 Wed, 06 May 2026 15:33:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:03 -0600
Message-ID: <20260506223341.1759760-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106830; x=1778711630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JB8rBvK6ATcPb/0sHtXsstdlQn95v/Behr8C4grLGUM=;
 b=aXTDJifX9Ing2bKHoLuvEGpfYS8KS4LRaKCWb+HNbGwndXOd0F6kAbmN5jgxu+0lc4
 xExE8rPmJVzEPw/DHA6viuQ8a6nmHSc5kVAvNgwh7DBv5/FZAQV5Oxyi668aVkLPmi4z
 aa1uKNb8tmQDUjjxXdeG7qZn7Q62x+JX+nDTa6J46ihKFVAH1eheOf4gA12S0FIGnHTp
 TOGNX7ISHPWLV1lvYlxuCZTRfjcnl4rifMzbwdYYsDpjj9avRixmH/tFecfdm4aoyedD
 J5T1QxZuez+OvsURPdrc1+3JvdhNhkp2d9RffCygU52T1ZwSsX4qPMdd1A+FKsj3IHZt
 ETOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aXTDJifX
Subject: [Buildroot] [PATCH 02/40] package/babeld: preserve /usr/sbin symlink
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
 package/babeld/babeld.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index e9d20111f9..7845178ded 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -14,7 +14,7 @@ define BABELD_BUILD_CMDS
 endef
 
 define BABELD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/babeld $(TARGET_DIR)/usr/sbin/babeld
+	$(INSTALL) -m 755 $(@D)/babeld $(TARGET_DIR)/usr/sbin/babeld
 endef
 
 define BABELD_INSTALL_INIT_SYSV
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
