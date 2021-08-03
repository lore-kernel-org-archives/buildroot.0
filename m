Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C063C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB7C60F48
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DB7C60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274BF843BF;
	Wed,  4 Aug 2021 01:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD2WEjYhFLB7; Wed,  4 Aug 2021 01:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BEC784396;
	Wed,  4 Aug 2021 01:23:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23B6A1BF3E1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C604405A2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 23:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1YEO8pqQAW9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 23:21:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E6F0405C5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 23:21:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k3so160761ilu.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 16:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSPsqX6EPSYnZ27kQkA7JFqTjEmRJUqqCWs4rvdoNug=;
 b=jdZ9t/SouMUqJ0IUEtQxgU4xTkK6EPdX7jbNpqBJ5Mn6hZmdaGdR6R9PxFkCZ6skiM
 OWib550TWATlBakKxcJ2mBga30DaWkBO0C0TuprcaSjYNPkOAW5qjTjmVTZDtIOnxHkM
 Y8exHMRPKPqATO6rqjhyFog5TbzavrBViDR8U6CJ40fWXjmVtETCaBq62asb5iOQqmB/
 LxezOE3NMLlAi/0Jt4iPYjI6cCmURFpb6f4hpb/4tP1UKZ8Tb9pXbsSY/aCFqFlnoeg6
 LJLPVrJvJKVTqzi82xTIh1h+lUj4JA+OVfR+jIXPF87O0VXqYBrpQ+Qn7NLm2D1OvaiJ
 ZzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSPsqX6EPSYnZ27kQkA7JFqTjEmRJUqqCWs4rvdoNug=;
 b=R5QMy/f8tQAVbGttqhyk/yqT255S0G3oo64/n4e5HLxE9rSsr1/vNZXqzTaoDprOr6
 Tjj4PHksbg/sHKqdZouoOhxY9VIjO7HeSm8wV66fJoRAWUmQTN03AzLWLb/wB4eki+LP
 tKI1FlMEGCQX2UvjmgsJTquaxsdQD1/lG4WcCLek+/S1xPKoRHvJdWDLEjwmhzuxqyNf
 gBt97sa5QACgdfs5c3ojptZ/j6SXnUe/zKY409jnRDHU1ySAtUrplrIFCy53SfhJNAho
 winGnEhiqtRyuOYd4o5eDTZOlp+oGpfn1EbR9YjjxEB0nZX/4E8e6fV42J1LWGFJpKIg
 A97w==
X-Gm-Message-State: AOAM531glsG7a9oxHAA4eh2WrsjskXGsTN8HwkpTQ9YTYNj+iamsgg2a
 u6T9BIvJzrCRM6ABq+LYYJWx4FlNAac=
X-Google-Smtp-Source: ABdhPJxGQWXxIbRW14lsdCojNCQC1hU09GCtWlSUfSNfhYjL8af+LgqVTvEIBz+RxhbHnERteYErSA==
X-Received: by 2002:a92:c544:: with SMTP id a4mr393171ilj.242.1628032880992;
 Tue, 03 Aug 2021 16:21:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id y198sm343453iof.25.2021.08.03.16.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 16:21:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 17:21:10 -0600
Message-Id: <20210803232110.285603-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803232110.285603-1-james.hilliard1@gmail.com>
References: <20210803232110.285603-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/system-config-printer: add host
 desktop-file-utils dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
 - http://autobuild.buildroot.net/results/33f/33f00aa38d55e5d3acb7171428a7ef23532afa94

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/system-config-printer/system-config-printer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/system-config-printer/system-config-printer.mk b/package/system-config-printer/system-config-printer.mk
index b20bea7dc4..e275743026 100644
--- a/package/system-config-printer/system-config-printer.mk
+++ b/package/system-config-printer/system-config-printer.mk
@@ -9,7 +9,7 @@ SYSTEM_CONFIG_PRINTER_SOURCE = system-config-printer-$(SYSTEM_CONFIG_PRINTER_VER
 SYSTEM_CONFIG_PRINTER_SITE = https://github.com/OpenPrinting/system-config-printer/releases/download/v$(SYSTEM_CONFIG_PRINTER_VERSION)
 SYSTEM_CONFIG_PRINTER_LICENSE = GPL-2.0+
 SYSTEM_CONFIG_PRINTER_LICENSE_FILES = COPYING
-SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-intltool host-pkgconf
+SYSTEM_CONFIG_PRINTER_DEPENDENCIES = cups host-desktop-file-utils host-intltool host-pkgconf
 
 # 0001-Add-option-to-disable-xmlto-manual-generation.patch
 # 0002-configure-accept-non-system-cups-config.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
