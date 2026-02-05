Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F83ECD992
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CE76080E;
	Thu,  5 Feb 2026 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iX9bJpn1a7L5; Thu,  5 Feb 2026 19:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1782E60B5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770318260;
	bh=JDdogy6l9pjQgMWoFKpGcrFB0sm5RQKwdfJB9NnkRDI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sYOpwypNlW0b/RXOixbJB7IiV6mxsfs9U9Inpmb8By4tJ27Iuls1zMR/XXBz/oUAe
	 hVwcJmHFp43GqguAAdj/OWOpyULH2vdJNS2DnDiCd8pVUKfrqd7eV8M66iVVnRPfgn
	 QVA1N/nqDxmV5MAg+xgj7W8yeoqvYyzuNgy/w59WduqHbA2ptmGIKcQl5sF2xtR4JQ
	 5ziQGB/lXHPzwR98e4D6CIQ2te4paYaXHTcv0G4y/xIHo+6aT4jtGy2l/e99zek1da
	 qwTjgBTXagOrtkWaKu3k7psrOsvXE3hzbB2uCDynVGPgHcPFya+MgC08PYyS5Qmivv
	 zdVXpZO1ufw0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1782E60B5F;
	Thu,  5 Feb 2026 19:04:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1B117A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1BB84038
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5aKWxFRI5Tn for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7C7E84049
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C7E84049
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7C7E84049
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:04:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so192632966b.0
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 11:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770318254; x=1770923054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HB5tX680wiXGExXubtwTrQfuIvJ+tfSZYxnE11AL0ms=;
 b=VKCmS4MmkBS5SpLOq49Bkt0g3B+aLNOP+RkNRlz+6Y1wne1lMq8739IN3KAC/Xx+dc
 t9RJ3q/fZO5rTJaL5R+iPLs2hGzb1HLFClEEFMyEFm6zyzjtOafGSPM/qlNjJDdvIwvw
 fFb7K323Gxkmjz/iyBU0Lyc7zzvh6lEu+jI89/QYCe8F4dLPDVBO5e1sj3TsRKMnWRYJ
 Vv3cNCYdT47oDwOscF1ifYYjvrShFM9WGp6CLHlAMhNMH6qutTnuNS36Cc109tHQS34W
 K1MLtTUasB7riCPsvpJWk234aAqa1jWffvqpr3GIBFlBZx9JL0wwLPfUQ/otPL/pTTYY
 ltPQ==
X-Gm-Message-State: AOJu0Ywqpnq8v5AC1PnYdHu1wjfFb+riCbCwYkhz5kZZRyPrHI6zP+gD
 m2w2rV+DWD6/POFQUkGvEcEOTYkGYC5haNbsEO0/eCx2mWveVUSU/10wc43h2JPlT22Pkz7O4U0
 dK0FP
X-Gm-Gg: AZuq6aLgMNrHcbUnwhN0Ikk8Y4pqmcYwKFhEjLsfV7/tJlYC/nE9QuLqziHIJkpx+36
 /S+gPmkaqEE/tYKGsFfz1JuZhz3RGcWUIWzi86Lu6/bO2Wzg7HR/FeWileG5/jX+FvWLE000wAw
 afl7Nc8tdGkB0mxnKzLWldEXarX1sp4CB/00qhqQXvg0W2AsEectGuAf6vsN3C0fwzSQmZeR138
 ccf3rrqGRo2M7turf1Uk4XTOZEOfMQ0TBoYdPddRRwUW79dxg6fFdhzQNRq2QIlKwbzGmbbCtoc
 xo51miP543XVaX6AChK2GRp3HC8jw+oYSNNvaIkiGHvGJw8b6UOH9qlcVmIET4lzrNGZdISChau
 K4ovIgtrmg8QR2iJdYQSllMMdBTEoGg15d3ZQ/JRLj4n80RDrfKjj0bqfQhuObCOS7X37V3eox8
 zvI/Nj/h6yubQ=
X-Received: by 2002:a17:906:f582:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b8eded6565fmr4161666b.0.1770318253658; 
 Thu, 05 Feb 2026 11:04:13 -0800 (PST)
Received: from mindpad ([2a02:a020:3cd:38cd:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edae32664sm10103666b.58.2026.02.05.11.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 11:04:13 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu,  5 Feb 2026 20:04:10 +0100
Message-ID: <20260205190410.523140-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770318254; x=1770923054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HB5tX680wiXGExXubtwTrQfuIvJ+tfSZYxnE11AL0ms=;
 b=QpolOMcLjMFej7cdLRNfrV66OEjlY7wRVnlYw4KGPOfaAAykUeC1AyKPEI7fZkuV1p
 HW9ynU+7XXYlG4OrSlstVE2H/n6G7LzewfHlvEsBmm8/n/p3kC26MfE/70TeEp0Jl/03
 /jaG6McqSHKFNSbtYj7pI7fJRXSjuKNypQnPjPue4dgjVbSSspfDicqdxFzYcs31be+t
 TKz6jTAoUZkRGDOz1PK09mHggp5QnPn/MDprnv3NAXlr1GkPpUmThLlyzPc6krQ0Zsg6
 BA4pxn6bbxK5ss5gIBFzdVjWJ4qwIhWCT2BUE0TLgCEKHabLvm51NZXdmBLig2Z/bcwS
 t5gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QpolOMcL
Subject: [Buildroot] [PATCH 1/1] package/strongswan: fix patch header
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

Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
security patches neeed to reference the vulnerability with the `CVE: `
trailer in the patch header.

[1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
[2] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
index 8442cc7816..7442c123c4 100644
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
@@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
 overflow and causes the daemon to get aborted immediately instead.
 
 Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-Fixes: CVE-2025-62291
+CVE: CVE-2025-62291
 Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
 Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
