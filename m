Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12409C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 09:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C63760B2D;
	Sat, 19 Feb 2022 09:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6hSpS2LYJNJ; Sat, 19 Feb 2022 09:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC13360AD6;
	Sat, 19 Feb 2022 09:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7B31BF344
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 09:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CFE582BBA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 09:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5FlyQMThahR for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 09:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10F4E8297F
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 09:20:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f3so18225484wrh.7
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=XDvWLqJtKF5V+CotbJm98dtHfADQV7C0mG74FBQ8efg=;
 b=aGVUHuqRYj9uGgVVuVNuFmy8OaCmjjcAidzosZ+D3Ct7UQ8Icy9TNkSNPkqlExdPmj
 lRyB8eRQ6gGa1xMYqiSBOCc/1nXpJEKfRpPoxJ+js9z82bmLPsR0IN1/XQkHNRQ2mFry
 iqeMhCCbbDrnHkVZJ36BNweHoyE59Scr5hAZ2MU6Ls7pJ62MKWXIg3hT2oYAx591trdR
 oIJx13ymgciNARbyL5CkIkBJzjRCbhG4/BL1P08IjvusHXvwGomPhKlMpEI7PIMY9hzw
 2JUtpIWm1H95WbOkQK0gc0M63ChSkwSefKxhOBqGFnCl1Bqu7mVBiQVnsBgJCsqc5fQO
 fvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=XDvWLqJtKF5V+CotbJm98dtHfADQV7C0mG74FBQ8efg=;
 b=puRlRsJ9Fvt5RRQdQ+aV6iVmRmndD7O3yo1N2BNcPx6r2Jh8vh+W8yInyvCnUKe7TJ
 5ZVoIWN0KUUHsg/hFI4SUA9eLIg+qwPUl6D5/JOw394GK0KD+8QhLz+2fe0TEJ9C100C
 dxaM/PHeYqLMXKHyEAlMi3acOMSn/zj9hpuyJyGJgyVRLhZLkVWr4KdYag54GSsElv+o
 qVBdwzp2BOmlT4w2nESLit3L46u88RTnhhEgS44Kp7UI2ljjBwiK7ObpuKwQz/M28DTt
 7lpbrj2QfjZTRYsKXGCX4KAE4yLT5FNjYWGSCor9YAn5skdnP8t8x26r2imu8qYwO5L1
 fCXg==
X-Gm-Message-State: AOAM533BuF/J2HHGROoKZseYkmi2nyXMJqo3n4EY3ZGRZ6T0BHRxH7Nj
 qpbFBtQoHY9A0w+cWHFxQxLAXUToBIc=
X-Google-Smtp-Source: ABdhPJwEoOvsSp8SVa1gWsctNOk6p6sEaXrEZJfm5pQApwTUVnVhdG2lFjfgA0QmANZnnpRT0Av0Lg==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr8567783wri.401.1645262443691; 
 Sat, 19 Feb 2022 01:20:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id b15sm42865918wri.96.2022.02.19.01.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 01:20:43 -0800 (PST)
Message-ID: <e9fbdbb9-5ba3-cae6-7492-4a287c3ba2fd@gmail.com>
Date: Sat, 19 Feb 2022 10:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
To: Joachim Wiberg <troglobit@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101225906.2341845-1-fontaine.fabrice@gmail.com>
 <87bl0t1a9o.fsf@gmail.com> <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
