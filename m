Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51864D2ECF7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 08:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0018C4EE2F;
	Tue, 20 Jan 2026 08:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88QGrZhr88tI; Tue, 20 Jan 2026 08:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E22A4EE1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768897457;
	bh=sPt8Bswa1L5P/oAKPYykhlMYqx/P2fv+qmawcN+pOo8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TpKIvrFEL/L283Ee8kgDFNKGBQLrF2Auz35d+xlHrE4g+xBcAJtryQYCz6mM7vaTn
	 89rQVj0hCnHtfseJ3QmDaDfDi32vftRmDj7PI4vBIlupJoueIc3RA3oAier0uSlRRF
	 IU67C4pmk3wr48gCDbQEU8MUxebPchu9E3Pja5bok63lLrtUTCv/ONkZtu1/CYTwLg
	 4g5gFmRcQzSE2T+GK6R6BrcIlj1ToFCURdMzXsb7j41xB9XZOw3DxcOIj2U5PcsJrF
	 HNWQNOqc9UZf9MbCwOEm6c9R1Cucq309cd+0bGOR7Z50vZCnTGqeEPAGji2RfLjhAS
	 kRoBgjZAgdRqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E22A4EE1B;
	Tue, 20 Jan 2026 08:24:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A42342A8
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971F0857C6
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWpCWQQ-QAiI for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 08:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38417857CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38417857CA
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38417857CA
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 08:24:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-658034ce0e3so392019a12.3
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 00:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897447; x=1769502247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EeBpijeQMfAFoQGV1zUrwwgM6VyD3lchM6HMhGXd+0Y=;
 b=lWivaDe9FhVrKoAqcLAtNnwVPtzbr/Ia6aTNA6HuiXqycQnk1jVoQlTJu/w1ogo82u
 edR28gE+xQUEP3rwURBbkw9mYNDlFPKxRfLOoOc7Yb2PydUMgtXPGHOIXf7iGUS2uV/I
 FflzNXQRwwr5ivs/81sMAT7EeURH7B3r3HvmVSRlxs2vk9qRZyc21EX5xJIYwC/BqBlJ
 epuwkMDrMn0CzexTx8/KV2+RWGsk45IkQHYaLLwywuCXozh4E893ONYS9qtM3AxcNmWl
 kWKAXr7lLlQ+U2SLfqTYiosyZgvTzVMljQcG/ZhADiBnWMszvLfJ4R05jk3Uhc1Q/n+O
 V9Vg==
X-Gm-Message-State: AOJu0YwJy3URL34u+O/BPxUnXYe7wm+/FIUCg4sAy2XkI9qrnYYaYS+o
 COL49Z47UEeZ3BC1ieKoJyQ6+A0XwcejLOGtd/JE0mrQo4Xw85Ib89Dgh4h+vB3p6zdHBkPHZEm
 n+EO7
X-Gm-Gg: AY/fxX4P3dhe/ZBJ7LcxdYi/udyEnYxo0bh5ZxaVugBL7s+sVaZWaGltwZx3Hx4UXIB
 9hkTkad9LlGe5m6Pd7SLLzEiYLKZ9ayHA9tAMxXhzkBI3k89OGMPtyPlAY+Z81KyngglXZZodFm
 cXky4bOCClS9eau7lrRVpk9yxKvT0BKmJYz/QW2WDIu9+lk+OGcDCngCZmTB4Zb2qfMQxltDMhL
 K2I0Y4/ty44wmGblFahZBclZXivtaHVOiqvzGmxKMbpTmlx8ga/HlOtdh/qFhNwk+pIJEjz+XhM
 NWObbvRpjC86elhYY5b03i0RyOHRnFCPqJfWyg4LsxJqHdM9ttdr9iTv0U9dVQj1cvvP9W9flKH
 YVVu81yO6C1kow1zZjuGdhwDXDboAPJt9KSc0GVJQ06mr/cai81c0ATVHp1Y1r4DR9TsX3GggkN
 hJElADpdJf14+EhE9dcdihfIJkuC2tYZTlBCI=
X-Received: by 2002:a17:906:730e:b0:b87:1741:a484 with SMTP id
 a640c23a62f3a-b880069ddfbmr104988966b.43.1768897447509; 
 Tue, 20 Jan 2026 00:24:07 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fbefdsm1307568566b.55.2026.01.20.00.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:24:07 -0800 (PST)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
Date: Tue, 20 Jan 2026 09:24:01 +0100
Message-ID: <20260120082405.46683-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1768897447; x=1769502247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeBpijeQMfAFoQGV1zUrwwgM6VyD3lchM6HMhGXd+0Y=;
 b=ULwGv6/pQiocT/JvacPncANv6Fyf5PyqIhO+3WWXEZYctHZc+Veo/HZ4Quf3r38prl
 61cMxsuhkjdxc6wIbv7yzandmhLGn07Nrbfm1606P35KBEnYhB45lMsR+EqX5IoDQXpA
 V3Ey42gtVb01JobeQ3iu5YaemJnMKRJp9Nyco3cEO7YUfT1hSOd778sN920kxKqkeqmp
 +IComuBPTlS8/MMjQkvzPDEaEY8dfkACUJ6/TYRVfXt4kXjAUN/aD4vT8GmSxz2j7XOX
 l9w8v09l6KJxpCXq4XzH3eXVq5ZOHHqpLerNnYhZyGwD/VzcIRmNsGwkw7UGj4qR1cs8
 eYfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ULwGv6/p
Subject: [Buildroot] [PATCH 2/6] package/podman: add CPE
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

Add the `podman_project:podman` CPE referenced in the GHSA page [1].

The last entry with this CPE is CVE-2024-3056 [2].

Dropping the `v` prefix from the version to track the CPE version
correctly.

[1] https://github.com/containers/podman/security
[2] https://nvd.nist.gov//vuln/detail/CVE-2024-3056

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/podman/podman.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 31cc9ba349..80107f3d9e 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -31,6 +31,8 @@ PODMAN_TAGS += seccomp
 PODMAN_DEPENDENCIES += shadow
 PODMAN_TAGS += libsubid
 
+PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
+
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 PODMAN_DEPENDENCIES += btrfs-progs
 define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
