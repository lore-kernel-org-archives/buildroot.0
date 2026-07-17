Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B83EC44523
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 14:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9034D8110D;
	Fri, 17 Jul 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvzboJV-2dNd; Fri, 17 Jul 2026 14:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE08810D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784298338;
	bh=C36B0PUVC2qLYCFl9S2sGlgdwhL1LDoZt7P7WZ2unvU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJgr++7tCpzr97ALjYyGc/FFRPOWxCIExV13atZoaD5GCvjTVmkUJJMXnWXIQBtjl
	 sVjP4PM5C+ZedgFyoCH88PgHwV1K6iOLifDwyR8lBnxweS4ryXBFX0/AJfPy0QmutK
	 w0RLHW2jc/nPiNbihfHSlU6PRj0Q6Ibg0m8JqNmPZQnz22Db9UgBe3oSLorhUtwnV2
	 G9G0YS5R1r2hKq0H2cVs2PIgATPBbDycVyxVVp3GffNCs+VUR4o6MgYbrIVPbukta1
	 C7wx6G345FJrTdvLPaPvjWOKVc60pvBXE5i0bbldQpOmrG9EGrG/OZ/najhq5njqzK
	 CvZvcWbPKXbfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE08810D8;
	Fri, 17 Jul 2026 14:25:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84EDB36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76C3D810CA
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5B-16-bwKLn for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78D9980F2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78D9980F2C
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78D9980F2C
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5aeb98460c6so5199844e87.2
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 07:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784298333; x=1784903133;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3XOoK5szkIbyzWQuK2E5XKM6oOB1yYxAO/8wZvrwayM=;
 b=RK8nI5VgksoXPWndOM7zYlcs/r9uYl9NO6+J2JeZ+kFl8ZJe4ECbgO/jc4b9fFpK1F
 5pic1h+OiU6TyQUOIeDjqUK8uPC+JBFLFMhAkUPbPXGr7LpTcDrx3QmxDjjqBI96lFpj
 VYBmJXWUhtOEHFJm6aKFF5k6p5pQGj5lm+G010LkH1sG6GpByCgHrk5aqaW0/4S03AYC
 gSfKsa412Zk/1C6J2BhzfFuxCQvhrAGZCcKEEAvhi+0ynd/rXFQTc4aVVf0+gn0zAnT+
 d2SOgc3LkE+1DLKbWyuF+oY8+qkHxHoIGSPtDUV4CjGLp69n7JK/6b2VLp2FqPat+KA+
 OVTw==
X-Gm-Message-State: AOJu0YwmegNkhwuIuqEPbM7/JVR/hR7QkJOoFIW9ZnmH0CmsGb7CNhHI
 Rdi880soIsHnarb1lyxyKTneNmXO8mU3AwIYaIV+HL3epctaCIA19++o9TYfmw==
X-Gm-Gg: AfdE7cmbk4QK3d3p+kbuXWD1y+lS5m3Fcacdc1xp5S6FWtCN1Gd+R7a6257g3loTcRh
 QHlAej25dpJPePz1H1DzYu508wVdLCEeiggu81YyJuL0WqkVhw64DvJ5oVoiTVXQBuzgUf4j2zy
 XzgemYIUcR/Gg/EGMzTD/bQzS7qLglZqXLZw2x/LBaDKbKbMFLAYaw/x/HpAqgC5Bhc5/NYyytV
 8yCdto4EZPJw93MR0HZdnqLSgHS3pf894BQhDwXbs/bleLMwjPKSJsT5H/jnC19eSuLd1oGEbVD
 uomAvPTL3B7m13fDMg9eTF+o4fUfdHC94U3RB1VpHV7uaRfmU/F2HVOi1qa+W8UA+3aLsL1UFlH
 gQ6AUoEgMlA2tYoqF27PmOEBouQtRVx2jNJHVCZOOI8IHtME5GBBz7yl+nJgn9/sXBG5Pl9wPmb
 ky9sNo0RCZy42LKTlUv9Ma0L78DSrUlIWWBy/auc2WVrarALS0eUw=
X-Received: by 2002:a05:6512:3456:b0:5ae:ba27:ee5b with SMTP id
 2adb3069b0e04-5b28f9b7f04mr362869e87.40.1784298332733; 
 Fri, 17 Jul 2026 07:25:32 -0700 (PDT)
Received: from gimli.addiva.ad (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b291e0ea1dsm361762e87.43.2026.07.17.07.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 07:25:32 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 17 Jul 2026 16:25:27 +0200
Message-ID: <20260717142528.2709557-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717142528.2709557-1-troglobit@gmail.com>
References: <20260717142528.2709557-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784298333; x=1784903133; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3XOoK5szkIbyzWQuK2E5XKM6oOB1yYxAO/8wZvrwayM=;
 b=GeFBUFYQYSub11HKOBqmGUiBCzOf9h/AGb5nvThwMz4nrzJQR+KY9GjRWMolOT4d1S
 v1MhLcPaym4F0WUBH+lwpca2AG5j0p8PfZWjNGF5errfear5EjL73x+/g3lFzUyCg0WD
 8TEmPU6N4kU2Jv8D5tItp9YP6mOacKJylqBqFgN6zk8lkr5HpIXK9/Pc/aLDEvr9dOs5
 HM82Ss7Hme4QGqnXvQkpSTw3Meg5V8qvwQR10LHSDlqKcSgxbsLseiFosypOJ9F9N6Nm
 A3sk8qkUKpsiFsdipN2NEwaIQj/aOjjDj0PYCYb+Qn0TCfClub3bgWrvmEZGcy6QYq5b
 Va2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GeFBUFYQ
Subject: [Buildroot] [PATCH 2/3] package/mdnsd: install libmdnsd to staging/
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

The mdnsd project has always been both a daemon and a library you can
link to your own application.  With v1.0 a major bug (requiremnt on an
internal header, config.h) has been removed, enabling installation of
.a and .h files to staging.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mdnsd/mdnsd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdnsd/mdnsd.mk b/package/mdnsd/mdnsd.mk
index c938890508..ca443f6211 100644
--- a/package/mdnsd/mdnsd.mk
+++ b/package/mdnsd/mdnsd.mk
@@ -8,6 +8,7 @@ MDNSD_VERSION = 1.1
 MDNSD_SITE = https://github.com/troglobit/mdnsd/releases/download/v$(MDNSD_VERSION)
 MDNSD_LICENSE = BSD-3-Clause
 MDNSD_LICENSE_FILES = LICENSE
+MDNSD_INSTALL_STAGING = YES
 MDNSD_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_MDNSD_MQUERY),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
