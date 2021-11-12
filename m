Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69F5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796BC60F46
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 796BC60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D974059A;
	Fri, 12 Nov 2021 11:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_3NG06u2xbV; Fri, 12 Nov 2021 11:01:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8754A40597;
	Fri, 12 Nov 2021 11:01:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 047631BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E48404023F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yiOPcuELvYUv for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D49FE40144
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso7053392wmh.0
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaMMSg4AhdsIbFxMQIPw7wQWEC5gftLdUdUPNQAnaDI=;
 b=OOKbMyhT3e7obldzpkJ9JMCW/qkg4FN8Y0H3FFzTKw+CUOo20K2nZcKkaNp+4XBzwO
 VN+Z1xNA0Y3NwwaeUDB664WT8ziaYcwUCKM97eoBr8QyiIkzlMnjU+H1/AM3CxmU9zJt
 ThVBbwIwxalK3kH5Eu1HQuhgAdF9673Qa3X8PE/jsuKI60tS7id9DIcNh22UKo4vwQgv
 2kKA9k30muGmSkc0eJ+7bvRfFXOQhirFoS6c+1DMVHcD4xcOIB9H2Gjj0hkfwjwUDLEc
 x+VVMh9En5jBxz3xwMFjSRx/4yae0ljJw8CIYvVw/Ozt49UE020xafGC8syTZdTgsygx
 UCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaMMSg4AhdsIbFxMQIPw7wQWEC5gftLdUdUPNQAnaDI=;
 b=Ed4nF2G2wiFiaHtPCS8ITNBhQY15ZSOyFCe79BePOcCPzfTwZeGUqdVfRCrjPP0gV9
 SpmcSbK/mORei/ulOqfj/pa3lY8e+GaaoLSPUkdgZYp6l6OLEHQ4Nex3wIpB8qaKPYXI
 xQFJTdXX9DAJLkeK8wuVIwaEhZwGqbbiKOLsj4DXuKt/l0Z7xfNwJYS4bu6syIanPY3I
 B7rd5r1kgDyH8k/jDRO0stlDirmXYVsLpSFhQp4B1uAKtDhy+SDy4OSZH1OCo0jdt9Y0
 sI1EUwX8qejAcYfUJPl1Z+Ln9F94OZcqc/g1FVzqfBQVtoUchIN7GSMZHQG2nplTzO7v
 QCtg==
X-Gm-Message-State: AOAM533L08P4sQV+Vn7QdMdyriB+6Dh2s0uzvFEQs9bMtVkGcb9xiIqh
 fxYEfVJaG6g+vVuB3oQgfgsYKvCBsvQ=
X-Google-Smtp-Source: ABdhPJz4QJOp11lBNTa8bSuuOMBYc5oCunsG2L1dEgwYJ9LwDohzXasCw8gtTqAJU22EoKVsh9C5tw==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr32157659wmb.28.1636714815761; 
 Fri, 12 Nov 2021 03:00:15 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:15 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:06 +0100
Message-Id: <20211112110007.787836-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/luajit: disable 64 bit GC objects
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
Cc: Francois Perrad <fperrad@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Francois Perrad <fperrad@gmail.com>

Luvi uses the cross bytecode generation of host-luajit
the bytecode format has 2 flavors, depending of GC64 option.

Since the commit https://github.com/LuaJIT/LuaJIT/commit/bd00094c3b50e193fb32aad79b7ea8ea6b78ed25
GC64 mode is enable by default on all 64bits platform.

With this patch, luajit and host-luajit are built with the same option,
so the bytecode generated by host-luajit is valid on luajit.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Romain:
  - update commit title
  - add a comment about missing LUAJIT_ENABLE_GC64]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
The luvi test still doesn't works all the time since the output of
"luvi -v" is not reproducible
---
 package/luajit/luajit.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index fbbd8ebc70..89b164c96d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -26,8 +26,10 @@ endif
 # libraries are installed.
 ifeq ($(BR2_ARCH_IS_64),y)
 LUAJIT_HOST_CC = $(HOSTCC)
+# There is no LUAJIT_ENABLE_GC64 option.
 else
 LUAJIT_HOST_CC = $(HOSTCC) -m32
+LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
