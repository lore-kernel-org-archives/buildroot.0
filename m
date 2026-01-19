Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E56D29C37
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E3440ED7;
	Mon, 19 Jan 2026 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu87X-4AtB9M; Mon, 19 Jan 2026 15:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307DB40EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768835821;
	bh=kIaDzQzhSA6MmhcrfMitr4ayEuGFbUtK2Yyf0ciqDac=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NpSdODIUpFwpvIyqySWZl727adwzwMeEns6tDgd1nGe3s2QxD1gxlgGmYSCb6aTQv
	 TSnyKh0PpwME9/T6tKJbkHPvudUWuO3ZVTYVkwMNdSv3irnpXt7zeV3R4oJw+T/MVu
	 jEkpeCt9FI2Ttgu70tUi6kCUBmETQ4vKVMHIIZm9cDK8123tIQfItsZJETaxQ7g5eh
	 4k6KyHnvin+8BkVSsBIqXaLHlfh+Dlrh6td+GzwWscfWjXoJUujSJcWg+nw/3HmEYG
	 f7EGH0w6DkR3dGB4bpnisevtLO0b5fB3aQhcF12LKdtBx391J2ZcNghkotcmldOxNv
	 MeQD9UUdUjjYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 307DB40EE2;
	Mon, 19 Jan 2026 15:17:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03F7B2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E246C6120C
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jApwsmjA3W9J for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 15:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B29161206
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B29161206
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B29161206
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:16:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so50968445e9.0
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 07:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768835812; x=1769440612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mb/zO4Xhf29REvfW6DrWzBymYoVU5vFGl0BgREr1VwE=;
 b=cap7Zu26YE8RWbfm26EjttsD1g+fNCQ9yt5FjP2DSzqzjsXBY/+aLZDrLOinJ6eMge
 xzNb60SnsrZeljUmVRR7QOSm5iIKaQTw2OI28S5eG/3WJZpxjfF0B+7v2tqpOs++I9ri
 PpEh0oi3APU1UblR8XGYg1y7ndKL4ZUQXvUKppy/rTg8e5/YOFVAoADzTl05QScfuc1q
 Pz/vTvBkLgfRWh/x6RHvhg54vSgjuILdKPqHWnyFCi++Ji3mLH4ihcRmYtrgZIi77KGZ
 xOLjlz7dwtooOtRylbORuP6OfJpzFVJj9Ua6dHyslfRk7Pfhy2VfjpsaADDrtJggrHBW
 9Dsw==
X-Gm-Message-State: AOJu0YwMxtUNfHkqOOSIb8NlODFwfb0l4608rdcdYCIGq2tNoyljz/LT
 tzNB+DGfVDVLzN7IHVmiUFnrVZOp4pgL0+moSXfdxVCnoU5zE5oPYr1U5FWCTwqBOe7MwzotqMS
 jwZMvnR4=
X-Gm-Gg: AY/fxX5O6Moxj5/e2dij5Hrm+Y+gibw2x0jfFwOoVIzgixU4IzgYTouTFt4NbubKlE4
 OQgBWg7i5lmFDK14ysvbbxer6/oA9pFaanjQmOivOzv9q0Y3BmvtolUAM6qJoYW28A+v7jS5N6W
 wiLqhM9SMEfKnJBZrl0ionNmR639Iar3ElL5qcLS66tJtL9sdi/m7MMZqL2hqcHJpw0QVdX14na
 IOWxThI+TzpTEhqI0t3h0tOOQ8Qz9b1eP8HXjInHrQqlvxy1EO1IGMOCAJZrq7jaevJfrzy7kkC
 fu1JJ6cmugj1vKbjYaHhbUUj5DQcHldDx217lOadxWwa0606/os+HvXh2igv8/cwiNpKjqCzEHK
 7j7VlD8lfQPD5zRn1xQhenRF0fpqFnofPyGf8Dlg027F5N2ekOGFnbF6Z3ZIVKbPvshLqIFfhRk
 LcmJeb71gMJ9kLDVzWPblG006L+hUpI6EXvI22rRP9SzXDGaoVcXUyN29EUV0=
X-Received: by 2002:a05:600c:138d:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-4801e3432fbmr139945575e9.25.1768835812155; 
 Mon, 19 Jan 2026 07:16:52 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm253324295e9.6.2026.01.19.07.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 07:16:51 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 19 Jan 2026 16:16:44 +0100
Message-ID: <20260119151644.100529-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119151644.100529-1-thomas.perale@mind.be>
References: <20260119151644.100529-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768835812; x=1769440612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mb/zO4Xhf29REvfW6DrWzBymYoVU5vFGl0BgREr1VwE=;
 b=fw/KKdlkkuU9ONgTKiuupJZki2OMy94p5BCRpd94FbW5XMFAUj1y4rC5IqUcHFis0D
 fsaxDIbwW/q0j+IePxkAU8BOln04f0lukz/wzTP9fh5QIeEUySjKWb/6mqgcoQLVgLq5
 7uvxemaK4U+Ia4ifkIqUz556ZY6X05McCKzbfunKxmQNiBvl4SxXrgK86AVcisef3IcG
 Mwe/cbt7GnqdLgkpb8eZTGp/RSdy6NesOcuuqP0KZosVj7Cd7ZV/NRBvR0sod7SwR4UF
 SHyWvp5wjiBg49LsBnltjzjBDHPUHtrz9cwj6htmweEjro0sVqpULl1uNQW2zEiohbiF
 AhEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fw/KKdlk
Subject: [Buildroot] [PATCH 6/6] utils/generate-cyclonedx: mark host
 packages as external
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mark Buildroot's host packages as 'external' with the 'isExternal'
property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
property like the following [3].

> An external component is one that is not part of an assembly, but is
> expected to be provided by the environment, regardless of the
> component's .scope. This setting can be useful for distinguishing which
> components are bundled with the product and which can be relied upon to
> be present in the deployment environment.

This fits the usage of 'host' packages : a package provided by the
environment and not bundled with the target.

[1] https://github.com/CycloneDX/specification/releases/tag/1.7
[2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
[3] https://github.com/CycloneDX/specification/issues/321

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 2662b673a6..11ebe153cb 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -274,6 +274,9 @@ def cyclonedx_component(name, comp):
     return {
         "bom-ref": name,
         "type": "library",
+        **({
+            "isExternal": True
+        } if comp["type"] == "host" else {}),
         **({
             "name": comp["name"],
         } if "name" in comp else {}),
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
