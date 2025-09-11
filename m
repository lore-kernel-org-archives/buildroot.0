Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE6CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB7384ABE;
	Thu, 11 Sep 2025 19:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HJQXHAKpxPA; Thu, 11 Sep 2025 19:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41739849B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41739849B6;
	Thu, 11 Sep 2025 19:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C93F0443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5EC86F512
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T9g3pfIyZlJ for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA0706F4E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0706F4E3
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA0706F4E3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:26:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so1387784a12.2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618814; x=1758223614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UD4Tam4ntlyg+tnDGATdzCEEoXWd2i1Ct+cI+aUH7k=;
 b=eBKg75QBR8av2rWerR+p4XBSfFTD4qMyB2+lncFWHmXPwgm3QIcIPeeTmpapPR+g+R
 qfUt6v3xlvDmRUF7paU3ydbx6a1bJZFXwyWKB5p0tghM0xEPC1AGoVbHe2a6J1ncphL6
 5Sl0MX6pMdGOs7SmNhs0Vyves4ruInZ47YCAv8S1/GG5COnjIXV3pfJDowbRYZpn2Gu1
 oNvFcwWdUP3IZu/pifn4tqU/pX0nCo7CyL0T6MbUGIWq7+1if66KGZRvyQFG8vvZyO52
 VlnafJxZRNupUI/5lR1YZ3YIQceFeP5ZQ/QQZxuyi7lHgDe7CZVkvlKkk+0hITXY6KMf
 SNkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlcWgCBBKzHc3tc/cobYHyC/jOxOZ/ZtzCtcoquXJM9GAspBpu3hlD60IPji3VQnPlTQkxToJDStQ=@buildroot.org
X-Gm-Message-State: AOJu0Yzf1j8RdCLYaiITfSFLr/DcJfs/JtLXrEXvTCZ0dCVkrdE7VHtv
 ApCC235O5MK8ZBDiFzN1jvCl+J3Ovr5vvVSm9TU18AgKmYLWAned5eN7/nkx+TtlV6U=
X-Gm-Gg: ASbGncvyLSgDP25J0PUBbH2swzZ5SRvYvdhW1Nk4bH6rch1Z/yvVwGoeOTxJspP5djE
 rkc+W8UpwgRkCn1KywiaE+00bPDfJQSKMYPfS0+nWKo1x7JgykGSghjxXuqebPvboMIIxdXJYX1
 AIg0QcZFIlJwUHTtG7zqG7/OHikquVyPQ/WwZS/GaRtm+mOaJ56+DKLM1O9840IHBBL1yKxOC81
 btpDt/6MYAyEibia59LPeNPRZtSA+PVAJG/EapuPpGiEnQRJPOE/U+IagUEfWpDfcfa71lGJfTO
 ibHFRxXM8ZYzKDOtJ41ps2ljilJAcNvkwzrvFlVVnqawnmd79lMG3LkKhBxvWul9aZfuFVHlPh0
 83OA3rwR3j9rxN1Bbt+kSjiIhe+V2An8zUCXI
X-Google-Smtp-Source: AGHT+IGs/ZwljL2HlZgKerLYeS9x0ErxNDgjRWO7srxHtX1L6b31jM7BxkfAWHaGmtPbGWBybfi08Q==
X-Received: by 2002:a05:6402:5114:b0:62c:6a07:97d7 with SMTP id
 4fb4d7f45d1cf-62ed82c4019mr647194a12.34.1757618813757; 
 Thu, 11 Sep 2025 12:26:53 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33a51fdsm1692285a12.7.2025.09.11.12.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:26:53 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:26:30 +0200
Message-Id: <20250911192630.2672691-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250906172419.3848350-1-romain.naour@smile.fr>
References: <20250906172419.3848350-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618814; x=1758223614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UD4Tam4ntlyg+tnDGATdzCEEoXWd2i1Ct+cI+aUH7k=;
 b=F9qThsV9/DL//ybq9jCBmxN/O6zKBUuYlM+M70LT7YEisEqKOaP+xyNHTl/nLPajo1
 7nke9ZKtuKVXeuTwsqkG57Rfe3dMYGvPrM+n9MNiD9K5J0nxNjL9QOlFr8I1N8xlLidn
 SmpqkB64qzVm6sNoCmGPRPYMlR/AqUCvuAJUR32HURMUKTQiMgZlCb+u8DIFHXxy7Lxg
 13Ckwp6xTyfUn5WRUe4eLdv1X2mI3w6D1F0AkT8GnW8X34e2OOEiBQxBPErIv8nFuzXn
 sx39i9tpEgOJnC8dfVQEoXkLSMaYBGlBeFjmgAZDo/U1fo+i3BK2XmAdwGSAbJntu8V0
 wzAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F9qThsV9
