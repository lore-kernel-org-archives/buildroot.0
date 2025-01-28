Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CCC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 10:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0356780D03;
	Tue, 28 Jan 2025 10:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJhZZd-6estC; Tue, 28 Jan 2025 10:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161B180E7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161B180E7E;
	Tue, 28 Jan 2025 10:01:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B5C1AF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5950540B8F
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy3xfp4gpO5K for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 10:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D23040B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D23040B3E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D23040B3E
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 10:01:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436230de7a3so8756955e9.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 02:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738058504; x=1738663304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sL6zcuaC0MsDb9DnYzxyZyOTl0wR8/CS9ICVP4rOnPI=;
 b=qvuKmMOZ2Krbol0uEf7JYbnixsJ8Uq+cJcbeS9oSJyxW58HgcO7Vd9FhOQkiaUhdLm
 OWOkruJIWgZYQNPR+2ZeJX7+4YyGuCdFVwXDShCqu7Am+saFPG5ZVt/fH7bgzvHnOGQh
 wBhqqOSUraTMky2XV6HSDN/FrUea0lkj2Jkb2ElDCSRyqsLMa7LmxNpFaY6PNik4h+c0
 0AXQrsHyaHSE4b0r1/NBBTRZBq7CsVmQv/wAm0VapGweP+zcvLyX9zE/5Y7iG9nb3TMG
 PFqrgj7BKem5oaw8TGKy7ETLklBDNqbcMTR12xrysL7qRgx6diccWX/UkbNG0qn1pMDF
 9Kbg==
X-Gm-Message-State: AOJu0YyoO2+kkLXk9ENDSZG3KVycaccQJPUWxDE+sOp2lVwcEw4WQFKs
 8b7pnw7j8jl9cshbUVHKBYKt0Bxei+FgOzPKaQqAnqlNTGbHrYsd6wEl7EN0
X-Gm-Gg: ASbGncuS3vzrchogod2sk1rad5taLduhCyGQRDWKZ7lPdKkpuHEOAlcB2nFTKDRwrBD
 5WZ70OGw/sbqnQ9BSriIcK4x73TuLXOogLQiAPBwp4xeyFi/+0GVs0Ta+sssPyZbzxtZfIg1ysd
 +ud0PmphxgFVUH67+lei0DTOnsA1wCTJJLhzXBgo37a4a+5GEPz0u0GWQ+1e0gsphk+dPcJTcWZ
 xUqCp65EdaQhgzrXUDvC+uqTB2kXMuDrWRktvPAP0P6Th8hHnDP3QMnvnrtdd7bK3hZYiobnjxl
 BH9KDLJItkO2dgVkkYv+I1ULjg==
X-Google-Smtp-Source: AGHT+IFjhj4dS3pH33gFM27XCo74sT5w96wEIWRnzQb/oWFJXghJbmnqSVKJ7OYaQQlD4r+7ZkvmRg==
X-Received: by 2002:a05:600c:5126:b0:42c:bb35:b6d0 with SMTP id
 5b1f17b1804b1-438913be3fdmr157345355e9.1.1738058504002; 
 Tue, 28 Jan 2025 02:01:44 -0800 (PST)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd508257sm161549315e9.23.2025.01.28.02.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:01:43 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Date: Tue, 28 Jan 2025 11:01:38 +0100
Message-ID: <20250128100138.2132824-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738058504; x=1738663304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sL6zcuaC0MsDb9DnYzxyZyOTl0wR8/CS9ICVP4rOnPI=;
 b=hJtg/YxM7FfU+G35E0YGdyGMxfzI3I4VfLBxS9vr2oo9yECpjEPfG6PkaGJi4n5rmZ
 aYmgMWL8MdWdOrozD4utwTesXJcpSsw7OtMLihGtZwXD32QpJGx4gPdMccGv5fJ6cAeg
 SyoeRw8U+SOD3PRR+nlxBWdgD2ijY3jIdoz6NhMLstjWSJmEDCd+aIxTn5tE4SJiKZK6
 yWzHuadhpBGm7c80ikYs7+GQPc7oyDsgqaPxRDloWnxrRHZfmTLUpou4A+mzIFeQ97Pn
 PnqpSapPLwBib9zMsiRPT96uLsowNoT4GdFSP80D2hSQxaM8dGa9zm44h7/cMgBKEd77
 DkoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hJtg/YxM
