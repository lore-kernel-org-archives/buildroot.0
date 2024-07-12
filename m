Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01520C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A49641707;
	Fri, 12 Jul 2024 13:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0irgkEWqCbvZ; Fri, 12 Jul 2024 13:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2755D41722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2755D41722;
	Fri, 12 Jul 2024 13:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F931BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290C780DC0
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPev7C5YxDfl for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E413C80D9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E413C80D9B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E413C80D9B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:04:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so13060085e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720789453; x=1721394253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2Ol1crDhQTOmcoKmmassTK/LyRXS1rOFUutIHC0t4c=;
 b=QWJVQoYel7eiYSH9xab3PJqm20tkwwG4HRaE7jx59Vn4j4S0Y/b6lIgKMfanFl78xb
 EHaf6gK9nQNYoudvXX8yBo/WV9rXhvRArt59lhDyhOxSU4W6Ut9ipMJkAI5n9AYXF8/7
 xjcbWYVeZ+fBG1LdT2AHfx7QFlyQzRU8HG8jytaz5BWcYvzMdg/t7uJN4vh7tml+ePnV
 5Q8YKHati50BmGjyyt2c9Up8GeDi8Rr/PFa9FWTsHyBhLAASTv3MKvf+7Hzab674iKyM
 lcqK8/yrKiTtvVE2GoiLt+K3TomlMUiMHKTZCMOBdnlEWNoJygTh1YN+kAKIykcePVx9
 twSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0Rczj2/ecOdoyewYd8sT7sKo5LogZwngYFCNi00w9npxfHwa1WYjWmDxtyD17Y5LgiLjXyPQBuRGZ+gNr3p5S3p7H6vUXaQ==
X-Gm-Message-State: AOJu0YzOFi9GI5z9nhlj3GplWltOEcTrmKlmbzYz2K73ZA3hvPDpxZXr
 Fe45F43ntk2qSECE2wG4uB0/5RPwubYgF+8c5fvVuuvr6+6jTEeOAC86ijireUM=
X-Google-Smtp-Source: AGHT+IFJN2w9X1OFPMSg9a5nsLDidrwjzhMd9AV88RPy/MwTZKA6UrC6woZ0DtSsHK2vAzRN4G7O+g==
X-Received: by 2002:a05:600c:28b:b0:426:6f81:d235 with SMTP id
 5b1f17b1804b1-426707d9c3dmr89655155e9.15.1720789452907; 
 Fri, 12 Jul 2024 06:04:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde890d3sm10245516f8f.59.2024.07.12.06.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 06:04:12 -0700 (PDT)
Message-ID: <fd3ee48a-04a5-475c-9276-dfd40138e1cd@smile.fr>
Date: Fri, 12 Jul 2024 15:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
 <20240524-loongarch64-v1-2-d24078d79cd5@flygoat.com>
Content-Language: fr
In-Reply-To: <20240524-loongarch64-v1-2-d24078d79cd5@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720789453; x=1721394253; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2Ol1crDhQTOmcoKmmassTK/LyRXS1rOFUutIHC0t4c=;
 b=RXvhg2TXJ73wjFLQekt7w3xSFZRaB+wH15mxaXLBgAzLMOWS+T/P8AD3TgHhSNTpco
 nT4tlKqgo2KlRN7/7atnykHcIpIh8V9EBnnwF+QR6d3XISN07ZA2Y4Wi6nX1JKofx4/d
 0R/AJvc9Jn4cdjrddGnaLoDhStAsZ81wZ6c2s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RXvhg2TX
