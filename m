Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E01061B02
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2FB760BB7;
	Mon, 30 Mar 2026 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTDs_pJJBuvV; Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581B260BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774881974;
	bh=2vbApEfGNZKq7qnIYquuYBsY35bUuzPMB5PiWMI6onM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbE7v8wDbM18+j+wtSuuwonppJqmeYmhqGTv/RDKiN/tiIg6eIXc/3d3QcMFlXxw4
	 TpvJ7e9qMHTWBK3jXk1/aCdK7N+DSrDLEU9if9cuqaTHxupRgo6Q+GIqYlJGt+3PR7
	 i76Qoey1//GLpWj7NhtA3LRyOsvkUfsxGH6LGV3IAkAb6RNKkHs9RkqSU3S27bmRTm
	 lctmQKj/Vcll7DM6Vx/LvmS1HGRbQWauxaLkS1QbnwY9Jrz//f1hiT8jRUXTdzFVoV
	 yy5ECm1oU1f0K2lKLwcNAjaR1yMuMEJFRdrxVwjbvbvc9CvTrpUgg/2BMkX0/JuKi0
	 muDLOSZWNJgDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581B260BB0;
	Mon, 30 Mar 2026 14:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0055B1D3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E66DD40485
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CML9qMPoMfZ0 for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 14:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AC1640484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC1640484
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AC1640484
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:46:12 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-8d0288d24f6so290775285a.0
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 07:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774881970; x=1775486770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dLbU23djQE5CD5EZq8ROZ2xN1FDeAkT/lko/0XZOvOo=;
 b=h5TawcDf05hTYLI6hQuJZ73lhVFehJ4QKTsnyAyQtmRin0r1lZCKsAWUfHMHby9112
 kI7Xsf5mtd3BID+xgLJLEQLKTRvZuEAqAkIUc1D34e94uTW6Wu6GORDKSFXEdfEiFu9N
 h+VYp5b3GnzpHFqmeT97XLr3tPmon6kYybLkIlumVGX5g4H9avPy5T1fT9SJ0ACAiREx
 g5/KUUECBVxxsowBjBB/YpZpRm1IoAd34oYL5pjqzd3JIszsfZ33uh882nqQxop0MLlV
 RH+SE2nq4KTIcCAr1W8q/a8UPKF5tC9uMW5NhLMUGzdZZJb+8JYmNYZlfR2fsLEF6Mpr
 x00g==
X-Gm-Message-State: AOJu0YxkSrvyFYLrFJeb33VM3jgEqsLz60CXB3o3gyJslyA4jQxbnIei
 LLJz3Z4/WvB0Bn4DeQlWOeydmxOEaN48WRT9rmrut1olUEKTJ31pBqmHZ/0KrMRz
X-Gm-Gg: ATEYQzzs2QSe9ma4BP0LaJejlJOQmmNXSXrCmupQ4+d4ISdOWMwtJhNCTDaFEnZIRkz
 u4wZYcbjqO9rv3XODnXmZXo4q9R3LWkvjtb8VZA0EI9csAa7YRxnADaolJM70skKCRRW0XDNxa0
 eidoMbHubAmC103aKNPPBjXXELmaIBIbEhK+g0051a1McACO6p4RZkba3ePhleYyOUWvng9+ZPt
 qfG+a9aq3npcxrMCm0ZR0NxWR3/Fkc0F0RQ0bM4IEPvQzKZz0UnhsG7rT8BfA6IO+rJ5iHkIjgc
 wpkDHPjRU44wmVM2fQJxAyf+AoyNCoXoZ1O6m5DNE1ASLu6aoZvaf2LEvJnJiUUABcVaGrg1TA/
 lEiX5ZAN9ONd/r4g1KamqcVdtlvW+v4cwpzBAOR7Vtyr2HVnOu+K1exjkXUBL3SzCJ0In19HYh4
 IZA5loK5y1RrzTLNgMzhc7QpaeLP+2BrE=
X-Received: by 2002:a05:620a:6910:b0:8cf:bad7:20c5 with SMTP id
 af79cd13be357-8d01ce806e2mr1412504285a.25.1774881969874; 
 Mon, 30 Mar 2026 07:46:09 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8d028073afesm612224385a.37.2026.03.30.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 07:46:09 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id A2B37A980E3;
 Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 980618A; Mon, 30 Mar 2026 10:46:08 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Mon, 30 Mar 2026 10:45:50 -0400
Message-ID: <20260330144553.2525883-2-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
References: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
 <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774881970; x=1775486770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLbU23djQE5CD5EZq8ROZ2xN1FDeAkT/lko/0XZOvOo=;
 b=H9r5eTK3juB8ySGaAq2FWGVTQsZwWohwPmioZZN0PSE3XHtJvLJ7WpCN3VHW511ru7
 FZkcMGQLXPd+/DG14HKxqmfcBUkp88FppUSEgk2QsQa9AnKQfKOKHM4Ay1xwXsQ+PtYc
 7kBtrVxVfAZBv4ytJguPY7kebNdx8JBgYrAt0LzfbwA7oxqnqgoDeF1BOWJE6PF/T/O/
 p8KvvKp5AOXpQjH97VlVP0tYL4gJzxN7RmQ6as2nKgjn9gCzkLV50f0m8jYXgzS9blBx
 z5PHmUDavAEezMfgZouhnaFOQwy60IPvmy66oO9i6gXEhQ7OIAybK6yGlMI3Somfc692
 pI3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=H9r5eTK3
Subject: [Buildroot] [PATCH v2 1/3] package/gst1-plugins-base: if libdrm is
 enabled, make use of it
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

This formalizes the relation between the configuration option, now
automatically aka randomly set, depending on the state of
libdrm (BR2_PACKAGE_LIBDRM).  Since that dependency was not
previously noted, configure would sometimes choose one way or another,
but usually without.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index adfb407386..467e15414b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -47,6 +47,13 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += libdrm
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=enabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