In-Reply-To: <114f25cd-b392-fbde-ce20-eef87447f1c0@gmail.com>
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAzMC8wMS8yMDIyIMOgIDE3OjM2LCBSb21haW4gTmFvdXIgYSDDqWNyaXTCoDoK
PiBIZWxsbyBGYWJyaWNlLCBKb2FjaGltLCBBbGwsCj4gCj4gTGUgMDMvMDEvMjAyMiDDoCAwOTo0
MSwgSm9hY2hpbSBXaWJlcmcgYSDDqWNyaXTCoDoKPj4gT24gU2F0LCBKYW4gMDEsIDIwMjIgYXQg
MjM6NTksIEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90
ZToKPj4+IFRoZSBMWEMgNC4wIGJyYW5jaCBpcyBzdXBwb3J0ZWQgdW50aWwgSnVuZSAyMDI1Lgo+
Pj4gT25seSBidWdmaXhlcyBhbmQgc2VjdXJpdGl5IGlzc3VlcyBnZXQgaW5jbHVkZWQgaW50byB0
aGUgc3RhYmxlIGJ1Z2ZpeAo+Pj4gcmVsZWFzZXMsIHNvIGl0J3MgYWx3YXlzIHNhZmUgYW5kIHJl
Y29tbWVuZGVkIHRvIGtlZXAgdXAgYW5kIHJ1biB0aGUKPj4+IGxhdGVzdCBidWdmaXggcmVsZWFz
ZS4KPiAKPiBXZWxsIGl0IGFsc28gaW5jbHVkZXMgbmV3IGZlYXR1cmVzIHNpbmNlIHRoaXMgdmVy
c2lvbiBidW1wIGJyZWFrIGx4YyB3aXRoIGFsbAo+IGtlcm5lbCA8IDUuNiBkdWUgdG8gdGhlIGJy
b2tlbiBmYWxsIGJhY2sgd2hlbiB0aGUgbmV3IG1vdW50IEFQSSBpcyBub3Qgc3VwcG9ydGVkLgo+
IAo+IFdlIGhhdmUgYSB0ZXN0IGZvciBseGMgdXNpbmcgYSBrZXJuZWwgNC4xOSB0aGF0IHRyaWdn
ZXIgdGhpcyBpc3N1ZSBbMV0uCj4gCj4gU2VlIGx4Yy5sb2c6Cj4gCj4gKGtlcm5lbCA1LjUpCj4g
REVCVUcgY29uZiAtIGNvbmYuYzpseGNfc2V0dXBfZGV2cHRzX2NoaWxkOjE2ODIgLSBObyBuZXcg
ZGV2cHRzIGluc3RhbmNlIHdpbGwgYmUKPiBtb3VudGVkIHNpbmNlIG5vIHB0cyBkZXZpY2VzIGFy
ZSByZXF1aXJlZAo+IGx4Yy1zdGFydCBseGNfaXBlcmYzICBERUJVRyBjb25mIC0gY29uZi5jOmx4
Y19zZXR1cF9kZXZfY29uc29sZToxOTY2IC0gQ2xlYXJlZAo+IGFsbCAoMCkgbW91bnRzIGZyb20g
Ii9kZXYvY29uc29sZSIKPiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgRVJST1IgbW91bnRfdXRpbHMg
LSBtb3VudF91dGlscy5jOm1vdW50X2F0OjY2MSAtIE5vIHN1Y2gKPiBmaWxlIG9yIGRpcmVjdG9y
eSAtIEZhaWxlZCB0byBtb3VudCAiL3Byb2Mvc2VsZi9mZC80NCIgdG8gIi9wcm9jL3NlbGYvZmQv
NDMiCj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIEVSUk9SIGNvbmYgLSBjb25mLmM6bHhjX3NldHVw
X2Rldl9jb25zb2xlOjE5ODggLSBObyBzdWNoCj4gZmlsZSBvciBkaXJlY3RvcnkgLSBGYWlsZWQg
dG8gbW91bnQgIjEwKC9kZXYvcHRzLzApIiBvbiAiNDMiCj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMg
IEVSUk9SIGNvbmYgLSBjb25mLmM6bHhjX3NldHVwX2NvbnNvbGU6MjE0MyAtIE5vIHN1Y2ggZmls
ZQo+IG9yIGRpcmVjdG9yeSAtIEZhaWxlZCB0byBzZXR1cCBjb25zb2xlCj4gCj4gKGtlcm5lbCA1
LjYpCj4gbHhjLXN0YXJ0IGx4Y19pcGVyZjMgIFRSQUNFIG1vdW50X3V0aWxzIC0gbW91bnRfdXRp
bHMuYzpjYW5fdXNlX21vdW50X2FwaTo1ODIgLQo+IEtlcm5lbCBzdXBwb3J0cyBtb3VudCBhcGkK
PiBseGMtc3RhcnQgbHhjX2lwZXJmMyAgVFJBQ0UgbW91bnRfdXRpbHMgLSBtb3VudF91dGlscy5j
Om1vdmVfZGV0YWNoZWRfbW91bnQ6MzI4Cj4gLSBBdHRhY2ggZGV0YWNoZWQgbW91bnQgNDUgdG8g
ZmlsZXN5c3RlbSBhdCA0Mwo+IGx4Yy1zdGFydCBseGNfaXBlcmYzICBUUkFDRSBjb25mIC0gY29u
Zi5jOmx4Y19zZXR1cF9kZXZfY29uc29sZToxOTkwIC0gU2V0dXAKPiBjb25zb2xlICIvZGV2L3B0
cy8wIgo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzIwMDY3OTg5OTgKPiAKPiBUaGlzIGlzc3VlIGlzIG5vdCB5ZXQgZml4ZWQgaW4gbHhj
IHN0YWJsZS00LjAgYnJhbmNoLgo+IAo+IENhbiB5b3UgaGF2ZSBhIGxvb2s/CgpwaW5nLgoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pj4K
Pj4+IGh0dHBzOi8vZGlzY3Vzcy5saW51eGNvbnRhaW5lcnMub3JnL3QvbHhjLTQtMC0xMS1oYXMt
YmVlbi1yZWxlYXNlZC8xMjQyNwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFp
bmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+Pgo+PiBSZXZpZXdlZC1ieTogSm9hY2hp
bSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
