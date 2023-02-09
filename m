Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5521EC05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E313140940;
	Thu,  9 Feb 2023 03:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E313140940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjeXYecHvxwL; Thu,  9 Feb 2023 03:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB1E40934;
	Thu,  9 Feb 2023 03:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB1E40934
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D23121BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B958B40934
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B958B40934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Krzec5Atp4de for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:05:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18C340865
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D18C340865
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:05:10 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so1006425fac.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ci8hfX2AyisEF+wOmPmcZ/gFDTTtuSVj9metqb1uE48=;
 b=gsVnYkxTbZxt7fYxrHZgiNBtBu0m+Aasq6QV5r4uiQaofezzL7R99Squ+cSVLwOw8h
 m+i3c/QFT7vowCjAjFgIRQuX/eWQ4fc29bEyxPEX7S3nfsNPETTudWvCMdNFbyYu1HLM
 GBZXBYgYYtEIf/bfZcxZYlkqd6ZVoV9VSASuFv33e746s7KmS/klgC1l8ARsyK6kk7fR
 5pW+ULSz7YqYM6JT9yxjP42JhKhR8dIjop8xZle6p0nNKiNtXwQhgC6S8Jh+kR+a/rrc
 iBZsgArUESE7lsXPp5qiV5dOi3Mg/Ex3qWtlrp8xejnCoRcEBjsuC9QA4Cfgza97CaUM
 nVjg==
X-Gm-Message-State: AO0yUKUEF2mKjdcROe06LiKWM9NRIj7b+EEdNnJ9s3bH/YO78WGH2HX2
 jnIe/o88S/HsiOq2tXpL5e2+HUWIcHA=
X-Google-Smtp-Source: AK7set8UBxtz0TQPcQgHEEl/GlOCvGM7n2tDuKhS8Lok08WPxYM/9e3h4ihF1AXSG46TcgYy4Qde1g==
X-Received: by 2002:a05:6870:a1a7:b0:163:2f1c:eb07 with SMTP id
 a39-20020a056870a1a700b001632f1ceb07mr5802036oaf.53.1675911909794; 
 Wed, 08 Feb 2023 19:05:09 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056870a10500b0014fe4867dc7sm108383oae.56.2023.02.08.19.05.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:05:09 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:04:05 -0800
Message-Id: <20230209030405.33574-4-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209030405.33574-1-charles.hardin@chargepoint.com>
References: <20230209030405.33574-1-charles.hardin@chargepoint.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ci8hfX2AyisEF+wOmPmcZ/gFDTTtuSVj9metqb1uE48=;
 b=S6chyOh5iJCSskS9N19TJszJc0O1epYxscCkGQrtUWgshRkNaRTuJGQuEf1jmSJkja
 Ryo30RNIfWo9ccDBphfJQDjMXbClqr6rpNvlrRH0AWmN0/o26PDgdAK/8rXKPchXrPRW
 76s13AHRkSSnCEJTfZC/bdDaqHRTjjuR46V2d6MfVnLSGh0QaWvLOTVdTxgQ8FoQeqMJ
 KsFPHrL776pOlZbKeIUFPZiOlxysQ4X7tLo+Q7dnZweHGj+MJYN01jxY4c+p9RjLKA/p
 HXo4nuT5r4JSuh1XXftR0zMEBp4SonPA+FlCcxRTqonXUiEEbtoYnmECzdMsL6dOcPNk
 hn8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S6chyOh5
Subject: [Buildroot] [PATCH 2/2] linux: add a setlocalversion rsync hook
 when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Charles Hardin <charles.hardin@chargepoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define UTS_RELEASE "5.4.70-00031-g92c23d10d003"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..e88856d71e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,18 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+define LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(LINUX_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+LINUX_POST_RSYNC_HOOKS += LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
