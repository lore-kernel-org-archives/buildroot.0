Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B365FC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A28060EE4
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 07:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A28060EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C951782C1E;
	Thu,  5 Aug 2021 07:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WvQQBgeDTSm; Thu,  5 Aug 2021 07:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B12082798;
	Thu,  5 Aug 2021 07:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F861BF859
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6FE482798
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 07:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szy3sIly0PPO for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 07:05:55 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9E1D826FF
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 07:05:54 +0000 (UTC)
Received: from smtpclient.apple ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id BXKxmSQvIxC2nBXKxmMT8s; Thu, 05 Aug 2021 08:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628146722; bh=mM++5V/5JxsVhCAvXRciMDGiQ2dphmGvgAjT3sUAkyQ=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ZWI6nkAB8R6xccIxt3RNpKnvyu+n/9P2i00bNWVRtlMHKxVS07Y0zXrkAl4GsoChI
 wFa9caZpOSG8iCwJ8aZo6nkUwUrjBTTF4Uin3JubPiDyY1LlAZ1nIUd9PexevM7rjl
 qVgDj4dXkXu6kc3p6H8NFGikPgqXv/eCzJbVXu/3Nld02b5ANJWS3mvb7WU8yYN2bC
 PNUa6ElJhdKCcxXmXQpHbsyOmj1oa/DIxfOEV8S/geOZ51eZoX1h2QB+5DPmuMJAgT
 owp1q2AfAhYUdViFYq1Bd8MxyVbsXBXITjoyEw1VmnR/DYP1gZSdTsCKV7bQkL1UBQ
 gr1H1MwM4uRVQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 5 Aug 2021 08:58:39 +0200
Message-Id: <B9F86A76-6A01-44DB-8445-0A92A3BC7EEB@benettiengineering.com>
References: <d9f6c6d8-566f-0d84-f935-58130ab7fde8@mind.be>
In-Reply-To: <d9f6c6d8-566f-0d84-f935-58130ab7fde8@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfM1HEqdxYf9i0jljq9j7QK9Ly4sH2Jnba0zVG20XvGgHElzTcG8uE39QhlnOLHQXbNyF2xAlpbAnkRWqIw8VPYOqGrqHaIfwXo9p81DefuPMR0bzWhKP
 o9trqx6BGRlNlJTnxmMFRo15v28vP+riwXN8cjHiESpqaethWWQtyxNQ+yxGbyzgPaoc1u4+0PsFPBM3uDoi0aPJ0IGrXrjGqZ1dqCdv1VTmUtVnPitLkW1m
 9u2c86Mh9C9mgAMUI5ubOlF+rWatW3vEXmf/OErTSG9rfJXPpbuBFd4evhcWgQwgXpbQ0XbIrc5nQVqvyMGqKTnW9Z1ytMIJ5TWXGq0n4cTkDHLxZPDIBf/q
 /xR4zO1VT/16kPCW9Upmjw6QbwFJxcQdYEWy/OwW2UhuTQbI83Y=
