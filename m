Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED397C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A4041BD5;
	Tue,  5 Aug 2025 15:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ed6O-5dl8Czg; Tue,  5 Aug 2025 15:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0A9F41B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A9F41B8A;
	Tue,  5 Aug 2025 15:18:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A303C12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85764401CB
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEoHrVnw3rDn for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CB3C4026D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CB3C4026D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CB3C4026D
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459e1338565so10080975e9.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407100; x=1755011900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rILU5yuZVmDjSnPNNoZSle0C13L39C3G5U0kaSyHfFY=;
 b=M0BBtuF02BwwAS5BlkrZIfP5FtCJ1DfVL+mB53CQ12eXYU5aerKv8CGi1H1dqOgf9e
 LzApgjoGL0XFcPq3tFMyOJkeqPFuAa+qQcoR6ecW+WSBFsd5DYbcwdt7luMbzjmueGel
 sbAs61CauShWnSvWjwh4ZcHeI1mxOplxnNtrrE/7y4p81EX8Eoo/wa0jL4eU3DyrTlTb
 wMmUZ8zwVd+kOdnRNgI+Otym1fTbJ3TpvYsza08vO0rDDWplr0FnJ013fBFQn2CJriPC
 r525x9ByCsp7TSX0BAIqDFqP1OBoezWzUtOckOPcSSLvRVynSXR9uCOh7RlrggcOxGRD
 D/Rg==
X-Gm-Message-State: AOJu0Yx/xrXwQ2WweS7KKS3yJ+LRnQ4wlr7FL4i00Y6Pf/cXBsqOgUpQ
 us9XHm+0hyQHEwL07/WBZ5LUb172MrtnUgNxxuhcn4jeKuMF7Y8+jFPXJNJWoJTR0IFCJaaNaeF
 UxoJ+
X-Gm-Gg: ASbGncv+iKxW6EM6KRKF07nKRZ/hAck3x81ge45EL/gSgPPsxNllb31cJVQCkXSDESF
 9zPPBzl8Zp+c9LEfNgnOxlex4a0kx6MJsaIs4dx0HNylN0jKM5ETgy5n76dTSyN47//b6Jhr3fC
 eXu88wdwMEVI9dp6ndGRm+fLcvUK7PrClfzqcQdntS4Mmm9CWlMfTpD+tsdNSQsMLD92IQkSPMi
 GZ1BxHxaPznOzddU14yAj9pnwbafA8iU9YSB1e/AQxj7SA+mqkECj+ZXbdRdA3v8FalJllV2bR7
 Hkei5ioqCa7e8g2zieA13w3GHoujW0T6Pk7y6UHF9NlMaoettQKAv9IfIN6BpFe2LZCSzqj4qi/
 QICM7+dCHgp6HGUinBOf5IbZmvU2fcFh9Eg==
X-Google-Smtp-Source: AGHT+IHcVSS62dNugalwB/Tn/XjQCnmIk8wbLhEqmsq4fY1X3H6eM1CP1TVEtnTaPfBnH2mTAfS3JQ==
X-Received: by 2002:a05:600c:354e:b0:453:6ca:16b1 with SMTP id
 5b1f17b1804b1-458b6b47baemr110598835e9.26.1754407099746; 
 Tue, 05 Aug 2025 08:18:19 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c40e9bsm2352795e9.7.2025.08.05.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E95685F898;
 Tue, 05 Aug 2025 16:18:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:05 +0100
Message-ID: <20250805151814.1114414-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407100; x=1755011900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rILU5yuZVmDjSnPNNoZSle0C13L39C3G5U0kaSyHfFY=;
 b=UX5nFTShD9gbNOVbiqgfm3NqIgoNfnS1iAwrNvi3nHoSHJwldsUlGgOG5BBFvGqh6i
 REOVdKAy4vgrokZ4UM4Rm5d/dpYrWIf2QmSGpkWlIyturfLIbx4+LEbJbvL1nwjAG3e7
 ie1lmsM3rxQfFr2YxKgMvQtjsh2LbK7WCnqlkl4JRKwRvJN/jWpZPQpcBFjVOtFixeJU
 Aa2sX//DIaHxQ0fgNjH3N8QkSvBTqQMTosMa8ZFbCuTKSoHhrr0sw30cl4B9FFCpSP2m
 Hc8yui3GaDaeLZ+iyh11H+LklyfmlG3x/FHLCHeWMdbk3wiu5hu198WBEPGN5Tj8FZU+
 R88A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=UX5nFTSh
