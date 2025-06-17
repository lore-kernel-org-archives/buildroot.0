Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA03C7114A
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 07:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203EF81770;
	Tue, 17 Jun 2025 07:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tinoB_k3C04W; Tue, 17 Jun 2025 07:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610428174F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 610428174F;
	Tue, 17 Jun 2025 07:16:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC070151
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7EB46090B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pURDS3go_fez for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 07:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C2E660906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C2E660906
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C2E660906
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 07:16:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so4016485e9.1
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 00:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750144594; x=1750749394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkhJ4mWmM5theZTa4xoHkYDbyUnMuBHetAOiRQQO/zM=;
 b=J4LoUAlEvsK6WUZ2VeFplWZXBmr5bjRX3KDiojMuGC3fmKmcrtTIsU7KrjO242Ocif
 zrvYHcoq6j5kl9T4S7SIcrP+ZPF95GRjLWQXAPlN9sw3v2r64xYGR3PxAzmkp8tVA/Jr
 OZZIIpesIB/+JtZ9WoN0Azwd2xMT58q4fAS48UPhTGU5Y6sWWsivtq6t9xNpRC7pOzXx
 HKowRED27Gipk8UmB8tYEnexFGu2rkzA/g6OFV1gwZfyGuvKycZ/EYOpRuH1sIAw+myN
 zoyfpDtlU9h0jZQMSrf1Jc3w9eN1U7iceVIrJFzpYu/4i3czn1Nw/h0w9wPzFaQzzIO9
 J8UQ==
X-Gm-Message-State: AOJu0YxCv2jMFvfOmJLuk8dvR/XuPZl+kUHzX3Nbe1noIK2NfS7vxNjl
 xFBRhyepFV1AAV6AGUMyx0SKcXlzr32+ozlT75JnE5KL24JQ+YFp3nziP8HCavWzDHFnitcYGr7
 V4N2w
X-Gm-Gg: ASbGncvMJjGElOIIZ0hF3rjIU9yeYXtwTYW/5F/8niik96rZ+cK0t5VZ5dOqY/llCQU
 rGZH6UjAJqEMvcOlrqOTpayTrnU6+CZ4tFJUkvYdZ33twr4xzqzp4ojoKgDlglftWlCkstsyzBA
 RPpJbPwvVHovduvxPl/o4gO9haD1rEywPdXsWZ3ChVMG8Iy3gpy7eQKmdpkM+K909Y8ALwgESPb
 0kjahAZrWE/sH+5gOzm5ed6v/J6cSZFQgpogqZtUm5ZSTSzNh8d/rj8f4F3FGP4B5eUvCd9oMuy
 8GiqoQzXyH7j7YfXAVpCl/e+NAj5V3JLcslOT+bXtu1mTsJLNAJg34S16X0LW9leZdiy7xBs2Zh
 Tg/E/23WE4G421ZMZJ15pvil95ognQsxtHLQ8wZVdeUHn/nHr6gK1BoCP
X-Google-Smtp-Source: AGHT+IFlDKERYDgsfnPgKvYAoUHAbzsz+NMRGoHjl4ZohHBHmfaYXkhEihSnHhhzTlsLG+QmlG4LRA==
X-Received: by 2002:a05:600c:1797:b0:43c:f3e1:a729 with SMTP id
 5b1f17b1804b1-4533b27e8e6mr83734455e9.12.1750144594517; 
 Tue, 17 Jun 2025 00:16:34 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e261ebdsm171984305e9.39.2025.06.17.00.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 00:16:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: dalang@gmx.at, joseph.kogut@gmail.com, raphael.melotte@mind.be,
 romain.naour@gmail.com, valentinkorenblit@gmail.com,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 17 Jun 2025 09:16:12 +0200
Message-ID: <20250617071612.1043959-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501133002.1408454-1-raphael.melotte@mind.be>
References: <20250501133002.1408454-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750144594; x=1750749394; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkhJ4mWmM5theZTa4xoHkYDbyUnMuBHetAOiRQQO/zM=;
 b=q3uOiZDJWGNyuvyUTnjJTUlH4bbqeazMHIvWRthgq9miNJ4ELgNDhvYEqdxh6k1UFa
 1Ezfrx15sk0ZHRQ4dJfXN1rfOJsCtyeQ7kJ1yb2vrWJo2s19D4wljJOAHr4w74BkA7Sy
 Z5Bz5FO+yWYWC3Fp8RD2tbhcO/VIrVhSz7zrM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=q3uOiZDJ
Subject: [Buildroot] [PATCH v2 1/3] package/llvm-project: add support for
 clang python bindings
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Raphael, Hi all,

Tested-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

Following the LLVM project upgrade in Buildroot, "host-python3" is now
a permanent dependency of "clang". We only need to add:

"HOST_CLANG_CONF_OPTS += -DCLANG_PYTHON_BINDINGS_VERSIONS=$(PYTHON3_VERSION_MAJOR)"

To install the Python "libclang" bindings. There is no need for any
Python-related condition anymore.

I tested this with the latest LLVM version in Buildroot (20.1.7),
and the "cindex.py" file is correctly installed at:

"./host/lib/python3.13/site-packages/clang/cindex.py"

Also, after rebasing, I successfully ran "TestPythonPy3PyMuPDF".

Best regards,
El Mehdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
