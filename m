Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C35C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 15:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 060D140376;
	Sat, 19 Feb 2022 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVt0s7q6VnLw; Sat, 19 Feb 2022 15:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BBB74012E;
	Sat, 19 Feb 2022 15:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A57111BF30B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93BC660746
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSYH6_32ouQ4 for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 15:20:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 524EE6058F
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 15:20:03 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso4133038otp.0
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 07:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qrJQEtWDxWAn+QEm3ktxxiho7KWhmmW+OZhNq0myti8=;
 b=d+cpp66/nEEptwu7Qv52U2F4aNftpyAZEJNpEwsW4ARgvI0gJ7+++0udAu6s35HDSq
 LTwdUXD40GCPxFcu4LFWI9lq4m73rOxBuNiug7FhlCnmiU9tCoi1Ijs3FDogGPvOsQ2y
 SWPkKC0tBRSjn9rGzE2alepeQ3S5Msz2vmubXl6vB/7cpDUx0oEwSW1CmyBk1oFCqOUA
 EHG+JjX6u9puYeq8dmu70kTxxxQcad2koF24Im30od0Z9tK8VC72HGMCGxnCSff8f3MK
 kYWIVkF175WEpza5DWZF3RX8qzznGHgEbUMWU+7BJL+NAvcSR+qIbHptzdXdv4xqFYWv
 2Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qrJQEtWDxWAn+QEm3ktxxiho7KWhmmW+OZhNq0myti8=;
 b=AZdARuiL3vhzFG/CmTaXaoqthXXp010/VRvdLyRm0PjOroHs+v4YyZW77nGikQXlai
 dvQyjz7bUKjTkdjE+hAA9vbnJIRgOstHkhf/8z66PhUcPU+N/yHUOx4D+40b4bzjPLV1
 uIZAaSJeEf6AvXefEWeu8Exgo3eTzWzzhb8dSEAQuwRNgUht8jV+Y+dNLhef1QsRCT58
 40FGzzzKHDLninfuV271J4BN44A2Pe1Z/kN0fJ3O/fmzEQX97c4tkV2U/snVqeAO6cTZ
 31LgH5X/el0Xc5SYdkaXCuECR5C6AfGzUpYl6bGp5XrL+hHiH0rbqW6j/F0KITmnR7Vl
 1MXw==
X-Gm-Message-State: AOAM533mw0S98p54FqsWZ3n1rpeTJ9tYg4nxccSgSVShcoktutQnOg/x
 aWYip6hhqFEXay4xf4qhnJW6mTSlcAvkrlDTx9i2UsWrtNLdog==
X-Google-Smtp-Source: ABdhPJwdCPHOM0RrVQZ59mc/e+zl5qcEWbeRhVGU3VN7l6Gm5QhaAQAodkgNdtW2V/jF2QcwUSgxecDQhJ8wJqlYyKU=
X-Received: by 2002:a05:6830:2a05:b0:5af:1417:1218 with SMTP id
 y5-20020a0568302a0500b005af14171218mr237698otu.237.1645284002358; Sat, 19 Feb
 2022 07:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
 <87bl0t1a9o.fsf@gmail.com> <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
 <e9fbdbb9-5ba3-cae6-7492-4a287c3ba2fd@gmail.com>
