Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BAE38149D;
	Mon, 20 Dec 2021 20:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2ykmdUzRCmF; Mon, 20 Dec 2021 20:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABD8813F1;
	Mon, 20 Dec 2021 20:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05B571BF356
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01FA460E50
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_hkFuwJI8Ba for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 20:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81F4A60E43
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 20:36:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y22so43403874edq.2
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jakdPAQSbgRBW7U1R1lZH+/rAK9KW63RsfHhgaDKRqM=;
 b=GgrfOsckOoBlm1ZeaPK+hStDAmC4o4inx7+o5rfNhUt861ixCBThtyNqOvjpASbTdy
 AJIT2wjdBEIkFVQZXhtmKNSopaUXpZR9E7A4DkKUVx4Y+23EigZwUPb0wjgSEpPYgsX6
 fdo4/v7SNHVaVLm/5rEI/U0orvx6p/lyFFgw7eL2vY4vy3Jvmx4m0+b67Ti/l2Ou8SWM
 dDrQeT0r2U7+b3wMiY/aY0ojs50txx+fmJx1gyLRZet8bNqc63hkB66NSbDbXUxUZPaK
 gDhv4fvCL14IzIHmXxGX963Oh0B3KEQ91AUY/maCjrgN2BGDlTelWn/yGhta/VabNKrP
 rzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jakdPAQSbgRBW7U1R1lZH+/rAK9KW63RsfHhgaDKRqM=;
 b=G4eatu6HrQfU3dHwWoamwBlKS+/ECz2Q1vbPmjLudDaFqo1xSVCdsqXBrxbh8E9nlB
 HF8QXfizv7pRHIwO60wVGpuo2B30/cwCRrsT7YujC0xoNbgVdc6GSm+DLNsdUlUp6nED
 CNKXW0uRVt7Ujj9FzYuoQdk5+Utbefu/o94juHmD7yLGYMFFq4+8r300saRSPtGh2gB7
 +z6bRQqaXpsNBN/n7SCsA0P0+WFqpj5JrXQy1XBJrJ01Ah+zdCwCKc8bG7Jyo69eGH6o
 6VH00eL1wDShWYsF35OcPmnkTGGlbmJWMcOJ9usy7huyetYjBvW4b6Bc5rMKiJbwsO84
 fx/g==
X-Gm-Message-State: AOAM53122QFym982r2chnraRnukb8h1e7CstXeGz520p/yF6sskqBKWB
 ajPhAVlW0pzLbBIFOqUhPb1+8A==
X-Google-Smtp-Source: ABdhPJzxynLFTjoOCvZcaex2Q0Uuc62TOayby3rjy974BBFehlYuPf8I/KOZ1Kuhyeu+gqBj+LvPMQ==
X-Received: by 2002:a05:6402:51cc:: with SMTP id
 r12mr3348738edd.92.1640032588260; 
 Mon, 20 Dec 2021 12:36:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z1sm7197661edq.54.2021.12.20.12.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 12:36:27 -0800 (PST)
