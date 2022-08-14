Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D763AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78142408E6;
	Sun, 14 Aug 2022 23:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78142408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdPH5cXZysup; Sun, 14 Aug 2022 23:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF59408CE;
	Sun, 14 Aug 2022 23:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF59408CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93A371BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EF0660C0A
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF0660C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihAuQ_hdiK4k for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0C5960C09
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0C5960C09
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:16 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id s129so5832855vsb.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QNUg1lFpjNqLca/jqaDKkHHKeqQw7gZcffTjAMJzhQo=;
 b=Sa1frQjv+wCrm7hEhuwuetIaVI0zcw+e7y94J+cMVQjEK56xe5DW/5oO7PEGh51SsR
 9M371pygRmrhDCEnuRa3wsn+tmKHs43BRcN4F6rVBrArX1VEhRnOPv94S3HgCSiPU/a+
 3G6NwwBVzvu6CeQoJXyU+qT14mMGpMMV5fatWTuoKj7W37/97uF4UQl0oEj+ijpekHQz
 cW0Rr/giukMkMDaZ3VBGKTyA6Ly+mdMQ9BqVPjA2qxLCNG1DzQde4sD8i98PTDmdEayu
 ISWGTZFfgsQWz9axB0m8VXujGg9sXlnuAWCg6GC1tgvVzTZWvRS9nn4tTuMGaRlOC4+S
 DUVQ==
X-Gm-Message-State: ACgBeo1gjJgSUKYA99MgbaCGGN40smVUAuGkgOX3HseBuICtDurhumh8
 rtjeoaIm6EOPkNLVP17+LvZcMqu43C8=
X-Google-Smtp-Source: AA6agR7F0AgPNr4/SE86rqxpdAeF31HCNqkJJi1qEo/VwonijJP4fJZst66fhIDP88ux4mzrKvKjtQ==
X-Received: by 2002:a67:fe8d:0:b0:388:5a9f:dda9 with SMTP id
 b13-20020a67fe8d000000b003885a9fdda9mr5377887vsr.84.1660520415692; 
 Sun, 14 Aug 2022 16:40:15 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:14 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:35 -0300
Message-Id: <20220814233845.2247022-24-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QNUg1lFpjNqLca/jqaDKkHHKeqQw7gZcffTjAMJzhQo=;
 b=XldVl8WMBrhR8+PKIaWK7fEmwKfVL3PmzZ3+lep21Aq3UNqop5aN8cRMA/72k/xRni
 JYSZbwzpbYSXix+w1cAmz75Itgy+lqCgp5aoST/FiiMfxAf0fMcz2fz1VDij27mwWN6z
 dHAFdMxlpKdE6awdrXHWZiK4T7+rZdxUxt15rrr6VYr8TTAdHSa6FoQtFJ5jtGxo6tfB
 Yl27CaGU7Kb0k/1rPUSIopQl8h49z3NReU/P46vY6Q2MvWTgBlElDhbo7H5ontZY+FbA
 NYlOrP3rpuRB4ZlrD0DjhAGTsov/oIWXa8Vx4hzHCSiTPkVTDl+IVIuoq4rPSlLzeRza
 HhpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XldVl8WM
Subject: [Buildroot] [PATCH 23/33] package/pcsc-lite: fix typo on
 BR2_PACKAGE_PCSC_LITE_*
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added in 2012 by commit
'8c345d91cf pcsc-lite: new package'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/pcsc-lite/pcsc-lite.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index d007d8da2f..34950dd866 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -37,11 +37,11 @@ else
 PCSC_LITE_CONF_OPTS += --disable-libsystemd
 endif
 
-ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
+ifeq ($(BR2_PACKAGE_PCSC_LITE_DEBUGATR),y)
 PCSC_LITE_CONF_OPTS += --enable-debugatr
 endif
 
-ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
+ifeq ($(BR2_PACKAGE_PCSC_LITE_EMBEDDED),y)
 PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
