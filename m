Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BEECD4F54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 07:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9AA42D6F;
	Sat, 30 May 2026 07:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLkeY8rUbQkB; Sat, 30 May 2026 07:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC8D242C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780126321;
	bh=up7XUoKC7SqQLkyYn4rqhnBAQXTuRKvmYfPI1dKm/Ms=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oKJQRFB0fx/30+Xa26pB/s7d0WKeWzZkRgXdW0a6wI6MwjYtShfxX4++GFBmmtvAA
	 I7GG7tAteS4zeuuvlEsDhZ3HLANdlgilmvejduCfvqdnJikcH8d1XZeFnhsdE+ZY7x
	 Yj+B+pEmvI7GjO/H6WfEVthaSERt/j53eYQ9RcCesZiSgDNoUWQaSao7tODF3MGGOR
	 bVmMmCJbKltqHKX+9lwt+M2ilg8GXHTQwyaVi5tVIaJwz4JxEBt+U5CZx5pf9VmznH
	 CmY2d0mcWPZAqdsrRr97c0NiZ1jXexg5qtJqt2Fgn2d/Mo1cRtC97XSgRCNxwRETPD
	 FIy6bav9Zvtvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC8D242C06;
	Sat, 30 May 2026 07:32:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F382212F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA9442C06
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fUoFErCV2Cy for <buildroot@buildroot.org>;
 Sat, 30 May 2026 07:31:59 +0000 (UTC)
X-Greylist: delayed 49194 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 30 May 2026 07:31:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC81642BF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC81642BF4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC81642BF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 07:31:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AD873EC86;
 Sat, 30 May 2026 07:31:53 +0000 (UTC)
Message-ID: <7257763a-5577-44e0-a12a-e13872c041ad@yoseli.org>
Date: Sat, 30 May 2026 09:31:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-3-jeanmichel.hautbois@yoseli.org>
 <ahlvrRhu_eSb3WIb@windsurf>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <ahlvrRhu_eSb3WIb@windsurf>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTF2tDJkENxZx64CYv6ezUjVWyZ+LgAKhF43v9h16T7mgfqka2mlYfLWYZirfPWAnxtGZTh+UXx+kbUXUPJhmnHO/c9ee2Jq1Zc4lQfYZqrOSrxrIO2rIBBgoVZjv9c9XxsAtVAXvR4V9q69qUQvAJxu2aD378/Pdvb7mwyQ/4TIWPi4RT7KW6RWIME8UTgnhvrj7lGCixylaDzWgUdoUszqUqpUZkCjmB0It/gD9iJ9+QxF2zeFaxUeQvOZ53Sf7ujka289PRHsMUP7pPIYD4tHl6bxSGOpYDnXXo+2odgwi63LKB6KDLcmO/nxItdUj4pdJqh+gGju7vKXKkRPXLCjLcsH96y+LIoC5ZYsaKFOJ9uo2cPxMRi4ZI8zlcosPsRUpFPXGowFFeeSO0q7OU7b+QweSlpI7Z3TjZuyG4u4QePjqfcQqQaDL5HUdNRB50umSAj0rods8jiNcAI6eeXZu+Au2Kaja+mOqsVJaTOFbJ/4N/dpPvbvvQMNNFePDIDTeD8FtjHWhpyXbmapQlJ7Jer6QhM+JXR1GOigUqzCw82yvMCVQd2cYj8eNfutTUGdyCioS6MIM5JkJWq/1FPcBplfB5LiLbVd1Ki5qxS3gAswby/rWXNstwlHmIhx2dKs1VWxIXF+0/WoTcYK3gqDj2uX8SYxYXHSYlpv+wL84w
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780126314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXxm8h+3VQtQSudYXnOSt56FIV+gIBNm+GZ4u+ATscM=;
 b=nN/0ZhlwXGl18JyQMtKj13Wj1rcQ/d254qqlcJOC56eYMLxDN2Lvf186w27ULjne2RGsO7
 9zpAK0sV14S21csv8Rl63lLHM0Sqt8c1/Q73ZNcT3YxejS8BqRq8nPSY34qZR/QKVDtUkr
 NbTFwh4UJzuOBnPKe12MQuuFaHEkXyK8ViXC6YV95h6O0NGpFr7EK7w6XSNDNn17UKo3Ir
 3hWI1dbVQ3iO8G2RqDQRqeh6W8hVsgjLJYWjalbzPwi4rbLBRzY+Zuxo1t701Lyaqzpmug
 /4ZpaVo2Z7nZigy5TXLCxiBJZMMnp1IacWoxl7Wd+Bv33GvJcTkALUg+AHukNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=nN/0Zhlw
