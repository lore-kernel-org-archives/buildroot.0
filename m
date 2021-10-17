Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED439C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:05:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F08960FDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F08960FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78DB9400F9;
	Sun, 17 Oct 2021 20:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdh78oiTBxAb; Sun, 17 Oct 2021 20:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE80C4024A;
	Sun, 17 Oct 2021 20:05:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 493951BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38D8A80E42
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9eaY5l6JPYdH for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:05:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F17FF80E3D
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:05:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso6737795wms.4
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VFwC4tQKnc7Q7Axmf/31GWdU/Vt4HY+aA6/H9nZj7Cg=;
 b=KmqaJiU90cJ8sq2uQ4ZN4u2UHDD7gU7xvnZemJBtkNkXrsj6ppSion77WGUwG8pmsj
 e4AjY/scbopFrNav5XmaQpqKz3k9nrcU3ICQ8/9JTbgrfl5jDYmOaxII6yus8hQgEChc
 h5dGglwl4zmaZtBoEuEgT7zKIoa0/FzBPLYulORbdU1+S+9iQlobIudK4na42KuC9GkD
 XjH22RFdw+lZhHCsLt/RsAdgHzYXUZmunSPutLfv44D1pQiDkyIPqJzBr0NDDcdtd+W5
 JabaRCZq34Op7tzBno0g/ZQSEOcg56rvId8zJUr1dWY1ea4T6vygC6S4+FSNB+QQvIK9
 M3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VFwC4tQKnc7Q7Axmf/31GWdU/Vt4HY+aA6/H9nZj7Cg=;
 b=7FXr+eL372oBu1Mu475ywhlSYHrXjVOB1hEE4aojMq+FOHF/GgHCmijd7vEmf7tgvP
 yiTejfTO3/v4/mPtrcTMJLrnYEX6z0V3X1IVhmSxqOCTRLdV6s/q7sc0znUNWKabfLyZ
 6JqYF2IVJ/3CGk2v+sFC3UgoAY2faJknIqOxJxUXkwzuuoHhje1wxGHfhNkiNGRsClIE
 nAKYYrRPkOXEubWHsa91jlL287jMOURf3K0efIgpeVo38uKWJjQPfxdN1NK7Epfs04uc
 7v1NVm5iTdY4oezaeRyOrvG7XnZyFcgHhGojRfGEfJkfJSQ5WBsnlgcmiBzS4OZ5TW+a
 lHRw==
X-Gm-Message-State: AOAM530/Ed1O/qi503KxtcWuh65P4n7KIftSxAZYmjKAW769cbU2CnGo
 LZrPpDiVQSP8QL/z77lgd5bg9hXJcP0=
X-Google-Smtp-Source: ABdhPJwwQeAlOhmyIFqMCrX/4YbDnrPUQgUfOFu2h3rOE5HExOtzziehf1Z/cMmvdH1z1R+UCxLsxA==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr38892170wmq.164.1634501102139; 
 Sun, 17 Oct 2021 13:05:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l13sm10598927wrn.79.2021.10.17.13.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 13:05:01 -0700 (PDT)
Message-ID: <f35a7a52-cf60-288a-59f5-45fd6081ae89@gmail.com>
Date: Sun, 17 Oct 2021 22:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-13-romain.naour@gmail.com>
 <20211017195136.GL2400@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211017195136.GL2400@scaer>
Subject: Re: [Buildroot] [PATCH 15/16] support/testing: update logical
 eraseblock and physical eraseblock size for qemu >= 2.9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDE3LzEwLzIwMjEgw6AgMjE6NTEsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIxLTA5LTEyIDE2OjExICswMjAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBUaGUgY3VycmVudCB1YmkvdWJpZnMgdGVzdCAodGVz
