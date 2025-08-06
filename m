Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5A7C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705A4412E1;
	Wed,  6 Aug 2025 14:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8bpMoKlz_ZS; Wed,  6 Aug 2025 14:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B739B41B90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B739B41B90;
	Wed,  6 Aug 2025 14:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F02D79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9C1845FC
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2L1OcW-As42j for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12F46845FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F46845FA
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12F46845FA
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:09:01 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b423b13e2c3so4156951a12.3
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754489341; x=1755094141;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GXzyJvjYTa6ozITEZxNsZKdkUpJgGmjYjWAkDhqZDiA=;
 b=gSiu7npG0ymrOB5dbll7DVk9hSOJYshzCDJuwn/r0fK4Iu+xkWdn9c5fl9lRBTq37j
 UpRCodPpCLHQZGZ6W/y7CQovyWi9H3pqaql/YstDF8HOkeY6zgYjdKBz6BCdd7ZtbjeN
 1n9NsoWpcdd005l/9luYUCxrb2xsFscVZ6ivW5sjAjG1da0DnRZYlZl6PQU9PZafGXuF
 sMGDkW1xwh0bsxR8QPYaMMCbJzCvYNK/UPzcylgWffH3hRCwdM2s2udPdxGIkeapnYel
 bPVJH9xjVmUhb61Sellj4u8Gve4yl33uRTl5Oxd835qFOHktJCrZBUGVB5I1rpeNBmDo
 a7nQ==
X-Gm-Message-State: AOJu0YwtKcp5H34DFSko9gMXNNW2C7fDPTEIR7238aVYqfn1ZwjQGvPw
 5F8CS6z5QrbbThjMbB9nDElpHtxKv6KlZlEthKmszndOczIhK56EkD+WdCt3uw==
X-Gm-Gg: ASbGncsi6MIMGXGcLgnl2N3u8q2nSNw3Hnat7Cai8RPwNPLWzgLRe/UOF1ZAvGT1jGv
 pjsn7F4NnpGfpcgeIxZSpa51OpaODnbHAHEFmPA7wJ3mNYig3BmgX1/9qf62lXraa7XfNBvbXd8
 /GPo0WAHUp888vZZ6vAW/RKRw61p85IbNY/Iczpv8+YSXIFOtWaSv0QSldoO3r53Jwq0I/8vRfN
 HRJXN860uKtWjMbKXddr3BZrwf48osXUt7KRta/NxSVf5nRkUgfXMR3cKwignXJr18J9jHOj9DN
 LhoaxAvUeMFfSOK1Db206bnLm3RD16rMkLEw0inG6tK5O1ZD7X7sUSsvEIkfBHLh7coKt3CYghb
 /W9M4flFwr1I0R8pLSNgiXjCAu58gCb4EAvL4qlCwjl/F+w==
X-Google-Smtp-Source: AGHT+IGZZ7zleIIgf0fDRxilaV2n8RUzfOoACiRJeyyTpaZpwQz/bSz6Tn3D66T/ZWMNNSBqjgkVtw==
X-Received: by 2002:a17:903:2b06:b0:240:b075:577f with SMTP id
 d9443c01a7336-242a0b70dbdmr37429715ad.37.1754489340870; 
 Wed, 06 Aug 2025 07:09:00 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f1ececsm159378245ad.68.2025.08.06.07.09.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 07:09:00 -0700 (PDT)
Message-ID: <1cc31884-bcac-4b37-b83e-0bb3ef937f64@gmail.com>
Date: Wed, 6 Aug 2025 08:08:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754489341; x=1755094141; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXzyJvjYTa6ozITEZxNsZKdkUpJgGmjYjWAkDhqZDiA=;
 b=VTlJma+E27jolHSedSL6cCkdm6yWi0xBTkQyT9V10rYgbQJpRgZw8ma3oKlqBLLF0U
 eqrnli2LzPimDX+UgWNvgXAJumb76Xgt0Krp6czeWcvLJYSj+/thJeTJl46cfRYBPo8q
 +NI7DDbXYmskV1mkaPMf1BERXCCbmHqrTpR08n2sM6+Vw+gR7HkQ8yT3kVbfEKxn7Lpy
 tqrHhjBWmdBiNXnw3vMZQXKc7eNH2itTr5tDIJAU0s5Lrw/c5w/ZTzNjuDt1PiMBVc6D
 haOK92Y5ETV3B8Oycs7+SrUx2ohsg4Hbzp45YLRjgJs1Uu3nQXr/yQcWnguAPxnoYCnh
 mkwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VTlJma+E
Subject: [Buildroot] Multiple uboot defconfigs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSdtIHdvcmtpbmcgd2l0aCBhIGRldmljZSB0aGF0IGNhbiBib290IGZyb20gbm9yLCBuYW5kLCBl
bW1jLCBhbmQgCnNkY2FyZC7CoCBJJ2QgbGlrZSB0byBjb21waWxlIHVib290IGZvciBlYWNoIG9m
IHRoZXNlIGNvbmZpZ3VyYXRpb25zIGluIApvbmUgZ28gaW4gYSBzaW5nbGUgYnVpbGRyb290IGNv
bmZpZ3VyYXRpb24sIGJ1dCBpdCBsb29rcyBhcyB0aG91Z2ggeW91IApjYW4gb25seSBzcGVjaWZ5
IGEgc2luZ2xlIHVib290IGRlZmNvbmZpZy7CoCBJcyB0aGVyZSBhbnlvbmUgdGhhdCdzIGFsc28g
CmRlYWx0IHdpdGggdGhpcyBzY2VuYXJpbz8gb3IgaXMgdGhlcmUgYW55dGhpbmcgSSd2ZSBtaXNz
ZWQgZm9yIGNvbXBpbGluZyAKbXVsdGlwbGUgdWJvb3QgY29uZmlncyBpbiBhIHNpbmdsZSBidWls
ZHJvb3QgY29uZmlndXJhdGlvbj8KCnRoYW5rcywKTGFuY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
