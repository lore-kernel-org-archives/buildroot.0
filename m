Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87564CCF9E0
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 14:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D11240F6C;
	Thu, 23 Oct 2025 14:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLzuuNKe9pES; Thu, 23 Oct 2025 14:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F281C40FD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F281C40FD2;
	Thu, 23 Oct 2025 14:05:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3593A70A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C73E40F6C
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXzgFDOnrXzT for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 14:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D04740FD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D04740FD2
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D04740FD2
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 14:05:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b4f323cf89bso197898566b.2
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 07:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228338; x=1761833138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PsKmhUmaNukCHDBzU1tzRoqWF9/r0HDihvDeHHwzxbw=;
 b=WctOUgS3iJNMfEpbDBkYPlLHUMxQmPcSLQb5IhZ29CVUodVtu084OAJfpggXOIHSZ3
 CVuEJqYT7QzMC+N5j2zn6LbaxM2sjN4Zco2Uo5xdqJKzJNukEo7HWFfaaX1kD+kSMzGX
 YRT8IsbS7ygyjcl3P0q2OmIoS4vH+wfbulcQouk5nxaLxS41dqPtF6oGAy81SzHsF2Ej
 NRPijKUJUyIQA5oLyZIDN3dMrPaNKVYnnaZVDBbe543hu535aGmAOMLbLAWFMV0DRhD3
 NG8oby3IiaGBXcvsAV94p745erYSA05LvDpAwX9Ixn4HpvRGLPD1O3yJ2HLg0J+Pk9w8
 Btgw==
X-Gm-Message-State: AOJu0YyNxRTzqQUAzRJSRKzd0AMHY4P74xTXPgcWIC0xYQ4jz5L9ZWQS
 VcRqu0QczRLJGJVEk7315vxjsQ2xAGi3Mw9ve0NI0QOztYX7wS9IOv0eeOZewLDm+zWibwLKSiQ
 Trf1ElvU=
X-Gm-Gg: ASbGncu6qEFBfz/Cl/oLQ56I3GdR+TlPrSf4zhhxsEZeJ0/OgGmQyWb2+bIyGORETLD
 PTw2uB8wOGYA76u90GTLdnX31ZSlnDWLCVMX/M30UmumMAB8/tRRYV5KvsbGY0EM44Iec49K9mu
 IBBJQv/1I77i3REugZOV/mxNiRFA1hIHInHeA4xTx56I8AE+fa4vKyte0tCTM/qsl09ECXPpg6o
 QCTJAJev1IBYxzCZE+ZAsPngjB9qitClPe7s0ZKb0yZQUIrR2cqdJuZRHwXdzmtPQFIkrQ+KaCI
 YtCt6RAYIWMxc1T8swa+ku1CwL2UPmKPJirnZtZBlq9AP9X/HZg/FcgXraqTKEXkCa/GbUp5ipR
 E21+7lW+boTsWnIAEMMpJ1O9BPAh+3czuQdn3leCcnW3Uj+gcOGIAD731GkjcMaqnEsb9+44tRM
 LDSHxTKlsQID02tJ8nMOIowXzN
X-Google-Smtp-Source: AGHT+IG+QUbheXtLE0ug0QUbCjmNmpCgIwqFDvlcBURJHDQkUR2LLfAWeDzxmC/dnEROng/36plJtg==
X-Received: by 2002:a17:907:3e95:b0:b47:d628:f002 with SMTP id
 a640c23a62f3a-b6472b5fe86mr2924231166b.13.1761228338145; 
 Thu, 23 Oct 2025 07:05:38 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51317e97sm222834966b.35.2025.10.23.07.05.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 07:05:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 23 Oct 2025 16:05:24 +0200
Message-ID: <20251023140527.544948-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023140527.544948-1-titouan.christophe@mind.be>
References: <20251023140527.544948-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761228338; x=1761833138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PsKmhUmaNukCHDBzU1tzRoqWF9/r0HDihvDeHHwzxbw=;
 b=gOEglZ1/C8WwAk/Btj1ZZ/L5/CysyJukgNsj/wfaGx0tRCA+KpwgyrgkP7w5FTk9TE
 rxuwT/UhVHWtSQQcNBB+lekuXnX62dVmuw5YaAj9AU8vmAVXLNOmnxl/FIChg//jMkKX
 IqQwY6JdW4QOww1LVMAeG6xE74a5JMtNw3gevd/wzKBqkzleYKVfJCWuBLGFg94koV8o
 VF/D5hinAaSSt7qcQ9SjKDRp32TAwtw6B1o0I4xylHBDZLVWTxmZ/xK8X45BPZ1l9BOM
 kA0pK2hgK7fW6eWVcGdvuu2ZZS5W8WGyIgbQy2JG0iB6RuHhh+4HqkMbZv1iltmIrkvd
 /bog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gOEglZ1/
Subject: [Buildroot] [PATCH 1/4] package/freerdp: ignore CVE-2025-4478
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 3a1ba61621..391b9a4675 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 FREERDP_CPE_ID_VENDOR = freerdp
 
+# As explained on https://github.com/FreeRDP/FreeRDP/pull/11573#issuecomment-2904160524,
+# the affected code is new with 3.x, was not there on 2.x
+FREERDP_IGNORE_CVES += CVE-2025-4478
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev -DWITH_GSTREAMER_0_10=OFF
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
