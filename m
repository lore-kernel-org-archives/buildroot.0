Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5932C67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 19:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEE56069A;
	Sat,  6 Apr 2024 19:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGevRDC9yHAI; Sat,  6 Apr 2024 19:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1717D6066F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1717D6066F;
	Sat,  6 Apr 2024 19:32:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 221671BF38B
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 19:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF296066F
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 19:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWPtCyfX94bI for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 19:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D527F60656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D527F60656
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D527F60656
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 19:32:49 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:8f05:3e55:1f7e:fc26] (unknown
 [IPv6:2a01:e0a:12:eba0:8f05:3e55:1f7e:fc26])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C3688BFD4D
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 21:32:46 +0200 (CEST)
Message-ID: <4570d0d7-b1b8-412d-a3f8-957ee8b0dfc9@grenoble.cnrs.fr>
Date: Sat, 6 Apr 2024 21:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1712431966;
 bh=6H1vg9CuEeCXFqVnmVZYSNDTFFRD6z6wxqS2Xo/zTrs=;
 h=Date:To:From:Subject:From;
 b=qdy7S9n35nUvQARRjxdnwzNDLkN4Ah96nw3ZPKIKuo6SbBQi79EG+DxbOFvapjqcv
 PplDQ3Y//phOc4wBATciaw5waBxY7ULQqyPVvZtFuyq95b+AcwZXNNoPt4E9uwhdri
 mOVmbrJ7Le1gLYOSx17DmpriipyZ6Q4a4iePRwOkDsY4futGFUcsefYxVWCZSY9jbM
 NaAf2BMc/OMpRxO68XtTJvIC5/y7dAKzXFoqRRgAVg+5zhZthYNWlyOdSw6jOQn4TL
 Z+Ep19y2D3LjXfXWE5KlMC/GoREgcPOVHOmiP4/ev6mNIUJ7bH0my/CoOD82rDpGCi
 UanodhiQbC6Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=qdy7S9n3
Subject: [Buildroot] Binutils 2.41 cannot compile old Linux kernels
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

