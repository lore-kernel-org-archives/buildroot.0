Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7CC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94A5041545;
	Wed,  3 Jul 2024 13:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twPUGiiTQ3J0; Wed,  3 Jul 2024 13:58:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124FF414C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 124FF414C0;
	Wed,  3 Jul 2024 13:58:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 131FC1BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CA4E403C7
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZnXQ9fesa9b for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:58:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47609403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47609403C4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47609403C4
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:58:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-36743a79dceso464557f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 06:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015097; x=1720619897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YeYgSxA9ZBOCJDRiKM+wD9Bn1MESrYGKGWX6yDS7/C4=;
 b=AXhEx+sqjmKKBTFmMSbh+XFpcX29bFkXHz+DVwtOmcOlCuVhO78ZlkK9+UuGG3Ssjs
 6wxHdhBi2iUnoM86D32XywWlV5/sGiwXTJOl0rl0udT9J3IJvVJHz07Qa9VynbTApcQy
 L+iB7dJD/N86OpBci/XywaY1dW1nt4L+va1CA+SWD+NfFAUA5O/VLwnVRc9wJd4ZBlB0
 N/Z8gYTv50BBMshXyh+/iPLyFT6UziIU5cFF2peURXpYsuiwL67yaAKcBqmi54tbpBvI
 VhQTq90Iex8ZhnhSaR3W8dQdLnQ3BPRlbgaAYa+o4fuReKmYWcUI6SwZGnpQPs/JEKn9
 KL0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQrK2e26hdvPGecmaaBO2xm5F9RThTXyFFIqu4AtLEfB4LgJAXFg6k9ewwcWWewaPQJpsFBEiArU/fOTLfnNmM/ooPJG+ntg==
X-Gm-Message-State: AOJu0YwSKAB1bxA8ZcfD259tgyGcGkVW2/PPASflg2Sy/NYI5UEqRBe7
 JdVTmnh79LmYHa6reR7tsFqBRiMoSk5MOIRxxlVijxBQHpQSYLtJq1M5GPsmjRQ=
X-Google-Smtp-Source: AGHT+IGaA+i4ryy8KsCVMN3lA2ksaWZlsBTCKQ3MOSuL5HUZugR+CZGpTlXdPiPELzgEQ3x+bfsSiQ==
X-Received: by 2002:a05:6000:235:b0:360:866f:5083 with SMTP id
 ffacd0b85a97d-367947c7bf9mr1443714f8f.32.1720015097268; 
 Wed, 03 Jul 2024 06:58:17 -0700 (PDT)
Received: from [10.5.0.35]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd562sm16039506f8f.15.2024.07.03.06.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 06:58:17 -0700 (PDT)
Message-ID: <1a787cc0-197d-4f45-b743-b6888ccda671@smile.fr>
Date: Wed, 3 Jul 2024 15:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240702220411.2518456-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20240702220411.2518456-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720015097; x=1720619897; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YeYgSxA9ZBOCJDRiKM+wD9Bn1MESrYGKGWX6yDS7/C4=;
 b=IJQzCm//oHG2DD6/L9sp9lB1wmtH0gyC3S4ZGzjq/RGJM+AH96afzyzTgrs4nn3m4p
 T04GrQYV67nJw4teCxfPCGe2URoUoVQqFhgZpgZtYaxepTa9kZhUQUS+JVKwQPa3gYs7
 e2wrU2ThiZodg+MazPsffeztsY0DuY38uE0FU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=IJQzCm//
