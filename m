Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02435E83F11
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7AC560C2D;
	Wed,  4 Feb 2026 13:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiQL1niEN4RL; Wed,  4 Feb 2026 13:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B083160D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770213258;
	bh=0p1UVSaxkiZvpYdGMEomCpyplNuLn6KSJOvQkKBzaCw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SsV1rUOYZqncZyAbxfWhyqaghx3OAj4nEm9QPdhvYrAjNNxTtUHkhE0+2MPJJa/DE
	 J+jVTYp0rPNqUk5B3Hv8KSOqOWI9pZnIdVW6t794SEY9DNN+yTEiKBBybpNGvfsUHJ
	 KLTF8wUHQPvjxyqurJjUKGHqDV+YyvGoA7v9qdckbn4MhF3eFcvVOHrL/0IbvewA/G
	 gcEGevzy/eGBc8FhbcOeRlf+2pOucXOjGc1yFOYmkHRBNIENdY14VHZKUOkSZwLqOI
	 MA6OHoV16eylkfI/wHSuyqFya3GsChWPGFPSiDDMF9wvPsMeglOzNJFRpRr7zy1loK
	 x3Zv0/2gaRuBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B083160D76;
	Wed,  4 Feb 2026 13:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F31BF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFAD560B77
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBSKs1lPlxOJ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BEA1E60D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA1E60D50
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEA1E60D50
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:54:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso6903645e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770213244; x=1770818044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NfdlP95iKUdtSRLNbi5yKbWTJwgzHNmD6XWp8rUD2ok=;
 b=sLZx2DCqkgWL056nJosrf5a36pKOBYCr/WxQoMUF2O7FBDowMSwFjotqPtmeAAWM5O
 lDNIUQ1Dvtjk4ik6rR7ginQ6QCV0EY/a/s8hcYaGBK3KFnXCVr25WqovJ42kbU642BfA
 y9skebif/X7tsIp46bAHJDMDwltmuG0jppHkU12VHseYlQtm0OkgperSR7lFEOLmKvrk
 W7PSP1q52mfsh9TJrKu7EanBslx+uU8hqFHp1cjUroRtgr1kfs1Tio6XfRvKYG7xut4G
 Y0LRoGvThq9D9lt66hjPCKTXrj9hn6MLxILQXS5kWgHtm/Man5VTjPrtyUe+XhGPPe1U
 j7sw==
X-Gm-Message-State: AOJu0YwIl6g6FLjbnkNsDbVWhWD4Adkes89MghlaMI07Y/j8Xt0gsX/U
 wWkUlPi4U8dParYeIGkGjV79wFcpw6XGHW5EFPoQ1uye728C73jmwXoIJwbudjyf/XRdFsxpUly
 ubatNF/0=
X-Gm-Gg: AZuq6aLAUzWLJphZPQxaBEZ17Mn4l4/yHVjBcvJvcHNKFeVvIjN/8mPrDedaWK+mlGz
 /27jPfb82Z15oYKnxC8LH5fPF6KDg5sbDpI0lC2k6PRrtxO+4Yv9zojST3LTbM8uhSHmjskotMy
 XBOSWlClhXp84uhHza3ND2aIURz+VPecS/Y/N3Pr6B3FnCuMrftt1U4pi8MMPJa0+7qD8Pruko4
 J7uWK2eATf1S5+gBLS7dEyrJJwU8vPKdjHVSZkdA4D5we+pfAaVGXjrygvka2SEpyp9+HtJw3pb
 Ajm2FbAwlEnrxiwENehvjm9iwm7a0RzBpJ+pkl29ajLO7tswIIR60quOjf8awCcLIgSlx0Z1tkr
 nzBW15zZMq+H6IuP1fD6sevC7zEAzoVE8KO2t9fvueE2BreXtF9TKT/4C5sBx++CAHk+SylPgAa
 2HBNbzLp/G3KDDZINoqJVsVPVJ6oEFH7e3JX6U5sh/HRU=
X-Received: by 2002:a05:600c:5295:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-4830e96adddmr36720215e9.19.1770213244442; 
 Wed, 04 Feb 2026 05:54:04 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48310880598sm41026035e9.0.2026.02.04.05.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:54:03 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Wed,  4 Feb 2026 14:54:00 +0100
Message-ID: <20260204135400.307638-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204135400.307638-1-thomas.perale@mind.be>
References: <20260204135400.307638-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770213244; x=1770818044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfdlP95iKUdtSRLNbi5yKbWTJwgzHNmD6XWp8rUD2ok=;
 b=Lbzx4v54at8vlY0VkYpbFBzCHHmxim43eYCwR56V0+GOSXASXAHnS2TcQtQR4tR1U5
 V5o9mEqyT/Bxpa2Xvdhb52GFWoNHynFmwvDtUZt5hLil0nBOOIedrW4IfNP69xgUHlQ0
 hUbTsxD2bnsCVnSA9YkAu3ByUAl3aQbZYgJEfGpiOf8aX74ZYki692XRDivOPkljmcNr
 l2oijm6uge7rXa33KRyDRMdoM8RZwmoy05kH2Qd6YCzCEQSvNT1VRYyo5zZUVieq7zJU
 MzPiYu0j/B+7L7r3ocVdSpH5l3gUpsrk3lesY5m8obOfd4tbxzJaEfWmbVR1RqiCx5h0
 zb/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Lbzx4v54
Subject: [Buildroot] [PATCH v3 6/6] utils/generate-cyclonedx: mark host
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
index cbce3364de..407e42fc86 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -373,6 +373,9 @@ class CycloneDX:
         return {
             "bom-ref": name,
             "type": "library",
+            **({
+                "isExternal": True
+            } if self.options.cyclonedx_version == "1.7" and comp["type"] == "host" else {}),
             **({
                 "name": comp["name"],
             } if "name" in comp else {}),
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