Subject: [Buildroot] [PATCH 1/1] support/scripts/genimage.sh: add shell
 option -e
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbW1pdCA2ODg5MDU2ZjFlIChzdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gpIGFkZHMg
c3VwcG9ydCBmb3IKY3JlYXRpbmcgYm1hcCBpbWFnZXMuCgpTaW5jZSB0aGVuLCB0aGUgc2NyaXB0
IGdlbmltYWdlLnNoIGxvb3NlcyB0aGUgZXJyb3IgcmV0dXJuZWQgYnkgdGhlCmdlbmltYWdlIGNv
bW1hbmQuCgpBcyBhIGNvbnNlcXVlbmNlLCB0aGUgdGFyZ2V0LWZpbmFsaXplIHRhcmdldCBsb29z
ZXMgdGhlIGVycm9yIGFzIHdlbGwsCmFuZCBzbyBvbiB1cCB0byBtYWtlLgoKVGhpcyBhZGRzIHRo
ZSBzaGVsbCBvcHRpb24gLWUgdG8gZXhpdCBpbW1lZGlhdGVseSBpZiBhIGNvbW1hbmQgZW5kcyB3
aXRoCmFuIGVycm9yLCBzbyB0aGUgZXJyb3IgaXMgbm90IGlnbm9yZWQuCgpGaXhlczoKCglncG9y
dGF5QGFyY2hsaW51eCB+L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwgJCBtYWtlCgkoLi4uKQoJPj4+
ICAgRXhlY3V0aW5nIHBvc3QtaW1hZ2Ugc2NyaXB0IHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5z
aAoJSU5GTzogY21kOiAibWtkaXIgLXAgIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRl
cm5hbC9vdXRwdXQvYnVpbGQvZ2VuaW1hZ2UudG1wIiIgKHN0ZGVycik6CglJTkZPOiBjbWQ6ICJy
bSAtcmYgIi9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJyMi1leHRlcm5hbC9vdXRwdXQvYnVpbGQv
Z2VuaW1hZ2UudG1wIi8qIiAoc3RkZXJyKToKCUlORk86IGNtZDogIm1rZGlyIC1wICIvaG9tZS9n
cG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRtcCIi
IChzdGRlcnIpOgoJSU5GTzogY21kOiAiY3AgLWEgIi90bXAvdG1wLkVjbEtHd3RBNFIiICIvaG9t
ZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2J1aWxkL2dlbmltYWdlLnRt
cC9yb290IiIgKHN0ZGVycik6CglJTkZPOiBjbWQ6ICJta2RpciAtcCAiL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMiIiAoc3RkZXJyKToKCUlORk86IHZm
YXQoZWZpLXBhcnQudmZhdCk6IGNtZDogIm1rZG9zZnMgICAnL2hvbWUvZ3BvcnRheS9zcmMvcnRv
bmUtYnIyLWV4dGVybmFsL291dHB1dC9pbWFnZXMvZWZpLXBhcnQudmZhdCciIChzdGRlcnIpOgoJ
SU5GTzogdmZhdChlZmktcGFydC52ZmF0KTogYWRkaW5nIGZpbGUgJ2VmaS1wYXJ0L0VGSScgYXMg
J0VGSScgLi4uCglJTkZPOiB2ZmF0KGVmaS1wYXJ0LnZmYXQpOiBjbWQ6ICJNVE9PTFNfU0tJUF9D
SEVDSz0xIG1jb3B5IC1zcCAtaSAnL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUtYnIyLWV4dGVybmFs
L291dHB1dC9pbWFnZXMvZWZpLXBhcnQudmZhdCcgJy9ob21lL2dwb3J0YXkvc3JjL3J0b25lLWJy
Mi1leHRlcm5hbC9vdXRwdXQvaW1hZ2VzL2VmaS1wYXJ0L0VGSScgJzo6RUZJJyIgKHN0ZGVycik6
CglEaXNrIGZ1bGwKCUlORk86IHZmYXQoZWZpLXBhcnQudmZhdCk6IGNtZDogInJtIC1mICIvaG9t
ZS9ncG9ydGF5L3NyYy9ydG9uZS1icjItZXh0ZXJuYWwvb3V0cHV0L2ltYWdlcy9lZmktcGFydC52
ZmF0IiIgKHN0ZGVycik6CglFUlJPUjogdmZhdChlZmktcGFydC52ZmF0KTogZmFpbGVkIHRvIGdl
bmVyYXRlIGVmaS1wYXJ0LnZmYXQKCUlORk86IGNtZDogInJtIC1yZiAiL2hvbWUvZ3BvcnRheS9z
cmMvcnRvbmUtYnIyLWV4dGVybmFsL291dHB1dC9idWlsZC9nZW5pbWFnZS50bXAvIiIgKHN0ZGVy
cik6CgltYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvZ3BvcnRheS9zcmMvcnRvbmUt
YnIyLWV4dGVybmFsL2J1aWxkcm9vdCcKCWdwb3J0YXlAYXJjaGxpbnV4IH4vc3JjL3J0b25lLWJy
Mi1leHRlcm5hbCAkIGVjaG8gJD8KCTAKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2Fl
bC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5z
aCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9z
dXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2ggYi9zdXBwb3J0L3NjcmlwdHMvZ2VuaW1hZ2Uuc2gK
aW5kZXggZGYyMjQyNDFhYi4uODY1Nzk0MGJlNSAxMDA3NTUKLS0tIGEvc3VwcG9ydC9zY3JpcHRz
L2dlbmltYWdlLnNoCisrKyBiL3N1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaApAQCAtMSw1ICsx
LDcgQEAKICMhL3Vzci9iaW4vZW52IGJhc2gKIAorc2V0IC1lCisKIGRpZSgpIHsKICAgY2F0IDw8
RU9GID4mMgogRXJyb3I6ICRACi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
