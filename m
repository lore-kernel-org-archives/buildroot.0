Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573FCC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFF580CD2;
	Tue,  7 Jul 2026 04:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7eS1adXbhZB; Tue,  7 Jul 2026 04:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DE5680CB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397329;
	bh=lzDgti3eurrKelR3WmTUFPnMUcqNzJvaDplZ/UOGpag=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AglquzY4QJVsITfSlkcOFj2tfxeO80zQGQRaxdvKnH1CnXzyYGKe95/dPfmxM1wsD
	 QEjy0TmKj1+mws6CJ9KWb76S5vMC6BpeHDMHTcDnWsIABK9TZU0NbFgMAjjlX3Cy6X
	 y5kwo7NQW00sbqx50omxMeJpa5NIL9HHfR0qypaaMAIj/Iwotf0P7YCAd4E0RTDb4l
	 F8iiAfhGu5kMM/qHHu56E6irVTkRxGWC/IBdqrXlMnYqEb3daR9RgjaAbXWa9AJ6CY
	 U+XJrUwiH6qaIzv94lLD6Oz9m/2T/ULLlnZPm4wGhCMU0oDSX3qsjd8nFF1cf8GqhD
	 n1abKQLis8ihw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DE5680CB6;
	Tue,  7 Jul 2026 04:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25D8533A
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182D66072D
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2NloUFQxx_Q for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DA47606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DA47606D4
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DA47606D4
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:47 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-380cda7f00cso3188247a91.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397327; x=1784002127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=di+QAMLjOjfkPnAQzp3n0/0+/TOnLBnCysNDd8etMtg=;
 b=ObijyFDaaZyr9XRSaxzx3PcfdPhEC1sm5rnijpEua+Fip67JjyNIZvuHca50h63juu
 VjdS+uknGGoE95wwqSYpdkJVxw4Unz7oH/+dJIar89QNm53RpctuZCoesJBP7Q2lHvtP
 TkWRZSeQnV75i73sC7vpD8A55Jnb0QUuPbxPo9I6zdy97j4jr/FrQ999BlUqbeQpChwu
 gsDoTAHO6rPSdtJB3fKgvt90UuNfKRGs7aIT9nzTf8u5wDQYOl13qga42jL8RG5/KKRt
 fmMMgoP5j1PAedjM7Y16Tmz4VyIAmzYx6ZErTYOZdj/ioQCBZZujGXEoHxm36uQ00aL7
 L7iA==
X-Gm-Message-State: AOJu0YzKkC4H94F9blS6uYKZ3VDzgmbvuUz/8MHyG/us+0gEcRQjZkZc
 C7dAfj4GG8ZhOmyjJatS1c9d4SSn8D8GRPLnz8DTNgDVsS8ZhPPMdRu0vdca+cU+
X-Gm-Gg: AfdE7cl2pciBTVpr/pSbpt56/K9rdA/zhIicy52tpZTijeB3/csRT/3n7InaZLNttZV
 9Yl9AvxEzL/3ejiFTmIxDJtgeRPucRxA2LupUksHFuH9fwsax1CjM1MVZ776MZaA/dC2mlUy8KG
 fIaxSg3m4bIXHTatc7tD8Ih1FowzzDeVndR53a6yWLz5Jl2nOgfz7YQ1QM04UPSzg0tMS0ajOsn
 O0tcZuW1It4lsrtEINoDU6yRBxlDqJzKKARYFFl74SxsIjZtOLtdpXmHpV9epYXSIyo/ZlSJ4zS
 Vz+N3WpsPPjARRzZZ6eBucZfUg4qyhYT/PRK/vIFcmNBZwovCb8vQ3w9dv/vxLzS6g7fVulD/CN
 Ze6rCxSDEdBc5y9SdQ3Rhxdxldq1uubN0lfaD0h3CL9ZLtSnhFUbsZ8F9SJOqFAikWr+ADntjAr
 MoS3Hu5ZdEphi8UC/rBc3vtlx3R6ncmef2P4Ow05a/xa4a9RiCxoLFD0U1SPPdsiUxhn23DiyNu
 A==
X-Received: by 2002:a17:90a:e7c5:b0:37e:10d1:c05b with SMTP id
 98e67ed59e1d1-38756ce1783mr3414251a91.22.1783397327059; 
 Mon, 06 Jul 2026 21:08:47 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:46 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:39 -0700
Message-Id: <20260707040544.108052-4-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397327; x=1784002127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=di+QAMLjOjfkPnAQzp3n0/0+/TOnLBnCysNDd8etMtg=;
 b=RbwUc0sLLcDqHPGDDJzENJcPmbsimgUHDDt4ul+JMx1GSoJ1NvVEoLhx6Bcvi/YMgR
 B3B/pkfLsNRbLNWDHQtQmHsAO6IEZeygPC3C0vrbj/oxX0QqL1L4t6/gh4lx/+jq+nsG
 WRJMIkUWsGxyRlqlzHUgf6+pvdqNn7tLzyXHP5mkGztLtjhK31DaaID480yZiZuwsZVj
 caCLJZp/jj3U0ecDf9+YJm18biyHEYaJTW/tKDS6emvDl8egj7GhNTd8eLDbryWVDu1J
 Y6ee9yq0Lv8JtvKA+fDf6A96NtVftzEGF586EqfD5R1rjuxKB56kXwxXd9/OkmrNY+Cc
 ODLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RbwUc0sL
Subject: [Buildroot] [PATCH 4/9] package/fmc: bump version to
 lf-6.18.20-2.0.0
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

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index aad3d1ab11..586304c37d 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3a9e2742bd68c5eb04f3d803b0b61926a163621058e3cc6a34f241683b5b153  fmc-lf-6.12.34-2.1.0.tar.gz
+sha256  07a8a4b9a847ebd10c288eb64ce270d76882a4e0188d525d933c968d854eb762  fmc-lf-6.18.20-2.0.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index d88fa9614d..c2c4ea4744 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.12.34-2.1.0
+FMC_VERSION = lf-6.18.20-2.0.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
