Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22177C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C669360593;
	Thu,  8 Aug 2024 16:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3S2-QvDQJqo; Thu,  8 Aug 2024 16:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8EC060ACB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8EC060ACB;
	Thu,  8 Aug 2024 16:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 040CC1BF28E
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B4360593
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yb3PyGG9tZRW for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:09:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F92B60AD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F92B60AD5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F92B60AD5
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:09:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso7794345e9.1
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 09:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723133365; x=1723738165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2QddF77mm9FfIgYgFQTPOZIDy7RydTha4J+fvNTaso=;
 b=ovPM1mOD0SpzL4018jElZLO65Xv3HDl5k/K8nnUOJ1Q8RpuIIq+xPONDS9GM7gAwV8
 0RljcwZzN1qzOUpByu/W48a2MbQ75BwN0eA/U8iMHmJ5CqDm0lU+fA76ex7kKEUg8xUc
 C36Z8BYf209FKq14ODtdkZtWIvpJVd01RvFz0wTCkVnm/2o03HMUSap7/wSaj0itAO5L
 iWSQM90p8Pr0cneedItxc0qiH56Dkg0gumACCYPj4DIzjHaHa9eCkpUZ63CCODd4H5iY
 flGkPw5nO+tjStcxV3Hj/BESj+USfAqx2BFIrtFqByFSvbm/nA+U6b8nNruG+TuR3G8y
 xryA==
X-Gm-Message-State: AOJu0YzwcoUWysDqlYD6Kd++6golFA3olgnp1I1SaD+1l5RDop/xoqGs
 /6sLP/XvkJrdOxO1rKvy4Y1rA965GBnDaqbwzmU3rB7E4xmKsRfaoNZQEs1P
X-Google-Smtp-Source: AGHT+IEzvb3ekfYusfNTeDHIWVfH0FBEBWo+PxiQmNWOTpPQhjNMdzP0W8gmSI6nzmFiZZvnnV/VXA==
X-Received: by 2002:a05:600c:5493:b0:428:16a0:1c3d with SMTP id
 5b1f17b1804b1-4290aec8fdamr18330915e9.19.1723133364829; 
 Thu, 08 Aug 2024 09:09:24 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([78.30.23.54])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059cbea0sm81835855e9.43.2024.08.08.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 09:09:24 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 18:06:10 +0200
Message-ID: <20240808160606.60188-6-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807120619.66304f2e@windsurf>
References: <20240807120619.66304f2e@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723133365; x=1723738165; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2QddF77mm9FfIgYgFQTPOZIDy7RydTha4J+fvNTaso=;
 b=D4wWyQIqWmpYw/VsDZs4UNRrtlBcZ6KU+TpYbZiiNAySQ8KYszqW9xqLvxT3LTAqo5
 6rS19c+ZBhhLDgixL80jZSE3SGm3KdzNRmX9gRMVsDr/l0SYu70cYUJTANzZ9H7MhRjF
 Z9ah1y7/CrZKb4Snrp678bPLDJ2WY8WNnXzm+JasPQsZvqJ3+JNAaCVEDN5z9G/8eec/
 v/x44zpn2Yvg7z2Av6rGxSXFZth5JaZd6sDGd34U6Yholo4MGTKav8YVQfh/6hr6xC97
 64dIIOrgT+nknmgB4bNP9BZ2W91EcemRlLxGXnvmd2SWflQP3XFaVn4rr6z3Qc3TFs24
 9sCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D4wWyQIq
Subject: [Buildroot] [PATCH v3 2/2] package/zfs: bump version to 2.2.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCAyICstCiBwYWNrYWdlL3pm
cy96ZnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96
ZnMvemZzLmhhc2gKaW5kZXggOWM4ZDRjZWM4NS4uOTU5OGFlZDk5MiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS96ZnMvemZzLmhhc2gKKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1
IEBACiAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25s
b2FkL3pmcy0yLjIuNC96ZnMtMi4yLjQuc2hhMjU2LmFzYwotc2hhMjU2ICA5NzkwOTA1Zjc2ODNk
NDE3NTk0MThlMWVmMzQzMjgyOGMzMTExNjY1NGZmMDQwZTkxMzU2ZmYxYzIxYzMxZWMwICB6ZnMt
Mi4yLjQudGFyLmd6CitzaGEyNTYgIDIzODhjZjZmMjljZDc1ZTg3ZDZkMDVlNDg1OGEwOWQ0MTlj
NGY4ODNhNjU4ZDUxZWY1Nzc5NjEyMWNkMDg4OTcgIHpmcy0yLjIuNS50YXIuZ3oKIAogIyBIYXNo
IGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3
ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggZTUxYWRlNTVh
NC4uNTQ5Zjg2NDFiOSAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2th
Z2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLVpGU19WRVJTSU9OID0gMi4yLjQKK1pGU19WRVJTSU9OID0gMi4yLjUKIFpGU19TSVRFID0g
aHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpG
U19WRVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERM
Ci0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