Subject: [Buildroot] [PATCH v4 3/9] package/kvm-unit-tests: update
 dependencies
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

VG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQsIGdldGNvbmYg
YW5kIG5tYXAtbmNhdApzbyB1cGRhdGUgdGhlIHNlbGVjdC9kZXBlbmRzIGZvciB0aGVtLiBBcyB3
ZSBuZWVkIGF0IGxlYXN0IEdDQyA4IHdlCmNhbiBkcm9wIHRoZSBzcGVjaWZpYyByZXF1aXJlbWVu
dCBmb3Igb2xkIHg4Ni02NCB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2MgogIC0gcmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMg
d2UgbmVlZCBhdCBsZWFzdCA4IGFueXdheQogIC0gc2VsZWN0IFFFTVUgYW5kIG90aGVyIHJ1bnRp
bWUgZGVwcwogIC0gbWVudGlvbiB0aGUgcnVudGltZSBkZXBzCiAgLSBhZGQgc3VwcG9ydCBmb3Ig
Z2V0Y29uZiBmcm9tIGV4dGVybmFsIHRvb2xjaGFpbgogIC0gdXBkYXRlIGNvbW1lbnQgZmFsbGJh
Y2sKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDI0ICsrKysrKysrKysr
KysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgppbmRleCA3NTM4MzYxZGY0Li5iODlmMDEz
ZjJhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgorKysgYi9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgpAQCAtMTUsMTIgKzE1LDE5IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCiAKIGNvbmZpZyBCUjJf
UEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCWJvb2wgImt2bS11bml0LXRlc3RzIgotCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwotCSMgb24gaTM4NiBh
bmQgeDg2LTY0LCBfX2J1aWx0aW5fcmVhY2hhYmxlIGlzIHVzZWQsIHNvIHdlIG5lZWQKLQkjIGdj
YyA0LjUgYXQgbGVhc3QuIG9uIGkzODYsIHdlIHVzZSB0aGUgdGFyZ2V0IGdjYywgd2hpbGUgb24K
LQkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2NjIChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMp
Ci0JZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2
CiAJZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2XzY0IiB8fCAhQlIyX3g4Nl82NAorCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUworCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCAjIHFlbXUKKwlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKKwlkZXBlbmRzIG9uIChCUjJfUEFD
S0FHRV9HTElCQ19VVElMUyB8fCBcCisJCSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJTFMgfHwg
XAorCQkgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGlt
ZSBnZXRjb25mCisJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUKKwlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBxZW11LXN5c3RlbS0kQVJDSAorCXNlbGVjdCBCUjJf
UEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1lb3V0CisJc2VsZWN0IEJSMl9QQUNL
QUdFX0JBU0ggIyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTk1BUF9OQ0FUICMgcnVudGltZSBmb3IgbmNhdAogCXNlbGVjdCBCUjJfSE9TVEFS
Q0hfTkVFRFNfSUEzMl9DT01QSUxFUiBpZiBCUjJfeDg2XzY0CiAJaGVscAogCSAga3ZtLXVuaXQt
dGVzdHMgaXMgYSBwcm9qZWN0IGFzIG9sZCBhcyBLVk0uIEFzIGl0cyBuYW1lCkBAIC00MCw2ICs0
Nyw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwogCiAJICBodHRwOi8vd3d3
LmxpbnV4LWt2bS5vcmcvcGFnZS9LVk0tdW5pdC10ZXN0cwogCi1jb21tZW50ICJrdm0tdW5pdC10
ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNC41IgorY29tbWVudCAia3ZtLXVuaXQt
dGVzdHMgbmVlZHMgYSB0b29sY2hhaW4gdy8gdXRpbHMgYW5kIGdjYyA+PSA4IgogCWRlcGVuZHMg
b24gQlIyX2kzODYKLQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUK
KwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84CisJZGVwZW5kcyBvbiAh
KEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IFwKKwkJQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxT
IHx8IFwKKwkJQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpCi0tIAoyLjQ3
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
