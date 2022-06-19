Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3425CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C81D7409F8;
	Sun, 19 Jun 2022 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C81D7409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztMdsvIQ3LGh; Sun, 19 Jun 2022 21:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0397409DD;
	Sun, 19 Jun 2022 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0397409DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 782A61BF292
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52A7B409FA
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 21:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A7B409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWSalFhp9H7t for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 21:04:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A76409F8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92A76409F8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 21:04:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m1so4362038wrb.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 14:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXcvALNfeYfycEq4rHDwpjnztG3gzRy3giJe4wNmQuM=;
 b=hszc+LuoSbPIjhsyFEht2y7NPv69lmNtcMhnicOLd+yT6Cv6YzaRegYOxcE27RhQo2
 p+WW+34Fr3q/SIwJ8VbAGUpnLNWaJ0YjGaxezPIQwSnEQ/zQMyaS0MoheGqvBjlZEZcz
 vkNLdgOAfyujyFmyLSrnOzycZW3rdlrHWrcwzxBwFRQj5dl4YSbA15A0PliKBfkS8k8r
 /rslvjSjwLpvDWSaOW/bD76Xwk6dkdAQjeg9Z8j27y8DybYkXlRU0HsQyLWrqaZRUqCG
 w+/LLvgcs7f+sjmtSXNfmRMKR3l3fYa1LidMpawaM4obZZLhMME5S+G47W6WaXST5VAd
 lCxg==
X-Gm-Message-State: AJIora+cm4JYk+oO5OvMPGL+AlRZw7yBJh8NFlDr+KnAjH4tC/0AlM1h
 NFrrwu7Dj/0mkH533UCYS/OC9ulRZg0=
X-Google-Smtp-Source: AGRyM1ucmaIyo4Tk0QqSeb6C+f5fJwdSgqpp80v9LyhUkqKW2TwQ8Cp1mUUbKi1P7Wa43zU/Ozvq2A==
X-Received: by 2002:adf:d1e7:0:b0:215:2126:dede with SMTP id
 g7-20020adfd1e7000000b002152126dedemr19730519wrd.297.1655672650873; 
 Sun, 19 Jun 2022 14:04:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h81-20020a1c2154000000b0039c41686421sm15677994wmh.17.2022.06.19.14.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 14:04:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 23:01:02 +0200
Message-Id: <20220619210102.1021263-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
References: <20220619210102.1021263-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXcvALNfeYfycEq4rHDwpjnztG3gzRy3giJe4wNmQuM=;
 b=AWLm0jTaBfIrv2xI09mkFCnTt1cOm+SFpYbzfF9RGYvwdnBMbp+OPjnylSmhCrNMBB
 ULj2QwNuS6SOru99he9q5PkUN5Wb4tcL/2/eWYBsiu0nkfEL0WNwxNQ93TPUesAxIJTG
 SmUb9Mf+u7lYUExOP+3pij5X2h+BdY9gx1i7st5m7lf4T3nCljVwdaiTz6KkaQrau0bl
 ObHwgwY8WNUTfSnTTqZ8STG1mo3LHl+JHlGH4H6RzHsTpuPfZJXG+yhGtxYJjeBbHs1F
 xwxhai7WXqTI45tcaPTj2beydj85/YWppnlzaWON9nYO9VdEPt+HYB9K7hM7aWb422Or
 2KSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AWLm0jTa
Subject: [Buildroot] [PATCH 3/3] package/bind: add libmaxminddb optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add libmaxminddb optional dependency (which is enabled by default), two
options must be used to enable/disable this dependency:
 [pairwise: --enable-geoip --with-maxminddb=auto, --enable-geoip --with-maxminddb=yes, --disable-geoip]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c84abe91a0..1646fc6237 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -61,6 +61,13 @@ else
 BIND_CONF_OPTS += --with-gssapi=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+BIND_CONF_OPTS += --enable-geoip --with-maxminddb
+BIND_DEPENDENCIES += libmaxminddb
+else
+BIND_CONF_OPTS += --disable-geoip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
