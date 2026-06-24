Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E1DCDE002
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88DBF40C2C;
	Wed, 24 Jun 2026 10:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjBgFiU-0Zni; Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CE4840C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296030;
	bh=+HKdzq1Anwatd5OJVMpcKHOcMhPhGX46XkunJJZL4uw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=LgsGPhG2nX2X59cTBRQfXz6C2wLOoSQBb3F/qPhQoKHrQkdNU88pN1AbWqj2M3k6y
	 iEkkt18S3dk8kBE/+XV04fzMMLKrR4op9drt/i0jqjwykbL988J3SZoXv5bscpO3ft
	 D6kAGgOmm0EPmKxq6FSK9FkXqOPpNNsJElvhhEEeXm9EFxCABBR/9eJK0tSMQH7VoZ
	 qf9mKfa219/GxrslPBr5xC/ghKRbM9Q12i/b4izPW2l/RRcOFD95HMhyBJuJBAIyOj
	 R9kri4k9f8jorgKQahh+v35MS5Zr2keCmb/NS0GTz2CmJnIHFqSIn4PZWdi8up4k3B
	 H22l3uQG5X0zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CE4840C39;
	Wed, 24 Jun 2026 10:13:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F215367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23B3D60BA8
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNqtmv4w09uX for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E98EA60BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98EA60BC1
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E98EA60BC1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-460166910e6so526652f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296023; x=1782900823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OtZtgxH7vlgMs4lvXymgpcart3o3b5tx56xKFvkPA0E=;
 b=XF88f1kjNrE7c4vvSXRV9vKNZLaQcGrrvDhMBQhQeuI+L40EIAC2elZpyjhxSI1WQB
 z2lGQ4oShhqUIQjMLclkYmTyNdnwRvo2Q9OAVOOy9SNDqTaL1b9gFcVDNHgREzeeQT4+
 9EG6/jPmu9mIJJcTqZzy++2SUYSRssFcXLKsZ42ggE2dfxXhBCAnV3AoWx+DYtMuVPAa
 PZAtF5yJ6jnbBd3DDmq23y4Cnx4KnXlLrsqgClnOF4c+i+/Qxc5ScJmDTyVo/oM6phId
 Y7fc/0FkkqSIWpBF8rcNs8EE180aRkg3PHnV+2dUMMMEp5HgdJEF2A0/wf3zk21xTwzx
 taIw==
X-Gm-Message-State: AOJu0Yw9hWuxAikcqQS/ocjsO3r6CEvdNeOdWvRgVktvr93xbFGPOHS1
 6hGdjY5p1Iyy4QPjQPAUrVbrQ0Lx5dyTI2QR/8hf6nNwBDv63mkTWJrmObEFEILdnyjiWUbI8c9
 49ssd
X-Gm-Gg: AfdE7cnncv6b/9bAS7B0b3YFCf/It6Uz2qJZUXr1puUQWISeZzeH3JN1uyG4Dn3OBaB
 OODOJvSxb+3arcrZmMU5sQEwnO/ocranQSlciQM/HGCDv/A3XxtWCShobgu8gapxxyAvNAFHzm3
 xLlMW6wEirogHCGkjiQDnQ08rdwmzjPry82GvY4RtleHqoZtA4dUkYVq3DJY1nh0NKcCAc5jP2i
 stxO+IGV3OXgs2iV9tJQhtS8VxEGhJ8jdXWqiKDMjIWtPvYW6GLZGKFMkROXKxUv/rfGSyWpOr7
 dvpRZR7jlpTL8sA6usGmtA/7vA4v6q5rRZXYpy0rRjY7TeMRvonzqUdE6aF9dT0HYTMYbSrGk2T
 B+75+RCyMVAHxOvHdGWJUjMw9Od3ibK5ZN/I5yRirebXZTfNc8PxWEH7sBVB0L5C2jVxHYAwSb1
 V/tyUb
X-Received: by 2002:adf:ff8e:0:b0:460:25f3:b25a with SMTP id
 ffacd0b85a97d-46c0aa46f40mr3008591f8f.34.1782296022887; 
 Wed, 24 Jun 2026 03:13:42 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:34 +0200
Message-ID: <20260624101340.80670-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296023; x=1782900823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OtZtgxH7vlgMs4lvXymgpcart3o3b5tx56xKFvkPA0E=;
 b=VmHh7LqAxYdMu16YQ0xMCfMVT4qIw7P6rXOF73TKfC3YDSi5B0C5U8LMxtYt5aIN6J
 sSuUcrpJ7r31e5tUQxlnvH9cXdvCRVW42/6Ko5eCH0j62KGK+SaXlR18w/69jaj0mKfL
 Txtw7sxaaU3e4N796DwYqoSoUZO0vXJ7SoZAgfuOac1r4u5i1LdL0679RJdKKM7WtHf7
 Sn1Hs0FzqR9gOBvp8Y7uB3WYhnb/3KNBx0BEsWac3wMcGtIVYi90eusZpXXi2d44T4OC
 HZCJnPpeOs2uzhUBTtr1YvaaaTfD05SqaaX1bt3RjRAUJFAW8TgvlPmY01gEcYcw+zJ5
 4H8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VmHh7LqA
Subject: [Buildroot] [PATCH 3/9] utils/generate-cyclonedx: add 'id' property
 to resolves
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

[1] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves
[2] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_id
[3] https://cyclonedx.org/docs/1.6/json/#components_items_pedigree_patches_items_resolves_items_name
[4] 9415529923 utils/generate-cyclonedx: add support for 'resolved_with_pedigree'
[5] https://cyclonedx.org/use-cases/pedigree/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index e337770599..902b4276ec 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -233,6 +233,7 @@ def cyclonedx_patches(patch_list: list[str]):
                     "resolves": [
                         {
                             "type": "security",
+                            "id": cve,
                             "name": cve
                         } for cve in cves
                     ]
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