SGVsbG8gQnVpbGRyb290IHBlb3BsZSEKCkVhcmx5IHRoaXMgbW9ybmluZywgdGhlIGF1dG9idWls
ZGVyIHdyb3RlOgo+IERldGFpbCBvZiBkZWZjb25maWcgZmFpbHVyZXMgZm9yIG1hc3RlciBbNzEg
ZmFpbHVyZXMgZm9sbG93XQoKVHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2h5IHRoZXJlIGFyZSBzbyBt
YW55IGZhaWx1cmVzLiBJIGV4YW1pbmVkIHRocmVlIG9mCnRoZW06CgogKiBhY21lc3lzdGVtc19h
cmlhX2cyNV8yNTZtYlswXQogKiBhY21lc3lzdGVtc19hcmlldHRhX2cyNV8yNTZtYgogKiBhdG1l
bF9zYW1hNWQzeGVrCgphbmQgdGhleSBhbGwgZmFpbGVkIGZvciB0aGUgc2FtZSByZWFzb246IGFu
IGluY29tcGF0aWJpbGl0eSBiZXR3ZWVuIG9sZApMaW51eCBrZXJuZWxzIGFuZCBiaW51dGlscyAy
LjQxLiBUaGUgZmFpbHVyZXMgd2VyZSBwcmVzdW1hYmx5IHRyaWdnZXJlZApieSB0aGlzIHBhdGNo
IGZyb20gMjAyNC0wMy0wMzoKCiAgICBlODgyMjVlZDg4IHBhY2thZ2UvYmludXRpbHM6IG1ha2Ug
Mi40MSB0aGUgZGVmYXVsdCB2ZXJzaW9uCgpTcGVjaWZpY2FsbHksIHRoZSBhc3NlbWJseSBzeW50
YXgKCiAgICAuc2VjdGlvbiAiLnByb2MuaW5mby5pbml0IiwgI2FsbG9jCgp3aGljaCBvbiBvbGQg
a2VybmVscyBpcyB1c2VkIGJ5IG11bHRpcGxlIGZpbGVzIGluIGFyY2gvYXJtLCBpcyBzdXBwb3J0
ZWQKYnkgYmludXRpbHMgMi40MCBmb3IgYWxsIEVMRiB0YXJnZXRzIOKAnGZvciBjb21wYXRpYmls
aXR5IHdpdGggdGhlIFNvbGFyaXMKYXNzZW1ibGVy4oCdLlsxXSBIb3dldmVyLCBiaW51dGlscyAy
LjQxIG9ubHkgc3VwcG9ydHMgdGhpcyBzeW50YXggZm9yClNwYXJjIEVMRiB0YXJnZXRzLlsyXQoK
VGhlIHN5bnRheCB3YXMgZml4ZWQgb24gTGludXggYnkgdGhpcyBjb21taXQKCiAgICA3OTA3NTZj
N2UwMjIgQVJNOiA4OTMzLzE6IHJlcGxhY2UgU3VuL1NvbGFyaXMgc3R5bGUgZmxhZyBvbiBzZWN0
aW9uIGRpcmVjdGl2ZQoKcmVsZWFzZWQgb24gTGludXggbWFpbmxpbmUgdjUuNS1yYzEuIFRoaXMg
cGF0Y2ggd2FzIHRoZW4gYmFja3BvcnRlZCB0bwpzZXZlcmFsIHN0YWJsZSBicmFuY2hlcyAoaW4g
djQuMTQuMzI5LCB2NC4xOS4yOTggYW5kIHY1LjQuMjAzKS4KCk5vdyBJIHdvbmRlciwgd2hhdCB3
b3VsZCBiZSB0aGUgcHJvcGVyIHdheSBvZiBmaXhpbmcgdGhpcyBpc3N1ZSB3aXRoaW4KYnVpbGRy
b290PyBBIHN0cmFpZ2h0Zm9yd2FyZCBzb2x1dGlvbiBpcyB0byBhZGQKCiAgICBCUjJfQklOVVRJ
TFNfVkVSU0lPTl8yXzQwX1g9eQoKdG8gdGhvc2UgZGVmY29uZmlncywgYnV0IHRoaXMgZG9lc24n
dCBsb29rIGxpa2UgYSBsb25nLXRlcm0gc29sdXRpb24sIGFzCmJ1aWxkcm9vdCB3aWxsIGV2ZW50
dWFsbHkgZHJvcCBzdXBwb3J0IGZvciB0aGlzIHZlcnNpb24gb2YgYmludXRpbHMuCkFub3RoZXIg
b3B0aW9uIHdvdWxkIGJlIHRvIGJ1bXAgdGhlIGtlcm5lbCB2ZXJzaW9uLCBidXQgSSBhc3N1bWUg
dGhpcwpzaG91bGQgYmUgZG9uZSAoYW5kIHRlc3RlZCkgYnkgdGhlIG1haW50YWluZXJzIG9mIHRo
ZSBhZmZlY3RlZApkZWZjb25maWdzLiBBIHRoaXJkIG9wdGlvbiB3b3VsZCBiZSB0byBhZGQgTGlu
dXggY29tbWl0IDc5MDc1NmM3ZTAyMiBhcwphIHBhdGNoLCBsaWtlOgoKICAgIEJSMl9MSU5VWF9L
RVJORUxfUEFUQ0g9Li4uLzAwMDEtQVJNLTg5MzMtMS1yZXBsYWNlLVN1bi1Tb2xhcmlzLXN0eWxl
LWZsYWctb24tc2VjdGlvbi5wYXRjaAoKQW55IG9waW5pb25zPwoKQmVzdCByZWdhcmRzLAoKRWRn
YXIgQm9uZXQuCgpbMF0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy82NTQ0NTAwOTc1ClsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2JpbnV0aWxzL2Rv
Y3MtMi40MC9hcy9TZWN0aW9uLmh0bWwKWzJdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvYmludXRp
bHMvZG9jcy0yLjQxL2FzL1NlY3Rpb24uaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
