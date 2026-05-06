Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F7DCD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB8160F5E;
	Wed,  6 May 2026 22:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exoT05D-mg1f; Wed,  6 May 2026 22:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A2560F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106860;
	bh=bdKJaxrRBQUuSc4k7DkpyQvUnphCAy0mE1ND5Pmsbf4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ut9Qw4FuAu+QONF/lexOmPUJ8SPC03fsgiPMGCyvfKcZSVqat4dBXPCfiVePM04Kn
	 ADxXUwjsXog7lA3T24KQ39HH/7rvzqqxdDKp3VeF+WMWu1SUmUAXOxqBXMMh7JITE1
	 24eWe2B17fzgH5/Ig5/VxZOP1BYPIbdZWdsiYRH1vKVUz+r1eOifYYsdiM4MYg64z+
	 fRRidUaqPyMAMuQ4VUrXOvk6leRfCXL8VaUnquCICxU8mSLq8NV1LkDe8quFHsWb+q
	 njkOnTBeai1dWxBbDKZjlVWGVRqB0m6+chH3OQovwm/HH6qoiXBxsTEAjhmXrFsG5B
	 Qxulq3OEpTOeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A2560F83;
	Wed,  6 May 2026 22:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10830317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815A783563
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOoBDhPGoZ-8 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7953283566
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7953283566
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7953283566
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:15 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7dcc9b506d9so211555a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106854; x=1778711654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fp4CvvyDvaCnQTCxIuLL76/qrg8LeNDkrQS1tQAqRBc=;
 b=gpwqiioi1ZAwpeU6ospWpEIA6Xj0lytA5BWwN8u8wf8lKoqRaUEJHYEhzOcFWmXZa3
 xyVzpIj2IZT4mxeZej3WoOYH1jvzk0gvyN0rkzI2nr2n3EQcPol1/Bc+e12aPXMNI6XF
 0z99ufo1HvATs7nlBLN1SVZ2r4iRLAGjFF6koTp7LmF/BjHE6qmSjkSivdz0RxcxLgHe
 o6j0l18p0fTExExs3xzidkLj/54VGLkU1jIDhOn4fX+ZT1r07LeU2BgNcFhLKWuem3Zo
 mbsZIl9+PBVYdrhIwPjQhgdV0Gk7UmBLI7qEK8lS3GNpFNq/I7gWI6OOaoDBw2TADksx
 uCtg==
X-Gm-Message-State: AOJu0YxJ6Gek0pfISWLpaO5IPgqx/ZpL7y37JZ+3e69VtphT/R0vFJEZ
 xdsInYKShDJBhFBmoXv1KFmcEwHEMLhhbFvNYCWh0fbCsdnVek+jSQ/fqs+SS7CH
X-Gm-Gg: AeBDietlOp8p0i2J5elbbkQzlX7oHl61eQSbVDcODRuS5mfbD/lHhvQZ8QFXoUkIN41
 WjBFU3KoeP2LxKzOdOOX/3Vx/8wpLPCA6jvoG3VRO3UWypnWFClOb3+gx4aZvMBlbEuBHCA/hVH
 d7OezoX9NTsxzuzXAAManeDhW/MRWuQH0SZOY4eLieFSizqL0qv4Kseifvfrt03v7U/pASE9wEZ
 lY9wwK3tiMmzvL2JcjMIdHmESFzzatNxoCzg0VqIj03gqqHCveiODEOSmviF/mfL9k5eZnFiuym
 vkoVcxSzPswg8zBMO7JffJO2bzqEhwmH0HsNQVivbDqEmhSxFv2hbDM5BRsDy4nzpRZgT9ciIYb
 e27KW5SWiGYUKKJgfcL1PQQ9sznZAN+OPWq4aXBAH1lbBjafE8Nosc9YcFL3ko5mgFosfCoroK8
 QZOl/56+il4a0sHUJGF3bRKuPxCOx8Fyoqb+iMQSPvVWlmlrrW68zETkE3D1MtebozbKwi9GVv4
 /XOAEyTus3w+QhohBibMPb9C5aqi6JttLP49oqZsXDOL0GFn0PGZGsL+NR+W2V7J3F0/CJrSVYV
 jCx6WIY=
X-Received: by 2002:a05:6830:6a8b:b0:7dc:d951:977f with SMTP id
 46e09a7af769-7e1def48172mr2923871a34.7.1778106854197; 
 Wed, 06 May 2026 15:34:14 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:26 -0600
Message-ID: <20260506223341.1759760-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106854; x=1778711654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fp4CvvyDvaCnQTCxIuLL76/qrg8LeNDkrQS1tQAqRBc=;
 b=Kk/sg8r24veROiuiSmdbJnFItDmr1miWspgEJn3IViCuoHDXoK8JXzxKfj1/A//6z9
 /5IxMPqu4iebXEgwCeW7RERhJ9PE9oStaj8qQLsMwKrhdAOjMJ/Nai8FqopA9Zu31zVD
 mEGhNTIPYNJBgV3pQtq2uBS6tp7R9VMBRkJp11eiZB1ByOUmjSJglrYiM8xUbb6sawB3
 qJkRD0E4uA0dy//Qcu81bnWcw2+DibXVYGW3nInTdUxJvicoP/kyfjJTTGQ3sQYPmgcd
 V/9riDbrKsj3LgdYfbLW6nbEj5ehoc6cHwwoiFDZlN8x/Pi+3LnMKMKMAcumujxfmbCX
 3log==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Kk/sg8r2
Subject: [Buildroot] [PATCH 25/40] package/proftpd: preserve /usr/sbin
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
 package/proftpd/proftpd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index ba026f5dd1..8643cf3979 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -126,16 +126,16 @@ PROFTPD_MAKE = $(MAKE1)
 ifeq ($(BR2_PACKAGE_PERL),y)
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
 define PROFTPD_INSTALL_FTPQUOTA
-	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
+	$(INSTALL) -m 0755 $(@D)/contrib/ftpquota $(TARGET_DIR)/usr/sbin/ftpquota
 endef
 endif
 define PROFTPD_INSTALL_FTPASSWD
-	$(INSTALL) -D -m 0755 $(@D)/contrib/ftpasswd $(TARGET_DIR)/usr/sbin/ftpasswd
+	$(INSTALL) -m 0755 $(@D)/contrib/ftpasswd $(TARGET_DIR)/usr/sbin/ftpasswd
 endef
 endif
 
 define PROFTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
+	$(INSTALL) -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
 	$(SED) 's/^\(Group\s\+\)nogroup/\1nobody/' $(TARGET_DIR)/etc/proftpd.conf
 	$(PROFTPD_INSTALL_FTPQUOTA)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
