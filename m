Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50DEEAA7B
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 22:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639D183684;
	Thu, 14 Sep 2023 22:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639D183684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbKKCPsPNowM; Thu, 14 Sep 2023 22:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 039698340C;
	Thu, 14 Sep 2023 22:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039698340C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66AF51BF5A4
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D9DF40474
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 22:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9DF40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwBCIBWDV1wz for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 22:49:35 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7974F4029B
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 22:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7974F4029B
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1d577c89a4fso794519fac.1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 15:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694731774; x=1695336574;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiNtvuXu21NYPl9852Qj2R1u/PiuqGSMuLixpDg0bgw=;
 b=IO0ZEvNsd2xY1srPAzVCAVah0bjf2bT9u4sK8xP49ZEXOVxDfFGTENAzGkFuaEK4sf
 L4ksRsa+7N/WlG2kSnHgGXZCsYuh62Edzwiv4yBrGVGMaiuwu0Mtw9CgW7boJJ5loNjy
 1CVqVt2yzpJTYFwg4GvmhcZ+FwELGkR85H3LsXv2is02Tt7Aacow87Molb0psIiBOQbF
 2coTrMQGMHC79hArZUWR+nTpihgxK+XQRink4cBBk/lL1oTlvikJu5THwbghcklh4Jy8
 stbxeTk4Z0Xmqc/Ltvy0+zFRkHnX69Ow+cumaE+Esg5SaTNAsgTBc6YguPRlFmvy4BfT
 V+7g==
X-Gm-Message-State: AOJu0YwwBKK43NLIfLnXN+HTHaOapopaH0Ff8ZMlJlrliVpJNNnhLF2Y
 xDAP+1uTDhBw5UFJSloVGdVzD4wogBz+tbWzSw5I9JVA
X-Google-Smtp-Source: AGHT+IGM2TgXgLeoIuyPXtEM/nmJkY4HrQ6eM7w1jqwEaKPUq9wWqA2gR6TWmuShwyli18gMF3QGb+Du2kTHq4JqvC4=
X-Received: by 2002:a05:6870:659e:b0:1d5:a72e:154e with SMTP id
 fp30-20020a056870659e00b001d5a72e154emr56987oab.36.1694731773856; Thu, 14 Sep
 2023 15:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGF=AeQr3N0UkB9sXqg42D6nUhC3+w3Gw3fHOJPjg-J0f+Lbbg@mail.gmail.com>
In-Reply-To: <CAGF=AeQr3N0UkB9sXqg42D6nUhC3+w3Gw3fHOJPjg-J0f+Lbbg@mail.gmail.com>
From: Robert D Kocisko <rkocisko@gmail.com>
Date: Thu, 14 Sep 2023 18:49:23 -0400
Message-ID: <CAGF=AeR2bbvmCSi4ZuAGtY_v19073gqqt=M_RGyG1R2XCgpknw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694731774; x=1695336574; darn=buildroot.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hiNtvuXu21NYPl9852Qj2R1u/PiuqGSMuLixpDg0bgw=;
 b=AudPpt/1PaLzw74TJMvwvwesiju9dkpSVxRxn2pUwdOvkwpTelHGvR7AqtVjtUbgmo
 LVkRoREBBWwt6ztTsjq4B9SXoI32rIlSKj9Kemy0TEaggJmzoPqhFAhFtAr/9BGeHUM+
 zyfPERSTh2dhdbsWge5tGQxCdzFO3xRuT8qolUIXMDj3KQjZhVx29UwZTir9P6cCnAHq
 JuYMnnN23Ma7HVxhUPj/wH2BnJLHwkhk61D0WiazNUUVQ2dNdBqhplyvk/brGwXX0OVg
 t7O91ruNCdozxFPy3DPh+C2TtCY33GTwiTLW9+QTOpzijymT8Vsrg0/PMQhCajlxQvkB
 LT+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AudPpt/1
Subject: Re: [Buildroot] Erlang JIT build issues for aarch64
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

