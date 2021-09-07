Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A656FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:08:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D740F60238
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D740F60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710BF606FF;
	Tue,  7 Sep 2021 12:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oSVlxRPB8qo; Tue,  7 Sep 2021 12:08:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB4D36075B;
	Tue,  7 Sep 2021 12:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8561BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C14082AB6
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOJ6DOr3-pFp for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0174682A8F
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:08:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i6so13606365edu.1
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKVS214AqbAfSYEbP+2+5BqPGvAVU53c0dlkdr5zFiM=;
 b=aJFnKVQxGfLBpJHWkZAgl9cfxB+i2+YIB+a0nUqRJBGvTKe1r+jtcsF8OiCXPsNKb9
 hrzItRTdOUqZ77oREQ2fHAyULGrcmxOawBVMQ62wPAiLEi+uPpfZY88C1eGxt5/Ii7Bo
 0vyZYGWAgVGQGHNQmR58HEq4TCakdOQMF4Ol71b8Zct/0h+NCyYMI1iDKuxr64U5EjiJ
 luimea3A420qnBrsxHQ30gdTgNQ8fh5EXUDv1hjCwykYOJEyujv1UtUVIxyxN7NiVkzS
 /I8YhkDSJqJBU2JICT+F170RkS47rZoUgQZT45GD8NsgvgAVG90NbLXMkr8qoTGF899A
 Dj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKVS214AqbAfSYEbP+2+5BqPGvAVU53c0dlkdr5zFiM=;
 b=s18TxUddZrkv+QNeQNisMIN4Bp6Tb/q5J/oZc31ZCJYbTPgRW8SYMMdiSfkheD8Pnr
 Ht7SUP9yYE25HSGXRzDFVQmE3omd5CvdGth5eC6uIbO03IF8zQ/0z8tX+35OzmoXsTpB
 YD7SWfjxiHG9QU/59WDhlQ0MxvdUWKbL4WH8QodJGOWrDL6oj3XcUe5AOpms6t0poZiW
 AF8/92X2C4Yq+CjFs4ZF4kbB763L/DnG4EXsTvedaoatYpNAfO9K5VbJ8+LhCrdHRBjF
 /l7LpKCAzRbTThhu7ZWbRjNojAytlNB7nGPQ3v4nylesI6vLlHbPTBkHBquoI7fANOUA
 cxjQ==
X-Gm-Message-State: AOAM530IuC+oyOrGhbLYwgsSk4FjUSxVbtjBfPPevxlaaIUR/I8J6I/i
 FnFXJ+864+n7qb0r7IRpzb628F2lAF4etHgr
X-Google-Smtp-Source: ABdhPJzzbce7AyJAG9dgIx2Tr01MRSi/piuB6Mbg/o7DXPhNZafV6mtgTGy6/cXoJlqXKTq2zEtpsw==
X-Received: by 2002:a05:6402:791:: with SMTP id
 d17mr18036442edy.321.1631016499239; 
 Tue, 07 Sep 2021 05:08:19 -0700 (PDT)
Received: from debian-hp-1.home (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id s3sm5507327ejm.49.2021.09.07.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:08:18 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 14:07:47 +0200
Message-Id: <20210907120750.31432-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/2] package/mupdf: fix building on mips
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8sCgpUaGlzIHNlcmllcyBmaXhlcyBidWlsZGluZyB4c2VydmVyX3hvcmctc2VydmVyIGFu
ZCBtdXBkZiBvbiBtaXBzLgoKSXQgd2FzIHJ1bnRpbWUgdGVzdGVkIG9uIG1pcHM2NGVsIHVuZGVy
IHFlbXUgKHN0YXJ0aW5nIFgsIG11cGRmLXgxMQphbmQgbG9hZGluZyBhIHNhbXBsZSBQREYgZmls
ZSkuCgpJIHdhcyB1bmZvcnR1bmF0ZWx5IG5vdCBhYmxlIHRvIGRvIHRoZSBzYW1lIHJ1bnRpbWUg
dGVzdCBmb3IgYW55IG90aGVyCnBsYXRmb3JtIHlldC4KClBsZWFzZSBub3RlIHRoYXQgd2l0aCB0
aGlzIHNlcmllcyBidWlsZGluZyBtdXBkZiBvbiBtaXBzIHByb2R1Y2VzIHdhcm5pbmdzOgovaG9t
ZS9ybWUvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL21pcHM2NGVsLWJ1
aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1aWxkcm9vdC1s
aW51eC1nbnUvYmluL2xkOiBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoTm90b1NhbnNUYWlUaGFt
LVJlZ3VsYXIudHRmLm8pOiB3YXJuaW5nOiBsaW5raW5nIGFiaWNhbGxzIGZpbGVzIHdpdGggbm9u
LWFiaWNhbGxzIGZpbGVzCgpJJ20gbm90IHN1cmUgd2hhdCB0aGUgaW1wbGljYXRpb25zIGFyZSBm
b3IgbXVwZGYgdW5kZXIgbWlwcy4gRHVyaW5nCnRoZSBydW50aW1lIHRlc3QgYSBzYW1wbGUgUERG
IGZpbGUgd2FzIG5vbmV0aGVsZXNzIGRpc3BsYXllZApjb3JyZWN0bHksIHdoaWNoIGlzIHN0aWxs
IGJldHRlciB0aGFuIHRoZSBjdXJyZW50bHktZmFpbGluZyBidWlsZC4KCkFueSBjb21tZW50cyBv
ciBzdWdnZXN0aW9ucyBhcmUgb2YgY291cnNlIHdlbGNvbWUgOi0pCgpLaW5kIHJlZ2FyZHMsCgpS
YXBoYcOrbAoKUmFwaGHDq2wgTcOpbG90dGUgKDIpOgogIHBhY2thZ2UveDExcjcveHNlcnZlcl94
b3JnLXNlcnZlcjogZml4IGJ1aWxkaW5nIG9uIG1pcHMgd2l0aCBHQ0MxMAogIHBhY2thZ2UvbXVw
ZGY6IGZpeCBidWlsZGluZyB3aXRoIHNvbWUgdG9vbGNoYWlucwoKIC4uLi8wMDAxLXVzZS1nY2Mt
aW5zdGVhZC1vZi1vYmpjb3B5LnBhdGNoICAgICB8IDI5ICsrKysrKysrCiAuLi4tZGVmaW5lLWlu
Yi1vdXRiLWFuZC1mcmllbmRzLW9uLW1pcHMucGF0Y2ggfCA3MyArKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDEwMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9tdXBkZi8wMDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpjb3B5LnBhdGNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS94MTFyNy94c2VydmVyX3hvcmctc2VydmVyLzAwMDYtY29t
cGlsZXIuaC1kb24tdC1kZWZpbmUtaW5iLW91dGItYW5kLWZyaWVuZHMtb24tbWlwcy5wYXRjaAoK
LS0gCjIuMzIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