Subject: Re: [Buildroot] [PATCH RESEND 2/7] package/gcc: Introduce
 BR2_GCC_TARGET_SIMD option
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmlheHVuLAoKTGUgMjQvMDUvMjAyNCDDoCAyMTozNiwgSmlheHVuIFlhbmcgYSDDqWNy
aXTCoDoKPiBJbnRyb2R1Y2UgQlIyX0dDQ19UQVJHRVRfU0lNRCBmb3IgZ2NjIHRvIGhhbmRsZSAt
LXdpdGgtc2ltZC8tbXNpbWQKPiBwcmVzZW50IGF0IGxvb25nYXJjaCdzIGdjYyBvcHRpb25zLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4K
PiAtLS0KPiAgYXJjaC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNiArKysrKysKPiAgYXJjaC9hcmNoLm1rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIHBhY2thZ2UvZ2NjL2djYy5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKwo+ICB0b29sY2hhaW4vdG9vbGNoYWlu
LWV4dGVybmFsL3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgfCA0ICsrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmlu
IGIvYXJjaC9Db25maWcuaW4KPiBpbmRleCBmMzljMzNlZjdmZmYuLmNjOTAyNDQ2YmZkOSAxMDA2
NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbgo+ICsrKyBiL2FyY2gvQ29uZmlnLmluCj4gQEAgLTM1
MCw2ICszNTAsMTIgQEAgY29uZmlnIEJSMl9HQ0NfVEFSR0VUX0ZQVQo+ICBjb25maWcgQlIyX0dD
Q19UQVJHRVRfRkxPQVRfQUJJCj4gIAlzdHJpbmcKPiAgCj4gKyMgVGhlIHZhbHVlIG9mIHRoaXMg
b3B0aW9uIHdpbGwgYmUgcGFzc2VkIGFzIC0td2l0aC1zaW1kPTx2YWx1ZT4gd2hlbgo+ICsjIGJ1
aWxkaW5nIGdjYyAoaW50ZXJuYWwgYmFja2VuZCkgb3IgLXNpbWQ9PHZhbHVlPiBpbiB0aGUgdG9v
bGNoYWluCj4gKyMgd3JhcHBlciAoZXh0ZXJuYWwgdG9vbGNoYWluKQo+ICtjb25maWcgQlIyX0dD
Q19UQVJHRVRfU0lNRAo+ICsJc3RyaW5nCj4gKwo+ICAjIFRoZSB2YWx1ZSBvZiB0aGlzIG9wdGlv
biB3aWxsIGJlIHBhc3NlZCBhcyAtLXdpdGgtbW9kZT08dmFsdWU+IHdoZW4KPiAgIyBidWlsZGlu
ZyBnY2MgKGludGVybmFsIGJhY2tlbmQpIG9yIC1tPHZhbHVlPiBpbiB0aGUgdG9vbGNoYWluCj4g
ICMgd3JhcHBlciAoZXh0ZXJuYWwgdG9vbGNoYWluKQo+IGRpZmYgLS1naXQgYS9hcmNoL2FyY2gu
bWsgYi9hcmNoL2FyY2gubWsKPiBpbmRleCA0MTc0ZDMzZGY1NDguLjRhNzg1MWE5ZmRjZSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FyY2gubWsKPiArKysgYi9hcmNoL2FyY2gubWsKPiBAQCAtMTYsNiAr
MTYsNyBAQCBHQ0NfVEFSR0VUX0ZQMzJfTU9ERSA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0dDQ19U
QVJHRVRfRlAzMl9NT0RFKSkKPiAgR0NDX1RBUkdFVF9DUFUgOj0gJChjYWxsIHFzdHJpcCwkKEJS
Ml9HQ0NfVEFSR0VUX0NQVSkpCj4gIEdDQ19UQVJHRVRfRlBVIDo9ICQoY2FsbCBxc3RyaXAsJChC
UjJfR0NDX1RBUkdFVF9GUFUpKQo+ICBHQ0NfVEFSR0VUX0ZMT0FUX0FCSSA6PSAkKGNhbGwgcXN0
cmlwLCQoQlIyX0dDQ19UQVJHRVRfRkxPQVRfQUJJKSkKPiArR0NDX1RBUkdFVF9TSU1EIDo9ICQo
Y2FsbCBxc3RyaXAsJChCUjJfR0NDX1RBUkdFVF9TSU1EKSkKPiAgR0NDX1RBUkdFVF9NT0RFIDo9
ICQoY2FsbCBxc3RyaXAsJChCUjJfR0NDX1RBUkdFVF9NT0RFKSkKPiAgCj4gICMgRXhwbGljaXRs
eSBzZXQgTEQncyAibWF4LXBhZ2Utc2l6ZSIgaW5zdGVhZCBvZiByZWx5aW5nIG9uIHNvbWUgZGVm
YXVsdHMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2MvZ2NjLm1rIGIvcGFja2FnZS9nY2MvZ2Nj
Lm1rCj4gaW5kZXggNjcyZjk0NzJhOTQ3Li4zOTQ1NTk0NzljZTEgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9nY2MvZ2NjLm1rCj4gKysrIGIvcGFja2FnZS9nY2MvZ2NjLm1rCj4gQEAgLTI1MSw2ICsy
NTEsMTAgQEAgaWZuZXEgKCQoR0NDX1RBUkdFVF9GTE9BVF9BQkkpLCkKPiAgSE9TVF9HQ0NfQ09N
TU9OX0NPTkZfT1BUUyArPSAtLXdpdGgtZmxvYXQ9JChHQ0NfVEFSR0VUX0ZMT0FUX0FCSSkKPiAg
ZW5kaWYKPiAgCj4gK2lmbmVxICgkKEdDQ19UQVJHRVRfU0lNRCksKQo+ICtIT1NUX0dDQ19DT01N
T05fQ09ORl9PUFRTICs9IC0td2l0aC1zaW1kPSQoR0NDX1RBUkdFVF9TSU1EKQo+ICtlbmRpZgo+
ICsKPiAgaWZuZXEgKCQoR0NDX1RBUkdFVF9NT0RFKSwpCj4gIEhPU1RfR0NDX0NPTU1PTl9DT05G
X09QVFMgKz0gLS13aXRoLW1vZGU9JChHQ0NfVEFSR0VUX01PREUpCj4gIGVuZGlmCj4gZGlmZiAt
LWdpdCBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5h
bC5tayBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5h
bC5tawo+IGluZGV4IGMwOGJmMGE2NTM5MS4uMmMyYWZhNzZjMDY5IDEwMDY0NAo+IC0tLSBhL3Rv
b2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tawo+ICsr
KyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5t
awo+IEBAIC0yMTcsNiArMjE3LDEwIEBAIGlmbmVxICgkKEdDQ19UQVJHRVRfRkxPQVRfQUJJKSwp
Cj4gIFRPT0xDSEFJTl9FWFRFUk5BTF9DRkxBR1MgKz0gLW1mbG9hdC1hYmk9JChHQ0NfVEFSR0VU
X0ZMT0FUX0FCSSkKPiAgVE9PTENIQUlOX0VYVEVSTkFMX1RPT0xDSEFJTl9XUkFQUEVSX0FSR1Mg
Kz0gLURCUl9GTE9BVF9BQkk9JyIkKEdDQ19UQVJHRVRfRkxPQVRfQUJJKSInCj4gIGVuZGlmCj4g
K2lmbmVxICgkKEdDQ19UQVJHRVRfU0lNRCksKQo+ICtUT09MQ0hBSU5fRVhURVJOQUxfQ0ZMQUdT
ICs9IC1tc2ltZD0kKEdDQ19UQVJHRVRfU0lNRCkKPiArVE9PTENIQUlOX0VYVEVSTkFMX1RPT0xD
SEFJTl9XUkFQUEVSX0FSR1MgKz0gLURCUl9TSU1EPSciJChHQ0NfVEFSR0VUX1NJTUQpIicKCkJS
X1NJTUQgbXVzdCBiZSB1c2VkIGluIHRoZSB0b29sY2hhaW4gd3JhcHBlciBjb2RlIChtaXNzaW5n
IGdpdCBhZGQgPykKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArZW5kaWYKPiAgaWZuZXEgKCQo
R0NDX1RBUkdFVF9NT0RFKSwpCj4gIFRPT0xDSEFJTl9FWFRFUk5BTF9DRkxBR1MgKz0gLW0kKEdD
Q19UQVJHRVRfTU9ERSkKPiAgVE9PTENIQUlOX0VYVEVSTkFMX1RPT0xDSEFJTl9XUkFQUEVSX0FS
R1MgKz0gLURCUl9NT0RFPSciJChHQ0NfVEFSR0VUX01PREUpIicKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
