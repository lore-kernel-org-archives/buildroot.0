Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA9C48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 14:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A72F24020B;
	Thu, 22 Feb 2024 14:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgHhGQ1ka1Zz; Thu, 22 Feb 2024 14:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46AA440638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46AA440638;
	Thu, 22 Feb 2024 14:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4AF1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6699540638
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 14:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDGiZX9n-lPU for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 14:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 313B54020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313B54020B
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 313B54020B
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:11:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512a85806fcso2002158e87.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 06:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708611093; x=1709215893;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZ1vb1p7G1YioFRvUOCfOL2Tn8eHf6z3wfXVUdZ0iqA=;
 b=KwLv/ZJ8m+KZHsVxz29iVVVBetepxWlopLAvWv2uC1NGaiGhJMddbCGFu6Fe9+4mCB
 xd4/x36sISON14qKcTsnDktLNzQt5ay01ZJDCxvoMWIQc6nO89sM3B9F2iryXlXBsWzc
 6ugGHTxzwbpM79V1OawEXIu0J0ykWJM8I7U8tir2PfqR8S0FJDHmkNc6HCICMmdpy59p
 Y7xdFBNJtphcALjyKzdBrqd1Kr55WYyeJ7nEqWc+Uq7T2E1hKz3Fk3RC+3/bJS5NkS7U
 Lneb68ngQn5GwBjtlh8Vp6snw1jDoO3nvdp9byUNrJxT+qZaD46qjl8p1i1qH0HWfTq4
 IJCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxDa2TEYuJVpInMzmnWqRwIygjUUzc1BcZeVJr+I7YEUI2qebXAjWaW1bKd63xBgb6ifp2bYuWk4mO27MrTGAAmMWlRy2PQ==
X-Gm-Message-State: AOJu0YwNG5xGxs1BgcPDKtHtSqnOSmT1VPmd0crGXJKXaq9Wf/hHJOCk
 GHzQ7zl0oAkICZcJJ4bE36ukXPJpJOmGblOwAAy2vSoxmPqqXXfUHtTPtVmerE8=
X-Google-Smtp-Source: AGHT+IFgFeGeMj6y83w43NYpq+66Pp3bJNPZwJ9pUSvvcwbJg8f2BbXXoTKTRNcF3HF9AFTKQNF44Q==
X-Received: by 2002:a05:6512:3b93:b0:512:8de5:2170 with SMTP id
 g19-20020a0565123b9300b005128de52170mr15814606lfv.38.1708611092711; 
 Thu, 22 Feb 2024 06:11:32 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b00411a6ce0f99sm22360623wmq.24.2024.02.22.06.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 06:11:32 -0800 (PST)
Message-ID: <18c5c62e-ac9c-476a-9792-b523c2ee1470@smile.fr>
Date: Thu, 22 Feb 2024 15:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
References: <20240222135550.3428952-1-vfazio@gmail.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222135550.3428952-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708611093; x=1709215893;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZ1vb1p7G1YioFRvUOCfOL2Tn8eHf6z3wfXVUdZ0iqA=;
 b=h7xNdNRldOUOrHDUlmDx9bUtcRIQ7r6GPTkG91xsniLcXDo025AtRWyaP4HXiojYsl
 ZGDNSFsWV6i5HBrwF9eSdEdFq5+s9IO3x53LXKkJZDaLQo9xJgu1azJBnhdVk8eKBrOp
 X7xYlk8VL5chzcXUYQ1BAvkfFirchWa4+AHpUrGjML5bwQKcl2JtJxLIJJXD/gFABUD+
 k1hC2RjmKiWcH3x0GIPT5CyBxSxRmmzVIJciyqUmDXFyORYnnSHKZXiqYdgrdzmNki2t
 qDDZqaJ1HsNYw6Ya/yKO8LWD6r2lMKXTqWX80+SwY61hxokbJiYxwz3gr9ZqnyCbjRVg
 CzIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=h7xNdNRl
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: remove orphaned 10.4.0
 patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmluY2VudCwKCkxlIDIyLzAyLzIwMjQgw6AgMTQ6NTUsIFZpbmNlbnQgRmF6aW8gYSDD
