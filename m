Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5849C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EC640B5F;
	Tue,  4 Feb 2025 17:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdBYJlSnD3YG; Tue,  4 Feb 2025 17:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F83E41448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F83E41448;
	Tue,  4 Feb 2025 17:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 587F112A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 495BA805AB
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XlNvBRyEXd6 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56BFE80561
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BFE80561
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56BFE80561
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:35:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434f398a171so7297545e9.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 09:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690502; x=1739295302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2mWm5NwlG/Rv8AT75CVZnHWxlnHR5D3JC2bAAwQ++OM=;
 b=YOawz5acmz/AQAtrvkjZaNj8bGx05sDsIC9pi01XXBRpJpes3kT/m5CQu8ClBT4fMe
 exJ7e9ChhbrQt7Lboh90xpRCAp11ZmN5eG8f6q3+YWp2p/sV1IDxnwwF/I+ZIOp79AxL
 mkhvQwVZTOOG9jAw9iBBc9Muwfa9prHvkum8ASLuiNtHMXcdErUxhOyvbI9cfDmDIAuZ
 OppDrRU6e/1+h0sdRLfwcajtQ+7rH7xwVk4XqA+J9UCVD52KPzwST0UqSbP18kSOIaiy
 h/3sTAILbV2uWF05hN75srwzNTVR6mEg9oM5280XvGDERNIvdV9H4bAB8CwSxGm5BTGL
 xqNA==
X-Gm-Message-State: AOJu0Yz2tTv6P8IYZvxuEy95PjD0pJsSvBJdEvPL06Wy6XI5ZcNEDIF8
 VMiNxhcouLanwTKbp1t6w8eOjjDCBmh3Ygp7GCut5+Oms5lq0oaIcGy751eK0R4=
X-Gm-Gg: ASbGncvr+MVqlTdgJk8jd/AjCveTrqJsYni2J/byJ1g7DV+v9xLG5Iyw3F4FiaLmGVl
 MIbKfkgl2CgIuk1eU30ejyGCXQejsqoFK9+ZbRoBp0995KbomdbxuXcRkngmrAurrEHrbh4byoq
 eKm9YuIjElTpa5n/ngTHicLIXBluaf8FsoMRt+/1+dhBaTKx492Zp3aMXvhhsFII6nWd4QWiF0s
 5Fx9s3056Jz63pQ7cn9PbU8GcPvTzaewxl5vtWLNYrStDmu3uh4TekRuXnMz/hC7DzbGfZ21scp
 rvatYw7ZcTAheEpZbiDoFbHikw==
X-Google-Smtp-Source: AGHT+IEHP3oXK+YBcN0NAKZiEzpISN9tQN9IgM/E/YvVNfdbWVP7Pcx5/5wB143q6fVaHvRc/bOW9w==
X-Received: by 2002:a05:6000:402c:b0:385:df73:2f43 with SMTP id
 ffacd0b85a97d-38da4df48ddmr1366132f8f.2.1738690502506; 
 Tue, 04 Feb 2025 09:35:02 -0800 (PST)
Received: from archlinux.. ([78.244.185.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dadca52e6sm2092245f8f.0.2025.02.04.09.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:35:01 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Tue,  4 Feb 2025 18:34:56 +0100
Message-ID: <20250204173456.201056-3-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738690502; x=1739295302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mWm5NwlG/Rv8AT75CVZnHWxlnHR5D3JC2bAAwQ++OM=;
 b=C3TlxBf3XDd4Nnp4/V8HceTpfbl1J3QscmscwjeStgF2M9Bz+O2POo4cLw7EXs6KMc
 zeGy4KW8FPtPdUwn8EeGnvAbx/a4XchBRMHB7Ukjpoeagcq0EDt9ntPtmwuofAAp+tKW
 NLxDD5xE9u8prz+XUSv9pyN2dBE0CXKxiQVScBS0Tw+kW73dzbbeXfgkxmPcu8RkPAty
 0Dtfb8vmUhBory15xNJICWgfTqRvxi6jV5yinnXoF6TgmwZhsWQ39U3dH/sYSxJdOHpB
 DCzZduCHE3kmrnfvR/2BSGK0HMEhHKFm0uzjX8rsoROlHGMPfaMCE0CUxnP3KWBhsljK
 FodQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C3TlxBf3
Subject: [Buildroot] [PATCH v4 2/2] package/rpi-userland: package is
 deprecated
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

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhpcyBhZGRzIHRoZSBtZXNzYWdlIGluIGl0cyBoZWxwLgoKWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlk
NWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvcnBpLXVzZXJsYW5k
L0NvbmZpZy5pbiB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbiBiL3BhY2th
Z2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbgppbmRleCA0MjE5YmRiOWM0Li5jMzllYjQ1OThmIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9y
cGktdXNlcmxhbmQvQ29uZmlnLmluCkBAIC0xNiw2ICsxNiwxNyBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfUlBJX1VTRVJMQU5ECiAJICBtbWFsLCBHTEVTdjIsIHZjb3MsIG9wZW5tYXhpbCwgdmNoaXFf
YXJtLCBiY21faG9zdCwgV0ZDLAogCSAgT3BlblZHLgogCisJICBJbXBvcnRhbnQ6IFRoZSBwYWNr
YWdlIGlzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWQuCisKKwkgIEl0IGxhcmdlbHkgY29udGFpbnMg
Y29kZSB1c2luZyBwcm9wcmlldGFyeSBBUElzIHRvIGludGVyZmFjZQorCSAgdG8gdGhlIFZpZGVv
Q29yZSBmaXJtd2FyZS4gSXQgaGFzIHNpbmNlIG1vdmVkIHRvIHN0YW5kYXJkCisJICBsaW51eCBB
UElzLgorCisJICBWNEwyLCBEUk0vS01TIGFuZCBNZXNhIGFyZSB0aGUgQVBJcyB5b3Ugc2hvdWxk
IGJlIHVzaW5nLgorCisJICBUaGUgZmV3IHVzZWZ1bCB0b29scyBmcm9tIGhlcmUgKGR0b3Zlcmxh
eSwgZHRtZXJnZSwKKwkgIHZjbWFpbGJveCwgdmNnZW5jbWQpIGhhdmUgYmVlbiBtb3ZlZCB0byB0
aGUgcGFja2FnZSBycGktdXRpbHMuCisKIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlw
aS91c2VybGFuZC8KIAogaWYgQlIyX1BBQ0tBR0VfUlBJX1VTRVJMQU5EICYmIEJSMl9hcm0KLS0g
CjIuNDguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
