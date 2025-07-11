Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40C2C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 16:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D31540F9B;
	Fri, 11 Jul 2025 16:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qZr0hRXaUQCs; Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34709410D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34709410D6;
	Fri, 11 Jul 2025 16:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C95114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 184A583BF5
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuK2Yf9_keyP for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33ECC83BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33ECC83BFC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33ECC83BFC
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 16:44:13 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so1994969f8f.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 09:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752252250; x=1752857050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOWwB/ryinsQPSiEImaPAZI4QluJL5CNTE4aHnBsWgI=;
 b=rKxRM5Y35LYWUioS0QTERrUTSQowCZCUbXXkgA20DkEjZJDM86LXQjG4j4Mfxb6vah
 V3GzqJyn8TK4bRxm5hyd9PjGHI4OjjEgWjtJeVX7XXsK7NCKV3ufGudtlurOLXDfmnLZ
 iXhsp3adkgdpgUlNAK6/zjuCzHdG/5yQDdOCObWNhFmTxYUOQKFXYEX6PFm+Lzwynq4D
 BozD2p71NnuOgXFi7bejm9bdcvKG91kfPWCPMCkT91bPwJceQ81MmK0hT3b9muNgOJgF
 ImD74WKX6ClhAQDzszYDKDLVhdih6gJD7AlDCCLjayejzMA7yDiRWuywQpwE2ei4yI7T
 ucqQ==
X-Gm-Message-State: AOJu0YxHyWKFFOUamzks2Kn3C9NMTes5ONaXwwaPUbe6blWJBt8xWogE
 g2yleUuvxX1I+IOHTRr2/Z7aTXcI2FZKrGbiN+tdSzQGD/HRw4S9siSWlP2GCGuvxwEGNHwOWGn
 zKVDzd3s=
X-Gm-Gg: ASbGncti1z0BadyKHcCa9G71mUdQUl7k5LsvuNysFvb56mSCZpW6tTiqgI1IZc8QUr2
 hHvq1BVed9U1lwm628SvgISOPTM6o6mK2uOFfY5PG0jPKySxeRgyfJeMERKZyrvCz8bz8GyRJAB
 fuZoGi1IKLG9wBYqrdd8rB+QXTOrCHpmd6MUBF0mRGvCNZwx7EXrgganc3jYnWUUsKukeBXCLra
 OYkL7+jYVopBmy9UqpMgLS90MLN/L1RdIysLJsUmVhl8lit5kxABHiQr2SKN2aU1Z/zhAr8YHAi
 zoY+nSc38lW4YZZ5/STphwlyFwa7nkpJFGDMWWwLZUEO++tW24eM71EzW7yvNATPzXCoiWSFp54
 IP6T/5j75Kbk5F/WJtY7Nt60=
X-Google-Smtp-Source: AGHT+IGHwqKvAfEK8Aq2s/a7EFTGhZ9lcBRj84PzM9DwZA0/4JxXOGTPGLQ0eZcxVwwaTh70kwAMHQ==
X-Received: by 2002:a5d:584d:0:b0:3b3:9cc4:4bc0 with SMTP id
 ffacd0b85a97d-3b5f2e1bab9mr2922002f8f.32.1752252250350; 
 Fri, 11 Jul 2025 09:44:10 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb549absm88624355e9.1.2025.07.11.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 09:44:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B89E15F87D;
 Fri, 11 Jul 2025 17:44:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 17:44:00 +0100
Message-ID: <20250711164407.799041-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711164407.799041-1-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752252250; x=1752857050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOWwB/ryinsQPSiEImaPAZI4QluJL5CNTE4aHnBsWgI=;
 b=lE4UHZYs2m6ZPWFNYJVl6B2gG4k9j++Kpo5Fo4OXfPM9Xilqn8lJg58Oj/lUqcyIge
 HwqX9eoJcCVHlTGbGYhaevCvT9wvehTijK9o75DPlwC6X7EsnKzgTtGt1t7CvbkV2RUH
 T1yovNLPAHEjqXe/KWvv+O/aPyeFw90wMBsUVlEgVbdzke7KoIDr3+4RQYnqbLqfMATv
 f28veHrWfeTu8QiBNb9/t6xL7R+6FH4SmItoaPlyBKGu+dLksdprlHUlxit6xoqJDt8p
 Ll5ll9i0wFu+2HmyMWArd0gwRGA+fIg89teBwOMv6WaU6XSjyeRO3Oh+/CBZL8kPkURv
 mcsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=lE4UHZYs