qWNyaXTCoDoKPiBTaG9ydGx5IGJlZm9yZSBHQ0MgMTAuNC4wIHdhcyBkcm9wcGVkIGluIGQzN2E4
ZjNhMiwgY29tbWl0IDRjZTBkYWNiNiB3YXMKPiBtZXJnZWQgYW5kIGludHJvZHVjZWQgYSBwYXRj
aCB0byAxMC40LjAgdGhhdCB3YXMgbm90IGFjY291bnRlZCBmb3IgYnkKPiB0aGUgcGF0Y2ggdGhh
dCBkcm9wcGVkIDEwLjQuMCBzdXBwb3J0LgoKV2VsbCwgdGhpcyBpcyB1bmZvcnR1bmF0ZS4gVGhl
IHBhdGNoIHJlbW92aW5nIEdDQyAxMC40LjAgd2FzIHBlbmRpbmcgaW4KcGF0Y2h3b3JrIHdoZW4g
dGhlIHBhdGNoIHdhcyBpbnRyb2R1Y2VkLiBJIGNhbid0IHJlbW92ZSBhIGZpbGUgdGhhdCBkb2Vz
bid0CmV4aXN0IHlldCA6cAoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gRml4ZXM6IGQzN2E4ZjNhMiAo
InBhY2thZ2UvZ2NjOiByZW1vdmUgZ2NjIDEwLngiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQg
RmF6aW8gPHZmYXppb0BnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLmluZS1UQVJHRVRfSEFWRV9UTFMt
d2hlbi1IQVZFX0FTX1RMUy5wYXRjaCB8IDQ5IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQ5IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9n
Y2MvMTAuNC4wLzAwMDctb3Ixay1Pbmx5LWRlZmluZS1UQVJHRVRfSEFWRV9UTFMtd2hlbi1IQVZF
X0FTX1RMUy5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy8xMC40LjAvMDAwNy1v
cjFrLU9ubHktZGVmaW5lLVRBUkdFVF9IQVZFX1RMUy13aGVuLUhBVkVfQVNfVExTLnBhdGNoIGIv
cGFja2FnZS9nY2MvMTAuNC4wLzAwMDctb3Ixay1Pbmx5LWRlZmluZS1UQVJHRVRfSEFWRV9UTFMt
d2hlbi1IQVZFX0FTX1RMUy5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDdlOTcxNGU5Y2IuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2djYy8xMC40LjAvMDAwNy1v
cjFrLU9ubHktZGVmaW5lLVRBUkdFVF9IQVZFX1RMUy13aGVuLUhBVkVfQVNfVExTLnBhdGNoCj4g
KysrIC9kZXYvbnVsbAo+IEBAIC0xLDQ5ICswLDAgQEAKPiAtRnJvbSBjYTAxZDI1MjY5MTdlYzZl
NTRiMzA0NzJkM2FlZGZkNDZkNGNhNTg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1Gcm9t
OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiAtRGF0ZTogVGh1LCAyOSBTZXAg
MjAyMiAxNTozMjozOSArMDEwMAo+IC1TdWJqZWN0OiBbUEFUQ0hdIG9yMWs6IE9ubHkgZGVmaW5l
IFRBUkdFVF9IQVZFX1RMUyB3aGVuIEhBVkVfQVNfVExTCj4gLQo+IC1UaGlzIHdhcyBmb3VuZCB3
aGVuIHRlc3RpbmcgYnVpbGRyb290IHdpdGggbGludXh0aHJlYWRzIGVuYWJsZWQuICBJbgo+IC10
aGlzIGNhc2UsIHRoZSBidWlsZCBwYXNzZXMgLS1kaXNhYmxlLXRscyB0byB0aGUgdG9vbGNoYWlu
IGR1cmluZwo+IC1jb25maWd1cmF0aW9uLiAgQWZ0ZXIgYnVpbGRpbmcgdGhlIE9wZW5SSVNDIHRv
b2xjaGFpbiBpdCB3YXMgc3RpbGwKPiAtZ2VuZXJhdGluZyBUTFMgY29kZSBzZXF1ZW5jZXMgYW5k
IGNhdXNpbmcgbGlua2VyIGZhaWx1cmVzIHN1Y2ggYXM6Cj4gLQo+IC0gLi4uLi9vcjFrLWJ1aWxk
cm9vdC1saW51eC11Y2xpYmMtZ2NjIC1vIGdwc2QtMy4yNC9ncHNjdGwgLi4uLiAtbHVzYi0xLjAg
LWxtIC1scnQgLWxuc2wKPiAtIC4uLi4vbGQ6IC4uLi4vc3lzcm9vdC91c3IvbGliL2xpYnVzYi0x
LjAuc286IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdGxzX2dldF9hZGRyJwo+IC0KPiAtVGhp
cyBwYXRjaCBmaXhlcyB0aGlzIGJ5IGRpc2FibGluZyB0bHMgZm9yIHRoZSBPcGVuUklTQyB0YXJn
ZXQgd2hlbiByZXF1ZXN0ZWQKPiAtdmlhIC0tZGlzYWJsZS10bHMuCj4gLQo+IC1nY2MvQ2hhbmdl
TG9nOgo+IC0KPiAtCSogY29uZmlnL29yMWsvb3Ixay5jIChUQVJHRVRfSEFWRV9UTFMpOiBPbmx5
IGRlZmluZSBpZgo+IC0JSEFWRV9BU19UTFMgaXMgZGVmaW5lZC4KPiAtCj4gLVRlc3RlZC1ieTog
WWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+IC0KPiAtVXBzdHJlYW06IGh0
dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXQ7aD1jYTAxZDI1MjY5MTdl
YzZlNTRiMzA0NzJkM2FlZGZkNDZkNGNhNTg1Cj4gLQo+IC1bQmVybmQ6IGJhY2twb3J0ZWQgdG8g
MTAuNC4wXQo+IC1TaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+
IC0tLS0KPiAtIGdjYy9jb25maWcvb3Ixay9vcjFrLmMgfCAyICsrCj4gLSAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gLQo+IC1kaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9vcjFrL29y
MWsuYyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmMKPiAtaW5kZXggZGEyZjU5MDYyYmEuLjBjZTdi
MjM0NDE3IDEwMDY0NAo+IC0tLS0gYS9nY2MvY29uZmlnL29yMWsvb3Ixay5jCj4gLSsrKyBiL2dj
Yy9jb25maWcvb3Ixay9vcjFrLmMKPiAtQEAgLTIxNzUsOCArMjE3NSwxMCBAQCBvcjFrX291dHB1
dF9taV90aHVuayAoRklMRSAqZmlsZSwgdHJlZSB0aHVua19mbmRlY2wsCj4gLSAjdW5kZWYgIFRB
UkdFVF9MRUdJVElNQVRFX0FERFJFU1NfUAo+IC0gI2RlZmluZSBUQVJHRVRfTEVHSVRJTUFURV9B
RERSRVNTX1Agb3Ixa19sZWdpdGltYXRlX2FkZHJlc3NfcAo+IC0gCj4gLSsjaWZkZWYgSEFWRV9B
U19UTFMKPiAtICN1bmRlZiAgVEFSR0VUX0hBVkVfVExTCj4gLSAjZGVmaW5lIFRBUkdFVF9IQVZF
X1RMUyB0cnVlCj4gLSsjZW5kaWYKPiAtIAo+IC0gI3VuZGVmICBUQVJHRVRfSEFWRV9TUEVDVUxB
VElPTl9TQUZFX1ZBTFVFCj4gLSAjZGVmaW5lIFRBUkdFVF9IQVZFX1NQRUNVTEFUSU9OX1NBRkVf
VkFMVUUgc3BlY3VsYXRpb25fc2FmZV92YWx1ZV9ub3RfbmVlZGVkCj4gLS0tIAo+IC0yLjM5LjMK
PiAtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
