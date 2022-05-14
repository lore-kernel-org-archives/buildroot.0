Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B5AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D4C83FA9;
	Sat, 14 May 2022 09:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsntzljxyRFS; Sat, 14 May 2022 09:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA5983FA7;
	Sat, 14 May 2022 09:49:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A04421BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EBC14086E
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clZ__6mMmtRW for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:49:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 759AE407D7
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:49:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id j6so20277811ejc.13
 for <buildroot@buildroot.org>; Sat, 14 May 2022 02:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lT3jqDCu3Usj0Vsys9xL0zf5xglMooIATYortttieiQ=;
 b=cf8No1lSTDxFZMWlYMS9/u+gw0vfJ7gIkj+LRT9BJAv5fB3PVChe2076RBb1Q6WkB5
 5mi7EaMuyFZ2dyCPd1jsLyAl3CrQ0/3MYWynHSDAVN3KTEIsNhZU4H1nX/5omEUUSues
 EvzTK7NNs0qBcLQdnaSgwC/Pv5df6VnZfT4c29KwHlsuyo3JtskHCNgLZ0djfDLhkS/A
 9JL3Bbv4yr8sRKt+qKwUeqt5rkjIVSOke7ltjo+NTGJPTE6e2L6b7Zz4mVugv73HrdDc
 069h1AYeMPLvhoRRS6rnM6XTY6HWdbYBtwtof7nt4Zmvj69fJJ+45a0RxQHqNvLSTSPA
 f4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lT3jqDCu3Usj0Vsys9xL0zf5xglMooIATYortttieiQ=;
 b=Cs6rUyB1LnzuESiVRejbPKDjkd7pjVmMaDij32nAgbjLPqt2hYmISF1NpzXkUl1yXa
 2cIo4PwxiHFbJgZyv4ibors3q3B/qAWhJUqlhTG7kQWvibT4QqwZtxTq68AQdoQyu/nQ
 LPvG7z8/WKhYufPnDDkyp35t21ZVLRs4wNyEn16CmLablhoYrKGO1G1xHkht/C9Ny1On
 jLpHA8r0wMA1CBmQeOPtr4/FhAyeZN5NdmpfadmQNZa4ZSSG8AfY55MoXSOYxkpQxmpJ
 qCJrLR8c6DYJeIr4E4GSoSulHdVQZsLkPJxlf5ziHCM4QIZk2YhQ94AViTh8ICOJ8cc0
 rdWw==
X-Gm-Message-State: AOAM531xdHxb4zvwG1TgCkl+i2zS6wRirgCJR3pIF4QkfJ/jY+vfJ3ni
 xRv3qUIKvsYHugV3b4MVanaUtg==
X-Google-Smtp-Source: ABdhPJxOCgVYBbuTF9QP6YEA2xxUIIP5QRH2LGMA9PDlqd1LcMQPQqhtlVVCjjqjmAWVQlMGemc/2g==
X-Received: by 2002:a17:907:6ea5:b0:6fa:967d:6d57 with SMTP id
 sh37-20020a1709076ea500b006fa967d6d57mr7611280ejc.276.1652521775656; 
 Sat, 14 May 2022 02:49:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qp24-20020a170907a21800b006f3ef214e56sm1570527ejc.188.2022.05.14.02.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 02:49:35 -0700 (PDT)
Message-ID: <f38a796e-fa42-d328-6748-c3f688adcba7@mind.be>
Date: Sat, 14 May 2022 11:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220512214906.96815-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220512214906.96815-1-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_zfs: don't run
 TestZfsBase as a test
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
Cc: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wNS8yMDIyIDIzOjQ5LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gVGhlIGNvbW1pdCBb
MV0gaW50cm9jdWRlZCBUZXN0WmZzQmFzZSBhcyBhIGNvbW1vbiBmdW5jdGlvbgo+IGJldHdlZW4g
YWxsIFpmcyB0ZXN0cy4gQnV0IFRlc3RaZnNCYXNlIHRlc3QgaXMgZXhlY3V0ZWQKPiBhcyBhIHRl
c3QgaXRzZWxmLgo+IAo+IFJlbmFtZSB0ZXN0X3J1bigpIHRvIGJhc2VfdGVzdF9ydW4oKSB0byBh
dm9pZCB0aGlzIGlzc3VlLgo+IAo+IEZpeGVzOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjQyOTAxNDAwNgo+IAo+IFsxXSA1OTNlOGNiNzFmOGYy
YWM2OTg4OTQyNGJiZWY1YWIwOWMwZGJiMDZlCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IENjOiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KCiAgQXBwbGllZCBib3RoIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IHwgMTEgKysrKysrKysrKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiBpbmRleCA4OTExZGNmZDllLi5lMzc4NGY3
ZDdkIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZz
LnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiBA
QCAtMjUsNyArMjUsNyBAQCBjbGFzcyBUZXN0WmZzQmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3Qp
Ogo+ICAgICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gICAgICAg
ICAgICIiIgo+ICAgCj4gLSAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gKyAgICBkZWYgYmFzZV90
ZXN0X3J1bihzZWxmKToKPiAgICAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2luKHNlbGYuYnVp
bGRkaXIsICJpbWFnZXMiLCAiYnpJbWFnZSIpCj4gICAgICAgICAgIGNwaW9fZmlsZSA9IG9zLnBh
dGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKPiAgICAgICAg
ICAgc2VsZi5lbXVsYXRvci5ib290KAo+IEBAIC02NSw2ICs2NSw5IEBAIGNsYXNzIFRlc3RaZnNH
bGliYyhUZXN0WmZzQmFzZSk6Cj4gICAgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9P
VExJTl9YODZfNjRfQ09SRV9JN19HTElCQ19TVEFCTEU9eQo+ICAgICAgICAgICAiIiIKPiAgIAo+
ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAgICAgIFRlc3RaZnNCYXNlLmJhc2VfdGVz
dF9ydW4oc2VsZikKPiArCj4gICAKPiAgIGNsYXNzIFRlc3RaZnNVY2xpYmMoVGVzdFpmc0Jhc2Up
Ogo+ICAgICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZyArIFwKPiBAQCAtNzIsOSArNzUs
MTUgQEAgY2xhc3MgVGVzdFpmc1VjbGliYyhUZXN0WmZzQmFzZSk6Cj4gICAgICAgICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfQ09SRV9JN19VQ0xJQkNfU1RBQkxFPXkK
PiAgICAgICAgICAgIiIiCj4gICAKPiArICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiArICAgICAg
ICBUZXN0WmZzQmFzZS5iYXNlX3Rlc3RfcnVuKHNlbGYpCj4gKwo+ICAgCj4gICBjbGFzcyBUZXN0
WmZzTXVzbChUZXN0WmZzQmFzZSk6Cj4gICAgICAgY29uZmlnID0gVGVzdFpmc0Jhc2UuY29uZmln
ICsgXAo+ICAgICAgICAgICAiIiIKPiAgICAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9C
T09UTElOX1g4Nl82NF9NVVNMX1NUQUJMRT15Cj4gICAgICAgICAgICIiIgo+ICsKPiArICAgIGRl
ZiB0ZXN0X3J1bihzZWxmKToKPiArICAgICAgICBUZXN0WmZzQmFzZS5iYXNlX3Rlc3RfcnVuKHNl
bGYpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
