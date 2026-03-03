Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB74EDA685
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 15:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E80A419E2;
	Tue,  3 Mar 2026 15:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0BTpM5Ub_ry; Tue,  3 Mar 2026 15:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB028408F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772551023;
	bh=U7CTyjQiG61cvBdrnSwgoJWFOqeaOV2kYHmrLeuerDo=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ghi+zXvLOnm6h+tvzSZcMBBTgcrIVR18RjIBWkeGXGMQ5ah26lDCzSyYXj1BI6huc
	 mTlgPdK143w8sZwY267b7e76lkm0aYX8htngxLiKptKw0vxpCI1WIpyjZqXLUrZXTL
	 fpLVdLig9Eb2O+G24n6LD4EbEewNKNjq5u3d+gGPt3uXKp12XcON456WIhWCrYeyQS
	 /EB3RCm2qFPLoZEcX/Vo9sxrltszzp2sBDMpb07caEiZNSalB8VHY9f/g+xIA1Aiv/
	 mDJer594MDg2UAbXAR471sFHYsWZdmB28e+qsdQhorqBcwYu1jrelY3QpFFj63TOHa
	 hgSpZuFdNtZzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB028408F3;
	Tue,  3 Mar 2026 15:17:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3E51EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8142A417D4
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT4nFYzTItX2 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 15:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05881409A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05881409A1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05881409A1
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 15:17:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4833115090dso59904335e9.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 07:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772551019; x=1773155819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=slnfWvbx/US0359fL5rMv7nBcJwinH3yBMuirO8MNO0=;
 b=pm80qpIdDgcTh9NFHuxcYl+iaGvJrQ5GFjDxmOsp9oTY5JCOfblHiruaqLQLjhKY5G
 yCHfSleZHZCgGxfA8O6p6TEEgDfFl4iyoD8PTqwztKy+JIZi43KmpllXu+McpLk6tNYY
 KU61bdO6L08Q0ab3/q3s4x0eygoQH4fnBZByerRJUn1pluJbXQds4rKaaPwX211wwE87
 UEdO378GVE197l47IDzF1gZs5zyRbMKM/3twlUdyCW3O6CwH+MSU77X2r6E0zg8UXkvc
 u10eqMsEttcIwJmSNp5dmZao8/D92jOGsekBIF60d0bb7X6zUe0z1x6Z4EjBvSRyZd0G
 JaXA==
X-Gm-Message-State: AOJu0YzF/IZj4nNxbunLg3gC9O8OmeDaeHGBt01GU5Z4skzM+t37O5ky
 14NkaahnCVJ6sZ+Snuhh9q9AH9/wTGy1zbL/J90cpisuAD/+qB7ycf8DwmxSw1NdKozS/74cGve
 SL3+j
X-Gm-Gg: ATEYQzzjc0jV46+r6QMQ3Oz/QRn9+WL19APRsNmeidiKMifDy7/CNAum7n9wHWNzNt8
 JZpWoBgVFpCh80shWLHnCRRa1rxZ/LdaXOBb49Mh0J8J6bkEmL6Wyhl/LoVoXtwHcseQZffuTy5
 dFw2O/bE//mCZBdazno11Xox3yPs8+lniF0BtOcpl+i98OD3HLv1WhU5/ddTrQW6wP3AJC9/rRX
 zDZkhrymGU6qw/u/UEUXOkIi1+UBaizkZn+pQXvFfUVrZQNL9XfabTrxBhunfGgBzO4XMofNTe5
 nxZrhBOMkkyot8MAkvfHDearoNxa+gY91l6VGGIEF2zqp3eP5Dvd6KyOkjrMr/bQen6yPijwzWV
 TF287eH99qnQiyeLd2pAqUcdFTfv0MbFFW62q9rQMfH9M3E3JRMZXkDXtSRrfTGMNLzARh4M6rD
 DnT+A6EENUGrSb5dc=
X-Received: by 2002:a05:600c:8b12:b0:483:71f7:2794 with SMTP id
 5b1f17b1804b1-483c9bbbe39mr302335615e9.15.1772551018756; 
 Tue, 03 Mar 2026 07:16:58 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d52f6sm17839655e9.31.2026.03.03.07.16.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 07:16:57 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 16:16:39 +0100
Message-ID: <20260303151641.382820-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303151641.382820-1-thomas.perale@mind.be>
References: <20260303151641.382820-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772551019; x=1773155819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=slnfWvbx/US0359fL5rMv7nBcJwinH3yBMuirO8MNO0=;
 b=ETJKgNKQXjfeNYmaJDbR71fM3aEq5rDnUWe89NIHHmczb6mPxJCN5/cJWFBwDgtJdL
 t4lD/ZeVKdUcD8GhKlEjWSTkLMKPU9xYhGWHaO9UPU8DbHh80JQng22BeiPG9wuSbmUl
 Qf2Ow2YPjekCsswk5/ktuRk+ckE/X3eRQw+YS2rpTzDnkE83qkpvrSpAHRZmkOwScBhx
 JX6foL0qBIiKALHv4MlfDLO4TNtB8ESfvkHgaJEzfPW3vqLZ5/4hWoPSHDh6iepBTR0b
 CX+cITTdh3wll7AbsHPkwNvxCmDjQGfcX8E9zI3pw9pnOcV1MRQHdIWgB6aQeZ0hSgC3
 OH4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ETJKgNKQ
Subject: [Buildroot] [PATCH v4 7/8] utils/generate-cyclonedx: add 'id'
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
index 407e42fc86..f3e3102f2a 100755
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