Message-ID: <e3d18846-7065-2665-984f-03685b0b3ab0@mind.be>
Date: Mon, 20 Dec 2021 21:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20211219110405.2233620-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219110405.2233620-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/libopenaptx: drop package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8xMi8yMDIxIDEyOjA0LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IFRoZSBsaWNlbnNp
bmcgYWJvdXQgbGlib3BlbmFwdHggaXMgdmVyeSBjb21wbGljYXRlZC4gVmVyc2lvbiAwLjIuMSB3
YXMKPiB0YWdnZWQgd2l0aCB0aGUgc29sZSBwdXJwb3NlIG9mIHJlbGljZW5zaW5nIGZyb20gTEdQ
THYyLjErIHRvIEdQTHYzLjArOgo+IAo+ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3BhbGkvbGli
b3BlbmFwdHgvY29tbWl0LzgxMWJjMTg1ODZkNjM0MDQyNjE4ZDYzMzcyN2FjMDI4MWQ0MTcwYjgK
PiAKPiBIb3dldmVyLCB0aGlzIGlzIGhhcyB2YXJpb3VzIGlzc3VlczoKPiAKPiAgICAtIHRoZSBj
b2RlIG9yaWdpbmFsbHkgY29tZXMgZnJvbSBmZm1wZWcsIHdoZXJlIGl0IHdhcyBMR1BMdjIuMSss
IHNvCj4gICAgICB0aGUgcmVsaWNlbnNpbmcgaXMgZHViaW91cyBhdCBiZXN0OwoKICBJIGRvbid0
IHNlZSB3aGF0IGlzIGR1YmlvdXMgYWJvdXQgdGhhdDogTEdQTCBleHBsaWNpdGx5IGFsbG93cyB1
cGdyYWRpbmcgdG8gCkdQTCAoIzMpIGFuZCB0aGUgKyBvZiBjb3Vyc2UgbWVhbnMgdGhhdCBnb2lu
ZyBmcm9tIEdQTDIgdG8gR1BMMyBpcyBub3QgYSBwcm9ibGVtLgoKCj4gICAgLSBhbiBleHBsaWNp
dCBiYW4gdG8gZi5kLm8gYW5kIENvbGxhYm9yYSBmcm9tIHVzaW5nIHRoYXQgY29kZSwgYW5kCj4g
ICAgICB3aXRoIGEgbG9uZyByYW50IGFib3V0IGl0LCBldmVuIHN0YXRpbmcgdGhhdCB0aGUgbGlj
ZW5zZSB0byBmLmQubyBvcgo+ICAgICAgQ29sbGFib3JhIHdhcyB0ZXJtaW5hdGVkOgo+ICAgICAg
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9wYWxpL2xpYm9wZW5hcHR4L2NvbW1pdC84MTFiYzE4NTg2
ZDYzNDA0MjYxOGQ2MzM3MjdhYzAyODFkNDE3MGI4I2NvbW1pdGNvbW1lbnQtNTQxNTQxNTYKPiAK
PiAgICAgICAgICBQZXIgwqc4L0xHUEwgYW5kIMKnOC9HUEwgbGljZW5zZSB3YXMgdGVybWluYXRl
ZCB3aXRoIENvbGxhYm9yYSBhbmQKPiAgICAgICAgICBGcmVlZGVza3RvcCBhbmQgd2FzIG5vdCBh
dXRvbWF0aWNhbGx5IHJlaW5zdGF0ZWQuIEl0IGFwcGxpZXMgdG8KPiAgICAgICAgICBhbGwgdmVy
c2lvbnMgb2YgdGhpcyBsaWJyYXJ5LCBpbmNsdWRpbmcgb2xkZXIgYW5kIENvbGxhYm9yYSBhbmQK
PiAgICAgICAgICBGcmVlZGVza3RvcCBjYW5ub3QgdXNlIHRoaXMgbGlicmFyeSBhbnltb3JlLgoK
ICBJIGRvbid0IHNlZSBob3cgdGhpcyBpcyByZWxldmFudCB0byB1cy4gUmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHRoaXMgdGVybWluYXRpb24gCmNhbiBiZSB1cGhlbGQgYXQgYWxsICh3aGljaCBJIGRv
dWJ0IHNpbmNlIEkgZG9uJ3QgdGhpbmsgZnJlZWRlc2t0b3Aub3JnLCAKY29sbGFib3JhLCBvciBh
bnlvbmUgaW4gdGhvc2Ugb3JnYW5pc2F0aW9ucyB2aW9sYXRlZCB0aGUgR1BMKSwgaXQncyByZWFs
bHkgbm90IApvdXIgcmVzcG9uc2liaWxpdHkgdG8gaW5mb3JtIG91ciB1c2VycyBvZiBpdC4gSXQn
cyBhbnl3YXkgZmFpcmx5IG1lYW5pbmdsZXNzIC0gCml0IGp1c3QgbWVhbnMgdGhhdCBmcmVlZGVz
a3RvcCBhbmQgQ29sbGFib3JhIChhcyBvcmdhbmlzYXRpb25zKSB3b3VsZCBub3QgYmUgCmFsbG93
ZWQgdG8gcmUtZGlzdHJpYnV0ZSB0aGlzIHBhY2thZ2UuCgoKPiBBIHNldCBvZiB1cHN0cmVhbSBp
c3N1ZXMgaGF2ZSBiZWVuIHJhaXNlZCwgaW4gcmVsYXRpb24gd2l0aCB0aGlzIHRvcGljOgo+IAo+
ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3BhbGkvbGlib3BlbmFwdHgvaXNzdWVzLzExCj4gICAg
ICAgICAgUG9zc2libGUgbGljZW5zZSB2aW9sYXRpb24KCiAgVGhpcyBjbGFpbSB0aGF0IHRoZSBw
a2ctY29uZmlnIGZpbGUgd291bGQgaW52aXRlIHBlb3BsZSB0byB2aW9sYXRlIHRoZSBsaWNlbnNl
IAppcyBCUywgc28gY2xvc2luZyB3YXMgdGhlIGNvcnJlY3QgYWN0aW9uLgoKCj4gICAgICBodHRw
czovL2dpdGh1Yi5jb20vcGFsaS9saWJvcGVuYXB0eC9pc3N1ZXMvMTIKPiAgICAgICAgICBSZXN0
cmljdGlvbnMgYmVpbmcgaW52YWxpZGF0ZWQgYnkgdGVybXMgb2YgR1BMCgogIFRoaXMgaXNzdWUg
d2FzIGFuc3dlcmVkIHByZXR0eSBjbGVhcmx5OiB0aGUgaW52YWxpZGF0aW9uIG9mIHRoZSBsaWNl
bnNlIGZvciAKZnJlZWRlc2t0b3AgYW5kIGNvbGxhYm9yYSBpcyBub3QgYSBtb2RpZmljYXRpb24g
b2YgdGhlIGxpY2Vuc2UgYXQgYWxsLiBJdCdzIGp1c3QgCmluZm9ybWluZyBwZW9wbGUgb2YgdGhp
cyBmYWN0LgoKCj4gICAgICBodHRwczovL2dpdGh1Yi5jb20vcGFsaS9saWJvcGVuYXB0eC9pc3N1
ZXMvMTMKPiAgICAgICAgICBQbGVhc2UgcHJvdmlkZSBsaW5rcyBvciBjaXRhdGlvbnMgZm9yIFJF
QURNRSBjbGFpbXMKPiAKPiBJbiBhbGwgY2FzZXMsIHRoZSBhdXRob3IgZGlzbWlzc2VkIHRob3Nl
IGFzIGludmFsaWQsIHdpdGggdmFyaW91cyBsZXZlbHMKPiBvZiBhbWlhYmlsaXR5Li4uCgogIEkg
YWJzb2x1dGVseSBhZ3JlZSB0aGF0IHRoZSB0b25lIGlzIGFjZXJiaWMsIGFuZCB0aGF0IHBhbGkg
aXMgYWN0aW5nIG91dC4uLgoKPiBUaGlzIHNpdHVhdGlvbiBpcyB2ZXJ5IGNvbmNlcm5pbmcuCgou
Li4gYnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb25jZXJuaW5nIGZvciBCdWlsZHJvb3QuIEl0
J3MgbW9zdGx5IGJhZCBuZXdzIGZvciAKdGhlIGxpYm9wZW5hcHR4IHByb2plY3QuIFdoaWNoIGlz
IHRoZSByZWFzb24gZm9yIGxpYmZyZWVhcHR4IFsxXSB0byBleGlzdC4KCj4gRHJvcCB0aGUgcGFj
a2FnZSB0byBhdm9pZCBhbnkgaXNzdWUuCgogIFNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGRy
b3AgaXQuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2lhbXRo
ZWhvcmtlci9saWJmcmVlYXB0eAoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