Subject: Re: [Buildroot] [PATCH] package/lua-utf8: fix missing header
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQmFja3BvcnQgYW4gdXBzdHJlYW0gcGF0Y2ggYWRkaW5nIG1pc3Npbmcg
bGltaXRzLmguCj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8xMTE3Njc3NDYzMCAoVGVzdEx1YWppdFV0ZjgpCj4gCj4gU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpBcHBsaWVkIHRvIDIwMjUuMDIu
eCAmIDIwMjUuMDUueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi5kZS1saW1pdHMuaC1pbnN0ZWFkLW9m
LXRyYW5zaXRpdmVseS0ucGF0Y2ggfCA1OCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2x1
YS11dGY4LzAwMDEtRXhwbGljaXRseS1pbmNsdWRlLWxpbWl0cy5oLWluc3RlYWQtb2YtdHJhbnNp
dGl2ZWx5LS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YS11dGY4LzAwMDEtRXhw
bGljaXRseS1pbmNsdWRlLWxpbWl0cy5oLWluc3RlYWQtb2YtdHJhbnNpdGl2ZWx5LS5wYXRjaCBi
L3BhY2thZ2UvbHVhLXV0ZjgvMDAwMS1FeHBsaWNpdGx5LWluY2x1ZGUtbGltaXRzLmgtaW5zdGVh
ZC1vZi10cmFuc2l0aXZlbHktLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5mODc5MzBlNmE5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbHVh
LXV0ZjgvMDAwMS1FeHBsaWNpdGx5LWluY2x1ZGUtbGltaXRzLmgtaW5zdGVhZC1vZi10cmFuc2l0
aXZlbHktLnBhdGNoCj4gQEAgLTAsMCArMSw1OCBAQAo+ICtGcm9tIGZlZGEzOGM2YjdlZjRjNTY0
Zjc3MjEzMDM3ZGMyMDc2OGM2MzhkOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206
IENhbGViIE1hY2xlbm5hbiA8Y2FsZWJAYWxlcnF1ZS5jb20+Cj4gK0RhdGU6IFRodSwgMiBKYW4g
MjAyNSAxNTo0MjowNSArMDMwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEV4cGxpY2l0bHkgaW5jbHVk
ZSBsaW1pdHMuaCBpbnN0ZWFkIG9mIHRyYW5zaXRpdmVseSBhc3N1bWluZwo+ICsgaXQKPiArTUlN
RS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK1JlY2VudCB1cHN0cmVh
bSByZWxlYXNlcyBvZiBMdWFKSVQgaGF2ZSBicm9rZW4gYnVpbGRpbmcgdGhpcyBMdWEgUm9jawo+
ICtlbnRpcmVseS4gUFVDIEx1YSBhbmQgTHVhSklUIGJ1aWxkcyB1cCB0byBhIGNlcnRhaW4gcG9p
bnQgaW5jbHVkZWQgdGhpcwo+ICtoZWFkZXIgaW4gbHVhLmgsIHdoaWNoIG1lYW50IHRoYXQgaXQg
d2FzIGFsd2F5cyBhcm91bmQgYXMgYSB0cmFuc2l0aXZlCj4gK2RlcGVuZGVuY3kuIFJlY2VudCB1
cHN0cmVhbSBMdWFKSVQgYnVpbGRzIG5vIGxvbmdlciBpbmNsdWRlIHRoZSBoZWFkZXIKPiArc2lu
Y2UgdGhleSBhcmVuJ3QgdXNpbmcgaXQgZGlyZWN0bHkgYW55IG1vcmUsIGJ1dCB0aGF0IG1lYW5z
IHRoaW5ncyB0aGF0Cj4gK2luY2x1ZGUgbHVhLmggZG9uJ3QgZ2V0IGl0IGZvciBmcmVlIGFueSBt
b3JlLiBJdCBzaG91bGQgbmV2ZXIgaGF2ZSBiZWVuCj4gK2Fzc3VtZWQgYW55d2F5LCBidXQgdGhh
dCdzIGJlZW4gdGhlIHN0YXR1cyBxdW8gZm9yIGEgd2hpbGUuCj4gKwo+ICtUaGlzIGZpeGVzIGJ1
aWxkIGVycm9ycyB3aGVuIHVzaW5nIEx1YUpJVCBoZWFkZXJzIGluc3RlYWQgb2YgUFVDIEx1YToK
PiArCj4gK2BgYAo+ICtsdXRmOGxpYi5jOiBJbiBmdW5jdGlvbiDigJhMdXRmOF9jb2RlcG9pbnTi
gJk6Cj4gK2x1dGY4bGliLmM6Mzk4OjIyOiBlcnJvcjog4oCYSU5UX01BWOKAmSB1bmRlY2xhcmVk
IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiArICAzOTggfCAgIGlmIChwb3NlIC0gcG9z
aSA+PSBJTlRfTUFYKSAgLyogKGx1YV9JbnRlZ2VyIC0+IGludCkgb3ZlcmZsb3c/ICovCj4gKyAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+ICtsdXRmOGxpYi5jOjEyOjE6IG5v
dGU6IOKAmElOVF9NQVjigJkgaXMgZGVmaW5lZCBpbiBoZWFkZXIg4oCYPGxpbWl0cy5oPuKAmTsg
ZGlkIHlvdSBmb3JnZXQgdG8g4oCYI2luY2x1ZGUgPGxpbWl0cy5oPuKAmT8KPiArICAgMTEgfCAj
aW5jbHVkZSAidW5pZGF0YS5oIgo+ICsgICsrKyB8KyNpbmNsdWRlIDxsaW1pdHMuaD4KPiArICAg
MTIgfAo+ICtsdXRmOGxpYi5jOjM5ODoyMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4K
PiArICAzOTggfCAgIGlmIChwb3NlIC0gcG9zaSA+PSBJTlRfTUFYKSAgLyogKGx1YV9JbnRlZ2Vy
IC0+IGludCkgb3ZlcmZsb3c/ICovCj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fgo+ICtgYGAKPiArCj4gK1RoaXMgaXMgYmVjYXVzZSBgSU5UX01BWGAgaXMgZGVmaW5lZCBh
cHByb3ByaWF0ZWx5IGZvciBhIGdpdmVuIHBsYXRmcm9tCj4gK2luIGluIGxpbWl0cy5oLgo+ICsK
PiArVXBzdHJlYW06IDFiYjcwZDQ1MjA4ZDQwMzNkY2M3NWVmZWU5NjhiZTcwNTM0ZGQzYWIKPiAr
W1JvbWFpbjogcmViYXNlIG9uIDAuMS41XQo+ICtTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiArLS0tCj4gKyBsdWF1dGY4LTAuMS41L2x1dGY4bGli
LmMgfCAxICsKPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ICsKPiArZGlmZiAt
LWdpdCBhL2x1YXV0ZjgtMC4xLjUvbHV0ZjhsaWIuYyBiL2x1YXV0ZjgtMC4xLjUvbHV0ZjhsaWIu
Ywo+ICtpbmRleCA1MjI1OTllLi43MWYyZjQyIDEwMDY0NAo+ICstLS0gYS9sdWF1dGY4LTAuMS41
L2x1dGY4bGliLmMKPiArKysrIGIvbHVhdXRmOC0wLjEuNS9sdXRmOGxpYi5jCj4gK0BAIC03LDYg
KzcsNyBAQAo+ICsgI2luY2x1ZGUgPGFzc2VydC5oPgo+ICsgI2luY2x1ZGUgPHN0cmluZy5oPgo+
ICsgI2luY2x1ZGUgPHN0ZGludC5oPgo+ICsrI2luY2x1ZGUgPGxpbWl0cy5oPgo+ICsgCj4gKyAj
aW5jbHVkZSAidW5pZGF0YS5oIgo+ICsgCj4gKy0tIAo+ICsyLjUxLjAKPiArCj4gLS0gCj4gMi41
MS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