Subject: Re: [Buildroot] [PATCH 1/1] package/poke: fix patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMDMvMDcvMjAyNCDDoCAwMDowNCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBDb21taXQgOGY4OGE2NDRlZCAic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBhdGNo
ZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiIHJlZHVjZWQgdGhlIGZ1
enogZmFjdG9yLgo+IAo+IER1ZSB0byB0aGlzIGNoYW5nZSwgcG9rZSBmYWlscyB0byBidWlsZCB3
aXRoIG91dHB1dDoKPiAKPiAgICAgQXBwbHlpbmcgMDAwMS1jb25maWd1cmUuYWMtSEVMUDJNQU4t
cmVwbGFjZS1ieS10cnVlLXdoZW4tY3Jvc3MtY29tLnBhdGNoIHVzaW5nIHBhdGNoOgo+ICAgICBw
YXRjaGluZyBmaWxlIGNvbmZpZ3VyZS5hYwo+ICAgICBIdW5rICMxIEZBSUxFRCBhdCA5MC4KPiAg
ICAgMSBvdXQgb2YgMSBodW5rIEZBSUxFRCAtLSBzYXZpbmcgcmVqZWN0cyB0byBmaWxlIGNvbmZp
Z3VyZS5hYy5yZWoKPiAKPiBUaGlzIGNvbW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2hl
cyBvbiB0aGUgY3VycmVudCBwYWNrYWdlCj4gdmVyc2lvbi4KPiAKPiBUaGUgcGF0Y2ggMDAwMiB3
YXMgZGVzY3JpYmVkIGFzIHNwZWNpZmljIHRvIEJ1aWxkcm9vdC4gVGhpcyBjb21taXQKPiBhZGRz
IHRoZSAiVXBzdHJlYW06IiB0YWcgYW5kIHJlbW92ZXMgdGhlIGNvcnJlc3BvbmRpbmcKPiAiLmNo
ZWNrcGFja2FnZWlnbm9yZSIgZW50cnkuCj4gCj4gRml4ZXM6Cj4gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvYWNlNGEwZWZmZmI2NmRjZWJmODczYTJiYWEzM2I1ZWRmZTY3
MDA5Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpB
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+
ICAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
MSAtCj4gIC4uLmFjLUhFTFAyTUFOLXJlcGxhY2UtYnktdHJ1ZS13aGVuLWNyb3NzLWNvbS5wYXRj
aCB8IDEyICsrKysrKystLS0tLQo+ICAuLi5iLWdldHJhbmRvbS5jLWZpeC1idWlsZC13aXRoLXVj
bGliYy0xLjAuMzUucGF0Y2ggfCAxMyArKysrKysrKy0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhLy5jaGVj
a3BhY2thZ2VpZ25vcmUgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gaW5kZXggZGNhNzI1MzQ1MzUu
LjllODk4ODA1NmQ3IDEwMDY0NAo+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPiArKysgYi8u
Y2hlY2twYWNrYWdlaWdub3JlCj4gQEAgLTEyMDcsNyArMTIwNyw2IEBAIHBhY2thZ2UvcGtnY29u
Zi8wMDAxLU9ubHktcHJlZml4LXdpdGgtdGhlLXN5c3Jvb3QtYS1zdWJzZXQtb2YtdmFyaWFibGVz
LnBhdGNoIGxpCj4gIHBhY2thZ2UvcGtnY29uZi8wMDAyLVJldmVydC1tYWluLWFzc3VtZS1tb2R2
ZXJzaW9uLWluc3RlZC1vZi12ZXJzaW9uLWlmLW8ucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4g
IHBhY2thZ2UvcGtnY29uZi9wa2ctY29uZmlnLmluIFNoZWxsY2hlY2sKPiAgcGFja2FnZS9wb2tl
LzAwMDEtY29uZmlndXJlLmFjLUhFTFAyTUFOLXJlcGxhY2UtYnktdHJ1ZS13aGVuLWNyb3NzLWNv
bS5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAtcGFja2FnZS9wb2tlLzAwMDItbGliLWdldHJh
bmRvbS5jLWZpeC1idWlsZC13aXRoLXVjbGliYy0xLjAuMzUucGF0Y2ggbGliX3BhdGNoLlVwc3Ry
ZWFtCj4gIHBhY2thZ2UvcG9saWN5Y29yZXV0aWxzLzAwMDEtQWRkLURFU1RESVItdG8tYWxsLXBh
dGhzLXRoYXQtdXNlLWFuLWFic29sdXRlLXBhdGgucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4g
IHBhY2thZ2UvcG9saWN5Y29yZXV0aWxzLzAwMDItQWRkLVBSRUZJWC10by1ob3N0LXBhdGhzLnBh
dGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL3Bvc3RncmVzcWwvUzUwcG9zdGdyZXNx
bCBsaWJfc3lzdi5WYXJpYWJsZXMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb2tlLzAwMDEtY29u
ZmlndXJlLmFjLUhFTFAyTUFOLXJlcGxhY2UtYnktdHJ1ZS13aGVuLWNyb3NzLWNvbS5wYXRjaCBi
L3BhY2thZ2UvcG9rZS8wMDAxLWNvbmZpZ3VyZS5hYy1IRUxQMk1BTi1yZXBsYWNlLWJ5LXRydWUt
d2hlbi1jcm9zcy1jb20ucGF0Y2gKPiBpbmRleCA4NWE3NmUwNjhlNi4uZmI1NjA0ZDgwZWYgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9wb2tlLzAwMDEtY29uZmlndXJlLmFjLUhFTFAyTUFOLXJlcGxh
Y2UtYnktdHJ1ZS13aGVuLWNyb3NzLWNvbS5wYXRjaAo+ICsrKyBiL3BhY2thZ2UvcG9rZS8wMDAx
LWNvbmZpZ3VyZS5hYy1IRUxQMk1BTi1yZXBsYWNlLWJ5LXRydWUtd2hlbi1jcm9zcy1jb20ucGF0
Y2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtRnJvbSA1MWZiODEyNjQzMjNmMDFhODZkZDBiZGVhZjFj
N2EwNDRhOWNiNmRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tIGE3ZTI5ZjczZGFi
NWY5YmQ0ZmM3YTI0MDdmMWVkMjAyMmM0ZmYxMDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4g
IEZyb206IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAgRGF0ZTogRnJp
LCAzMCBBcHIgMjAyMSAxNTo0Mzo1OSArMDIwMAo+ICBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3Vy
ZS5hYzogSEVMUDJNQU4gcmVwbGFjZSAnOicgYnkgJ3RydWUnIHdoZW4KPiBAQCAtMTIsMTUgKzEy
LDE3IEBAIEF2b2lkOgo+ICAuLi9ydW46IGxpbmUgNTE6IGV4ZWM6IDo6IG5vdCBmb3VuZAo+ICAK
PiAgU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+
ICtbSnVsaWVuOiByZWZyZXNoZWQgdGhlIHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBmdXp6IGZh
Y3RvciAwXQo+ICtTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+
ICAtLS0KPiAgIGNvbmZpZ3VyZS5hYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICAKPiAgZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBi
L2NvbmZpZ3VyZS5hYwo+IC1pbmRleCBhMTk0M2I1Ny4uYzYzM2Y3MTkgMTAwNjQ0Cj4gK2luZGV4
IDcxYjRkODYuLjY0ODdiNTcgMTAwNjQ0Cj4gIC0tLSBhL2NvbmZpZ3VyZS5hYwo+ICArKysgYi9j
b25maWd1cmUuYWMKPiAtQEAgLTkwLDcgKzkwLDcgQEAgZ2xfTElCVEVYVFNUWUxFX09QVElPTkFM
KFswLjIwLjVdKQo+ICtAQCAtODgsNyArODgsNyBAQCBnbF9MSUJURVhUU1RZTEVfT1BUSU9OQUwo
WzAuMjAuNV0pCj4gICBpZiB0ZXN0ICRjcm9zc19jb21waWxpbmcgPSBubzsgdGhlbgo+ICAgICBB
TV9NSVNTSU5HX1BST0coSEVMUDJNQU4sIGhlbHAybWFuKQo+ICAgZWxzZQo+IEBAIC0yOCw3ICsz
MCw3IEBAIGluZGV4IGExOTQzYjU3Li5jNjMzZjcxOSAxMDA2NDQKPiAgKyAgSEVMUDJNQU49dHJ1
ZQo+ICAgZmkKPiAgIAo+IC0gZG5sIHJlY2ZpeCBpcyBwYXJ0IG9mIHRoZSBHTlUgcmVjdXRpbHMg
c3VpdGUsIGFuZCBpcyB1c2VkIGluIGNmZy5tayB0bwo+ICsgZG5sIFRoZSBmb2xsb3dpbmcgQXV0
b21ha2UgY29uZGl0aW9uYWwgaXMgdXNlZCBpbiBzb21lIE1ha2VmaWxlLmFtIGZpbGVzCj4gIC0t
IAo+IC0yLjMxLjEKPiArMi40NS4yCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Bva2UvMDAw
Mi1saWItZ2V0cmFuZG9tLmMtZml4LWJ1aWxkLXdpdGgtdWNsaWJjLTEuMC4zNS5wYXRjaCBiL3Bh
Y2thZ2UvcG9rZS8wMDAyLWxpYi1nZXRyYW5kb20uYy1maXgtYnVpbGQtd2l0aC11Y2xpYmMtMS4w
LjM1LnBhdGNoCj4gaW5kZXggYmQyMGI1ZDJjNmYuLmRiMTI1MDgxMGQyIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvcG9rZS8wMDAyLWxpYi1nZXRyYW5kb20uYy1maXgtYnVpbGQtd2l0aC11Y2xpYmMt
MS4wLjM1LnBhdGNoCj4gKysrIGIvcGFja2FnZS9wb2tlLzAwMDItbGliLWdldHJhbmRvbS5jLWZp
eC1idWlsZC13aXRoLXVjbGliYy0xLjAuMzUucGF0Y2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAtRnJv
bSAyMzZiMDE5YjgzMjI4ZDJlMzdmYTA3NjM1ZmI2ODY0ZWQ3ZGM1ZmFkIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+ICtGcm9tIDA5NzU4ZWJiMTkxZGE2NTk1NjNiNGMzMzMzNDI5NWNlMjFlY2Fl
NzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gIEZyb206IEZhYnJpY2UgRm9udGFpbmUgPGZv
bnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICBEYXRlOiBUaHUsIDEgQXByIDIwMjEgMDc6NDk6
NDYgKzAyMDAKPiAgU3ViamVjdDogW1BBVENIXSBsaWIvZ2V0cmFuZG9tLmM6IGZpeCBidWlsZCB3
aXRoIHVjbGliYyA8IDEuMC4zNQo+IEBAIC0yNSw2ICsyNSw5IEBAIEZpeGVzOgo+ICAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zMDEwNTA5NGUzOTM3NGVjNmQ0ZTQ3
ZTJmYjVlOTk2OTZmN2Y3OTgxCj4gIAo+ICBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5l
IDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiArVXBzdHJlYW06IE5vdCBhcHBsaWNhYmxl
IChCdWlsZHJvb3Qgc3BlY2lmaWMpCj4gK1tKdWxpZW46IHJlZnJlc2hlZCB0aGUgcGF0Y2ggdG8g
YmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1NpZ25lZC1vZmYtYnk6IEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gIC0tLQo+ICAgZ2wtbGlicG9rZS9nZXRyYW5kb20uYyAg
ICAgICAgICB8IDEgKwo+ICAgZ2wvZ2V0cmFuZG9tLmMgICAgICAgICAgICAgICAgICB8IDEgKwo+
IEBAIC0zMiw3ICszNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPiAgCj4gIGRpZmYgLS1naXQgYS9nbC1saWJwb2tlL2dldHJhbmRvbS5jIGIvZ2wtbGlicG9r
ZS9nZXRyYW5kb20uYwo+IC1pbmRleCBlMTQ2ODczLi4zOTQ4ZDhkIDEwMDY0NAo+ICtpbmRleCAx
OWJiMzQyLi4wMjUxZTBmIDEwMDY0NAo+ICAtLS0gYS9nbC1saWJwb2tlL2dldHJhbmRvbS5jCj4g
ICsrKyBiL2dsLWxpYnBva2UvZ2V0cmFuZG9tLmMKPiAgQEAgLTE5LDYgKzE5LDcgQEAKPiBAQCAt
NDQsNyArNDcsNyBAQCBpbmRleCBlMTQ2ODczLi4zOTQ4ZDhkIDEwMDY0NAo+ICAgCj4gICAjaW5j
bHVkZSA8ZXJybm8uaD4KPiAgZGlmZiAtLWdpdCBhL2dsL2dldHJhbmRvbS5jIGIvZ2wvZ2V0cmFu
ZG9tLmMKPiAtaW5kZXggZTE0Njg3My4uMzk0OGQ4ZCAxMDA2NDQKPiAraW5kZXggMTliYjM0Mi4u
MDI1MWUwZiAxMDA2NDQKPiAgLS0tIGEvZ2wvZ2V0cmFuZG9tLmMKPiAgKysrIGIvZ2wvZ2V0cmFu
ZG9tLmMKPiAgQEAgLTE5LDYgKzE5LDcgQEAKPiBAQCAtNTYsNyArNTksNyBAQCBpbmRleCBlMTQ2
ODczLi4zOTQ4ZDhkIDEwMDY0NAo+ICAgCj4gICAjaW5jbHVkZSA8ZXJybm8uaD4KPiAgZGlmZiAt
LWdpdCBhL2ppdHRlci9nbnVsaWItbG9jYWwvZ2V0cmFuZG9tLmMgYi9qaXR0ZXIvZ251bGliLWxv
Y2FsL2dldHJhbmRvbS5jCj4gLWluZGV4IGUxNDY4NzMuLjM5NDhkOGQgMTAwNjQ0Cj4gK2luZGV4
IDE5YmIzNDIuLjAyNTFlMGYgMTAwNjQ0Cj4gIC0tLSBhL2ppdHRlci9nbnVsaWItbG9jYWwvZ2V0
cmFuZG9tLmMKPiAgKysrIGIvaml0dGVyL2dudWxpYi1sb2NhbC9nZXRyYW5kb20uYwo+ICBAQCAt
MTksNiArMTksNyBAQAo+IEBAIC02OCw1ICs3MSw1IEBAIGluZGV4IGUxNDY4NzMuLjM5NDhkOGQg
MTAwNjQ0Cj4gICAKPiAgICNpbmNsdWRlIDxlcnJuby5oPgo+ICAtLSAKPiAtMi4zMS4xCj4gKzIu
NDUuMgo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
