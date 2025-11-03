Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35254CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F16E2406D6;
	Mon,  3 Nov 2025 21:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiKyEhaDBflz; Mon,  3 Nov 2025 21:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F305406E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F305406E5;
	Mon,  3 Nov 2025 21:11:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA2A942
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 133F681100
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RobDuo8vfSCW for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2411481101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2411481101
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2411481101
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4710683a644so38566915e9.0
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204309; x=1762809109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtr1yESyZxCe9sn8L/8dQl/KkbDfusZ7M7VsQQNHFGQ=;
 b=E9/ECA9mPDLNYbecqgquImltP0p1dZK7ScevgjRM2kXBLU0dVobqppSStsgnHHem0T
 XmS+ZnF7BXpEIe508zLMumXTincA0XdkbD70mv4aP3PPaT1hfCB6f0a+z6VSN+0D/Nsn
 Foh4K3TQx4N/0vwbkGDuQKuTeceZFZRg4p7rB+ShI8uPE8xhMPpXNxtkNhCc21p1KMNH
 CeuVnN5ynbnmjp7zkHKN1xu4gZJy5s1h/HiA4wrQs8A456ndZA9o3soMnqtlOAxDBz94
 T+kI6nCpPa2tTkH7+snC+/8hvse1nh22zylXdXftoPY7/b6APRezaWJLXfz+4xQ6BrB/
 h8Lw==
X-Gm-Message-State: AOJu0YwE6299qv6gfbO1yCo0bMi2H9u35D2ze0Br3DiwE0CCjqjwbdq6
 07DHJ+BciGFXzWcyLlcF5Ii/NYVGQvmKTnBsm1FDnbOBiNGgl7sVUiAMzou8frV/QE7NeYZv/Rq
 jHzu5
X-Gm-Gg: ASbGncsL7EamweraXG9xuw0VV8ypj6c9xkqvZBOHn2wDwxYftixgZpVkMk44lhyp369
 3vYZkyfR5ecxvChiCl4rGhl9lJdSt6B4aGHje5DVCBt3FcBneM3dsbyxQ9jc9KEgqQp8y6Ec24x
 9LzRYFmAxxkEMBGLz/QyM+QpAAFIdKbzMb2uvFbrGJ8FCJlZSgxsCF619VIBqvM3DC+Nmt7H2rS
 IilKlIts3Hd1w4hV+0ir2DltH7kh7kdJc5M6TxgYJfPLR0iqZ6FNEKUQQFb6RfFLSVAOLePMZUJ
 AYVCUT4lgGrhANJE7en5ajozNUIk6ruTCRUh8J4YzcX8YBu0Syq6Jr1BiPTPc2uJvE6AADSSDIp
 DwzeNSKNhdUrfCpA5BSwxgYJ5OwWvaA79QZt3BYzk+cR+J/bSFqTrejDEZXlSphcT1vzQapsVHO
 faWV4eU1CBynPVkWIuGN6PGBnxU+JTR8lCUFDY
X-Google-Smtp-Source: AGHT+IEMHB5jw669wLl8V/Y2YuqnY7yPLOhbs8rYYoxqGCNSa9ZzhxE7xI2NtwFJISDHG1y2PRBGwQ==
X-Received: by 2002:a05:600d:8261:b0:475:da17:a98b with SMTP id
 5b1f17b1804b1-47754c49575mr5480765e9.13.1762204308958; 
 Mon, 03 Nov 2025 13:11:48 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:43 +0100
Message-ID: <20251103211146.57344-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204309; x=1762809109; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtr1yESyZxCe9sn8L/8dQl/KkbDfusZ7M7VsQQNHFGQ=;
 b=dYPWCSW3gthi9DQkLEgbcbC5vXRZ8cuufgfu62a5XOIxguNXSc7vWM+U5xppTDEork
 UvKUsa95NZHfy9euEmPZylASuhK4Boi3p1sJSTGEFczY5nd210XnkuqQXrYPT0uJ3hz7
 76gFoS+TZ+dvPJfBIbz6av08Hd737xX7WpvgA8Lq+0YM8paN2N7f1h60YjLvGFz/71wz
 U4XjddoHxD8Wt33MQl7sdqdM1zdwvFfOCehq9t7SRU3hFJPjJk/bt+xOcOnCCmtwQi1U
 hUtEjL8q8+wUi2pFLp9j1oPzAfdsmsN0MfPqngeFU1jmrmDLyxaZyWrqlkB5aVUmpr+U
 4wXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dYPWCSW3
Subject: [Buildroot] [PATCH 3/6] package/pkg-generic.mk: Set
 <pkg>_CPE_ID_UPDATE to NA by default
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

The commit [1] set the default value of '<pkg>_CPE_ID_UPDATE' to not use
a wildcard by default. But instead of setting the value to '-' it set it
to an empty value instead.

According to document [2] section 6.1.2.1.1 the 'Not Attributed' value
bind to an hyphen ('-') and the blank statement bind to the 'Any' ('*').

Because the CPE matching function was incorrect using a blank statement
worked to remove the false positives but this is not correct according
to the CPE documentation.

[1] 53a8616460 package/pkg-generic.mk: use more sensible default value for <pkg>_CPE_ID_UPDATE
[2] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf

Fixes: 53a8616460e5730abe703ca5a46bae0039d548aa.
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cf55101265..0a1e29a04e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -727,6 +727,8 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  ifndef $(2)_CPE_ID_UPDATE
   ifdef $(3)_CPE_ID_UPDATE
    $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
+  else
+   $(2)_CPE_ID_UPDATE = -
   endif
  endif
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
