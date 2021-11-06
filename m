Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CAEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 09:59:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50AC611EE
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 09:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B50AC611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46DCC825CA;
	Sat,  6 Nov 2021 09:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9a5OH_7z90R; Sat,  6 Nov 2021 09:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915F1825C3;
	Sat,  6 Nov 2021 09:59:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FEBF1BF286
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 09:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E37B26071C
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 09:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuyckDw-Gxuv for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 09:59:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E392060712
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 09:59:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 1so19214002ljv.2
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jGWQAe6pEcIucfmEwHdq0wh1q+X82KPnMIR6s2XtisQ=;
 b=P/Rw8oZsZVJgsrVA66ckF3uCMG3VPG6vS2wzCiioI8sN3TCQlFtfJyIVOQMzheIQ6F
 cK8+J5XaY7iNx7Hj+HUnfdhbqF5q0hS9bj2kgavRXpmE8QD+npVVVXlbZTsgTIMCCRhG
 6Dy9H+Ur6o7Sh2rqSWRoPYjKdTtot1tHeIm85mbcplufVzTzHhHJIS5RdvV/w/0GOs98
 mewqT9Kj95VHgQp6/FLMugHvMaCchzNVgc6vDN8oj0RP4h1rMNGhQoJoY/hxwcExkS2S
 mTwPB19MPMgEol2FfMHxi00rJzo+9PePfo/fVInsHvjr1AiJlQU/Y1MjaEZNKlKD+mHD
 0cKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jGWQAe6pEcIucfmEwHdq0wh1q+X82KPnMIR6s2XtisQ=;
 b=hepTeU6fkP4PHrS6myyooPauOwlPsUfXt05BEU1Pro/BzM/HxeFLvazaimhsTmC8Pu
 UNPIT4XQ8mQ8Jsbu8eqirlGZNq4gyGYEWMGMf5JBNJfgwG80E3CiGLn9AdsqtWilrHz2
 5s6QV6wRnAb7yqEp960ier3hqc6K6p8kyflJA0asQKFxcQe+T5L/hzUyCPShzq3mN++2
 ISYSQLdhdEoujjIrPs3jrDgH7glt5ZPSZVPffT49xBqsHJSK5FFSENC8OO5PoJLUnr07
 GthqmfPNQSZ64Ki/wsA9ggy8QhLP7IciTww5+yKVYpQEtsg8dRoLDcI3Fb7fSEJlcIqb
 9tmw==
X-Gm-Message-State: AOAM533+GPMT8kg2HUrbaPHPC8c6vWbCH1/it3IeDNzl21sfUFL00rBy
 qFM+r/+oabcdzrOlElVAxy1W9F/LTfJN7AooxPE=
X-Google-Smtp-Source: ABdhPJyMrDhj1k4Q53bamjkePZ84v1EFVnvD33Krm+G6EneAKvcWcM+a4pSHvXJR8vrGoWIWEcH75/wrwUG6ykCK4nM=
X-Received: by 2002:a2e:4949:: with SMTP id b9mr66790252ljd.240.1636192767675; 
 Sat, 06 Nov 2021 02:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211105213116.2589815-1-fontaine.fabrice@gmail.com>
 <20211105214147.GJ2400@scaer>
