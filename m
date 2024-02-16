Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE7C48BC4
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 01:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C94441EB7;
	Fri, 16 Feb 2024 01:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnhXYJ93qPVE; Fri, 16 Feb 2024 01:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFC5B41E52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC5B41E52;
	Fri, 16 Feb 2024 01:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E14A71BF98E
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 01:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE5A5606A6
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 01:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHFTwHFxKejv for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 01:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96185605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96185605D7
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96185605D7
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 01:44:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d0a7f2424so769623f8f.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708047858; x=1708652658;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sShWYQhwGzfC+bMb7aYg3cX9j30wxiiF3H9yjEUGNYM=;
 b=SG1cAA5mZh6I3CsDrzh2MBw8pgm5i6kR2s12jfSGvXDYbshgysZqPzJdRU3E5NCCIo
 ynVim0+yBY7AClsKglJ8GpIg9R4NIZp9gjyIWE4Acoex69eJHZu1R0tHv9WAMoOuTv25
 1MrqGw9lEcIt5Z5Y/T2pbd8cStIJBYg80OCfV/oPGjjr99zCW5NEr0mqTZhxjobFp3yQ
 po57DUVb+z6OOrLlN0k10fJNpwz2/eKAtMz2nhPzwdkgtJplYvpfvvD9EZSrBh5GCsbc
 pCayfqtaY1pQv0dT6gEPgjzbUhCiWE9T6AL1NV1T8+zxYBSeXmhXeJFYWxAmVUlEdExZ
 o81g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2XINjG1lZhqKU5IS1Fm1/UYAQYCL6Bt53+RFb8BNXs5vUie55WVnPPMNld8TOfq89qq795NPzSDtnZzXuQSotHpdakhJqhA==
X-Gm-Message-State: AOJu0Yymkm6E0ufnuIRRd6Sug/25y2M+Er/bPAbAVuwjEq5VQb/ev3nn
 tIiKRMEZghlcjmM1F/NN+PkMgE2jqcow7ELgFC0Yud9IEgT/Htcg
X-Google-Smtp-Source: AGHT+IEA3Zx2xiUdLbhP7gU4zJV7irmOkQpA1l5Q+lrzS+TQAKDxStQpWCq5smL+waT0X/lgh4C3PA==
X-Received: by 2002:a5d:58e3:0:b0:33d:1db5:da96 with SMTP id
 f3-20020a5d58e3000000b0033d1db5da96mr74905wrd.18.1708047858148; 
 Thu, 15 Feb 2024 17:44:18 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d58e7000000b0033b784c2775sm686400wrd.43.2024.02.15.17.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 17:44:17 -0800 (PST)
Message-ID: <9a9b1138094021975bf0ef1a22485a37efeebc95.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Fri, 16 Feb 2024 02:44:19 +0100
In-Reply-To: <20240213172817.2872849-19-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-19-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708047858; x=1708652658; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sShWYQhwGzfC+bMb7aYg3cX9j30wxiiF3H9yjEUGNYM=;
 b=EnGH3K2IvveSnWR08V0tQ2R9Ezgf15bOvi4ytNtlbWzKahdZzk8zRyLXJ+lzAhBVFh
 qPDRNcXqOASdDnqSx1SgRA+s500n72dh7Q7LpUNBS08AKPdJOLnwqYyJwWaj4BKhIaZh
 QyOYH6hnQAJW7SldlG8f0gJn5krkY+Kfg4EzgdUSQbqC7Ok0w/7fQQvCZBm3W7vJFihw
 v3iVvN9QgAp3T5DX/68ZVJS6kRmPVJ4uSV7tpeXgOHlDg0UfgEwZEWKzLZ9MWR4jKHfm
 dDACkZLahtp4+3aF1mWjOEz6sc1ywcxYyqOky78LnkUcHicVYRDKibqpGq/aPgynF4gN
 hjrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EnGH3K2I
Subject: Re: [Buildroot] [PATCH 18/21] configs/ti_j721e_sk_defconfig: new
 defconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3RpL2o3MjFlLXNrL3Bvc3Qt