dF91YmkucHkpIHJlbHkgb24gYSBRZW11IGJ1ZyBwcmVzZW50IGluCj4+IDIuOC4wIHRoYXQgd2Fz
IGZpeGVkIGluIFFlbXUgMi45LjAgWzFdLiBUaGUgdWJpL3ViaWZzIHNldHRpbmdzIGlzCj4+IHVw
ZGF0ZWQgdG8gcnVuIHdpdGggUWVtdSA+PSAyLjkuMCB1c2luZyB0aGUgbmV3IG11bHRpcGxlIGNo
aXAgaGFuZGxpbmcuCj4+Cj4+IElmIG5lZWRlZCwgdGhlIG9sZCBiZWhhdmlvciBjYW4gYmUgZW5h
YmxlZCB1c2luZyB0aGUgcGZsYXNoMDEgcHJvcGVydHkKPj4gIm9sZC1tdWx0aXBsZS1jaGlwLWhh
bmRsaW5nIiBbMl0uCj4+Cj4+IFRoZSBpc3N1ZSB3YXMgbm90IGRldGVjdGVkIHVudGlsIG5vdyBz
aW5jZSB3ZSBhcmUgc2lsbCB1c2luZyBhbiBvbGQKPj4gcWVtdSAoMi44IGZyb20gRGViaWFuIHN0
cmV0Y2gpIGZvciB0ZXN0aW5nIGluIGdpdGxhYiAodXNpbmcgdGhlCj4+IEJ1aWxkcm9vdCBEb2Nr
ZXIgaW1hZ2UgdXNlZCBieSBnaXRsYWItY2kueW1sKS4KPj4KPj4gRmlyc3QgdGhlIGxvZ2ljYWwg
ZXJhc2VibG9jayBzaXplIChMRUIpIG11c3QgYmUgdXBkYXRlZCB0byB0aGUgdmFsdWUKPj4gMHgz
ZmY4MCByZXBvcnRlZCBieSB0aGUga2VybmVsIHdoZW4gdXNpbmcgcWVtdSA+PSAyLjkuMC4KPj4K
Pj4gICBVQklGUyAodWJpMDowKTogTW91bnRpbmcgaW4gdW5hdXRoZW50aWNhdGVkIG1vZGUKPj4g
ICBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxKTogdWJpZnNfcmVhZF9zdXBlcmJsb2NrOiBMRUIg
c2l6ZSBtaXNtYXRjaDogNTI0MTYwIGluIHN1cGVyYmxvY2ssIDI2MjAxNiByZWFsCj4+ICAgVUJJ
RlMgZXJyb3IgKHViaTA6MCBwaWQgMSk6IHViaWZzX3JlYWRfc3VwZXJibG9jazogYmFkIHN1cGVy
YmxvY2ssIGVycm9yIDEKPj4KPj4gQnV0IHRoZSBzeXN0ZW0gaXMgc3RpbGwgZmFpbGluZyB0byBi
b290Ogo+Pgo+PiAgVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMSk6IHViaWZzX3NjYW46IGdhcmJh
Z2UKPj4gIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDEpOiB1Ymlmc19yZWNvdmVyX21hc3Rlcl9u
b2RlOiBmYWlsZWQgdG8gcmVjb3ZlciBtYXN0ZXIgbm9kZQo+Pgo+PiB1YmlmcyBpcyByZWFkaW5n
IGdhcmJhZ2Ugc2luY2UgUWVtdSA+PSAyLjkuMCByZXBvcnQgYSBzZWN0b3IKPj4gbGVuZ3RoIHBl
ciBkZXZpY2UgZGl2aWRlZCBieSB0aGUgbnVtYmVyIG9mIGRldmljZXMgKHNlZSBjb21taXQgWzFd
KS4KPj4KPj4gVGhlIGtlcm5lbCBkZXRlY3QgdHdvIGZsYXNoIGRldmljZXMgKGRtZXNnKToKPj4K
Pj4gICBDb25jYXRlbmF0aW5nIE1URCBkZXZpY2VzOgo+PiAgICgwKTogIjQwMDAwMDAwLmZsYXNo
Igo+PiAgICgxKTogIjQwMDAwMDAwLmZsYXNoIgo+PiAgIGludG8gZGV2aWNlICI0MDAwMDAwMC5m
bGFzaCIKPj4KPj4gRGl2aWRlIHRoZSBwaHlzaWNhbCBlcmFzZWJsb2NrIChQRUIpIHNpemUgYnkg
dHdvLgo+Pgo+PiBUZXN0ZWQgd2l0aCBxZW11IDIuOS4wLCA1LjEuMC4KPj4KPj4gRml4ZXM6Cj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTQzMTAwOTMyCj4+
Cj4+IFsxXSBodHRwczovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWNvbW1pdGRpZmY7aD1m
ZWIwYjFhYTExZjE0ZWU3MTY2MGFiYTQ2YjQ2Mzg3ZDFmOTIzYzllCj4+IFsyXSBodHRwOi8vbGlz
dHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIxLVNlcHRlbWJlci82MjIwNjku
aHRtbAo+IAo+IEkgYW0gbm90IHN1cmUgSSB1bmRlcnN0b29kIHRoYXQgcmVmZXJlbmNlOiB0aGUg
cGF0Y2ggaW4gWzJdIHdhcyBuZXZlcgo+IGFwcGxpZWQsIGl0IGlzIG5vIGxvbmdlciBwcmVzZW50
IGluIHBhdGNod29yaywgYnV0IEkgY291bGQgbm90IGZpbmQgYQo+IGRpc2NzdXVpb24gYWJvdXQg
aXQgZWl0aGVyLi4uIERpZCB5b3Ugd2l0aGRyYXcgdGhhdCBwYXRjaD8KClllcywgdGhlIHBhdGNo
IFsyXSB3YXMgYSBmaXJzdCBhdHRlbXB0IHRvIGZpeCB0aGUgaXNzdWUuClRoYW5rcyB0byB0aGlz
IHBhdGNoLCBpdCdzIG5vdCBuZWVkZWQgYW55bW9yZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAKPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
Pgo+PiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4K
PiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBN
T1JJTi4KPiAKPj4gLS0tCj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVzdF91YmkucHkg
fCA0ICsrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVzdF91Ymku
cHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVzdF91YmkucHkKPj4gaW5kZXggZWViNTVi
MWQ1OS4uN2M2ODdjMTk4MiAxMDA2NDQKPj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Zz
L3Rlc3RfdWJpLnB5Cj4+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy90ZXN0X3ViaS5w
eQo+PiBAQCAtOCwxMCArOCwxMCBAQCBjbGFzcyBUZXN0VWJpKGluZnJhLmJhc2V0ZXN0LkJSVGVz
dCk6Cj4+ICAgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlOX0NPTkZJ
RyArIFwKPj4gICAgICAgICAgIiIiCj4+ICAgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZT
PXkKPj4gLSAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfVUJJRlNfTEVCU0laRT0weDdmZjgwCj4+
ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZTX0xFQlNJWkU9MHgzZmY4MAo+PiAgICAg
ICAgICBCUjJfVEFSR0VUX1JPT1RGU19VQklGU19NSU5JT1NJWkU9MHgxCj4+ICAgICAgICAgIEJS
Ml9UQVJHRVRfUk9PVEZTX1VCST15Cj4+IC0gICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX1VCSV9Q
RUJTSVpFPTB4ODAwMDAKPj4gKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfVUJJX1BFQlNJWkU9
MHg0MDAwMAo+PiAgICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19VQklfU1VCU0laRT0xCj4+ICAg
ICAgICAgICIiIgo+PiAgCj4+IC0tIAo+PiAyLjMxLjEKPj4KPj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
PiBidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
