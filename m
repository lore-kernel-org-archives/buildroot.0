Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA762CD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715C6615E5;
	Fri,  8 May 2026 10:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6mpY3gm2fpd; Fri,  8 May 2026 10:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 686AE615BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778236352;
	bh=leZnHOXSdc2qwo5Kg2i0gNPHv+8+XuD1PzyNhw8jKT4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZix5EwCGTMF4F1huJRP5MHeHFIEq8ZN8ExQfQPj/5hfifqKQSNPzTuOeQLxVCbyY
	 1DDoTZQwpb37fzBCbc/aX3hpiLyiiodyvJsEQyaKQoqpuGSJISB5BMUnlTLyLAHXcm
	 bn0cobNz/8lIAukWwSSoQuQAfDxv6XWlVQBgwypyidv0hDFY1TlW9MtObCb0FQlblH
	 EEmCot6QLjdwL7dE7eeK/02UDkx7Cb2CA4VCnuz6R0XokMMyq690khmL+172RHzLqC
	 MTfuywLjk0jU2gdm1tx9rmp0QadxNtEmFo6qpJxRN+EpGniU7YdyiPi7cKYfJfeKd7
	 qul9h2UduWfsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 686AE615BD;
	Fri,  8 May 2026 10:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E32F0317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0D0440DF8
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJxl3dvF3zJU for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35D5C40582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D5C40582
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35D5C40582
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:30 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2bab2548e8bso8841555ad.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 03:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778236349; x=1778841149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vgVnn7jNEBM//La1HKvLewLNUivOvQ35hTaZMq6EAzU=;
 b=lGfiacizBN0L9yih4U+qJBOYXsFOMv1MIpNnyzK0t0EzGOJg8AZiYJ7tQ6Skl9pVIy
 7cefOvp7DsMmWC8EcYupeZtpGJDVyETFwlagUduBTwKxusEFrb8PJhTpu26Z8nPxQUHe
 nPoLXcDUedLRATD+jDHJ8W1yqIQt+arsGClRCkH44YUuzDG4sHNSS2x7yhiphrbJmS6r
 WNtCQ0cPkxQRlOpUkXI/MJSDasfNd6jFlF2z8m5DoPj16xl8VjOgO3345GMOCcau86hV
 7vRwgLEK/4OTfNnHD0RR1/SyvxnpgaYMoFVEG055bpIP55/zVpLbM4XA+h7JK1mwxrGQ
 YzuA==
X-Gm-Message-State: AOJu0YzKeYG9UsLMKtGGHsnd6dxFLlr9IJxXOFiNuEP3oA1ht+qkELjQ
 AfmeTdYd8lMfpNfPg50d9C+H+9g2MJEN89wgCB5CF4gvoCF3L5BKDFKLWdsWCbqh
X-Gm-Gg: Acq92OHrYOcf7nOMtzlzCwyNlb9nTHy81x6eCxSaTeRX8EjNd7lIhgL/5DpH3q4bhDN
 8eOidee+Rm5v26AH5sJ14Xmofa2GN4FGj5xJZpdy9HPljdfb8z+rB2wEGyKqVFfhccExRhxmjh5
 TX2o8HiWYLjSPezXOmIjAYrp13Cwap3rGI/lGWWA27HL4KLHEDLPWXUlQGrcEJNkUUcgLGMlTKG
 IyKXw4FhYQo4kHdOPz2qv6vB3yF0arc67SZEdCyrbPYcNQpbehDPK9X/ILeDDiBkhCi03ZBc+Ga
 MHlCcuP0BkfrAfjKJAjvZurAmwSqjEmztdiqyL8mHi2XIg8pcJ1gYb50fjNuLvbIvuw0/ivK/Jd
 tKesy4HQROOrZxqHELQ0dS7gZnEULu07KM5ikdrm3+nRBNkTobbSxjyuJnupWgQSStZ3gQ1c3PW
 NvrwppU+dbh15Vm/0twfgwXiOnzEkaKRrGdhaZ/M9LqYiP9OXo484amGJpm3iPRSPVmFYOPw==
X-Received: by 2002:a17:903:3bcc:b0:2ba:4e84:976 with SMTP id
 d9443c01a7336-2ba78f45b67mr118832485ad.13.1778236348893; 
 Fri, 08 May 2026 03:32:28 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:4064:4e33:456:d996:1796:c8f2:159c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eac3afsm18998145ad.71.2026.05.08.03.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 03:32:28 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 16:00:07 +0530
Message-ID: <20260508103009.463932-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
 <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778236349; x=1778841149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgVnn7jNEBM//La1HKvLewLNUivOvQ35hTaZMq6EAzU=;
 b=Cio1VKRw2x9RWSCplXHoRRGDJpEVbB985QT44Oran8V4xTo63s0Sr1S3QDsqRq2dC1
 hVZSdAwbUYFgmeDVqISjw4gZVxCGtth1CfAuhQqjtEhIfJHC7qaXxFnuGRIXXYjgLhAF
 uYoKTUIbnnLcLJnXK3lTGAlOisUqNfv0Muz0otvY0bKg+3qijOgdN3nEHi2v9QKzEMoF
 4kQDWfe/+u+tucSB7+o7gOo9uK5C/IyrXTGomtD9LlbCJcDYI+H6oDLibedaQzEkzfGL
 FRiCuaZLhFSFhvhwVyvkUrp3DpUxN6LCFXZ8meLPf0jmioTnpM1PZ9N0kyXmYKbrygFj
 Baxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Cio1VKRw
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: added Shubham Chakraborty
 for htop
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd973d7f86..ad3fdfc5a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3050,6 +3050,7 @@ F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
+F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