Subject: Re: [Buildroot] [PATCH 2/2] package/pixman: fix build failure due
 to gcc bug 101737
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgQXJub3V0LCBUaG9tYXMsCgo+IElsIGdpb3JubyA0IGFnbyAyMDIxLCBhbGxlIG9yZSAyMjoy
OCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+IAo+
IO+7vyBIaSBHaXVsaW8sCj4gCj4+IE9uIDAzLzA4LzIwMjEgMTA6NDIsIEdpdWxpbyBCZW5ldHRp
IHdyb3RlOgo+PiBUaGUgcGl4bWFuIHBhY2thZ2UgZXhoaWJpdHMgZ2NjIGJ1ZyAxMDE3Mzcgd2hl
biBidWlsdCBmb3IgdGhlIFNINAo+PiBhcmNoaXRlY3R1cmUgd2l0aCBvcHRpbWl6YXRpb24gZW5h
YmxlZCwgd2hpY2ggY2F1c2VzIGEgYnVpbGQgZmFpbHVyZS4KPj4gCj4+IEFzIGRvbmUgZm9yIG90
aGVyIHBhY2thZ2VzIGluIEJ1aWxkcm9vdCB3b3JrIGFyb3VuZCB0aGlzIGdjYyBidWcgYnkKPj4g
c2V0dGluZyBvcHRpbWl6YXRpb24gdG8gLU8wIGlmIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdf
MTAxNzM3PXkuCj4+IEFsc28gbGV0J3MgYWRkIFBJWE1BTl9DRkxBR1MgYW5kIHBhc3MgdGhlIENv
ZGVzb3VyY2VyeSB3b3JrIGFyb3VuZCBDRkxBR1MKPj4gdG8gaXQgZm9yIGNvbnNpc3RlbmN5IGxp
a2Ugd2UgZG8gZm9yIHRoZSByZXN0IG9mIHRoZSBwYWNrYWdlcy4KPj4gCj4+IEZpeGVzOgo+PiBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iMjAvYjIwODY5YmJiNDhlZGIx
ZjBhODQ3ZWE5ZTJlMWEwNDYyZDYzNTBiZS8KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBC
ZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4g
cGFja2FnZS9waXhtYW4vcGl4bWFuLm1rIHwgMTAgKysrKysrKysrLQo+PiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9waXhtYW4vcGl4bWFuLm1rIGIvcGFja2FnZS9waXhtYW4vcGl4bWFuLm1rCj4+IGluZGV4
IGQ5OTAwNWVjYjcuLjZmYWI1Mzk1OTMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcGl4bWFuL3Bp
eG1hbi5tawo+PiArKysgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKPj4gQEAgLTQ0LDEyICs0
NCwyMCBAQCBpZm5lcSAoJChCUjJfaXdtbXh0KSx5KQo+PiBQSVhNQU5fQ09ORl9PUFRTICs9IC0t
ZGlzYWJsZS1hcm0taXdtbXh0Cj4+IGVuZGlmCj4+IAo+PiArUElYTUFOX0NGTEFHUyA9ICQoVEFS
R0VUX0NGTEFHUykKPj4gKwo+PiAjIHRvb2xjaGFpbiBnZXRzIGNvbmZ1c2VkIGFib3V0IFRMUyBh
Y2Nlc3MgdGhyb3VnaCBHT1QgKFBJQyksIHNvIGRpc2FibGUgVExTCj4+ICMgbW92aGkgICAgcjQs
ICVnb3RfaGlhZGooJXRsc19sZG8oZmFzdF9wYXRoX2NhY2hlKSkKPj4gIyB7c3RhbmRhcmQgaW5w
dXR9OjE3MjogRXJyb3I6IGJhZCBleHByZXNzaW9uCj4+IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9DT0RFU09VUkNFUllfTklPU0lJKSx5KQo+PiAtUElYTUFOX0NPTkZfRU5WICs9IENG
TEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtRFBJWE1BTl9OT19UTFMiCj4+ICtQSVhNQU5fQ0ZMQUdT
ICs9IC1EUElYTUFOX05PX1RMUwo+PiArZW5kaWYKPj4gKwo+PiAraWZlcSAoJChCUjJfVE9PTENI
QUlOX0hBU19HQ0NfQlVHXzEwMTczNykseSkKPiAKPiBJIGJlbGlldmUgVGhvbWFzJ3MgZXhwZXJp
bWVudHMgc2hvd2VkIHRoYXQgaXQgb25seSBvY2N1cnMgdW5kZXIgLU9zLiBTbyBJIHRoaW5rCj4g
d2Ugc2hvdWxkIGRvIHRoaXMgY29uZGl0aW9uYWxseSB1bmRlciBCUjJfT1BUSU1JWkVfUywgYW5k
IHVzZSAtTzIgcmF0aGVyIHRoYW4gLU8wLgoKWWVzLCB5b3XigJlyZSByaWdodCwgYnV0IGF0IGEg
Y2VydGFpbiBwb2ludCwgaWYgSSByZW1lbWJlciBjb3JyZWN0bHksIHdl4oCZdmUgZGVjaWRlZCB0
byB1bmlmb3JtIHRoaXMga2luZCB3b3JrLWFyb3VuZHMgdXNpbmcgLU8wLAogaW5kZWVkIHNvbWUg
b3RoZXIgZ2NjIGJ1ZyBjb3VsZCBiZSBzb2x2ZWQgZGlmZmVyZW50bHkgYnV0IHdlIGtlcHQgLU8w
IHdheSB0byBoYXZlIGEg4oCcc3RhbmRhcmTigJ0gc29sdXRpb24uCgpXaGF0IGRvIHlvdSB0aGlu
ayBhYm91dCBpdD8KCk90aGVyd2lzZSBJIGRvIGFzIHlvdeKAmXZlIGRlc2NyaWJlZCBhYm92ZSwg
bm8gcHJvYmxlbS4KCkJlc3QgcmVnYXJkcwpHaXVsaW8gQmVuZXR0aQoKPiAKPiAKPiBSZWdhcmRz
LAo+IEFybm91dAo+IAo+PiArUElYTUFOX0NGTEFHUyArPSAtTzAKPj4gZW5kaWYKPj4gCj4+ICtQ
SVhNQU5fQ09ORl9PUFRTICs9IENGTEFHUz0iJChQSVhNQU5fQ0ZMQUdTKSIKPj4gKwo+PiAkKGV2
YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4+ICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2th
Z2UpKQo+PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