YnVpbGQuc2gKPiBAQCAtMCwwICsxLDE2IEBACj4gKyMhL2Jpbi9zaAo+ICtCT0FSRF9ESVI9IiQo
ZGlybmFtZSAkMCkiCj4gKwo+ICsjIHUtYm9vdCBpcyBsb29raW5nIGF0IC9ib290L2R0Yi90aSBm
b3IgZGV2aWNldHJlZSBpbiB0aGUgcm9vdGZzCj4gKyMgcGFydGl0aW9uIHdoaWxlIEJ1aWxkcm9v
dCBpbnN0YWxsIHRoZSBrZXJuZWwgYW5kIGl0cyBkZXZpY2V0cmVlCj4gKyMgaW4gL2Jvb3QgKEJS
Ml9MSU5VWF9LRVJORUxfSU5TVEFMTF9UQVJHRVQgZW5hYmxlZCkuCj4gKyMgRW5hYmxpbmcgQlIy
X0xJTlVYX0tFUk5FTF9EVEJfS0VFUF9ESVJOQU1FIGFsbG93cyB0byBrZWVwIHRoZQo+ICsjICJ0
aSIgc3ViZGlyZWN0b3J5IGJ1dCAiZHRzIiBpcyBzdGlsbCBtaXNzaW5nLgo+ICsjIE1ha2Ugc3Vy
ZSAvYm9vdC9kdGIvdGkgZXhpc3QgYnkgY3JlYXRpbmcgYSBzeW1saW5rIGluCj4gKyMgJHtUQVJH
RVRfRElSfS9ib290Cj4gKyMgaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLXRpL3Ry
ZWUvbWV0YS10aS1ic3AvcmVjaXBlcy1rZXJuZWwvbGludXgvdGkta2VybmVsLmluYz9oPTA5LjAy
LjAwLjAwNCNuMTMKPiArIyBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9i
bG9iL3YyMDI0LjAxL2luY2x1ZGUvZW52L3RpL21tYy5lbnY/cmVmX3R5cGU9dGFncyNMMTgKPiAr
aWYgWyAtTCAke1RBUkdFVF9ESVJ9L2Jvb3QvZHRiIF07IHRoZW4KPiArwqDCoMKgIHJtICR7VEFS
R0VUX0RJUn0vYm9vdC9kdGIKPiArwqDCoMKgIGxuIC1zZiAuICR7VEFSR0VUX0RJUn0vYm9vdC9k
dGIKPiArZmkKCnRoZSBhYm92ZSBzY3JpcHQgKHdpdGggY29ycmVjdGlvbnMpIGFuZC4uLgoKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvY29uZmlncy90aV9qNzIxZV9za19kZWZjb25maWcKPiBAQCAt
MCwwICsxLDUxIEBACj4gK0JSMl9hYXJjaDY0PXkKPiArQlIyX2NvcnRleF9hNzI9eQo+ICtCUjJf
Uk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC90aS9qNzIxZS1zay9wb3N0LWJ1aWxkLnNo
IgoKLi4uIHRoZSBob29rIGluIGNvbmZpZyBhbmQKCkJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBf
RElSTkFNRT15CgpzZWVtIHRvIGJlIG5lY2Vzc2FyeSBmb3IgYWxsIGJvYXJkc3doZXJlIHlvdSB1
cGRhdGUgVS1Cb290IHRvID49djIwMjMuMTAsCmJlY2F1c2Ugb2YgVS1Cb290IGNvbW1pdHMKCjAx
NGUwMTNlNzg0ZiAoImVudmlyb25tZW50OiB0aTogTWFrZSBnZXRfZmR0X21tYyBjb21tb24iKSBh
bmQKZDhlYTY4ZGE2YmYxICgiZW52aXJvbm1lbnQ6IHRpOiBQcmVmaXggQVJNNjQgRFRCIG5hbWVz
IHdpdGggZGlyZWN0b3J5IiksCgp3aGljaCBsZWFkIHRvIC9ib290L2R0cy90aSByZXF1aXJlbWVu
dCBmb3IgYWxsIFRJIGJvYXJkcy4KCkJ1dCBpdCdzIHVuZm9ydHVuYXRlbHkgc3RpbGwgbm90IGVu
b3VnaCBhbmQgU0stQU02MkIgc3RpbGwgZmFsbHMgYmFjawp0byBCT09UUCBpbnN0ZWFkIG9mIE1N
QyBib290Li4uCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
