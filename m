Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7632D1125832
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EB8442306;
	Wed, 11 Mar 2026 14:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBllXw4l1wdU; Wed, 11 Mar 2026 14:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B569942316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237915;
	bh=FJTIBc6VrmnKhZEsel7ndY+c5dwyiZaAG9/SJmZXiFM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V4UQc6jmpliObHeoesvPzF1ONNjsd1IHM0bDbefAOZu5BU884/6fdwCP8LDlJ50Nz
	 UC3+Y0jV73l8KaZgXlz1dfRNnYAqmrY5wBvqpqK+QoK6VKKRBAuK5HAd8pctk8hn8p
	 GGXKR+xs9kik7/y3m4N6kxjaHVxnF06553L90R81kQxYtUjVDBZSvT5RUmqt7t3HPS
	 KeHjEV2tatZ6yyQzh4GOF7RLXdfLfNlJY1W94n2dmnfRiNiQsZp6s4CctqNMVRgNGW
	 BF2LY/hHGGYL6Jq+Zje39tv2L4RUrH3CW/tb26iPEXm4fLHhWWRTH4OtszfMbcCVk3
	 KewpdmDmN1Axg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B569942316;
	Wed, 11 Mar 2026 14:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11932228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 039DF84572
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szoCj8Yv-_hK for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02A5984571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A5984571
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02A5984571
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so2251006766b.2
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237905; x=1773842705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EcTwkTCWltL2NKdO7PQmtiBrNmrEz9BZlWRAFyZpE7I=;
 b=FBV7bEq8DP2Sx2wZgOm7Z92YlTV7SJbnEyG1WQI9Ie2rDSGnN8frqJDR7PJIDhLgDb
 tAoh/Ov+pptMz1U2P3YALqbLIkFQdfUpO0uULAFL9Tk9LkCHI1gHZtr91gQ2ZP2R6CV4
 sXWrtIrcOedIJr7PpmGjJJ5IIU8xXgsgYvWaxDhlpQJsBVdzVARRm63bXtnHlxSJ4kP9
 zvmgPoM6l+oc5sSa6IwXo0a9AzpwreElL3/eswFpYNOG5fN1JbLCIVDtKXfsin3f1dWT
 Rnx+Vry1V/Lqe/rhqojFaTqenRck+nzqsGYn++hbxmJvGnbhXoh4N3YOV28C3EPtNQZV
 dc/w==
X-Gm-Message-State: AOJu0Yw4BCnA50IyWkheMUXN2fT/DMvtiI8PWD15KRpEGWNk+AuA85Tz
 T8ZScduYCooPSlMH4RYGIuq8QfWi1N83SiBuJce6TBd+peibCijWsNMv5nim1QQQ6Ddl7CYtPY4
 JNvHU
X-Gm-Gg: ATEYQzzoOdTNmGDHxwop3ItYt+53t0Z4qLq5iZ5BMTl2VDbJhfPgF/Lv8r8O3mVNoGL
 P8EHa4GyrUC3mnPmFw4Ig7slKzNldrCBrcry576CA8J0smdUndwMsLUuRU82RMswZTcsUZFG5EV
 mK2Zorc+H1251x3izH37i21KLRDKMr0aPN9R6p8766mW6Nq0wLbvDNE+Axm8SpZlNXgmDmpmNXZ
 Je/yjHvO/bcsG6YPME8I2ovNkJpiq3+zpEitTTzUxIniG2FRbCKiS83AXdpD9VLHuZzg+blpVsM
 9YdyWUgX+DywKcNV9vKgjK4tXyxbKp9h5MgBX7h3Eec8aQ/xq48xr4gQZNyo6n99ht82NQOE/SA
 YHd5WbaFwIKzv8+GNy2iTpb/62DFaOyXgL+Llet6C2yZH/pRcye4KaRhuQPmAIccwTe2G1XkuGf
 k5nMzRwWlPmq4WBfg=
X-Received: by 2002:a17:907:e10c:b0:b97:3bbe:e435 with SMTP id
 a640c23a62f3a-b973bbef943mr25676466b.8.1773237904070; 
 Wed, 11 Mar 2026 07:05:04 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:05:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:56 +0100
Message-ID: <20260311140457.140041-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311140457.140041-1-thomas.perale@mind.be>
References: <20260311140457.140041-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237905; x=1773842705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcTwkTCWltL2NKdO7PQmtiBrNmrEz9BZlWRAFyZpE7I=;
 b=Qs645xOfRTRGxw2IrNO2Z+1opxBaHqN9YDiGLsYNeIV7XZZ7Oo8OHimTgtwXRj+ojX
 mjPr/7p3lZy2zKacsmy6wzDtNa9wQDBnAEqEuT5yfMPg8Qe+JqBx9bLvmCbTmZD8u7CR
 gXpfho9vUsiKwahHWR0cL1j+9C5pRNovdWRNfcBt65snMTuDMB/ijicrptTpyqrB7g7E
 oCER76JYemGSiPU7dR5n/SRGhuSSzMTHlPhqSytV6ynPgKJQgZBKRkALreHx4UKGz6LZ
 oDqiXbJulbqb3ojLZKIf0Oq7Y5LET5uYxvN/NLIZcwo13MHhhs5CX1LZbbZLtbypSkJJ
 6BkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qs645xOf
Subject: [Buildroot] [PATCH v5 7/8] utils/generate-cyclonedx: add 'id'
 property to resolves
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

The CycloneDX spec defines the `components.pedigree.patches.resolves`
object [1] as supporting both a 'name' & 'id' property.

The definition provided for the `id` property is the following [2]:

> The identifier of the issue assigned by the source of the issue

And for the `name` property [3]:

> The name of the issue

The `resolves` object was introduced in commit [4] and only used the
`name` property to link to the vulnerability it resolves.

In example [5] provided on the CycloneDX website, both the `name` & `id`
properties are set in the security example.

In the vulnerability context, and more precisely the CVEs, the `name`
and the `id' are the same and thus the value can be duplicated across
the two properties.

This commit replicates the behavior documented in [5] to improve
compatibility with tools.

[1] https://cyclonedx.org/docs/1.7/json/#components_items_pedigree_patches_items_resolves
[2] https://cyclonedx.org/docs/1.7/json/#components_items_pedigree_patches_items_resolves_items_id
[3] https://cyclonedx.org/docs/1.7/json/#components_items_pedigree_patches_items_resolves_items_name
[4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
[5] https://cyclonedx.org/use-cases/pedigree/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 35d8c72057..43167d12d0 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -329,6 +329,7 @@ class CycloneDX:
                         "resolves": [
                             {
                                 "type": "security",
+                                "id": cve,
                                 "name": cve
                             } for cve in cves
                         ]
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
