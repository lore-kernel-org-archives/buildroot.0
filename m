Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4620C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:25:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6829E61076
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6829E61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D1A5401EC;
	Sat, 18 Sep 2021 20:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha9YrdgH74Fc; Sat, 18 Sep 2021 20:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 478D040162;
	Sat, 18 Sep 2021 20:25:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A69E1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06AF860622
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnfLYD_TV6jQ for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:25:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B8C9605DC
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:25:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q11so21096154wrr.9
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 13:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5kezMd3UrGYUvkVKr8sr6tLYMFKMwVx30fHFozzKuCI=;
 b=UKatg8DF5A5S1pkEYPFX12dWfBPFFGtdDD0iV/rouSxSv21xU0D6ffMSICUUDt6nAG
 J9c5HO9SxCwJYw5WKFs3e4rRt9x2hoaxFuOivFSJq+1rP2Q/HCDIcX0aNrg8z0DdGDPn
 z2lh8YCdOLDoRL2xmoNpdBXyeFfmKpGj+zaoBhe6DKUmcY9wYRiFS3HYBBedj5ECgf9h
 3TxljJ+VUDAHJwyzi0Yxnbsav14jdphJ9l2V+YCku+s8OmokEwJ5p2xIqCInptzT9BmC
 a/yUKZSlspEiKu89r7H1Bdr0gtzVJd7W6C3vrQV9qBaz4IyGBVSWq9IsDG949G66RtSG
 w//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5kezMd3UrGYUvkVKr8sr6tLYMFKMwVx30fHFozzKuCI=;
 b=3CQ7fFr8J0pG23IaGMCbqcdJeU1L5Eh3QygvczAk8ylIa9p386DRrUsCYK1GOXBCNc
 fRKz541K/hLwm+vQCW08Ye5Xqo8DoWsyZIPSoDMQq68bzxi+P0GC3k1YsNKs3MrEoipi
 LRiUIPLqnk7nxbTxwi6ZGbTg7UA9WkIqxFLI/iFMbKr/JMNLx+mA65LAtjs18oGLR4ID
 MSrJ5NkWVndFmTbSBqzZ4wLbNIWeepv05BLNKU0GJpZPVXqLOD/OjPc8QQb7AHsGkbCD
 Piba+3dJnZvkmkmF3P/79+yUVSIangTJEa4HX4V2wdE1ACcgGU2gVceW7FaLHtkoCltk
 4vcA==
X-Gm-Message-State: AOAM532WrBdoZf/0Z5xng1ZmIQVnAscxMtS+uaBM+qDXEVMbxlgVrvx8
 4/VaSxL04e637baC+OQWQY6DFO20bXg=
X-Google-Smtp-Source: ABdhPJx1JmjvGTwouj+xgJNBw4p4x9yrBKJiKgxqIp06ziBOGgZwNZiduxaPu1Ed5z0ApCpqb7ZSzA==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr10922041wri.288.1631996724081; 
 Sat, 18 Sep 2021 13:25:24 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce?
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id s14sm10528442wrp.84.2021.09.18.13.25.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 13:25:23 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <20210918070214.2527F8436A@smtp1.osuosl.org>
 <9dfa4af2-1f2c-4ead-1bdb-04282dd59e43@grenoble.cnrs.fr>
 <20210918102819.GJ1053080@scaer>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <243665c1-0af1-12df-aa4f-4e6c509d13ca@gmail.com>
