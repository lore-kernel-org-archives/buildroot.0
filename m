Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C300FC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDB860A9A;
	Thu, 25 Jul 2024 15:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0w9KwMgjF2H; Thu, 25 Jul 2024 15:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C14A60AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C14A60AB7;
	Thu, 25 Jul 2024 15:53:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 014B21BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E511F60AB7
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95Oqczy9u37d for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AEE860A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEE860A9A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AEE860A9A
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:53:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C538FFF804;
 Thu, 25 Jul 2024 15:53:49 +0000 (UTC)
Date: Thu, 25 Jul 2024 17:53:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240725175348.551ed37e@windsurf>
In-Reply-To: <20240725132641.333219-1-dario.binacchi@amarulasolutions.com>
References: <20240725132641.333219-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721922830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zY03UtvCU+VAePVx+S6kaGPDJSrLf9GHQ9K10vtWSu4=;
 b=NhsobzVYSmqJQgamonR2OLYj3s6bSCghlCwBVzReCYaMCrCTwl5neUcddJ9ug15tC9yDC3
 cWtfgw7Tlidiu+EEjW3+ffT4Vk4fWuOW9VEwBb7k+T9NXcF4mQOFONLrS403DAgJjQm4Yt
 ZcYpJ/5xx7+t9SLJVcjAJcpeRqKU9KbthOWYCQPhypp0b3b+HMRZwRP0mXCPKs8aIx6mLw
 38l+qm/99cfN+2SfHJZQZ6RiqWxD1HyB7MhXD2p/p24I/F8i+FPpYo+7yypBdicLV0eG89
 ikep2PNw4L3SOCjJRkObhd79J21+2NhCYCo9U26uFohzZ+EVqqoCe8V6WyGOfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NhsobzVY