VXBkYXRlOiBJJ3ZlIHN3aXRjaGVkIHRvIHJ1bm5pbmcgYWdhaW5zdCB0aGUgYnVpbGRyb290IGxh
dGVzdCBjb21taXQKZGlyZWN0bHkgYW5kIHRoZSBpc3N1ZXMgc3RpbGwgcmVtYWluLiAgSSd2ZSBh
bHNvIHRyaWVkIGl0IHdpdGgKdWNsaWJjLW5nIGluc3RlYWQgb2YgZ2xpYmMsIGFuZCB0aGUgc2Ft
ZSBwcm9ibGVtcyBwZXJzaXN0LgoKQnVpbGRyb290IHZlcnNpb246IGNvbW1pdCBhYjRmM2ZhZmFh
ODM5NTkzYjNlZmQ5ZWExMmM4ZWU1ZDkzNDBjZGViCktlcm5lbCB2ZXJzaW9uOiB2Ni41LjItcnQ4
CmdjYyB2ZXJzaW9uOiBnY2MgMTMueApiaW51dGlscyB2ZXJzaW9uOiAyLjQxCmVuYWJsZSBjKysg
c3VwcG9ydDogeWVzCgpSZXBlYXRpbmcganVzdCB0aGUgZXJyb3IgbGluZXMgb2YgYnVpbGQgb3V0
cHV0Ogo+IGFzbWppdC9jb3JlL2NwdWluZm8uY3BwOjg0MDoyNDogZXJyb3I6ICdnZXRhdXh2YWwn
IHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZQo+IC4uLgo+IGFzbWppdC9jb3JlL2NwdWlu
Zm8uY3BwOjk3MjoyMTogZXJyb3I6ICdBVF9IV0NBUCcgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlz
IHNjb3BlCj4gLi4uCj4gYXNtaml0L2NvcmUvY3B1aW5mby5jcHA6OTczOjIxOiBlcnJvcjogJ0FU
X0hXQ0FQMicgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlCgpBbnkgdGhvdWdodHM/CgoK
T24gVHVlLCBTZXAgNSwgMjAyMyBhdCA0OjAy4oCvUE0gUm9iZXJ0IEQgS29jaXNrbyA8cmtvY2lz
a29AZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvISAgSSdtIGZhaXJseSBuZXcgdG8gQnVpbGRy
b290IGFuZCBhbSBhdHRlbXB0aW5nIHRvIGJ1aWxkIEVybGFuZyBmb3IgYW4gYWFyY2g2NCBzeXN0
ZW0uCj4KPiBBbGwgd2FzIHdlbGwgdW50aWwgSSBub3RpY2VkIHRoYXQgRXJsYW5nIHNhaWQgdGhl
IEpJVCB3b3VsZCBiZSBkaXNhYmxlZCBzaW5jZSBJIGRpZG4ndCBoYXZlIGMrKyBzdXBwb3J0LiAg
VG8gZml4IHRoYXQsIEkgZW5hYmxlZCBjKysgc3VwcG9ydCwgYW5kIG5vdyBJJ20gZ2V0dGluZyB0
aGUgZm9sbG93aW5nIGVycm9ycy4gIEFtIEkgZG9pbmcgc29tZXRoaW5nIHdyb25nIG9yIGlzIHRo
aXMgYSBidWc/Cj4KPiBhc21qaXQvY29yZS9jcHVpbmZvLmNwcDogSW4gZnVuY3Rpb24gJ3ZvaWQg
YXNtaml0OjpfYWJpXzFfMTA6OmRldGVjdEhXQ2FwcyhDcHVJbmZvJiwgbG9uZyB1bnNpZ25lZCBp
bnQsIGNvbnN0IExpbnV4SFdDYXBNYXBwaW5nKiwgc2l6ZV90KSc6Cj4gYXNtaml0L2NvcmUvY3B1
aW5mby5jcHA6ODQwOjI0OiBlcnJvcjogJ2dldGF1eHZhbCcgd2FzIG5vdCBkZWNsYXJlZCBpbiB0
aGlzIHNjb3BlCj4gODQwIHwgdW5zaWduZWQgbG9uZyBtYXNrID0gZ2V0YXV4dmFsKHR5cGUpOwo+
IHwgXn5+fn5+fn5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2luY2x1ZGUvaW50ZXJuYWwv
Z2NjL2V0aHJlYWQuaDozNDcsCj4gZnJvbSAuLi9pbmNsdWRlL2ludGVybmFsL2V0aHJlYWQuaDoz
ODksCj4gZnJvbSBiZWFtL2VybF90aHJlYWRzLmg6MjUyLAo+IGZyb20gYmVhbS9zeXMuaDo1Mzks
Cj4gZnJvbSBiZWFtL2Rpc3QuYzozNzoKPiBJbiBmdW5jdGlvbiAnZXRocl9uYXRpdmVfYXRvbWlj
NjRfc2V0X3JlbGInLAo+IGlubGluZWQgZnJvbSAnZXRocl9hdG9taWNfc2V0X21iJyBhdCAuLi9p
bmNsdWRlL2ludGVybmFsL2V0aHJfYXRvbWljcy5oOjQwMTk6NSwKPiBpbmxpbmVkIGZyb20gJ2Vy
dHNfZGlzdF9jb21tYW5kJyBhdCBiZWFtL2Rpc3QuYzozODY2OjU6Cj4gLi4vaW5jbHVkZS9pbnRl
cm5hbC9nY2MvZXRocl9hdG9taWMuaDoxNDQ6NTogd2FybmluZzogJ19fYXRvbWljX3N0b3JlXzgn
IHdyaXRpbmcgOCBieXRlcyBpbnRvIGEgcmVnaW9uIG9mIHNpemUgMCBvdmVyZmxvd3MgdGhlIGRl
c3RpbmF0aW9uIFstV3N0cmluZ29wLW92ZXJmbG93PV0KPiAxNDQgfCBfX2F0b21pY19zdG9yZV9u
KCZ2YXItPnZhbHVlLCB2YWx1ZSwgX19BVE9NSUNfUkVMRUFTRSk7Cj4gfCBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBJbiBmdW5jdGlvbiAn
ZXJ0c19kaXN0X2NvbW1hbmQnOgo+IGNjMTogbm90ZTogZGVzdGluYXRpb24gb2JqZWN0IGlzIGxp
a2VseSBhdCBhZGRyZXNzIHplcm8KPiBhc21qaXQvY29yZS9jcHVpbmZvLmNwcDogSW4gZnVuY3Rp
b24gJ3ZvaWQgYXNtaml0OjpfYWJpXzFfMTA6OmRldGVjdEFSTUNwdShDcHVJbmZvJiknOgo+IGFz
bWppdC9jb3JlL2NwdWluZm8uY3BwOjk3MjoyMTogZXJyb3I6ICdBVF9IV0NBUCcgd2FzIG5vdCBk
ZWNsYXJlZCBpbiB0aGlzIHNjb3BlCj4gOTcyIHwgZGV0ZWN0SFdDYXBzKGNwdSwgQVRfSFdDQVAs
IGh3Q2FwTWFwcGluZywgQVNNSklUX0FSUkFZX1NJWkUoaHdDYXBNYXBwaW5nKSk7Cj4gfCBefn5+
fn5+fgo+IENYWCBvYmovYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L29wdC9qaXQvYXNtaml0
L2NvcmUvZW1pdHRlcnV0aWxzLm8KPiBDWFggb2JqL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdu
dS9vcHQvaml0L2FzbWppdC9jb3JlL2Vudmlyb25tZW50Lm8KPiBhc21qaXQvY29yZS9jcHVpbmZv
LmNwcDo5NzM6MjE6IGVycm9yOiAnQVRfSFdDQVAyJyB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMg
c2NvcGUKPiA5NzMgfCBkZXRlY3RIV0NhcHMoY3B1LCBBVF9IV0NBUDIsIGh3Q2FwTWFwcGluZzIs
IEFTTUpJVF9BUlJBWV9TSVpFKGh3Q2FwTWFwcGluZzIpKTsKPiB8Cj4KPgo+IEJ1aWxkcm9vdCB2
ZXJzaW9uOiBidWlsZHJvb3QtMjAyMy4wOC1yYzEKPiBnY2MgdmVyc2lvbjogZ2NjIDEzLngKPiBi
aW51dGlscyB2ZXJzaW9uOiAyLjQxCj4gZW5hYmxlIGMrKyBzdXBwb3J0OiB5ZXMKPgo+IFRoYW5r
cyEKPiBCb2IgS29jaXNrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
