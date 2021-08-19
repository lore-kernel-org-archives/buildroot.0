Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAFDC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3165C6108F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3165C6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 005724011D;
	Thu, 19 Aug 2021 21:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1nC07sEhjNJj; Thu, 19 Aug 2021 21:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AF59401BB;
	Thu, 19 Aug 2021 21:16:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E299F1C113E
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0CD94011D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHf3rR7Rs9r1 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8432E404E5
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:16:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id w4so12219694ljh.13
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GTv2vFZLGyn1s+Kq2q79V6BRugizDGSAv+vxFklB3UA=;
 b=sfH78XsOTZAv6TRuo4Fn01lDAZaQeSoWmxTf8Agqj/b5yUgQD4XW/uvT5/pMsZct6g
 F5tKDLk68q2Eev48TPqdj/QoPWfxvO+MTQvqVij3W/+Yj4mFpj48ck8K+617nuw/8yRf
 OqEuwWVvG5KOUGhF6+aU6JgooeVMASwC0rLgGtmsegMfiMqbzYdHUzDnpbHq3WVgWTum
 E59fsEIg1FJhJgcY20K3KXQQis6m3ZXjIiEBGB2MKyEbc+6r/kuZrnweXY5q8llUOZmS
 Jr9EaCP02VyVKFZEEstVwit9NBMQMfkgTOmoTOAx1QNS7W/H2YrBvCOY87XOozWc9fB9
 fXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GTv2vFZLGyn1s+Kq2q79V6BRugizDGSAv+vxFklB3UA=;
 b=le7wnW2qcCzkkfBPwb7bsW+3HdlX+nL9DjBq/QhFd/Cd9puNGuFPclC6HIWF0M3fhc
 2cCW3sUYDkvbo51u6YzV6t1YWq55xPB5AHKp0s8+BkAoqTUfY9jtXBK7xTp9ZviOhQsP
 AxPiXh0iTIiV+sJa+hS4XmZfyY0y+qwvPHbNMZhnEIfCsldIDzjjPwjzNsG58D5utrGF
 Z/TpXhw/1konfebLXbym4NjfL0nB0h2NdleZrvRqZtHsVjRPdBCPigRJCwxseCBcH0fW
 lZ03S96UAvRTf72UYxmdt4ayxi1Qc9MQhLTufciAIX3Cc8AbZn23wWGwNJlsauXCKn9P
 4WeQ==
X-Gm-Message-State: AOAM531QtKkO9XSC0343QAy3u0+z5RuppCCKsCeyRqvI8E9pp+I3/k8u
 ViknsxpVF9Mmh6wkWXLqGunSWcb7sIcY2EVP+ts=
X-Google-Smtp-Source: ABdhPJxNaiUvmvuv5OemPxsIB2yAj4bTfD4Fm/xFnEQrUWphv/K4NZrb5udSlTu4lzpOewkQ6T0aFB6oHVmDQpTheEg=
X-Received: by 2002:a2e:a606:: with SMTP id v6mr13400926ljp.366.1629407763359; 
 Thu, 19 Aug 2021 14:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210817221530.2343233-1-fontaine.fabrice@gmail.com>
 <20210819225118.361fe904@windsurf>
 <CAPi7W83S32fCdbuv-rGxz2QoTjWLFnA=AhL0AnG3AwaNSHMVxA@mail.gmail.com>
 <20210819231249.1fafaba9@windsurf>
In-Reply-To: <20210819231249.1fafaba9@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Aug 2021 23:15:52 +0200
Message-ID: <CAPi7W82HwkmdttntDMELYTq5TbZipO5qzzzLsraPVJ_es1fXcw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libshout: enable
 optional dependency for libressl"
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgamV1LiAxOSBhb8O7dCAyMDIxIMOgIDIzOjEyLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUaHUsIDE5IEF1ZyAyMDIx
IDIyOjU3OjA4ICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiA+IEhvd2V2ZXIsIGNvdWxkIHlvdSBsb29rIGF0IHRoZSBhdXRv
YnVpbGRlciBpc3N1ZSB0aGF0Cj4gPiA+IDQ2YjhmYjc1MDBlY2NhNjVhNzk1MDczMThmZDMwNTIy
MDg1NTljMDkgd2FzIGludGVuZGVkIHRvIGZpeCwgYW5kIHNlZQo+ID4gPiB3aGF0IGlzIHRoZSBw
cm9wZXIgZml4IGZvciBpdCA/Cj4gPiBUaGUgYXV0b2J1aWxkZXIgbGluayBnaXZlbiBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UgcmV0dXJucyA0MDQuCj4KPiBBYWgsIGJ1dCBpdCBpcyBhIHZlcnkgb2xk
IGNvbW1pdCBhbmQgYnVpbGQgZmFpbHVyZSBmcm9tIDIwMTcuIEluZGVlZCwKPiB3ZSBoYXZlIGxv
c3Qgc3VjaCBvbGQgYnVpbGQgcmVzdWx0cy4gQnV0IGJhY2sgdGhlbiwgSSBiZWxpZXZlIG9wZW5z
c2wKPiBhbmQgbGlicmVzc2wgd2VyZSBub3QgImNvbWJpbmVkIiBhcyBhIHZpcnR1YWwgcGFja2Fn
ZSwgc28gdGhlIHR3bwo+IG9wdGlvbnMgd2VyZSByZWFsbHkgbXV0dWFsbHkgZXhjbHVzaXZlLgo+
Cj4gSSBhc3N1bWUgeW91IGRpZCBhIGJ1aWxkIG9mIGxpYnNob3V0IHdpdGggbGlicmVzc2wsIGFu
ZCBub3RlZCB0aGF0IGl0Cj4gd2FzIG5vdyBjb3JyZWN0IHRoYW5rcyB0byBsaWJyZXNzbCBwcm92
aWRpbmcgLnBjIGZpbGVzLiBDb3JyZWN0PwpZZXMsIGl0IGJ1aWxkcyBmaW5lIGJlY2F1c2UgbGli
cmVzc2wgcHJvdmlkZXMgb3BlbnNzbC5wYyBidXQgaXQgd2Fzbid0CmEgc3VycHJpc2UgYXMgSSBi
YXNpY2FsbHkgcmVtb3ZlZCBkZWFkIGNvZGUuCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJlZ2FyZHMsCgpGYWJy
aWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