Subject: Re: [Buildroot] [PATCH 1/1] package/s6-dns: fix uclibc build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgorRmFicmljZSBpbiBDYy4KCk9uIFRodSwgMjUgSnVsIDIwMjQgMTU6MjY6
NDEgKzAyMDAKRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPiB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvczYtZG5zL3M2LWRucy5tayBiL3Bh
Y2thZ2UvczYtZG5zL3M2LWRucy5tawo+IGluZGV4IDhlMTc1NDMxYTRiOS4uZWNkNzc2NGFkZDM1
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvczYtZG5zL3M2LWRucy5tawo+ICsrKyBiL3BhY2thZ2Uv
czYtZG5zL3M2LWRucy5tawo+IEBAIC0xMiw2ICsxMiw3IEBAIFM2X0ROU19JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKPiAgUzZfRE5TX0RFUEVOREVOQ0lFUyA9IHNrYWxpYnMKPiAgCj4gIFM2X0ROU19D
T05GX09QVFMgPSBcCj4gKwlDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUykgLURfR05VX1NPVVJDRSIg
XAoKRmFicmljZSBzdWdnZXN0ZWQgYSBzaW1pbGFyIGZpeCBmb3IgdGhlIHRpcGlkZWUgcGFja2Fn
ZQppbiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjQwNzI0MTE1NTU0LjIyNzA4NjQtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8uCgpB
bmQgKGFzIHVzdWFsPyksIEkgYW0gd29uZGVyaW5nIGlmIHRoaXMgaXMgdGhlIGNvcnJlY3QgZml4
LgoKbWFuIDMgc3RhdCB0ZWxscyB1czoKCiAgICAgICAgICAgLyogU2luY2UgUE9TSVguMS0yMDA4
LCB0aGlzIHN0cnVjdHVyZSBzdXBwb3J0cyBuYW5vc2Vjb25kCiAgICAgICAgICAgICAgcHJlY2lz
aW9uIGZvciB0aGUgZm9sbG93aW5nIHRpbWVzdGFtcCBmaWVsZHMuCiAgICAgICAgICAgICAgRm9y
IHRoZSBkZXRhaWxzIGJlZm9yZSBQT1NJWC4xLTIwMDgsIHNlZSBWRVJTSU9OUy4gKi8KCiAgICAg
ICAgICAgc3RydWN0IHRpbWVzcGVjICBzdF9hdGltOyAgLyogVGltZSBvZiBsYXN0IGFjY2VzcyAq
LwogICAgICAgICAgIHN0cnVjdCB0aW1lc3BlYyAgc3RfbXRpbTsgIC8qIFRpbWUgb2YgbGFzdCBt
b2RpZmljYXRpb24gKi8KICAgICAgICAgICBzdHJ1Y3QgdGltZXNwZWMgIHN0X2N0aW07ICAvKiBU
aW1lIG9mIGxhc3Qgc3RhdHVzIGNoYW5nZSAqLwoKICAgICAgICNkZWZpbmUgc3RfYXRpbWUgIHN0
X2F0aW0udHZfc2VjICAvKiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5ICovCiAgICAgICAjZGVmaW5l
IHN0X210aW1lICBzdF9tdGltLnR2X3NlYwogICAgICAgI2RlZmluZSBzdF9jdGltZSAgc3RfY3Rp
bS50dl9zZWMKCiAgIEZlYXR1cmUgICAgVGVzdCAgICBNYWNybyAgICBSZXF1aXJlbWVudHMgICBm
b3IgICBnbGliYyAgIChzZWUgICBmZWHigJAKICAgdHVyZV90ZXN0X21hY3Jvcyg3KSk6CgogICAg
ICAgc3RfYXRpbSwgc3RfbXRpbSwgc3RfY3RpbToKICAgICAgICAgICBTaW5jZSBnbGliYyAyLjEy
OgogICAgICAgICAgICAgICBfUE9TSVhfQ19TT1VSQ0UgPj0gMjAwODA5TCB8fCBfWE9QRU5fU09V
UkNFID49IDcwMAogICAgICAgICAgIGdsaWJjIDIuMTkgYW5kIGVhcmxpZXI6CiAgICAgICAgICAg
ICAgIF9CU0RfU09VUkNFIHx8IF9TVklEX1NPVVJDRQoKU28gaXQgbG9va3MgbGlrZSBfR05VX1NP
VVJDRSBpcyBwcm9iYWJseSBub3QgdGhlIG1vc3QgYWNjdXJhdGUgdGhpbmcgdG8KdXNlLiBBbHNv
LCB3aHkgYXJlbid0IGdsaWJjIGJ1aWxkcyBhZmZlY3RlZD8gVGhlIGZpZWxkcyBhcmUgYWxzbyBp
bnNpZGUKYSBjb25kaXRpb25hbCBpbiB0aGUgc3RhdC5oIGZyb20gZ2xpYmM6CgojIGlmZGVmIF9f
VVNFX1hPUEVOMks4CiAgICAvKiBOYW5vc2Vjb25kIHJlc29sdXRpb24gdGltZXN0YW1wcyBhcmUg
c3RvcmVkIGluIGEgZm9ybWF0CiAgICAgICBlcXVpdmFsZW50IHRvICdzdHJ1Y3QgdGltZXNwZWMn
LiAgVGhpcyBpcyB0aGUgdHlwZSB1c2VkCiAgICAgICB3aGVuZXZlciBwb3NzaWJsZSBidXQgdGhl
IFVuaXggbmFtZXNwYWNlIHJ1bGVzIGRvIG5vdCBhbGxvdyB0aGUKICAgICAgIGlkZW50aWZpZXIg
J3RpbWVzcGVjJyB0byBhcHBlYXIgaW4gdGhlIDxzeXMvc3RhdC5oPiBoZWFkZXIuCiAgICAgICBU
aGVyZWZvcmUgd2UgaGF2ZSB0byBoYW5kbGUgdGhlIHVzZSBvZiB0aGlzIGhlYWRlciBpbiBzdHJp
Y3RseQogICAgICAgc3RhbmRhcmQtY29tcGxpYW50IHNvdXJjZXMgc3BlY2lhbC4gICovCiAgICBz
dHJ1Y3QgdGltZXNwZWMgc3RfYXRpbTsgICAgICAgICAgICAvKiBUaW1lIG9mIGxhc3QgYWNjZXNz
LiAgKi8KICAgIHN0cnVjdCB0aW1lc3BlYyBzdF9tdGltOyAgICAgICAgICAgIC8qIFRpbWUgb2Yg
bGFzdCBtb2RpZmljYXRpb24uICAqLwogICAgc3RydWN0IHRpbWVzcGVjIHN0X2N0aW07ICAgICAg
ICAgICAgLyogVGltZSBvZiBsYXN0IHN0YXR1cyBjaGFuZ2UuICAqLwojICBkZWZpbmUgc3RfYXRp
bWUgc3RfYXRpbS50dl9zZWMgICAgICAgLyogQmFja3dhcmQgY29tcGF0aWJpbGl0eS4gICovCiMg
IGRlZmluZSBzdF9tdGltZSBzdF9tdGltLnR2X3NlYwojICBkZWZpbmUgc3RfY3RpbWUgc3RfY3Rp
bS50dl9zZWMKCkluIGFueSBjYXNlLCBpdCBzaG91bGQgYmUgdGhlIHBhY2thZ2Ugc291cmNlIGNv
ZGUvYnVpbGQgc3lzdGVtJ3MKcmVzcG9uc2liaWxpdHkgdG8gcGFzcyB0aG9zZSBmbGFncyBwcm9w
ZXJseS4gUGFzc2luZyB0aGVtIGluIEJ1aWxkcm9vdAppcyByZWFsbHkgYSB3b3JrLWFyb3VuZC4K
CkkgYmVsaWV2ZSB0aGUgQyBmaWxlcyB1c2luZyBzdF9tdGltIHNob3VsZCAjZGVmaW5lIG9uZSBv
ZiB0aG9zZSBmZWF0dXJlCm1hY3JvcyBiZWZvcmUgaW5jbHVkaW5nIGFueSBvZiB0aGUgaGVhZGVy
IGZpbGVzLgoKQ291bGQgeW91IGhhdmUgYSBsb29rIGludG8gdGhpcz8gQW5kIHNhbWUgRmFicmlj
ZSBmb3IgdGlwaWRlZT8KClRob21hcwoKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFu
ZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQg
dHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
