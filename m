Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC11C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:52:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD12461252
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD12461252
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EBF833C6;
	Sat, 16 Oct 2021 08:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rtQS4IuN3vR; Sat, 16 Oct 2021 08:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C188302F;
	Sat, 16 Oct 2021 08:52:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9696B1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82B00401EF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 944PR5Svbzgw for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF2040124
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:52:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x192so17261828lff.12
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O2HzXThVQcfmx2ZDht3QAGoetWr3nrBShWDqGok3TgM=;
 b=kT2Q6JiP9ErhggnZLd5GUkvY7Y0X8KKISODs971fko4IFWPkfhjvV1UUay/GP7fQ5B
 57OIamOBIg7lYMJj9U9nBatO9aVTifjfc3JWDnlfi/JIQAtP0+dJ4aCYGTr8d/wxX3v8
 Nxn3K7lGSdQGxvURzLP/aCUtW39ddjvumpV0ofc/jlvnHqWFNMuSaL+wyyj/0hFe+Adp
 lgpXkdHBMQ6IwdilzYnSIJJraLzz9Xe3xrQzuQ7huTDgxqvxjPaP8WPFz4amGQPhL4lY
 ZuGgIVelpWXHsN/V3ZKtU8skS+y+l3w0fovXR46dnN6ue1g9zr8XTrSAOqDdSsWqyGCs
 ud1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O2HzXThVQcfmx2ZDht3QAGoetWr3nrBShWDqGok3TgM=;
 b=x7KW4B6Ep/o9Y2sFPU65AFa2GUlRLwr/z3xP+jMT48XmWtbpNo+0R3DxgUAdoHgYuB
 bZhJIUoqmrQpPyBLaFA5/s/abJJ7+cHUwsjGilToKF5lKpCQwyBi3IYi2u6II9CkxTNp
 v1NVABcvE/68y6f3VM5xF8j3Vij4WZl+LQ8hVfJfA7JQvCpWwgmKCUQlIq9ZBsdc/646
 phKo2e5IP1wPiXp0eCSyziE9BkB+STzz863uEjx1PHSSlFLQJ+0IJbQxDZfGROyN2WUf
 hvkkY5674dhKHB3agjGOiwtdmWxiWaMfyP5x8+BqgiJLi3RcZv4SZzgy1Ve/0QkAwgcO
 pZRQ==
X-Gm-Message-State: AOAM533jYedTk8ucllSCrdUDbyDrk6+BE4Bi3ajbjN7yamWqUiAAhpKx
 C/DVTfBeRlvvn2vmirCbdFs6VvhJTHPojBZr5u4doh1yvs0=
X-Google-Smtp-Source: ABdhPJw2V19Ybo+8unCVnWqIO8KcZhtP1TQ42SpBGej1SyS0eQbiIcs/SdHPl7ki6EUVYqQwoEyEv8J8FBdjn+HTuXo=
X-Received: by 2002:ac2:4f8a:: with SMTP id z10mr17061211lfs.686.1634374369283; 
 Sat, 16 Oct 2021 01:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211016084136.2475297-1-fontaine.fabrice@gmail.com>
 <87fst1nyr3.fsf@dell.be.48ers.dk>
In-Reply-To: <87fst1nyr3.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Oct 2021 10:51:31 +0200
Message-ID: <CAPi7W80qKoytyqrvZoQhWY16qq5kt=XgkxKOwrE-DSGH37YZdA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wireguard-linux-compat: add
 missing comment about kernel dependency
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiAxNiBvY3QuIDIwMjEgw6AgMTA6NDYsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBBZGQgYSBj
b21tZW50IHdoZW4ga2VybmVsIGlzIG5vdCBlbmFibGVkIChtaXNzaW5nIHNpbmNlIHRoZSBhZGRp
dGlvbiBvZgo+ICA+IHRoZSBwYWNrYWdlIGluIGNvbW1pdCBkZTU5MWM1YzNhOTNhNDBkMDQ5YTMy
YmQ3OWMzMGNjNjZkYWY1ZmIyKQo+Cj4gID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gID4gLS0tCj4gID4gIHBhY2thZ2Uvd2ly
ZWd1YXJkLWxpbnV4LWNvbXBhdC9Db25maWcuaW4gfCAzICsrKwo+ICA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4KPiAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlZ3VhcmQt
bGludXgtY29tcGF0L0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2lyZWd1YXJkLWxpbnV4LWNvbXBhdC9D
b25maWcuaW4KPiAgPiBpbmRleCA1YTMyM2EzNWU1Li40ZThlOTViZGMzIDEwMDY0NAo+ICA+IC0t
LSBhL3BhY2thZ2Uvd2lyZWd1YXJkLWxpbnV4LWNvbXBhdC9Db25maWcuaW4KPiAgPiArKysgYi9w
YWNrYWdlL3dpcmVndWFyZC1saW51eC1jb21wYXQvQ29uZmlnLmluCj4gID4gQEAgLTIxLDYgKzIx
LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dJUkVHVUFSRF9MSU5VWF9DT01QQVQKPgo+ICA+ICAg
ICAgICBodHRwczovL3d3dy53aXJlZ3VhcmQuY29tCj4KPiAgPiArY29tbWVudCAid2lyZWd1YXJk
LWxpbnV4LWNvbXBhdCBuZWVkcyBhIExpbnV4IGtlcm5lbCB0byBiZSBidWlsdCIKPiAgPiArICAg
IGRlcGVuZHMgb24gIUJSMl9MSU5VWF9LRVJORUwKPgo+IElzIHRoaXMgcmVhbGx5IGEgc2Vuc2li
bGUgY29tbWVudD8gSSB3b3VsZCBpbWFnaW5lIHRoYXQgbmVlZGluZyBhIExpbnV4Cj4ga2VybmVs
IGlzIGFuIG9idmlvdXMgcmVxdWlyZW1lbnQgZm9yIGEga2VybmVsIGRyaXZlcj8KV2UgaGF2ZSB0
aGlzIGNvbW1lbnQgZm9yIG90aGVyIGRyaXZlcnMgc3VjaCBhcyBkYWhkaS1saW51eCBhbmQgeHI4
MTkteHJhZGlvLgpTbyBJIHRoaW5rIHdlIHNob3VsZCBiZSBjb25zaXN0ZW50IGluIGFsbCBwYWNr
YWdlcy4KPgo+Cj4gID4gKwo+ICA+ICBjb21tZW50ICJ3aXJlZ3VhcmQtbGludXgtY29tcGF0IG5l
ZWRzIGEgdG9vbGNoYWluIHcvIGhlYWRlcnMgPj0gMy4xMCIKPiAgPiAgICAgIGRlcGVuZHMgb24g
QlIyX0xJTlVYX0tFUk5FTAo+ICA+ICAgICAgZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IRUFE
RVJTX0FUX0xFQVNUXzNfMTAKPiAgPiAtLQo+ICA+IDIuMzMuMAo+Cj4KPiAtLQo+IEJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
