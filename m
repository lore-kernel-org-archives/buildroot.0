Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A2BC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D28480DD8;
	Wed,  9 Sep 2026 14:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDhEP42g5Sp6; Wed,  9 Sep 2026 14:40:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9013680AE6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788964842;
	b=PRsCfOCtBQSAawUV+F99e+AGKBherjfJ5Z7rcMzaosOH8VwbgMGTVTWHttshZHxYltHS
	 ku7DQodLNmusU8YNqmn26m6yptKerBWN2TmXWDt7UiF2AXIFTBhouV0P3HwBz+PLQhbtk
	 DV7N8MU3rhTZ7Dyc6K86HiYB0W7N4FxMg855UGD2Xsctj+LoVX/fX3LBObT93hQNR6WaP
	 GdMS8bXXA+bDTwRU0kP+aDDg9xjH6xIRvb33pc+GaUkflJRaRFZoq6twhhIcXH/MhYG9e
	 fIPTJ0y+UwV2Nl5ccFgv4DMwDe68KTdzi8wTL6N41ddHALxkUp9Dh8GG15Z9azx6dow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788964842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jG7IYkkMCm5IErhtp7x5Z97mPGCE4GtqdRy/Oq8A9Ms=;
	b=biWebwM0IQLUuwzLkrkWP0U5nBGGyqg4kw85qqFGiwSt1jv0D/pCGCGqVc6wvS5rvo/9
	 oDbiIRZ+2mR3jd0WJNrAGzyo20p+qNYQFCRqZRicfxkh7vFI6vNq2gKyEeleSgRJydLxt
	 ye9W1AMTH7w04ENkz/LggqFRRJAYytQhln3BUXMT61Buy9jXDckpmx2XiUQZfoFXKN6XY
	 8lJ8oj/JQEMsvpPDdpAGq2GjK0sCabhyvRJvNmpJMke4WdNLnJVazXiQ/j4ILKVlYAgwo
	 FXlBXcnJ+N0cG2EGUYN40xNARzmShHrAa4FZTSWP3b5pg2EobKmR4NzPwgcvtby4Zug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788964842;
	bh=jG7IYkkMCm5IErhtp7x5Z97mPGCE4GtqdRy/Oq8A9Ms=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YoaLU1RnktnpoEpOqNCwpAEbxD0tEd1teofodWMar8AcCP5KDeL2rD9gATOuTmi67
	 AbCrr6BuQ/0Xr3mIeOg9QnfJUlqlgaUtSYcA5Ko39Y9HVueoNiyAVQ0uPMoNzwFlPs
	 dewTyQEt8zHTZxozfghr8tfClkMAwRHJZYoJOc9wXEw1L20dXiUuvJzFvJiadrzCSG
	 R+q+Pp82YR2OQweZtqBzsnBmGHm3U5B/fJyPiIVNk0/B4BfR9rxYvre6nWdiCoolGS
	 8LbaOwB3uOk+VqNZX4gMS4Lb2qGcVjg0oPNX7RQlD4RTjWP52uz8jJzSkdniCbIak/
	 NCTtpJ8Gw/yrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9013680AE6;
	Wed,  9 Sep 2026 14:40:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3F4E432
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D57A860787
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCLFi7UuZFqg for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:40:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5AE7F605AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788964840;
 b=P3OzEqKyRwXQDMzGhUz2rx11fXoClElbE64v1QRs1TATcruCgZ6WIPCdEUNyQBJtor3i
 lEvo5mTkwegIVjrzTC3EsY7g7OCzQpeT18deLi9V1Pp6OBIrRODIiYwTPKkob0UjKjpDM
 k1oNkaoID6+xoIchzFu9mw+jaU7P20f95VnLEhHJlZklBtBX8FK3UNxgPkxipT9PBm1M3
 rOsMVtu2EecNUO9rpTMMDjQSDPvWkLt97shxE/tH6RwUxq69nBATBY90bCvdeVrLKInmh
 g6g/uuUmWrgNJSIOxDR2TYimu+P3TQiWQF6sF8nMluzBIOCkorY+B9bhrqqOwaQPCyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788964840;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=TcrWmyDYpuZQbngwSUuDKuwinfNTK93Qo51k8xblblA=;
 b=jJk/liXNKQ6urqXjPoTacaml0AzI7VKqt9iNwfhmv1S/Eho4rCU31Uqaq1v2Mvnfpgsx
 o1PXLKj0tH7RhWQm4xBH6oDnZ8HbQLGVdM6RYvQRqGf1R1opb/elcD+AGbyj6LshTt6bp
 JD/Rj/j9ilLYfuSZv68N+Lvq3s7WUO3pWDlBmRiYaTu+D6tCW1BZ5+t63RstRBzFNQCbE
 cNaIekIAM6OskA/hy6aH1D0cOoYNzXJKtth1MxSlt7/4yT4VzMHjBI06jBf/C7Py4maDf
 z4924ZibswBfN13rj7jOTVvemjRSD3uoC0I+xQ44LZq6ZHXVRYEeKa+SnPD1gkx4h7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fnoNmEHz; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE7F605AD
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:40:39 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso2714945e9.3
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 07:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788964837; x=1789569637;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TcrWmyDYpuZQbngwSUuDKuwinfNTK93Qo51k8xblblA=;
 b=pRG58QQ9sv8oM4aboSmRWS8XH1UbMWzgkhWcNSz+XZkkdbSi3udn0YdPpUmGPw69KH
 LkVmVu0a7j0DpoSN6Hd122ZHNmwvQTMlc+0UWSmD9KnNjwnr1Myn7J9/MAVfjNCz42cb
 1sI+oi20DDfbXseHtt4hENwwzigoOzdx9P118afselVYtAokmENO4PeYzCpZAndzWge0
 MNVQaRqbeQ7+LRmpsveEVp+Ehtfv/7dhxb57y23ClzfAtlYvK+/Qg+PI5vm7ZWIZTVku
 tB/WbgpPL7bbZ8uBJJbdFqrEn9lPir7jBTz2vgVnE+S+x8zaLqbiQnPvjI5G5BLaZl5L
 cHrg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/ksPjdb3nxtZ+Fh5Bt3M7IU0vW6HwU9pWL6FhfnbUolrviH3iJAX17MeVDvMSlLQd6wRXsRWerM0=@buildroot.org
