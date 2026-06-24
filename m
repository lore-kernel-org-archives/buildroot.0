Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB86CDE005
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B0781E96;
	Wed, 24 Jun 2026 10:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NBBc8Sr_41c; Wed, 24 Jun 2026 10:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B01CD81F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296033;
	bh=oJ+WrUAjTAGdUfxER+9gISk4ifUy8L6s/gLFtQFw+YA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=AKLSRIcM7x/k5V+Zu9EQafRA0d42/uV1FxXav5nSlA1X7iIIJgA6HnCbwk269aZ4N
	 dpHVO3yyP80JczNXVtGL5XketS0i+prQtpho2uTbt9JIcfRx+M5kOAmIEDbg/SFvRb
	 Tu5DW72LVHaZfJ6qsxeesZei/NON6zQ0OtJoyEnsmz8lo77h+cRHP3mAWzKWvJhovM
	 zbJfTA4kOhC3j0VMA6piGG6Iux0tCi+sTLGPaHYfM2L2ql5C+TqbHNHoapG9BdjlO4
	 U0J8SSXuFCcp7kCRihR7ptnls2GKcQX2jep2dNbeGgMgK8Of3fbHlMSv8NRpGZrfIb
	 Ih2UUZN+Q4zuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B01CD81F18;
	Wed, 24 Jun 2026 10:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9131F256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB9160BC0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp1F9tBOc-E1 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BEA060BC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BEA060BC2
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BEA060BC2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so5566275e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296023; x=1782900823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6MfCmBjzjrLT75hjFcvCfvSHK7fjM51OlUgm/vfyMDM=;
 b=phy3HpeYg/S2zZrfbLGkUsDYJLOQkgwKIoBTgkBfBS3Y9rG6O3zdasasUGsq3arlIr
 tP4R8MFtg096cjBhkSzwOLDKCuPphPeXMdUbAU6YBB+uolx43rzGcgKDacUg6CBNcWUM
 QFbeCI6Nqru9GA4Ohzx9zEMFSRPhYBD8jh6d6zn13h2/H7oonrTTmxSDLGlx3KDMxgVq
 lzEk5ev70kTiumNp+bgg1Z5ztJwjMD0FHBRPoZG5PnqMqBc5eacOJL0nwDZVLEmXZf/3
 04M5kQXJ49qq7ALA1uibz1MTisABEsFW3oRKOuNH1uTFg48/6LYgi2wM2fixdPND9RzA
 FD+g==
X-Gm-Message-State: AOJu0Yyy5P1euKg37tSFh8/WW/Y7TDC1ccSGHBepCdwBwXUvcLHkKZlH
 thiPo1iyznFsGsWUqrMCfQPNJnHv/5ju++27NtQKW+yldnYcKGZOv4XYjfvEr3QzMTBXhRr+REb
 mLLqR
X-Gm-Gg: AfdE7ckQ4/PDLae7hdQpOy9TK81Zo8L7Suvhrbm6ZMXaPs1cKZYtZINJz69fAeetRIX
 fdy8bQq77Ka0j8cW5h6u66jPpXc0C5tHfd4f+nkbt7lmWkUfaPu+6XVexjPoeycT+Rf8Yh0OAww
 uehuKDaWen9lSyA2Pu2bGsIPHa6OOzFbqjvu1WQE+ej/gjugiqTTCE1UjBsuW+ooJ/lyl86iphe
 8se92/LKruLBTxoDrGy/peHIy2TKcXi50LMT9VdqSp48tq9t4AUjx31v4WRKql5YCDgdZZ67qdm
 XOiBrg9AfDgkgz2bCrzgsDmNDKSAb9dq5WA05XIAVjZ6N7hX0nurDDzs0kd0ftgVX9YsrPJ4z0W
 sDPRnjHj80qDYhv5p4tPB83y8Q68OiPnxgMiLb/fad2N9z8KVR5K3RyFkE0cHz67343tpLamVOJ
 WYxF5D
X-Received: by 2002:a05:600c:474f:b0:492:1e36:85dc with SMTP id
 5b1f17b1804b1-492608800famr35234085e9.36.1782296023366; 
 Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:35 +0200
Message-ID: <20260624101340.80670-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296023; x=1782900823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6MfCmBjzjrLT75hjFcvCfvSHK7fjM51OlUgm/vfyMDM=;
 b=UNvxrPVqpsurLkB/BDzdqI0UIETCoax7HblRT3Nwvq+H4dXz3/BMWNu3x+x//xAmYA
 t6EfN5lK532HZxrina/Kuf7Iu+K57ZJXuYgh+J2ywPnwCUawVyiPK2Sqd9twdt4tKbHN
 M7zhIIvTM4ZN52kUM65fVViJUNL+UqU11tef9v/hCKIevB5TCRA48+Fs5DzWaoUmVljR
 MvN8YkH7GXNrTRpjzA6b04AwYYlz+CRYWzuYc/+sb7EtpYnJBLNhBgO8Jo2wGB/vwQ4x
 J5GhUEsrs4e3GmXvx6u2enC2Z1pEmGx4gN6liETs7ZLVymcJ7POzzsMxQY4qPCcKr/yB
 B2+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UNvxrPVq
Subject: [Buildroot] [PATCH 4/9] utils/generate-cyclonedx: mark host
 packages as excluded
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mark Buildroot's host packages as 'excluded' with the scope
property [1]. The excluded scope is defined like the following:

> Components that are excluded provide the ability to document component
> usage for test and other non-runtime purposes. Excluded components are
> not reachable within a call graph at runtime.

This fits the usage of 'host' packages : a package without a runtime
purpose.

See the mailing list discussion around this property [2][3][4][5]

[1] https://cyclonedx.org/docs/1.6/json/#metadata_tools_oneOf_i0_components_items_scope
[2] https://lore.kernel.org/r/<de0bb761-ca88-4bc6-8d7b-6bd14e9d1cbe@cherry.de>
[3] https://lore.kernel.org/r/<20260409204208.302842-1-thomas.perale@mind.be>
[4] https://lore.kernel.org/r/<bd0f43c9-ebdc-4717-b8d4-783ec712bed2@cherry.de>
[5] https://lore.kernel.org/r/<176c5c42-50bc-4b39-a7b3-845b085f010e@rnout.be>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 902b4276ec..9e3bc9d4b8 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -371,6 +371,9 @@ def cyclonedx_component(name, comp):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "scope": "excluded"
+        } if comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