Subject: Re: [Buildroot] [PATCH 02/11] package/gcc: force --with-arch=cf on
 m68k MCF5441x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTGUgMjkvMDUvMjAyNiDDoCAxMjo1MiwgVGhvbWFzIFBldGF6em9uaSBhIMOp
Y3JpdMKgOgo+IEhlbGxvIEplYW4tTWljaGVsLAo+IAo+IFRoYW5rcyBmb3IgdGhpcyB3b3JrLgo+
IAo+IE9uIEZyaSwgQXByIDI0LCAyMDI2IGF0IDAzOjIzOjE3UE0gKzAyMDAsIEplYW4tTWljaGVs
IEhhdXRib2lzIHdyb3RlOgo+PiBPbiBtNjhrIENvbGRGaXJlIFY0ZSAoTUNGNTQ0MXgpIHdpdGgg
QlIyX1VTRV9NTVUgc2VsZWN0ZWQsIHRoZQo+PiBob3N0LWdjYyBidWlsZCBmYWlscyBkdXJpbmcg
dGhlIG11bHRpbGliIHBhc3MgYmVjYXVzZSB0aGUgY29tcGlsZXIKPj4gY2Fubm90IGRpc2FtYmln
dWF0ZSBiZXR3ZWVuIG02OGsgYW5kIGNmIHZhcmlhbnRzLiBJdCBuZWVkcyB0byBiZQo+PiBjb25m
aWd1cmVkIGV4cGxpY2l0bHkgd2l0aCAtLXdpdGgtYXJjaD1jZi4KPiAKPiBJJ20gcmF0aGVyIGNv
bmZ1c2VkIGJ5ICJjYW5ub3QgZGlzYW1iaWd1YXRlIGJldHdlZW4gbTY4ayBhbmQgY2YKPiB2YXJp
YW50cyIsIGlzbid0IE1DRjU0NDF4ICpvbmx5KiBhIENvbGRmaXJlIHByb2Nlc3Nvcj8KCllvdSBh
cmUgcmlnaHQsIHRoYXQgd29yZGluZyBpcyBwb29yIGFuZCBJIHdpbGwgZml4IGl0IGluIHYyLgoK
TUNGNTQ0MXggaXMgaW5kZWVkIG9ubHkgYSBDb2xkRmlyZSAoVjRlKSBjb3JlLgpUaGUgcmVhbCBy
ZWFzb24gLS13aXRoLWFyY2g9Y2YgaXMgbmVlZGVkIGlzIGluIGdjYy9jb25maWcuZ2NjLgoKVGhl
IGdjYyBtNjhrIGJhY2tlbmQgc2VydmVzIGJvdGggdGhlIDY4MHgwIGZhbWlseSAoYXJjaCAibTY4
ayIpIGFuZCB0aGUKQ29sZEZpcmUgZmFtaWx5IChhcmNoICJjZiIpIGZyb20gb25lIHRyZWUsIHdp
dGggYSBzaGFyZWQgbXVsdGlsaWIgCmdlbmVyYXRvciAoZ2NjL2NvbmZpZy9tNjhrL3QtbWxpYnMp
LgoKVGhlIHRyaWdnZXIgaGVyZSBpcyB0aGF0IEJSMl9tNjhrX2NmNTQ0MXggc2VsZWN0cyBhbiBN
TVUgdGFyZ2V0LCBzbyB0aGUgCnR1cGxlIGlzIG02OGstKi1saW51eCogcmF0aGVyIHRoYW4gdGhl
IG02OGstKi11Y2xpbnV4KiB1c2VkIGJ5IHRoZSAKZXhpc3RpbmcgNTIwOC4gSW4gdGhlIG02OGst
Ki1saW51eCogY2FzZSwgY29uZmlnLmdjYyBkb2VzOgoKICAgICB3aXRoX2FyY2g9JHt3aXRoX2Fy
Y2g6LW02OGt9CgpTbywgaXQgZGVmYXVsdHMgLS13aXRoLWFyY2ggdG8gIm02OGsiICg2ODB4MCkg
d2hlbiBub25lIGlzIGdpdmVuLgoKVGhhdCBwdWxscyBpbiBjb25maWcvbTY4ay90LW02OGssIHdo
aWNoIHNldHMgTTY4S19BUkNIPW02OGsgYW5kIApyZXN0cmljdHMgdGhlIG11bHRpbGliIENQVSBz
ZXQgdG8gbm9uLUNvbGRGaXJlIGRldmljZXMgKENQVSAhfiAiXm1jZiIpLiAKQnVpbGRyb290IHBh
c3NlcyAtLXdpdGgtY3B1PTU0NDE4IChhIENvbGRGaXJlIGNvcmUpIHZpYSAKUjJfR0NDX1RBUkdF
VF9DUFUsIHNvIHQtbWxpYnMgdGhlbiB0cmlwcyBpdHMgb3duIHNhbml0eSBjaGVjazoKCiAgICAg
JChlcnJvciBFcnJvciBkZWZhdWx0IGNwdSAnLi4uJyBpcyBub3QgaW4gbXVsdGlsaWIgc2V0ICcu
Li4nKQoKYmVjYXVzZSB0aGUgZGVmYXVsdCBDUFUgaXMgQ29sZEZpcmUgd2hpbGUgdGhlIG11bHRp
bGliIHNldCB3YXMgbmFycm93ZWQKdG8gNjgweDAuCgpQYXNzaW5nIC0td2l0aC1hcmNoPWNmOgot
IG92ZXJyaWRlcyB0aGUgbTY4ayBkZWZhdWx0Ci0gc2VsZWN0cyBjb25maWcvbTY4ay90LWNmCi0g
dGhlIENvbGRGaXJlIGRlZmF1bHQgQ1BVIGlzIGJhY2sgaW4gdGhlIHNldC4KClRoaXMgaXMgYWxz
byB3aHkgNTIwOCBkb2VzIG5vdCBuZWVkIGl0OiBhcyBhIG5vLU1NVSBtNjhrLSotdWNsaW51eCoK
dGFyZ2V0IGl0IGRvZXMgbm90IGdldCB0aGUgd2l0aF9hcmNoPW02OGsgZGVmYXVsdCwgc28gaXRz
IG11bHRpbGliIHNldApzcGFucyBhbGwgZGV2aWNlcyBhbmQgdGhlIENvbGRGaXJlIGRlZmF1bHQg
aXMgYWNjZXB0ZWQuCgpUaGUgY2hhbmdlIGl0c2VsZiBpcyB1bmNoYW5nZWQuIEkgd2lsbCBqdXN0
IHJld3JpdGUgdGhhdCBwYXJhZ3JhcGggaW4KdjIgdG8gZGVzY3JpYmUgdGhlIG02OGstKi1saW51
eCogd2l0aF9hcmNoIGRlZmF1bHQgaW5zdGVhZCBvZiB0aGUKImRpc2FtYmlndWF0ZSIgcGhyYXNp
bmcsIGlmIHlvdSBhcmUgb2sgd2l0aCB0aGF0ID8KClRoYW5rcywKSk0KUFM6IFNvcnJ5IGZvciB0
aGUgbG9uZyBkZXRhaWxlZCBleHBsYW5hdGlvbiwgYnV0IEkgc3BlbnQgcXVpdGUgYSBiaXQgb2Yg
CnRpbWUgb24gdGhpcyBvbmUgc28gSSBtdXN0IGJlIGNlcnRhaW4gZXZlcnl0aGluZyBpcyByZWFs
bHkgbGlrZSBJIAp1bmRlcnN0b29kIGl0IDotKQoKPiBPdGhlcndpc2UgSSB0aGluayB0aGUgY2hh
bmdlIGlzIE9LLCBhbmQgdGhlIGRlc2NyaXB0aW9uIGlzIHZlcnkKPiB0aG9yb3VnaCBhbmQgZGV0
YWlsZWQuCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