X-Gm-Message-State: AFuF++mg8KsMv6z8ZKFAuAluQYY3wR7bjH07Nq2Z3nQgHEvJ1xxCqDDH
 cVeakQM732XgdkOzYT3jr0/lKsRXovRV8QpacXMCiLBwWnzkNOzbKqRBtv5sbs6VRwI=
X-Gm-Gg: AYBFou3MArLjh+HsIkDUzlySqLH2epCqgHd4MHSQK9HeBFpP0KM2gTjJi0N0mw9tnZp
 1Zsd/bk8TERcZK464GKENfgQUNHZGcUbRNwj1mfDCupfaEpEfWdvbiyRAIDDBicBZ+6cqnFzSy5
 f4S2GIYUXaDOMWDP+CkgyDhs8Ym1tZ4/nuif7Xivhj+r0rMTolaY8jlg8t8QGW8AR5oq7pzrfbd
 OJg26Rh9V6M2YdSk4yap4tFq2zBPMWXszn8NtRw/8Y9G91IOmjigjV+ETWU0QPwB9T37IbVQXtY
 Ii23q7yfZ3D+CW6Eo80j70a1eKsqIRGPaHVzr2FMMmxEeJ3C8fcK3qFbcWamq+E+rPLDruT3P8W
 liUJYbpb96ByzkqDzWVOq+0QKQ3JyY7oSCZkm/TpxgVRBeiKE6SQho7vlvC2r1E5AdyNxznq7II
 W3LqT40Fc+WUgrziEuOhkdkwb5EESwdy8WXHrp9tuVwn5CS7dZ9hlq2seVXNAeVdAd675O7b8QJ
 Ej6atLmzuwqDupbqwi/K5176Zk/RkMj5/mUv9wBMWEpo1JLdW4qbaHCw/iLWXZ65bXOFI1k3g==
