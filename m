Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC96C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 04:29:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C94610C7
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 04:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4C94610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C2140385;
	Mon, 18 Oct 2021 04:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2B0iULrTy2sF; Mon, 18 Oct 2021 04:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D064038C;
	Mon, 18 Oct 2021 04:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6689A1BF2C5
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 04:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53396403C1
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 04:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EuaPTavipMl for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 04:29:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3655403B8
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 04:29:24 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id u5so4512179uao.13
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F9gwHcSZw49BUAelU1/1YJB3hkAlyq9WpzA5dPJ8aho=;
 b=FSyJMijDiLvrdk39PAvJTldKXhdOc3uWVQbvT0IpoYRmFTnVWHrjXE9E5kVWEXTLVi
 BKy9KoiKgoslDlyTQjWN9JBpjFT8DRGCEAuB9WMSkP4TAstlHqh3xVLK3+HHfoUJxYxA
 iakruI1epOpXeB3hZ1hzTJegUAmD8woH3/yC8WxHN0pruL88SxxpMUSk3pyVtQDDG1DI
 0TNJQAJ7Wpj3ETIZcjUWC/u+MwmXUx/jVbyEt/cBedc5zbwM8mJG23LxqorCAY4duuBT
 MowdytH+sUBd2CfeKqjucd08vurwDn92zyvcK54A0hQiPAH968F+BE8Z6lVE8GPbTg8g
 kscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F9gwHcSZw49BUAelU1/1YJB3hkAlyq9WpzA5dPJ8aho=;
 b=28gXz7br/OGCJYSWeqUUwewktMC85XESk2axcmULj5iP7m/kXAH+ZfIZ3tT5cppxqz
 A7JHEAJUO6os+LtSue18q2ulw+6EeQBToIIoTnW3wDP3GV7cr5A3c4JnBsFIr5fl3QKl
 uMVwIFU0LLe7W8eaZV96qB/Hh9L5V9FKVBzonsSM06BBpNXFWIbQVFknuNWb/wEk89dE
 MAz4P/LBHA2/PErO3h/otKuyNlpEa4BrKS2vqKFANsk8oeebVYtLxAwpdclILi5pEL2E
 cae1ICcPIo+x3em616pRsuPTf04m+t9+LAtX2RRx/U4v6AqLNqD2PKXiMvLLMOyIr/5n
 z/yA==
X-Gm-Message-State: AOAM533AYGkrEF4vkJ49LvLaYxJ/VIayfYuXaQSH/eGQw+v4HlhoGpo/
 Ql0KuSuoBjpj8muzyCP5kVgNTkegJKEqLw==
X-Google-Smtp-Source: ABdhPJwOarPGUZPWW+i7SvsnuhU6g7li8hojmWUtucWUcVWLJs8lolwfWzzcQCC2wqdxgtt0/RE0Ig==
X-Received: by 2002:ab0:381:: with SMTP id 1mr23489387uau.23.1634531362991;
 Sun, 17 Oct 2021 21:29:22 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id c5sm8093492vsl.30.2021.10.17.21.29.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 21:29:22 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a17so3957146uax.12
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 21:29:22 -0700 (PDT)
X-Received: by 2002:a67:2f0d:: with SMTP id v13mr25341131vsv.18.1634531362272; 
 Sun, 17 Oct 2021 21:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211015125944.10587-1-peter@korsgaard.com>
 <20211015125944.10587-2-peter@korsgaard.com>
In-Reply-To: <20211015125944.10587-2-peter@korsgaard.com>
Date: Sun, 17 Oct 2021 21:29:11 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oDWAxmNj5PtGLL1BhnNx6YFd8dJmCSTAPLQNe=EkOB-w@mail.gmail.com>
Message-ID: <CA+h8R2oDWAxmNj5PtGLL1BhnNx6YFd8dJmCSTAPLQNe=EkOB-w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/docker-engine: security bump to
 version 20.10.9
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AcGFyYWwuaW4+CgpPbiBG
cmksIE9jdCAxNSwgMjAyMSBhdCA1OjU5IEFNIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dh
YXJkLmNvbT4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoK
Pgo+IC0gQ1ZFLTIwMjEtNDEwODk6ICBDcmVhdGUgcGFyZW50IGRpcmVjdG9yaWVzIGluc2lkZSBh
IGNocm9vdCBkdXJpbmcgZG9ja2VyCj4gICBjcCB0byBwcmV2ZW50IGEgc3BlY2lhbGx5IGNyYWZ0
ZWQgY29udGFpbmVyIGZyb20gY2hhbmdpbmcgcGVybWlzc2lvbnMgb2YKPiAgIGV4aXN0aW5nIGZp
bGVzIGluIHRoZSBob3N04oCZcyBmaWxlc3lzdGVtLgo+Cj4gLSBDVkUtMjAyMS00MTA5MTogTG9j
ayBkb3duIGZpbGUgcGVybWlzc2lvbnMgdG8gcHJldmVudCB1bnByaXZpbGVnZWQgdXNlcnMKPiAg
IGZyb20gZGlzY292ZXJpbmcgYW5kIGV4ZWN1dGluZyBwcm9ncmFtcyBpbiAvdmFyL2xpYi9kb2Nr
ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+Cj4gLS0tCj4gIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2ggfCAy
ICstCj4gIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1rICAgfCAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLmhhc2ggYi9wYWNr
YWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoCj4gaW5kZXggMDdhY2I4Nzg2NC4u
NWUxNTg0Mjg1OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVu
Z2luZS5oYXNoCj4gKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUuaGFz
aAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDI1
MDVkMDAwMzJmNWQ0MGVhZDVhYzc3OWMyODQwMzAzZGNlYWQwNDcxM2M5M2JhOTc0YmU0YzE5YjNh
YjhkMGEgIGRvY2tlci1lbmdpbmUtMjAuMTAuOC50YXIuZ3oKPiArc2hhMjU2ICAzNTllODg1NGQw
ZDUxYmM4ODRkNDM0ZjE4MmY2NGNhNjJmMjVmYmJlN2I5YzZhMzM2ZWIwOWYyMTJmZThjYzlhICBk
b2NrZXItZW5naW5lLTIwLjEwLjkudGFyLmd6Cj4gIHNoYTI1NiAgN2M4Nzg3MzI5MWYyODk3MTNh
YzVkZjQ4YjFmMjAxMGViNjk2Mzc1MmJiZDZiNTMwNDE2YWI5OWZjMzc5MTRhOCAgTElDRU5TRQoK
VGhhbmtzLApDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
