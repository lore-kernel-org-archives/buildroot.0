Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED27CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B8E60EAE;
	Fri, 29 May 2026 15:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31q08U44mdFN; Fri, 29 May 2026 15:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C8D60EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067232;
	bh=SX9vXhdSTALESXc9vJuaLyIXilSI0S+q41ABLS+l6DE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JEprfXNuoOJWbieBlby2/wZHFQPW+B7A9Oz7294xa9y35oWF5ltF2yLoRhKSgsGzE
	 gy2xAoGkzeXlgL9AV7WaqMOZu9oYGg19nnePxIdUnpQ8tLVwgyO6CeJxSSwv6WZLkb
	 VbvY3YnsFuBhmTuace+lpQnBdN6Kb18LD8ew2e/yDBjeA+Mnm71ADfk70SqMRs9uIQ
	 wBo01VmhMLq/DoW5nSVucPq7mXqTUXWO2FbZo0X05X3iXwPkO8ghvud8340viXtdvf
	 N9zx0WMfNmEjq2kG//bzkpyA9tYgCCdGglE91MTrvM8uKemLc8mlEDDbMwVYdv7fG1
	 Eno/3WX4Z1Nug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C8D60EBA;
	Fri, 29 May 2026 15:07:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6299288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A64411BB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azZAhaLnuLVr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADDCF41F14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADDCF41F14
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADDCF41F14
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:07:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so83069965e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067228; x=1780672028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoKUyzWfM6402r6SzQXLUofDGPadVaaXL6JrN2vhwk8=;
 b=CsDijRYABRp7WeoodRzWFF4AgLN4vibowY9iLZBqM0n9TkRr7KIYc87c9B1OQR2AGK
 IVwZrOXREs4gfpJZm7QIGcFLtuPrKyuLAEkStEBt2Eq8B0q8num43iS4g10OJafnM78i
 5PJ5EKjqMGCgUoBtYiYNwIF3EV/8i1gr3OK5dA5qQfFeTj/vZC6bOklElFxJCggQ/gnM
 FrQ51siD1VCvnnFoZkFD9e94muNoFfuTYjWcv25JqvBIsIWvk99gxWE37wBobwlunGvc
 Ibe1bw51Ka0H+6WNNb5CMTD48PIwxHFSzPBgM3QPWPLfaSEeQnqjzI1PWA4X5L2EibeK
 HAOA==
X-Gm-Message-State: AOJu0Yz/m3VIwlMNYUHvCoXaUyo/Mw0XoBOunFe7z3Nd+GZikkyFhO9x
 93fix6pVp0ZGZ4ULelXPF0T1i7n4w1jyHOD8RTJQe84tz4hSsUfBSA3912gdwwfdHGErVVx/c/e
 W+nU9
X-Gm-Gg: Acq92OEYC6gUch1FO/OedcHdX/lt/bpJ2y10lbKYs5wHRl/supABv+tkiliMQeg0XlV
 uQv8Q97/osZC1mYUb+ks1GjqOk9BgjdnrHr3xZPiae4YgFjfyV3jobrlgmTuG3VpYgSvrvA0Phf
 yQ2N0yzJUfSyqzeIXt+8pX4OggnRyH2OPkEj1HIryY14GaTYrGZAovmyKR3H19vsEQbFw3JL0NB
 vm0nGRcOo8J5YpfrU1FnsCEjOEs/H373HrcuRbnrPe6PYCkJoyHhmAD0VMCuf/tlUu0T3rttml9
 wcf9DdHtOAaiinbUnlD+eNNMtLr9Aeuq19iIxB6yYr8qtLYngCJcN/9Tsr1ZbNsYizfqrFC4eD2
 leO5WhDeg/nuYchOmbbasmHS5du6289aVrjcRYndN4FyXcodSRBrefWL4uKP7UncG4AyyE7NM7X
 ujJ/dmcqYeGdJn8s+CcPs95YVvvnuo0Vp6SZa0mzxYcb7e/5UM2rHvJaiMCQ==
X-Received: by 2002:a05:600c:4686:b0:489:1b10:d896 with SMTP id
 5b1f17b1804b1-490a28d3f2emr1501585e9.0.1780067228456; 
 Fri, 29 May 2026 08:07:08 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c152570sm22832315e9.9.2026.05.29.08.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:07:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:07:06 +0200
Message-ID: <20260529150706.448400-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067228; x=1780672028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hoKUyzWfM6402r6SzQXLUofDGPadVaaXL6JrN2vhwk8=;
 b=diEdhESP+eLffiuTx/neRePs5XUuYMiPEEgj0upe7AfXnWUbMpxH/OxOJJbp+HFJly
 FFZFt94ej2AqN7RTV2iWPi9XFvPl5HVo7AXngkkhdmC/qrEAT/OmR1bT0ujj+96Re1/z
 g1MDt1wCdNTghrDsRFd6PaHUWlw1NdRXxnIrqf5g82Q3AjS+JxkRG6rDadTitDSkguim
 Vx9XMY2L0YKjLAJ+dY1hFfcB8d5pJpqzRPyaIvs+DljXjLzkrCfQ6iPN3ROfNo488QW2
 UBWNdlyx5v3MoIlUQYehD8hZrOYT58rmn43t5Sztkxp7tbCDjqCPjZQWZxitmqO2AvAf
 W2YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=diEdhESP
Subject: [Buildroot] [PATCH v2 5/5] package/pkg-generic.mk: replicate
 IGNORE_CVES to host packages
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

For host packages, this commit adds the same `ignore_cves` list as their
target counterpart and make it available from the `show-info` output.

When generating a CycloneDX SBOM with `make show-info-all |
utils/generate-cyclonedx` and running an analysis over it with
`support/script/cve-check`, multiple vulnerabilities
entries would be created with different analysis for packages that have
both a host and target variant that include IGNORE_CVES entries.

This is the case for the grub2 package that include ignored
vulnerabilities that patch both the target and host package but aren't
declared as ignored for the host package. This resulted in
vulnerabilities marked as 'exploitable' for the host variant while it
is patched.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..e5e0d49a16 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -745,6 +745,13 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
+# replicate the target '_IGNORE_CVES' to the host variant
+ifndef $(2)_IGNORE_CVES
+ ifdef $(3)_IGNORE_CVES
+  $(2)_IGNORE_CVES = $$($(3)_IGNORE_CVES)
+ endif
+endif
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
