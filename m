Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9876C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 08:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49759400CF;
	Wed, 20 Mar 2024 08:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J92zHAy02Q1R; Wed, 20 Mar 2024 08:02:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED434012E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED434012E;
	Wed, 20 Mar 2024 08:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAE91BF82F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 08:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A19681EB7
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 08:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTm5HxbNoy04 for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 08:02:34 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Mar 2024 08:02:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF7A6813FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF7A6813FF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF7A6813FF
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 08:02:33 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:55:20 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2024 08:55:20 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 08:55:18 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Wed, 20 Mar 2024 08:55:17 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.07,139,1708383600"; d="scan'208";a="120669102"
Date: Wed, 20 Mar 2024 08:55:17 +0100
To: Phil Williams <phil.williams@advisoft.co.nz>
Message-ID: <ZfqWZTDSOg9lUlpu@tl-lnx-nyma7486-2>
References: <ebb78d96-4372-4df8-b891-a46ff8703724@advisoft.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebb78d96-4372-4df8-b891-a46ff8703724@advisoft.co.nz>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX605.corporate.adroot.infra.ftgroup
 (10.115.27.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1710921754; x=1742457754;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=/NtB2NrDoFSlUO6Nlxdr05y2r1TkiHyL+7POkXmGxSs=;
 b=ovqmWA1fnHAONRGl7EHAFhaBhddNt/0LAmLukXgaD/l+aCBo9Sk4c8oW
 DUoFn3rQTVYVl/+y+SBQ1mF7vx3AZwvoF3M1BKoPpwlxZdq20Tf2S0B3g
 6OfJQxT2SGYBgqokjxpxQnHdx4qvWbCCU7eMhH394hAfLRHzxbmZVlbEf
 hgetBVlce5Rx+lV/+HQkXFpXOYpem7GylI4xyAlzrbUPCJxrqZ2tsgOfh
 3FPhuk8ht3s6p92uNu/A5PD0e8lLl/u1gqdXYHMRDS+RO0Po65+NaG36V
 NmgjH/KXK4TNKsYdW6msnPFlpy9ndOWf8wBVn0ByTxfYwHYZvsdN3xhWe
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ovqmWA1f
Subject: Re: [Buildroot] go receipe not installing go.env
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGhpbCwgQWwsCgpPbiAyMDI0LTAzLTIwIDEzOjE3ICsxMzAwLCBQaGlsIFdpbGxpYW1zIHNwYWtl
IHRodXNseToKPiBJIHJhbiBpbnRvIHRoaXMgaXNzdWUgd2hlbiB1c2luZyB0aGUgdG9vbGNoYWlu
IGNvbXBpbGVkIHdpdGggYnVpbGRyb290Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28v
aXNzdWVzLzYxOTI4CgpGVFIsIHRoZSBpc3N1ZSBpcyBnbyB3aGlubmluZyBhYm91dDoKCiAgICBH
T1BST1hZIGxpc3QgaXMgbm90IHRoZSBlbXB0eSBzdHJpbmcsIGJ1dCBjb250YWlucyBubyBlbnRy
aWVzCgo+IEFwYXJlbnRseSB0aGUgZGVmYXVsdCBHT1BST1hZIGNvbmZpZ3VyYXRpb24gaXMgbm93
IHJlYWQgZnJvbSBHT1JPT1QvZ28uZW52Lgo+IAo+IEkgbWFkZSB0aGUgZm9sbG93aW5nIGNoYW5n
ZSB3aGljaCBmaXhlZCBteSBpc3N1ZToKClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24sIHNlZSBi
ZWxvdy4uLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby5tayBiL3BhY2thZ2UvZ28vZ28u
bWsKPiBpbmRleCA5ZWZkNGEzMS4uZDAzMWZkMjUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nby9n
by5tawo+ICsrKyBiL3BhY2thZ2UvZ28vZ28ubWsKPiBAQCAtMTUzLDYgKzE1Myw4IEBAIGRlZmlu
ZSBIT1NUX0dPX0lOU1RBTExfQ01EUwo+IAo+IMKgwqDCoMKgwqDCoMKgIGNwIC1hICQoQEQpL2xp
YiAkKEhPU1RfR09fUk9PVCkvCj4gCj4gK8KgwqDCoMKgwqDCoCBjcCAtYSAkKEBEKS9nby5lbnYg
JChIT1NUX0dPX1JPT1QpLwoKVGhlIGRlZmF1bHQgZ28uZW52IGFzIHByb3ZpZGVkIGJ5IGdvLCBj
b250YWluczoKICAgIEdPUFJPWFk9aHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdAoKVGhp
cyBsb29rcyBsaWtlIHRoaXMgaXMgZ29pbmcgdG8gZmlydCB0cnkgdGhlIGh0dHBzOi8vcHJveHku
Z29sYW5nLm9yZwpwcm94eSwgYW5kIGZhbGxiYWNrIHRvIGRpcmVjdCBkb3dubG9hZCBpZiBtaXNz
aW5nIG9uIHRoZSBwcm94eS4KCkkgZG9uJ3QgdGhpbmsgdGhhdCBpcyB3aGF0IHdlIHdhbnQuIElu
c3RlYWQsIHdlIHdhbnQgdG8ga2VlcCB0aGUKZXhpc3RpbmcgYmVoYXZpb3VyOgoKICAtIHdoZW4g
d2UgZG93bmxvYWQsIHdlIHdhbnQgdG8gZG8gYSBkaXJlY3QgZG93bmxvZCB3aXRob3V0IGdvaW5n
CiAgICB0aHJvdWdoIGFueSBwcm94eSBhdCBhbGwKCiAgLSB3aGVuIHdlIGJ1aWxkLCB3ZSBkbyBu
b3Qgd2FudCB0byBnbyBhbmQgZmV0Y2ggYW55dGhpbmcsIGFzIHdlIGFyZQogICAgc3VwcG9zZWQg
dG8gaGF2ZSBldmVyeXRoaW5nIGFscmVhZHkgdmVuZG9yZWQgYXQgZG93bmxvYWQgdGltZS4KCkhv
d2V2ZXIsIGFzIEkgcmVhZCBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vYmxvYi9t
YXN0ZXIvZ28uZW52CnNldHRpbmcgR09QUk9YWSBpbiB0aGUgZW52aXJvbm1lbnQgc2hvdWxkIHN0
aWxsIGJlIHN1cHBvcnRlZDoKCiAgICAjIFRoZSBlbnZpcm9ubWVudCBvdmVycmlkZXMgZXZlcnl0
aGluZyBlbHNlLgoKQW5kIHRoZSB1cHN0cmVhbSBkb2N1bWVudGF0aW9uIHN0aWxsIHJlZmVyZW5j
ZXMgaXQsIHdpdGggdGhlIHZhbHVlcyB3ZQphcmUgY3VycmVudGx5IHVzaW5nOgoKICAgIGh0dHBz
Oi8vZ28uZGV2L3JlZi9tb2QjZW52aXJvbm1lbnQtdmFyaWFibGVzCgogICAgVHdvIGtleXdvcmRz
IG1heSBiZSB1c2VkIGluIHBsYWNlIG9mIHByb3h5IFVSTHM6CgogICAgICAqIG9mZjogZGlzYWxs
b3dzIGRvd25sb2FkaW5nIG1vZHVsZXMgZnJvbSBhbnkgc291cmNlLgogICAgICAqIGRpcmVjdDog
ZG93bmxvYWQgZGlyZWN0bHkgZnJvbSB2ZXJzaW9uIGNvbnRyb2wgcmVwb3NpdG9yaWVzIGluc3Rl
YWQKICAgICAgICBvZiB1c2luZyBhIG1vZHVsZSBwcm94eS4KClNvIHdlJ2QgbmVlZCBhIGxpdHRs
ZSBiaXQgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgYWN0dWFsIGlzc3VlOgoKICAtIHdoYXQg
cGFja2FnZSBkbyB5b3UgZ2V0IHRoZSBpc3N1ZSB3aXRoPwogIC0gaXMgaXQgZHVyaW5nIGRvd25s
b2FkICh2ZW5kb3JpbmcpLCBvciBkdXJpbmcgYnVpbGQ/CiAgLSBjYW4geW91IHNoYXJlIGEgcmVw
cm9kdWNlcj8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IMKgwqDCoMKgwqDCoMKgIG1rZGly
IC1wICQoSE9TVF9HT19ST09UKS9wa2cKPiDCoMKgwqDCoMKgwqDCoCBjcCAtYSAkKEBEKS9wa2cv
aW5jbHVkZSAkKEhPU1RfR09fUk9PVCkvcGtnLwo+IMKgwqDCoMKgwqDCoMKgIGNwIC1hICQoQEQp
L3BrZy90b29sICQoSE9TVF9HT19ST09UKS9wa2cvCj4gCj4gSSBkb24ndCBrbm93IGVub3VnaCBh
Ym91dCBidWlsZHJvb3Qgb3IgZ28gYXMgdG8gd2hldGhlciB0aGlzIHdvdWxkIGJlIHVzZWZ1bAo+
IGZvciBvdGhlcnMuCj4gCj4gSWYgc29tZW9uZSBjYW4gY29uZmlybSBpdCBpcywgSSB3aWxsIGZv
bGxvd2luZyB0aGUgcHJvY2VkdXJlIGFuZCBwcm9wZXJseQo+IHN1Ym1pdCBhIHBhdGNoLgo+IAo+
IFRoYW5rcwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fX19fX19fX19fXwou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0t
LS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAg
ICBfXy8gKSAgIHwgLyJcIEFTQ0lJIFJJQkJPTiB8CnwgICAgICAgICAgICAgICAgIHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgIF8vIC0gLycgICB8IFwgLyBDQU1QQUlHTiAgICAgfAp8ICszMyA2Mzgu
NDExLjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAg
ICAgIHwKfCB5YW5uLm1vcmluIChhdCkgb3JhbmdlLmNvbSAgICAgICAgICAgfF89IiAgICAsLS0n
IHwgLyBcIEhUTUwgTUFJTCAgICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLTpfX19fX18vX19fX186LS0tLS0tLS0tLS0tLS0tLS0tJwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpDZSBtZXNzYWdlIGV0IHNlcyBwaWVj
ZXMgam9pbnRlcyBwZXV2ZW50IGNvbnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVs
bGVzIG91IHByaXZpbGVnaWVlcyBldCBuZSBkb2l2ZW50IGRvbmMNCnBhcyBldHJlIGRpZmZ1c2Vz
LCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2ZXogcmVj
dSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyDQphIGwnZXhwZWRp
dGV1ciBldCBsZSBkZXRydWlyZSBhaW5zaSBxdWUgbGVzIHBpZWNlcyBqb2ludGVzLiBMZXMgbWVz
c2FnZXMgZWxlY3Ryb25pcXVlcyBldGFudCBzdXNjZXB0aWJsZXMgZCdhbHRlcmF0aW9uLA0KT3Jh
bmdlIGRlY2xpbmUgdG91dGUgcmVzcG9uc2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRl
cmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUuIE1lcmNpLg0KDQpUaGlzIG1lc3NhZ2UgYW5kIGl0cyBh
dHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdlZCBpbmZvcm1h
dGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Ow0KdGhleSBzaG91bGQgbm90IGJlIGRp
c3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3aXRob3V0IGF1dGhvcmlzYXRpb24uDQpJZiB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgYW5kIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5kIGl0cyBhdHRhY2htZW50cy4NCkFzIGVtYWls
cyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1lc3NhZ2VzIHRoYXQg
aGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4NClRoYW5rIHlvdS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