X-Received: by 2002:a05:600c:22d1:b0:49b:4d64:bbc4 with SMTP id
 5b1f17b1804b1-49d258fa850mr19669325e9.8.1788964837254; 
 Wed, 09 Sep 2026 07:40:37 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d04fe7f9dsm377923235e9.0.2026.09.09.07.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:40:36 -0700 (PDT)
Message-ID: <643ab362-2687-448a-b4e8-3ab9d539bf4f@smile.fr>
Date: Wed, 9 Sep 2026 16:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
 <20260906233048.692559-6-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260906233048.692559-6-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 6/6] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCkxlIDA3LzA5LzIwMjYgw6AgMDE6MzAsIEJlcm5kIEt1aGxzIGEgw6ljcml0
wqA6Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5j
ZS8yMDI2LVNlcHRlbWJlci8wMDA4NjguaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNi1BdWd1c3QvMDAwODY3Lmh0bWwKPiAKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjYt
QXVndXN0LzAwMDg2My5odG1sCj4gIk9uZSBpbXBvcnRhbnQgbm90ZSBmb3IgcGFja2FnZXJzIGlz
IHRoYXQgdGhlcmUgaXMgbm93IGEgTWVzYSBjb21tdW5pdHkKPiBtYWludGFpbmVkIGxpYmNsYyBm
b3JrIHRoYXQgaXMgdmVyaWZpZWQgdG8gcGFzcyB0aGUgT3BlbkNMIENUUyB3aXRoCj4gTWVzYS9S
dXN0aWNsLCBhbmQgd2lsbCBmaXggYnVncyBhZnRlciBhbiB1cHN0cmVhbSBsaWJjbGMgbWFqb3Ig
cmVsZWFzZQo+IGJyYW5jaCBnb2VzIEVvTC4gVGhlIE1lc2EgYnVpbGQgc3lzdGVtIHdpbGwgcGlj
ayBpdCB1cCB3aGVuIGF2YWlsYWJsZSwKPiBhbmQgZmFsbCBiYWNrIHRvIHVwc3RyZWFtIGxpYmNs
YyBpZiBub3QuIFRoaXMgbGliY2xjIGZvcmsgaXMgbm90Cj4gdmVyaWZpZWQgZm9yIGFueSBvdGhl
ciB1c2FnZXMgb3IgdXNlcnMgb2YgbGliY2xjIG91dHNpZGUgb2YgTWVzYS4iCgpXZSBwYWNrYWdl
IG9ubHkgb25lIGxsdm0gdmVyc2lvbiAoY3VycmVudGx5IGxsdm0gMjIpIHdoaWxlIG1lc2EtbGli
Y2xjIHByb3ZpZGUgYQpicmFuY2ggZm9yIDMgbGx2bSB2ZXJzaW9ucyAoMjEsIDIyLCAyMykuIE1h
eWJlIGl0IHdvcnRoIHRyeWluZyBhZGRpbmcgbWVzYQpwYXRjaGVzIHRvIGxpYmNsYz8KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgo+IAo+IFRoaXMgYnVtcCBpbmNsdWRlcyB0aGUgc3dpdGNoIHRvIHRo
ZSBuZXdseSBpbnRyb2R1Y2VkIG1lc2EtbGliY2xjCj4gcGFja2FnZS4KPiAKPiBSZW1vdmVkIHBh
dGNoIHdoaWNoIHdhcyBhcHBsaWVkIHRvIGZpeCBhIGJ1aWxkIGVycm9yIHdpdGggZ2NjIDwgMTMg
c2Vlbgo+IHdpdGggbWVzYSAyNi4xLnguCj4gCj4gVXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC8zZjk0NTFiNTRjNDJhMzdi
NDEyNDZkZTNjZWVhOTkxMTExMzg5YzM3Cj4gYWRkZWQgcnVzdGljbCB0byB0aGUgdmFyaWFibGUg
d2l0aF9kcml2ZXJfdXNpbmdfY2wgd2hpY2ggY3JlYXRlcyBhIG5ldwo+IGRlcGVuZGVuY3kgdG8g
dGhlIHByZWNvbXAtY29tcGlsZXI6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvbWVzYS8tL2Jsb2IvbWVzYS0yNi4yLjIvbWVzb24uYnVpbGQ/cmVmX3R5cGU9dGFncyNMOTcz
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0K
PiAgcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayAgICAgIHwgIDIgKy0K
PiAgLi4uZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoIHwgNDEgLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgICAgfCAgMyArLQo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCAgICAgICAgICAg
ICAgICAgICAgfCAgNiArLS0KPiAgcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKy0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0
OSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLzAwMDUt
c3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRj
aAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJz
Lm1rIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNhM2QtaGVhZGVycy5tawo+IGluZGV4IGZk
NzE1YjVmODQuLjE1MzgyZDlhZTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QtaGVhZGVy
cy9tZXNhM2QtaGVhZGVycy5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNk
LWhlYWRlcnMubWsKPiBAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgo+ICAKPiAgIyBOb3QgcG9zc2li
bGUgdG8gZGlyZWN0bHkgcmVmZXIgdG8gbWVzYTNkIHZhcmlhYmxlcywgYmVjYXVzZSBvZgo+ICAj
IGZpcnN0L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KPiAtTUVTQTNEX0hFQURFUlNfVkVS
U0lPTiA9IDI2LjEuOAo+ICtNRVNBM0RfSEVBREVSU19WRVJTSU9OID0gMjYuMi4yCj4gIE1FU0Ez
RF9IRUFERVJTX1NPVVJDRSA9IG1lc2EtJChNRVNBM0RfSEVBREVSU19WRVJTSU9OKS50YXIueHoK
PiAgTUVTQTNEX0hFQURFUlNfU0lURSA9IGh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qub3JnCj4gIE1F
U0EzRF9IRUFERVJTX0RMX1NVQkRJUiA9IG1lc2EzZAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21l
c2EzZC8wMDA1LXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlw
ZWQtZW4ucGF0Y2ggYi9wYWNrYWdlL21lc2EzZC8wMDA1LXNyYy1pbnRlbC1jb21waWxlci1qYXkt
amF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKPiBkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCBhZjA2NjI4N2UyLi4wMDAwMDAwMDAwCj4gLS0tIGEvcGFja2FnZS9tZXNh
M2QvMDAwNS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVk
LWVuLnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDQxICswLDAgQEAKPiAtRnJvbSAzNDVj
Y2Y5M2U5ZDAwZGZkMGY3MTA4NTgzMmE3ZGYwMTcwYjc0Zjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+IC1Gcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgo+IC1E
YXRlOiBTdW4sIDE0IEp1biAyMDI2IDE3OjQyOjE5ICswMjAwCj4gLVN1YmplY3Q6IFtQQVRDSF0g
c3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDogZG8gbm90IHVzZWQgdHlwZWQgZW51bQo+
IC0KPiAtVGhpcyBpcyBhIEMyMyBmZWF0dXJlIGFuZCBub3Qgc3VwcG9ydGVkIGJ5IGdjYyA8IDEz
LCB3aGljaAo+IC1tYW55IGhvc3QgZGlzdHJvcyBzdGlsbCBoYXZlIChlLmcuIERlYmlhbiAxMiku
Cj4gLQo+IC1VcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3lvY3RvIGhvc3QgZGlzdHJv
IHJlcXVpcmVtZW50c10KPiAtU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhA
bGludXRyb25peC5kZT4KPiAtVXBzdHJlYW06IE4vQSwgY29kZSBjb21wbGV0ZWx5IGNoYW5nZWQg
dXBzdHJlYW0KPiAtU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4KPiAtLS0tCj4gLSBzcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9p
ci5oIHwgNCArKy0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL3NyYy9pbnRlbC9jb21waWxlci9qYXkvamF5X2ly
LmggYi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oCj4gLWluZGV4IDgzMDcwNDRlZjhh
Li5hYmYxNzVhNzFiZiAxMDA2NDQKPiAtLS0tIGEvc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlf
aXIuaAo+IC0rKysgYi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oCj4gLUBAIC01Nzks
NyArNTc5LDcgQEAgamF5X3R5cGVfaXNfYW55X2Zsb2F0KGVudW0gamF5X3R5cGUgdCkKPiAtICAg
IHJldHVybiBqYXlfYmFzZV90eXBlKHQpID09IEpBWV9UWVBFX0YgfHwgamF5X2Jhc2VfdHlwZSh0
KSA9PSBKQVlfVFlQRV9CRjsKPiAtIH0KPiAtIAo+IC0tZW51bSBqYXlfcHJlZGljYXRpb24gOiB1
aW50OF90IHsKPiAtK2VudW0gamF5X3ByZWRpY2F0aW9uIHsKPiAtICAgIC8qKiBObyBwcmVkaWNh
dGlvbi4gKi8KPiAtICAgIEpBWV9OT1RfUFJFRElDQVRFRCA9IDAsCj4gLSAKPiAtQEAgLTYzNCw3
ICs2MzQsNyBAQCB0eXBlZGVmIHN0cnVjdCBqYXlfaW5zdCB7Cj4gLSAgICBib29sIGRlY3JlbWVu
dF9kZXA6MTsKPiAtICAgIHVuc2lnbmVkIHBhZGRpbmcgIDoxMjsKPiAtIAo+IC0tICAgZW51bSBq
YXlfcHJlZGljYXRpb24gcHJlZGljYXRpb247Cj4gLSsgICB1aW50OF90IHByZWRpY2F0aW9uOwo+
IC0gICAgZW51bSBqYXlfY29uZGl0aW9uYWxfbW9kIGNvbmRpdGlvbmFsX21vZDsKPiAtIAo+IC0g
ICAgamF5X2RlZiBjb25kX2ZsYWc7IC8qKjwgY29uZGl0aW9uYWwgZmxhZyAqLwo+IC0tLSAKPiAt
Mi41NS4wCj4gLQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4gYi9wYWNr
YWdlL21lc2EzZC9Db25maWcuaW4KPiBpbmRleCBmNDVhNjc1NDQ1Li5kMTdkNDMyMjg3IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvbWVzYTNk
L0NvbmZpZy5pbgo+IEBAIC02Myw3ICs2Myw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0Rf
UlVTVElDTAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xMVk1fRFVNUAo+ICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX0xMVk1fUlRUSQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NMQU5HCj4gLQlzZWxlY3Qg
QlIyX1BBQ0tBR0VfTElCQ0xDCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQV9MSUJDTEMKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfUFJFQ09NUF9DT01QSUxFUgo+ICAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1NQSVJWX1RPT0xTCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZf
TExWTV9UUkFOU0xBVE9SCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNMX0lDRF9MT0FERVIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2ggYi9wYWNrYWdlL21lc2Ez
ZC9tZXNhM2QuaGFzaAo+IGluZGV4IGRjNzc3NjQ4OGEuLmE2ZDExYWE4ZWYgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLmhhc2gKPiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QuaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+IC0jIEZyb20gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8yMDI2LUF1Z3VzdC8wMDA4NjUuaHRtbAo+
IC1zaGEyNTYgIGIzMjBmNjU4NzRmZDk2NTNhYzZjMGJkMTYxNjYwNTM4NzM0NGUxMjQ3NDExYTUw
Yzc5N2I1ZjNmYjlkYzBiNTUgIG1lc2EtMjYuMS44LnRhci54ego+IC1zaGE1MTIgIGViM2Q0NmFl
OWFhYmE3MGZkZDkwODQ4NmNlZjI0MDQxZmVjOTI2NGRkZjU4NmVhZWJiYmE2NWNlNTVlNzE2ZDMw
NmVmOWU5MWJlODNlNzQyZGZhZWM0ZGZjOTQxMDVhNWNkM2EzNmIyOWJmNTY2MTRmZWJjYmNmNmMx
ZjhiNTE2ICBtZXNhLTI2LjEuOC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNi1TZXB0ZW1iZXIvMDAwODY4Lmh0
bWwKPiArc2hhMjU2ICBlZWIyOWNhN2U1NmNmYWE4ZThhNzk1MzhkY2Y4MzRlM2IxOGU1MDFjMzFi
ZWY1MTQ1ZTk1OWVhNDM3Y2M0MjE2ICBtZXNhLTI2LjIuMi50YXIueHoKPiArc2hhNTEyICA1NWIx
MjM0Yzg2NTNkYWQ5Yjg1YmEzZGU3Yjc3N2EwZDk1NzkwOWJhZjQ2MjhmMGMwMGUyMWQ0YmE4OWMw
MDRjYjY4N2ExZGNmOGRhNDZlZDBhMDkyMjMxZGQ0Zjg1OTAyNzUwOWY4M2FkOGM1NTg3NTA4NDVi
YTQ3MDkwMjYxNSAgbWVzYS0yNi4yLjIudGFyLnh6Cj4gICMgTGljZW5zZQo+ICBzaGEyNTYgIDBk
MWEwNDcyZWNjODE4MzBlNzVjMjBkNTliMGVhMDI4NDFlM2RiMjEyNTVlMGViYWQ5N2FiNjgyYzU0
ZDY2MTUgIGRvY3MvbGljZW5zZS5yc3QKPiAgc2hhMjU2ICAzMjNjNTg3ZDBjY2YxMGUzNzZmOGJm
OWE3ZjMxZmI0Y2E2MDc4MTA1MTk0YjQyZTBiMWUwZWUyYmM5YmRlNzFmICBsaWNlbnNlcy9NSVQK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2Qv
bWVzYTNkLm1rCj4gaW5kZXggNzc5ZWE5ZjExMS4uYzY3MDdiNTNiZSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiArKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsK
PiBAQCAtNSw3ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gICMgV2hl
biB1cGRhdGluZyB0aGUgdmVyc2lvbiwgcGxlYXNlIGFsc28gdXBkYXRlIG1lc2EzZC1oZWFkZXJz
Cj4gLU1FU0EzRF9WRVJTSU9OID0gMjYuMS44Cj4gK01FU0EzRF9WRVJTSU9OID0gMjYuMi4yCj4g
IE1FU0EzRF9TT1VSQ0UgPSBtZXNhLSQoTUVTQTNEX1ZFUlNJT04pLnRhci54ego+ICBNRVNBM0Rf
U0lURSA9IGh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qub3JnCj4gIE1FU0EzRF9MSUNFTlNFID0gTUlU
LCBTR0ksIEtocm9ub3MKPiBAQCAtNTcsNyArNTcsNyBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX01F
U0EzRF9SVVNUSUNMKSx5KQo+ICBNRVNBM0RfUFJPVklERVMgKz0gbGlib3BlbmNsCj4gIE1FU0Ez
RF9ERVBFTkRFTkNJRVMgKz0gXAo+ICAJY2xhbmcgXAo+IC0JbGliY2xjIFwKPiArCW1lc2EtbGli
Y2xjIFwKPiAgCWhvc3QtcnVzdGMgXAo+ICAJaG9zdC1ydXN0LWJpbmRnZW4gXAo+ICAJc3BpcnYt
dG9vbHMgXAo+IEBAIC0zNTcsNyArMzU3LDcgQEAgSE9TVF9NRVNBM0RfQ09ORl9PUFRTICs9IC1E
Y3BwX3J0dGk9ZmFsc2UKPiAgZW5kaWYKPiAgCj4gIEhPU1RfTUVTQTNEX0RFUEVOREVOQ0lFUyA9
IFwKPiAtCWhvc3QtbGliY2xjIFwKPiArCWhvc3QtbWVzYS1saWJjbGMgXAo+ICAJaG9zdC1saWJk
cm0gXAo+ICAJaG9zdC1sbHZtIFwKPiAgCWhvc3QtcHl0aG9uLW1ha28gXAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