In-Reply-To: <e9fbdbb9-5ba3-cae6-7492-4a287c3ba2fd@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Feb 2022 16:20:03 +0100
Message-ID: <CAPi7W83+xLBCC=U2gdtcQW2+LK3kjrxB+6Z-toM+f5qD6grTXQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: bump to version 4.0.11
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
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBzYW0uIDE5IGbDqXZyLiAyMDIyIMOgIDEwOjIwLCBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvLAo+Cj4gTGUgMzAvMDEv
MjAyMiDDoCAxNzozNiwgUm9tYWluIE5hb3VyIGEgw6ljcml0IDoKPiA+IEhlbGxvIEZhYnJpY2Us
IEpvYWNoaW0sIEFsbCwKPiA+Cj4gPiBMZSAwMy8wMS8yMDIyIMOgIDA5OjQxLCBKb2FjaGltIFdp
YmVyZyBhIMOpY3JpdCA6Cj4gPj4gT24gU2F0LCBKYW4gMDEsIDIwMjIgYXQgMjM6NTksIEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4gVGhl
IExYQyA0LjAgYnJhbmNoIGlzIHN1cHBvcnRlZCB1bnRpbCBKdW5lIDIwMjUuCj4gPj4+IE9ubHkg
YnVnZml4ZXMgYW5kIHNlY3VyaXRpeSBpc3N1ZXMgZ2V0IGluY2x1ZGVkIGludG8gdGhlIHN0YWJs
ZSBidWdmaXgKPiA+Pj4gcmVsZWFzZXMsIHNvIGl0J3MgYWx3YXlzIHNhZmUgYW5kIHJlY29tbWVu
ZGVkIHRvIGtlZXAgdXAgYW5kIHJ1biB0aGUKPiA+Pj4gbGF0ZXN0IGJ1Z2ZpeCByZWxlYXNlLgo+
ID4KPiA+IFdlbGwgaXQgYWxzbyBpbmNsdWRlcyBuZXcgZmVhdHVyZXMgc2luY2UgdGhpcyB2ZXJz
aW9uIGJ1bXAgYnJlYWsgbHhjIHdpdGggYWxsCj4gPiBrZXJuZWwgPCA1LjYgZHVlIHRvIHRoZSBi
cm9rZW4gZmFsbCBiYWNrIHdoZW4gdGhlIG5ldyBtb3VudCBBUEkgaXMgbm90IHN1cHBvcnRlZC4K
PiA+Cj4gPiBXZSBoYXZlIGEgdGVzdCBmb3IgbHhjIHVzaW5nIGEga2VybmVsIDQuMTkgdGhhdCB0
cmlnZ2VyIHRoaXMgaXNzdWUgWzFdLgo+ID4KPiA+IFNlZSBseGMubG9nOgo+ID4KPiA+IChrZXJu
ZWwgNS41KQo+ID4gREVCVUcgY29uZiAtIGNvbmYuYzpseGNfc2V0dXBfZGV2cHRzX2NoaWxkOjE2
ODIgLSBObyBuZXcgZGV2cHRzIGluc3RhbmNlIHdpbGwgYmUKPiA+IG1vdW50ZWQgc2luY2Ugbm8g
cHRzIGRldmljZXMgYXJlIHJlcXVpcmVkCj4gPiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgREVCVUcg
Y29uZiAtIGNvbmYuYzpseGNfc2V0dXBfZGV2X2NvbnNvbGU6MTk2NiAtIENsZWFyZWQKPiA+IGFs
bCAoMCkgbW91bnRzIGZyb20gIi9kZXYvY29uc29sZSIKPiA+IGx4Yy1zdGFydCBseGNfaXBlcmYz
ICBFUlJPUiBtb3VudF91dGlscyAtIG1vdW50X3V0aWxzLmM6bW91bnRfYXQ6NjYxIC0gTm8gc3Vj
aAo+ID4gZmlsZSBvciBkaXJlY3RvcnkgLSBGYWlsZWQgdG8gbW91bnQgIi9wcm9jL3NlbGYvZmQv
NDQiIHRvICIvcHJvYy9zZWxmL2ZkLzQzIgo+ID4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIEVSUk9S
IGNvbmYgLSBjb25mLmM6bHhjX3NldHVwX2Rldl9jb25zb2xlOjE5ODggLSBObyBzdWNoCj4gPiBm
aWxlIG9yIGRpcmVjdG9yeSAtIEZhaWxlZCB0byBtb3VudCAiMTAoL2Rldi9wdHMvMCkiIG9uICI0
MyIKPiA+IGx4Yy1zdGFydCBseGNfaXBlcmYzICBFUlJPUiBjb25mIC0gY29uZi5jOmx4Y19zZXR1
cF9jb25zb2xlOjIxNDMgLSBObyBzdWNoIGZpbGUKPiA+IG9yIGRpcmVjdG9yeSAtIEZhaWxlZCB0
byBzZXR1cCBjb25zb2xlCj4gPgo+ID4gKGtlcm5lbCA1LjYpCj4gPiBseGMtc3RhcnQgbHhjX2lw
ZXJmMyAgVFJBQ0UgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5jOmNhbl91c2VfbW91bnRfYXBp
OjU4MiAtCj4gPiBLZXJuZWwgc3VwcG9ydHMgbW91bnQgYXBpCj4gPiBseGMtc3RhcnQgbHhjX2lw
ZXJmMyAgVFJBQ0UgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5jOm1vdmVfZGV0YWNoZWRfbW91
bnQ6MzI4Cj4gPiAtIEF0dGFjaCBkZXRhY2hlZCBtb3VudCA0NSB0byBmaWxlc3lzdGVtIGF0IDQz
Cj4gPiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgVFJBQ0UgY29uZiAtIGNvbmYuYzpseGNfc2V0dXBf
ZGV2X2NvbnNvbGU6MTk5MCAtIFNldHVwCj4gPiBjb25zb2xlICIvZGV2L3B0cy8wIgo+ID4KPiA+
IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzIw
MDY3OTg5OTgKPiA+Cj4gPiBUaGlzIGlzc3VlIGlzIG5vdCB5ZXQgZml4ZWQgaW4gbHhjIHN0YWJs
ZS00LjAgYnJhbmNoLgo+ID4KPiA+IENhbiB5b3UgaGF2ZSBhIGxvb2s/Cj4KPiBwaW5nLgpIb3cg
Y2FuIEkgcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGxvY2FsbHkgc28gSSBjYW4gb3BlbiBhIGJ1ZyBv
bgpodHRwczovL2dpdGh1Yi5jb20vbHhjL2x4Yy9pc3N1ZXM/CkkgdHJpZWQgdG8gbGF1bmNoIHJ1
bi10ZXN0cyBmcm9tIGN1cnJlbnQgbWFzdGVyIGJ1dCBpdCBpcyAic3R1Y2siIGluCiJCdWlsZGlu
ZyBkb25lIjoKCi4vc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtbyB0ZXN0LW91dHB1dC8gLWQg
dGVzdC1kbC8gLWsKLS10aW1lb3V0LW11bHRpcGxpZXIgMTAgdGVzdHMucGFja2FnZS50ZXN0X2x4
Yy5UZXN0THhjCjE1OjM2OjM1IFRlc3RMeGMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU3RhcnRpbmcKMTU6MzY6MzUgVGVzdEx4YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCdWlsZGluZwoxNTo1MTowNCBUZXN0THhjICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJ1aWxkaW5nIGRvbmUKClNvIEkgb3BlbmVkIHRlc3Qtb3V0cHV0L1Rlc3RMeGMtcnVu
LmxvZyBhbmQgZm91bmQgb3V0IGEga2VybmVsIHBhbmljOgoKS2VybmVsIHBhbmljIC0gbm90IHN5
bmNpbmc6IE5vIHdvcmtpbmcgaW5pdCBmb3VuZC4gIFRyeSBwYXNzaW5nIGluaXQ9Cm9wdGlvbiB0
byBrZXJuZWwuIFNlZSBMaW51eCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2luaXQucnN0IGZv
cgpndWlkYW5jZQoKSSBhc3N1bWUgdGhhdCBxZW11IGlzIG5vdCBhYmxlIHRvIHN0YXJ0IHRoZSBr
ZXJuZWwuCkRvIHlvdSBoYXZlIHNvbWUgYWR2aWNlIG9uIHdoYXQgY291bGQgZ28gd3Jvbmc/Cj4K
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMsCj4gPiBSb21h
aW4KPiA+Cj4gPgo+ID4+Pgo+ID4+PiBodHRwczovL2Rpc2N1c3MubGludXhjb250YWluZXJzLm9y
Zy90L2x4Yy00LTAtMTEtaGFzLWJlZW4tcmVsZWFzZWQvMTI0MjcKPiA+Pj4KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4g
Pj4KPiA+PiBSZXZpZXdlZC1ieTogSm9hY2hpbSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+
Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiA+Pgo+ID4KPgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