In-Reply-To: <20211105214147.GJ2400@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 6 Nov 2021 10:57:32 +0100
Message-ID: <CAPi7W80XGyOhD8NSakrO2+i27yi2Rqz6jtdXo4374Y0OWCm2Ow@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libteam: drop
 LIBTEAM_CPE_ID_VENDOR
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSB2ZW4uIDUgbm92LiAyMDIxIMOgIDIyOjQxLCBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24gMjAy
MS0xMS0wNSAyMjozMSArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiBM
SUJURUFNX0NQRV9JRF9WRU5ET1Igd2FzIHdyb25nbHkgc2V0IHNpbmNlIHRoZSBhZGRpdGlvbiBv
ZiB0aGUgcGFja2FnZQo+ID4gaW4gY29tbWl0IDc0ODVmNWJlMGM0NjA2NDllNzQwNjY5OWNkZTgy
YmI0OTJhYTIzZjEgYXMKPiA+IGNwZToyLjM6YTpsaWJ0ZWFtOmxpYnRlYW0gaXMgbm90IGEgdmFs
aWQgQ1BFIGlkZW50aWZpZXIgZm9yIHRoaXMKPiA+IHBhY2thZ2U6Cj4gPiAgIGh0dHBzOi8vbnZk
Lm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4zJmtl
eXdvcmQ9Y3BlJTNBMi4zJTNBYSUzQWxpYnRlYW0lM0FsaWJ0ZWFtCj4KPiBJIGhhZG4ndCBwdXNo
ZWQgdGhhdCBmb3IgbW9yZSB0aGFuIDMwIG1pbnV0ZXMgdGhhdCB5b3UgYWxyZWFkeQo+IG5vdGlj
ZWQuIFdvby4uLiBTY3JheSEgOy0pCj4KPiBIb3cgZGlkIHlvdSBjYXRjaCB0aGlzPwpJJ20gbWFu
dWFsbHkgY2hlY2tpbmcgdGhlIENQRSBvZiBlYWNoIG5ldyBwYWNrYWdlLgo+Cj4gSG93IGNhbiB3
ZSBlYXNpbHkgdmFsaWRhdGUgdGhhdCBhIENQRSBpcyBpbmRlZWQgdmFsaWQgKHNob3J0IG9mIHJ1
bm5pbmcKPiB0aGUgZnVsbCBwa2ctc3RhdHMpPwpXZSBjb3VsZCB1cGRhdGUgY2hlY2stcGFja2Fn
ZSwgdGhlIHNpbXBsZXN0IG9wdGlvbiB3b3VsZCBiZSB0byBhZGQgYSBjYWxsIHRvCmh0dHBzOi8v
bnZkLm5pc3QuZ292L3Byb2R1Y3RzL2NwZS9zZWFyY2gvcmVzdWx0cz9uYW1pbmdGb3JtYXQ9Mi4z
JmtleXdvcmQ9M0FDUEVfSURfUFJFRklYOkNQRV9JRF9WRU5ET1I6Q1BFX0lEX1BST0RVQ1QKCklm
IHRoaXMgY2FsbCByZXR1cm5zIG5vIGVudHJpZXMsIHdlIGNhbiBiZSBjb25maWRlbnQgdGhhdCB0
aGUgQ1BFCnZhcmlhYmxlcyBhcmUgaW52YWxpZCAoYmVjYXVzZSB0aGUgdXNlciBtYWRlIGFuIGVy
cm9yIG9yIGJlY2F1c2UgdGhlCk5WRCBOSVNUIGRhdGFiYXNlIHdhcyB1cGRhdGVkKS4KSG93ZXZl
ciwgYW4gSFRUUCByZXF1ZXN0IHdpbGwgYmUgc2VudCBmb3IgZXZlcnkgcGFja2FnZSB3aXRoIGEK
dXNlci1naXZlbiBDUEUgdmFyaWFibGUgLi4uClRoZSBvdGhlciBvcHRpb24gd291bGQgYmUgdG8g
bXV0dWFsaXplIHRoZSBmdW5jdGlvbnMgdXNlZCBieSBwa2ctc3RhdHMKdG8gZG93bmxvYWQgdGhl
IGZ1bGwgQ1BFIGRpY3Rpb25hcnkuCj4KPiBKb2FjaGltLCB3aGF0IG1hZGUgeW91IHRoaW5rIGxp
YnRlYW0gd2FzIGFwcHJvcHJpYXRlPwo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IC0tLQo+ID4gIHBhY2th
Z2UvbGlidGVhbS9saWJ0ZWFtLm1rIHwgMSAtCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ0ZWFtL2xpYnRlYW0ubWsgYi9w
YWNrYWdlL2xpYnRlYW0vbGlidGVhbS5tawo+ID4gaW5kZXggOTk0NTRhMDNlNS4uOGJkODNhYTIw
ZCAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGlidGVhbS9saWJ0ZWFtLm1rCj4gPiArKysgYi9w
YWNrYWdlL2xpYnRlYW0vbGlidGVhbS5tawo+ID4gQEAgLTYsNyArNiw2IEBACj4gPgo+ID4gIExJ
QlRFQU1fVkVSU0lPTiA9IDEuMzEKPiA+ICBMSUJURUFNX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGpw
aXJrbyxsaWJ0ZWFtLHYkKExJQlRFQU1fVkVSU0lPTikpCj4gPiAtTElCVEVBTV9DUEVfSURfVkVO
RE9SID0gbGlidGVhbQo+ID4gIExJQlRFQU1fTElDRU5TRSA9IExHUEwtMi4xKwo+ID4gIExJQlRF
QU1fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiA+ICBMSUJURUFNX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcGtnY29uZiBqYW5zc29uIGxpYmRhZW1vbiBsaWJubAo+ID4gLS0KPiA+IDIuMzMuMAo+ID4K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAt
LQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMs
CgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
