Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE5CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BF9A4019C;
	Sat, 23 Jul 2022 21:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BF9A4019C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnp7E0UWoJDt; Sat, 23 Jul 2022 21:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2683E416AB;
	Sat, 23 Jul 2022 21:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2683E416AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4938A1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F504049B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F504049B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xs5Qa0yuUDs1 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:00:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F9D4019C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F9D4019C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:00:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so6313938wmq.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDRP+7laK/qGjNmqOfKTo2lWAf4iKd0tiaRD1/9d+eo=;
 b=7BQ8WOUxBSgNJLTUh9DMQb3vZTGcxhzmjGeFZvvGcoFckN758LwLQ5nS0RuOZ3T9t3
 ppdjvHjqJX6pFCbi/8BD+tyIizDmV07ING9JhMD+izYJq9sUA+fySTpxTU1byBqgJ2YS
 7Y4LYM/UlOMHWgdKf2RgEzN2vaKj5Wcx/p5lbylGrpUES1ezX910qrieX17sSgtPOxtS
 hMi9c4+JeqKP2scpWdSU84R/jXrGt2w+8G583clFDIdqMhY0bjccSs+dMFA5ed28px7t
 l+HGuuv7fRXwc7HFQ4VK+R6T8wfW7LXhOU0U8zNGGYvUt9xEq1HaNaKWqq+GOZcGYHW2
 XOHQ==
X-Gm-Message-State: AJIora8dH8EchOmalqsDUjxcRd8u3zZamGb37AQjDt+4j1awv+/ks34f
 UsX+Q3cObZ8Mscr5UKz+0sZsgMG+7fA=
X-Google-Smtp-Source: AGRyM1usHckZuOWPqkJKVAhQzsHv/ZBqNWHf8rRjG+NhEZ78zM7Ug184jSxxFUPmGh6yXQgmDs4Hqg==
X-Received: by 2002:a1c:4c14:0:b0:3a3:ad5:62e7 with SMTP id
 z20-20020a1c4c14000000b003a30ad562e7mr3995001wmf.114.1658610001371; 
 Sat, 23 Jul 2022 14:00:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b0021e297d6850sm7653934wrr.110.2022.07.23.14.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:00:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:59:54 +0200
Message-Id: <20220723205954.458058-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723205954.458058-1-fontaine.fabrice@gmail.com>
References: <20220723205954.458058-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YDRP+7laK/qGjNmqOfKTo2lWAf4iKd0tiaRD1/9d+eo=;
 b=LrFmQZhTmbhV0qy/E8IUHkLg26FHLwOfgI9TJzmLP7OWSNFGZn+4O91bCbRcXn2Xji
 Ps3NookprKXrSXrfzAogHaXpyRSSoUpvR5asIl4kj0/2KJTQzNaDQ1InV2tuCo4jlbcq
 uSeWufXSaVFfGExZKhMFSUbONsgoqxssM8L5R60UIrptlnSSUJpNTrg0vEfjMwWkBBby
 rMF9RKocOcehewg8EmjwzFDxjE7QeZ6BdVhEEDFVKr+rZ4Hep8toBBdnffY8QRshn6sX
 3jg4DeXj+OQxvURXZwCP5buPv815lju+HxXYJb2eRnL3p+CI7E5U6KGR3n7SBzo76gJW
 y0fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LrFmQZhT
Subject: [Buildroot] [PATCH 2/2] package/bind: add json-c optional dependency
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 86049d3648..bd12f7ad31 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -33,7 +33,6 @@ BIND_CONF_ENV = \
 BIND_CONF_OPTS = \
 	--without-cmocka \
 	--without-lmdb \
-	--with-json-c=no \
 	--enable-epoll \
 	--disable-backtrace \
 	--with-openssl=$(STAGING_DIR)/usr
@@ -47,6 +46,13 @@ else
 BIND_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+BIND_CONF_OPTS += --with-json-c
+BIND_DEPENDENCIES += json-c
+else
+BIND_CONF_OPTS += --without-json-c
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BIND_CONF_OPTS += --enable-linux-caps
 BIND_DEPENDENCIES += libcap
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
