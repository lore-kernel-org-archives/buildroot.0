Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BF5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED0961B00
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ED0961B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C921B40545;
	Sun,  3 Oct 2021 08:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbK1TADhIXhL; Sun,  3 Oct 2021 08:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1589D404EC;
	Sun,  3 Oct 2021 08:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 499D51BF95A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39B82848CC
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGIv3YAhXXs9 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:13:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D2D9848CA
 for <buildroot@busybox.net>; Sun,  3 Oct 2021 08:13:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so4847968wmg.3
 for <buildroot@busybox.net>; Sun, 03 Oct 2021 01:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zasFTiNMsi8qZJAPNgH7R5In9qKP9+mTWJ9DnfB3vxU=;
 b=K5Gm16Tf12TktwdzTvzWfkzVqK/aghyynKHJxgmnh1hZa0C8CC4/DAuGlmksapZnOz
 xwpplg9xd+FSGvFP+04SW9c1Zg4mqhr+deh5CUawPgCrOUzZPmtIf2D96C8fwr/0YhcV
 0F43/r+Weuw6QS2V/bVpDnLbABaDB1YVZT4MM6nQdRnK+LcQxXF03Pd3ECqALOxGY/80
 sDDsGzTjDrTQMgSZ/QAbTF29LWkK7wPEBxTUPnXlEXC2ZozG6xIZXNKbg7DZTAGU2/ie
 J59PKjaCaoXxiJyoHAD74gNWsN2VmQCPEffplDM+Ag3IHLx0lyNdSy7KGKwe61R6bpfS
 2lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zasFTiNMsi8qZJAPNgH7R5In9qKP9+mTWJ9DnfB3vxU=;
 b=nkOiKwU7x4ac7gDnuYro1d0K72mLw6TbLRZ4lFHfz1I1dbTdCz4kH9W0PAkD5J8y23
 ehCp2c57sX4pQu31MaMuwSzZD3GrwqQQavbJe/FlCEApb6UQ1vrUtQmHL1AgYcUw87pv
 Z0TFiCw42NbBH2n2JySOlpjHPuPAL1a6wPdrnWI4aY4c39zE9qf6AeanJG+wYkKIXNa2
 8dPsYWwfmVawhhn/7Q87+ArZI3JdLyfXyAlfYuPqEfne4Ge8Fu8otZomUxrttG0bJ8kZ
 cGJzokBfVer48GvLyBqFZ+AppxDdoHI3fMifUFEB516s4e/yCoJxIeQ0m7lnt3phSKB3
 gHGA==
X-Gm-Message-State: AOAM530U3nF4IRZdhVcH3C5oQvuNfgeGd9hSypPbISqX2rYVUwTevVNt
 yKzPzV0c58SiJoxjj8SHXFwtsKp9O9o=
X-Google-Smtp-Source: ABdhPJxuGi+f19AQJ3/ao8coL21gSPmZ+HZQ2i2vFsKVeBynqSHgD0GMG1uvugoQEFL4UhAlBsdM9g==
X-Received: by 2002:a1c:2287:: with SMTP id
 i129mr12388846wmi.164.1633248821707; 
 Sun, 03 Oct 2021 01:13:41 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id v23sm10649304wmj.4.2021.10.03.01.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 01:13:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  3 Oct 2021 10:13:25 +0200
Message-Id: <20211003081326.465560-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003081326.465560-1-francois.perrad@gadz.org>
References: <20211003081326.465560-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/htop: add optional dependency libcap
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 22cc739e2..140d620f2 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,13 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+HTOP_CONF_OPTS += --enable-capabilities
+HTOP_DEPENDENCIES += libcap
+else
+HTOP_CONF_OPTS += --disable-capabilities
+endif
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 HTOP_CONF_OPTS += --with-sensors
 HTOP_DEPENDENCIES += lm-sensors
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
