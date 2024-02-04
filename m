Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8AC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD1A41734;
	Sun,  4 Feb 2024 20:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD1A41734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XTVzbR_GtFO; Sun,  4 Feb 2024 20:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830804171E;
	Sun,  4 Feb 2024 20:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 830804171E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 485701BF425
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CDD7405D9
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDD7405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHV8FWVPxQx8 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 20:17:06 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9151C405E9
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 20:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9151C405E9
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fccd09082so14640835e9.2
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 12:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707077824; x=1707682624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcWBqU43NCohJp3B8SZRA59UlvgeUHOpv8bYhWowHgE=;
 b=g8xBszDS54cUHYhC8xtXwQkPu2AN3pswOEDQr0ENRtVHr0HAzDyzZ4RwM6DcUiwBhS
 ZZ13ykk858USn2yfKGWMhVLqATRzUO95QmjS6oW4J+QMKK66nW22wQo3Y1WOwMXyiFaf
 LzYL5TrR4RTKi3lmxremrK7loJiSe7vQxCkcmEpEN8gFWVRWWKeLwE4M8481JeWEgmw6
 K9xZ+CqxIyqpTJgdqSO/pOk9Ai/nacAVthYn6JAZBzYpbkCDYHaUu+1x7uuIcKryjSeo
 eRvNy1iokUtxyC4QbnFuUx5DdjT/F4ju0UqAhhq8wXO6ZTc9HgP7zhXDjmR0pllnY/PW
 8KXw==
X-Gm-Message-State: AOJu0YxOmSZSfaAMUE/rp0BFHjAQUnOk3lVgGS1HrC4e+GgyNDQm2h3N
 Jf5GVH4Cu1GGGW8LD0RJkpz8Ck795z5udI5RUA3aHMH2Pbmbzjvx+Qdk3mbeKixdrA==
X-Google-Smtp-Source: AGHT+IG98P7TOaOiwW6+amxcwn442c+LEzJo4WNTODpfEjerBlrE/jqH9wuRos+9wA2GZmp/OFmPwQ==
X-Received: by 2002:a05:600c:4f01:b0:40e:6cae:479d with SMTP id
 l1-20020a05600c4f0100b0040e6cae479dmr3146704wmq.26.1707077824466; 
 Sun, 04 Feb 2024 12:17:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVN7Nmpx/xZdFnAeeNhDWvBRMjjh/coHuQsFe7R6sLg2NCMuHkehuzwbpJSf2D0NeorssLKtmON0P6OXjBD4CCXnbkDKIFzv9Jqm/mE2w==
Received: from aleksandr-System-Product-Name.lan ([146.70.124.140])
 by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040ef63a162dsm6458108wmb.26.2024.02.04.12.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 12:17:04 -0800 (PST)
From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 22:16:57 +0200
Message-Id: <20240204201657.33079-2-aleksandr.o.makarov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204201657.33079-1-aleksandr.o.makarov@gmail.com>
References: <20240204201657.33079-1-aleksandr.o.makarov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707077824; x=1707682624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcWBqU43NCohJp3B8SZRA59UlvgeUHOpv8bYhWowHgE=;
 b=iWki7AlbGFFF5yQiCXLuIGWhlsUmeqgsNpCMy5DzRshfkpnmhG6+wz0bgnHgK0Lsvh
 lijGOe99yUlsRVmWSM/D8i+5HXFre4A10W0RRBbbfRee0Wu2QhC6bOOvWB9jqc2I0hXe
 XfkXDPDlFSeC/UAOYkO5hOIC3ZfqhHHhDC7Z4YgEv0ao0Z1w6897qHGfT4M8LTu0PwTm
 WYdCaeV6lwdYYTHuZ69nAu5eLGja/rXVdsXtDjV28Bqqs5b7Fy+P6X+yG6DEEyWFheCq
 +nzhO8EK2d4I7WkktEBMUz5FacQpD7tUD6jSpn3+mAcxBn/2rX6pgAb85nvnEBI+m1CE
 ZiRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iWki7Alb
Subject: [Buildroot] [PATCH v2] package/haproxy: fix runtime 'FATAL ERROR:
 invalid code detected -- cannot go further'
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
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Setting HAPROXY_CFLAGS on the haproxy build command line overrides CFLAGS
which were internally set by the haproxy Makefile.

Among those omitted CFLAGS is -fwrapv. Compiling haproxy without it and
and then running the program results in runtime error:

$ haproxy
FATAL ERROR: invalid code detected -- cannot go further, please recompile!
...

To address this issue, include HAPROXY_CFLAGS in the DEFINE variable instead
of CFLAGS in haproxy.mk.

---
Changes v1 -> v2
  - Drop patch for haproxy program Makefile, make changes to haproxy.mk instead
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 63a92090f3..61a9ebebe4 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -82,7 +82,7 @@ endif
 
 define HAPROXY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		$(HAPROXY_MAKE_OPTS) CFLAGS="$(HAPROXY_CFLAGS)" -C $(@D)
+		$(HAPROXY_MAKE_OPTS) DEFINE="$(HAPROXY_CFLAGS)" -C $(@D)
 endef
 
 define HAPROXY_INSTALL_TARGET_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