Date: Sat, 18 Sep 2021 22:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210918102819.GJ1053080@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-09-17
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gRWRnYXIsIFlhbm4sIEFsbCwKCkxlIDE4LzA5LzIwMjEgw6AgMTI6MjgsIFlhbm4gRS4g
TU9SSU4gYSDDqWNyaXTCoDoKPiBFZGdhciwgQWxsLAo+IAo+ICtSb21haW4KPiAKPiBPbiAyMDIx
LTA5LTE4IDEwOjE5ICswMjAwLCBFZGdhciBCb25ldCBzcGFrZSB0aHVzbHk6Cj4+IFRoZSBhdXRv
YnVpbGRlciB3cm90ZToKPj4+IERldGFpbCBvZiBkZWZjb25maWcgZmFpbHVyZXMgZm9yIG1hc3Rl
cgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pgo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZGVmY29uZmlnIHwgICAgICAgICAgICAgICAgICAgICAgICBs
aW5rIHRvIHRoZSBqb2IgICAgICAgICAgICAgICAgICAgICAgICB8IG9ycGg/Cj4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0KPj4+ICAgICAgICAgICAg
ICAgICAgICAgICBhYXJjaDY0X2VmaSB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvMTU5NzI0ODc5OCAgfCAgICAgIAo+Pj4gICAgICAgIGFjbWVzeXN0
ZW1zX2FjcXVhX2E1XzUxMm1iIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy8xNTk3MjQ4ODAwICB8ICAgICAgCj4+PiBbLi4uXQo+Pgo+PiBUaGVyZSBt
YXkgYmUgYSBwcm9ibGVtIG9uIHRoZSBhdXRvYnVpbGRlci4gTW9zdCBvZiB0aG9zZSBsaW5rcyBw
b2ludCB0bwo+PiBidWlsZCBsb2dzIHRoYXQgYXJlIHRydW5jYXRlZCwgYW5kIGRvIG5vdCBzaG93
IGFueSBlcnJvciBtZXNzYWdlLgo+Pgo+PiBJIGp1c3QgdHJpZWQgb25lIG9mIHRoZSBmYWlsZWQg
ZGVmY29uZmlncyAoYWNtZXN5c3RlbXNfYWNxdWFfYTVfNTEybWIpCj4+IHVzaW5nIHRoZSBleGFj
dCBzYW1lIEJ1aWxkcm9vdCBjb21taXQgYXMgdGhlIGF1dG9idWlsZGVyIGRpZAo+PiAoYzQ4MzMx
OGQwOSkuIEl0IGFsbCB3ZW50IG91dCBzbW9vdGhseS4KPiAKPiBJZiB5b3UgbG9vayBhdCB0aGUg
dG9wIG9mIHRoZSBidWlsZCBsb2csIHlvdSdsbCBub3RpY2UgdGhhdCBob3NlCj4gZmFpbHVyZXMg
YWxsIG9jY3VyIG9uIHRoZSBnY2MxNjAgcnVubmVyLgo+IAo+IEknbSBhZGRpbmcgUm9tYWluIGlu
IENjIDsgSUlSQywgaGUgYWxyZWFkeSBub3RpY2VkIHNvbWV0aGluZyBmaXNoeSBnb2luZwo+IG9u
IHdpdGggZ2NjMTYwLiBSb21haW4/CgpJbmRlZWQgYnV0IHRoZXJlIGlzIG5vdGhpbmcgSSBjYW4g
ZG8uIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBtYWNoaW5lLgpnY2MxNjAgaXMgbm90IGFu
IGF1dG9idWlsZGVyIGJ1dCBhIGdpdGxhYiBydW5uZXIuCgpJIGJlbGlldmUgd2UgY2FuIHVzZSBn
aXRsYWIgc2hhcmVkIHJ1bm5lciBmb3Igam9icyB0aGF0IGNhbiBiZSBmaW5pc2hlZCBpbiBsZXNz
CnRoYW4gM2ggYW5kIHVzZSBvdXIgZ2l0bGFiIHJ1bm5lciBmb3IgbG9uZ2VyIGpvYnMuCkN1cnJl
bnRseSBpdCB0YWtlIG1vcmUgdGhhbiAyNGggdG8gY29tcGxldGUgYWxsIGRlZmNvbmZpZ3Mgam9i
cy4uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklO
Lgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
