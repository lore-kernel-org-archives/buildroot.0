Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314AAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 10:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF9961083;
	Fri, 17 Dec 2021 10:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmtIaTiFA8ki; Fri, 17 Dec 2021 10:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D13C260E4A;
	Fri, 17 Dec 2021 10:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56E381BF2B5
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 10:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51DD64047F
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 10:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuMQUchtUcpd for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 10:10:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A454C40153
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 10:10:43 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F04CA60009;
 Fri, 17 Dec 2021 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639735840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqp/QprkztFa23VpFbjAzvKnN0/A3ceEqskR3GuUMlc=;
 b=GEDl/x310J1vNNAeaiLRI6qVZ7cvOWfnpWh09YdPlc9EuI+Gpcs4Us0KhxSVnNHhLYFc0t
 wvY8lDwQxLSSBHawVF1ZZZIYuG94h+JuPPVPfIwES6Hw4yBpuLSyvmvuYPyM0TNXT4M3g5
 75Az0xKKACNXtY5vIrbSXDgbD8fiNi1qUqsVG1kDLm1uU/soxdJm+a92+WPxi/gU3f+0PI
 omA16JjFuh/7krmRoHzPf+oCK3YYvqPqDjC2W9DQrP/7vJhPhSBEj4GISYfLrGN9VKA5Cw
 wWYOEL5uEbAME6Rvycms2QWlV4uSh8SldxDQp28WddxyKf2GD7qvVryoyjjH7A==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <c0ae5edb-ad84-ecc3-8e3e-77e0d11b34e1@mind.be>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <45e4b674-3187-9c3b-6b7f-0fca30eae869@linatsea.fr>
Date: Fri, 17 Dec 2021 11:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c0ae5edb-ad84-ecc3-8e3e-77e0d11b34e1@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/3] package/cross-ldd: new package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

K8KgwqDCoCBoZWxwCj4+ICvCoMKgwqAgbGRkIGRyb3AtaW4gcmVwbGFjZW1lbnQgZm9yIGNyb3Nz
LWNvbXBpbGF0aW9uIHRvb2xjaGFpbnMuCj4+ICvCoMKgwqAgVGhpcyBpcyB0aGUgb2ZmaWNpYWxs
eSBzdXBwb3J0ZWQgdmVyc2lvbiBtZW50aW9uZWQgaW4gdGhlIGRyYWN1dCAKPj4gZG9jdW1lbnRh
dGlvbgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLm1rIAo+PiBi
L3BhY2thZ2UvY3Jvc3MtbGRkL2Nyb3NzLWxkZC5tawo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
PiBpbmRleCAwMDAwMDAwMDAwLi45MzI2YTUwOGJiCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
cGFja2FnZS9jcm9zcy1sZGQvY3Jvc3MtbGRkLm1rCj4+IEBAIC0wLDAgKzEsMjAgQEAKPj4gKyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIAo+Pgo+PiArIwo+PiArIyBjcm9zcy1sZGQKPj4gKyMKPj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAo+Pgo+PiArCj4+ICtDUk9TU19MRERfVkVSU0lPTiA9
IDZjOWM3MjRlYmQ2YTI5YzI3OWM2ZTU3MzRlNDRjMDdmMDY3ODA4ZWMKPj4gK0NST1NTX0xERF9T
T1VSQ0UgPSAkKENST1NTX0xERF9WRVJTSU9OKS56aXAKPgo+IMKgQUZBSUNTIHRoZXJlJ3Mgbm8g
cmVhc29uIHRvIHVzZSBhIHppcCBmaWxlLiBKdXN0IHJlbW92ZSB0aGlzIGxpbmUgYW5kIAo+IHRo
ZSBFWFRSQUNUX0NNRFMgYW5kIGl0IHNob3VsZCB3b3JrIGFzIHdlbGwuCj4KSGksClVuZm9ydHVu
YXRlbHksIHRoaXMgaXMgbm90IHRoYXQgc2ltcGxlLCBJIGNhbm5vdCBmaW5kIGEgc2ltcGx5IHdh
eSB0byAKZG93bmxvYWQgYSBzaW5nbGUgZmxhdCBmaWxlLApiZWNhdXNlIHRoZSBkb3dubG9hZCBz
eXN0ZW0gbWFrZXMgYSBzdHJvbmcgYXNzdW1wdGlvbiB0aGF0IGl0IGlzIGEgdGFyIGZpbGUuCgpt
eSBiZXN0IG9wdGlvbiBzZWVtcyB0byBiZSBzb21ldGhpbmcgbGlrZToKCgpDUk9TU19MRERfVkVS
U0lPTiA9IDZjOWM3MjRlYmQ2YTI5YzI3OWM2ZTU3MzRlNDRjMDdmMDY3ODA4ZWMKQ1JPU1NfTERE
X1NPVVJDRSA9ICQoQ1JPU1NfTEREX1ZFUlNJT04pL2Nyb3NzLWNvbXBpbGUtbGRkCgpDUk9TU19M
RERfU0lURSA9IApodHRwczovL2dpc3QuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2plcm9tZS1wb3Vp
bGxlci9jNDAzNzg2YzEzOTRmNTNmNDRhM2I2MTIxNDQ4OWU2Zi9yYXcKCmRlZmluZSBIT1NUX0NS
T1NTX0xERF9FWFRSQUNUX0NNRFMKIMKgwqDCoCAjIFNpbmdsZSBmaWxlLCBubyBleHRyYWN0IG5l
ZWRlZAogwqDCoMKgIGNwICQoSE9TVF9DUk9TU19MRERfRExfRElSKS9jcm9zcy1jb21waWxlLWxk
ZCAkKEBEKQplbmRlZgoKUmVnYXJkcywKVGhpZXJyeQoKPgo+IMKgUmVnYXJkcywKPiDCoEFybm91
dCAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