Subject: [Buildroot] [RFC PATCH v2 2/7] package/kvm-unit-tests: assume
 AArch64 supports KVM
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWx0aG91Z2ggaXQgaXMgcG9zc2libGUgdG8gY29uZmlndXJlIGFuIEFBcmNoNjQgQ1BVIHdpdGhv
dXQgc3VwcG9ydApmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2
ZSBzdXBwb3J0ZWQKdmlydHVhbGlzYXRpb24gZnJvbSB0aGUgc3RhcnQuCgpJZiB3ZSByZWFsbHkg
d2FudGVkIHRvIGJlIHN0cmljdCB3ZSBjb3VsZCBibGFja2xpc3Qga25vd24gbm9uLUVMMiBDUFVz
CmJ1dCBBRkFJQ1QgYWxsIHRoZSBjdXJyZW50IG9uZXMgaW4gdGhlIGNvbmZpZyBoYXZlIEVMMi4K
Ckkgc2hvdWxkIGFsc28gbm90ZSBLVk0gb24gQXJtIGlzIGRlcHJlY2F0ZWQgYW5kIHdhcyByZW1v
dmVkIGZyb20gdGhlCmtlcm5lbCBpbiB2Ni4xMC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2MgogIC0gbGVhdmUgQlIyX2NvcnRleF9h
NzYgYW5kIEJSMl9jb3J0ZXhfYTc2X2E1NSBpbiBwbGFjZSBhcyBjYW4gYmUKICB1c2VkIHdpdGgg
YXJtMzIKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDggKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL0NvbmZpZy5pbgppbmRleCAwMmVhOGRkNThjLi44N2IwNzVjNGI5IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL0NvbmZpZy5pbgpAQCAtMSwxMyArMSwxMyBAQAogY29uZmlnIEJSMl9QQUNLQUdFX0tW
TV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKIAlib29sCiAJIyBPbiBBUk0sIGl0IG5lZWRzIHZp
cnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgYW5kIGxpdHRsZSBlbmRpYW4gQ1BVcwotCWRlZmF1bHQg
eSBpZiAoQlIyX2FybSB8fCBCUjJfYWFyY2g2NCkgJiYgXAorCWRlZmF1bHQgeSBpZiBCUjJfYXJt
ICYmIFwKIAkJKEJSMl9jb3J0ZXhfYTcgfHwgQlIyX2NvcnRleF9hMTIgfHwgXAogCQlCUjJfY29y
dGV4X2ExNSB8fCBCUjJfY29ydGV4X2ExNV9hNyB8fCBcCiAJCUJSMl9jb3J0ZXhfYTE3IHx8IEJS
Ml9jb3J0ZXhfYTE3X2E3IHx8IFwKLQkJQlIyX2NvcnRleF9hNTUgfHwgQlIyX2NvcnRleF9hNzUg
fHwgXAotCQlCUjJfY29ydGV4X2E3NV9hNTUgfHwgQlIyX2NvcnRleF9hNzYgfHwgXAotCQlCUjJf
Y29ydGV4X2E3Nl9hNTUpCisJCUJSMl9jb3J0ZXhfYTc2IHx8IEJSMl9jb3J0ZXhfYTc2X2E1NSAp
CisJIyBGb3IgQUFyY2g2NCB3ZSBjYW4gYXNzdW1lIGFsbCB2OC4wKyBzdXBwb3J0IHZpcnR1YWxp
emF0aW9uCisJZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0CiAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2
IHx8IEJSMl94ODZfNjQKIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NCB8fCBCUjJfcG93ZXJw
YzY0bGUKIAlkZWZhdWx0IHkgaWYgQlIyX3MzOTB4Ci0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
