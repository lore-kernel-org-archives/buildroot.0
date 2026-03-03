Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78A0E67A95
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CC0612CA;
	Tue,  3 Mar 2026 08:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCzZI_Zicasp; Tue,  3 Mar 2026 08:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4564B610AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772525610;
	bh=S6Zy9g8EWBgG9qL7JfpFhnZ1HQ99U/ydtkFYsCgWuQM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mbWtER3DKAn+GNbBHm9c19pZooeq2bjRw/PXELSabT8E/JuNwpLEHch/WOIY9ghNG
	 HD6IXiYOGfb4xyin1nAlsHRazIT3XrDA6F8Dv0cV9EQ4bLV+Z9qjmU1tm338STBG43
	 MdEO/9nsh0AgnhOsSkk+LMii3S1EdpzfKqPIFxQhhlW8Jt5L4UW1fJYrSoLRg1tr5o
	 qBd3GaOUubkJLx5bgk+H5lDv3aAONuUX3o+nrfMBeqT9OEiTe6W1vFvloR9wnmkVNC
	 AZmIz0FKEwzR+Y/iezw5b8CjNkCpUIClMQ4oMvobA43P2KBr5+5zF/WQMuxNtei1jD
	 Z+a4Ee5oAep8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4564B610AF;
	Tue,  3 Mar 2026 08:13:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 094291EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C00404EC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79celPSc_YXy for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 08:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71FCB400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71FCB400B3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71FCB400B3
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso57087705e9.0
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 00:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525604; x=1773130404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOf8AuOe9jWmeCemi512taPIgkCVMaZ0eQBSAj429IY=;
 b=k/fTj4UWpirVzWzhPbfBtgoM/vgYdUutbkNGTqxDDvRbu8k5feC1bfWvb465f91lDz
 hO/bvoCkqR5ClTZq4+TndPaivPwW6kcFKYi7YU/+e0gS9gWoazStTJFPKgwPFq/XCvBp
 oCAj14oCm4BKb+aO6jsngKtVKAP+yk78jBHOTQw3H93ayUQ8n8Eps/dTWGLZLWZSp9qz
 2dRnNMDuCRC2nka3CyS45YnqD2BWqZ/YAFFFsNbgd3C9p1SGrRV84UqvLqXCtYxe/PjZ
 0YUkEqzQEu2frcaYuA0g2PUioKyYTVcIc1tbELrmYaggX/0tTAq5oVzV6z40nJUVeH+D
 7vRA==
X-Gm-Message-State: AOJu0YxIYpwW9fFrUN4fLNCygoH3Syf5ZM1xiYPRrdIsxBqrwSpIuOkJ
 vyBuKs1k/d2HQ22VggvbyJq1SGhBebJleJXoI3cLt3z+HUlr1OBPOyLr8dRig/h5lEKNqUacgA9
 4ypPk
X-Gm-Gg: ATEYQzxPaEuVUMf7G24JhluOlxblMt8RFuHLxCx+e2RFbXRvphJjY/M/tRzy9fXstML
 ehzLVCvMyFp+6uX5aniBX9sRJZ1XyV7EsWHYy5QHJb3nQO4dz/z7X74uMZSeoFOcBadKa46j2Yp
 ePn2+WbEMDooHjZUiqCxoGMk3M008gwkGPFWVeyf4mfbQ4r+XOZxLFdqqASzbmrSbSu7JkUvHZm
 oS9klo/0RCzYEOVHgsGKQrMYMp0kkf828w4tPaj5brrpQr7QTsC1ELHWfPd9DkXmOe+vWaMjh0m
 xTbDNyo+PWRNOFThHAQaVWziNMAqLINvfrNdVYfpIQ4qZ9WBXfHSygJSdiw3vPE82na4A7WyEFI
 7+4+kFp5pjBijc3iKfilBhM/pvo2gN505pGCbog1zN5ayy1ZJUsss+h0ZpYuQeGLs2I0xJMXEN9
 c8FXfZTTLdumbXF6I=
X-Received: by 2002:a05:600c:3b18:b0:483:7432:a761 with SMTP id
 5b1f17b1804b1-483c9bc558bmr253895495e9.24.1772525604437; 
 Tue, 03 Mar 2026 00:13:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d8870sm9242235e9.32.2026.03.03.00.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:13:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  3 Mar 2026 09:13:20 +0100
Message-ID: <20260303081323.53405-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772525604; x=1773130404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WOf8AuOe9jWmeCemi512taPIgkCVMaZ0eQBSAj429IY=;
 b=RbAf/8MCgQl6FaOfUc69ubEtJMqeyM3OlVft/nlbeQiFpxN0EVeG1BDc03iwv6trFq
 Ab14XvxmYhfY0QC38QO2zNhTOQJXGchRB7QtPhNplhyh20qIdQ0eMVY6LnHrGW1HuYBb
 T4H9leEH+NFp3+hj3yu8NEJcfggocHzJuAGnwfbkH9zRfAQRK3lNSImz+MmdT6LZffSS
 gP38zDRFJWgkfxIPqhysRVkAtTQwmyHlQg5BmehfivT3fmXpfE3NHA+1oACx12+I3M17
 Cbao1BoSsUXoxmC/FqvQvGtTTbKKyDwRW2dd0mHPrKkcWweiEd53cLFSntdYsF0uIFFw
 BRHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RbAf/8MC
Subject: [Buildroot] [PATCH 1/4] package/graphicsmagick: add CVE-2008-6621
 to IGNORE_CVES
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

This vulnerability match on every version of graphicsmagick. Since it's
really old it's unlikely it will be updated and is thus added to
IGNORE_CVES. See [1].

[1] https://nvd.nist.gov//vuln/detail/CVE-2008-6621

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/graphicsmagick/graphicsmagick.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 4b9f3bd23c..40107b3aae 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -11,6 +11,10 @@ GRAPHICSMAGICK_LICENSE = MIT
 GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 
+# Wrong NVD annotations
+# Fixed in version 1.2.3
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
