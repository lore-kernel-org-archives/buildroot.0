Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BFBC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A90403B5;
	Sun, 16 Aug 2026 19:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARyKDIi-M7jy; Sun, 16 Aug 2026 19:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB21040412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786910200;
	bh=xl1+xb6FCSJNuig5iaKPiqw12GSy0PmkjHqmO7Hys3w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVeSrb9q2rqL/1RY4xT5m/G5hOaLS8fD1U1dLxe6qEwJWXECV53Kglf6Sd1T2ARJN
	 HUViVkgij1x7OFisN9JcittJXMYw/QMsktD7eWQbhzpQazQx0bfhjhBJQpxvMNA2ER
	 Cmy7Thzp0xnvgQ39Nw6GWHyrPaPsoZ4PTGEfi6kr1lPXfNsny2oylrQCxza9sWWhJG
	 2ovjOUEby7/quBh75tVX4iNKzbqZXVE9tFGdqN+D84FEsiexuDQpci6KZ1mykjpxgz
	 +q0iUShfck+kVk/e6gTeW4UnZkZDiLZocAMX494HFlZLHIipCjJqD2kWSaWpxyX9M8
	 VnUBmbMRFIgZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB21040412;
	Sun, 16 Aug 2026 19:56:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC657336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE09B40086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXow7PrOwkwx for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:56:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB52040063
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB52040063
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gAQg2HlE
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB52040063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:56:38 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso18605665e9.0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786910197; x=1787514997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rlkFDDJZ/rSCjiFXvDJpjEr50LeRshhNB6OBUksWL3o=;
 b=gAQg2HlE6INEW/YMa1gxbpMVtiBuEG9ADSgT2x4lJnWuEXkxwBVjCfGFM9tZ73R8KE
 ickxq3XwxYSqIUGjFAEl2IHfienUdW73TE4Mk6dUzGYV5RCChuYWnoSBW34r2nb5+YPC
 JLSpk4zl7TktGrD1KEyoNjTvvz+4WuXqKy7wgQpwQMlw3GVVa+k5tbujAYjglikcIB5J
 wHL3wT1D3K22BrjjZuJrtptgeWXCgDbFr79MOjtUtuzyqbmiO0xQKqxx8FalO3SlemGJ
 JCewa5TOMp3v5Z67dZ6OHV8Iick1CJiUdApMmvo5qYV8jSWmp2/9YIqQQqJgRgLyfOUg
 f0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786910197; x=1787514997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rlkFDDJZ/rSCjiFXvDJpjEr50LeRshhNB6OBUksWL3o=;
 b=LfTd+MEX9M3BROq+Mp0+fpe6hXuVDCylxHikcJAEaezC4JQB0SGSXqCsR1mnVcS80K
 DttfDzOKbrlz9LXRm5TyPQvJayrxvKwudCpLAGdvleshlr7PQ7p5KOwS8MEHI38k9ARJ
 oW98XcIxfZV2Wo2BwdU4o2q3CWn7p9pu2VaiV/v9e9cKoh8U/E8hmSnMSYq9/G4uvXTO
 dBe3kW6qpjmwH1OkbiwXDHBtIxDFjmx1aC8nD7DM3ulaQKplbYsVTG4WyJ+RJDx0B59Y
 j7YEgxzDD83wW6/nWud16U9Ocdyc16VTt6Jcgj/rDVI6dThnbqJwOm/81XnxaHgXmYyk
 rh6w==
X-Gm-Message-State: AOJu0YwNadGql0hRmKcrcvTdWx1jvIQfeDxblx/GC690/X+zITZF88yk
 nAZ6oaKGpJGlZ/r5gcwX0MT+w4+OohtIKXm8pUzInunf7+gK0WSep0ZtOPmahh9gSDk=
X-Gm-Gg: AR+sD12vIaFjWQO2BiQOMsR8bTgL51aT5nSlJ9FgzVB/hpWWfvwDYz5MZ5cCY6v3Q0j
 qLjMRQUrzv6oGBVbTcQcIJ72qAiPxTpAwf+8XywVPD/r9D5yxpRzv/zOQjvYxt0cqG4ZrjgkcSf
 3PPpysdXegaK9COi5S2n9/COehePidpPeX98RYktki8W3VC9uySGHrtOtjwogR05aNXw3MV4CUr
 CHx6rQXOn/rYBl8Wzj9Sl/V9u7mgWkmg44M/NOqVooOxlFTOqdgfcIeYpoG7KE4SOW/zVR6okUd
 sIhOk0970OC2bUSBD4GjfKXprPDOelB3pbLFN/lyOutvl4MBM1n8M/UtWwtrVV8UiRjNmLajczZ
 c8R5JYsWaZVmC30i+Uz3BGDfPkpT43f2GIqqG7YykUsSkCeB28xqmaB2bnGalAiYQVQ3tAGT+jL
 bJEzOcyxNzJTi2SeVR5VvLXW2lFaa7kiGj9mpeXqBdzZmfifbXEs56vurdjMoHn8QEDw==
X-Received: by 2002:a05:600c:4fca:b0:493:a623:d090 with SMTP id
 5b1f17b1804b1-49987961c23mr303535665e9.10.1786910196611; 
 Sun, 16 Aug 2026 12:56:36 -0700 (PDT)
Received: from localhost ([37.101.131.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999611bf65sm65199265e9.13.2026.08.16.12.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:56:36 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 21:56:07 +0200
Message-ID: <20260816195616.279864-2-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816195616.279864-1-mattianarducci1@gmail.com>
References: <20260816195616.279864-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/gensio: add udev optional dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Udev is an optional dependency used to directly control cm108 sound
device gpios. It is enabled by default since version 2.6.3:
https://github.com/cminyard/gensio/commit/c1b5c0a214b85026f1d8c97bd79aae038fef733b

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 8fc21fab01..0c3ca5e03b 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -34,6 +34,13 @@ else
 GENSIO_CONF_OPTS += --without-mdns
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GENSIO_DEPENDENCIES += udev
+GENSIO_CONF_OPTS += --with-udev
+else
+GENSIO_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
