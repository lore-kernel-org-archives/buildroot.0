Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062A6C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B94840B2D;
	Mon, 16 Sep 2024 11:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYwnLcdN2QhV; Mon, 16 Sep 2024 11:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFA940B1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BFA940B1E;
	Mon, 16 Sep 2024 11:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3941BF5A0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A7CD40B1E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18F8ScbA_au7 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE5644038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE5644038B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE5644038B
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:10:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.118])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9B0A62003ED;
 Mon, 16 Sep 2024 13:10:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 13:10:21 +0200
Date: Mon, 16 Sep 2024 13:10:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZugSHdOG4e6S_yAn@landeda>
References: <20240905221743.1162124-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905221743.1162124-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726485026;
 bh=b+e1O1J2dXRtLbc+94pgTlnJe9iLqZ7+ZVOK9pJLXHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GKi9+qZOmIlX+FcR0IREklyWOWG1OfLuIGjFrkf8hRacTvR1plt7AFONA/rdQTm0j
 3TUl1ZuaHWaJ4sUTpkTIHi+D8AAhIUM9KncHT6bM0oo+i8sRJgfafYsLuUFmqJqpnN
 I3UTWLpPVd4OqYC7KvtV+HUG0rXZdhc4eYyTTzCehkA+PPw6XCZ9D25XvAAO53HtDZ
 4Qcrtow2pGCXTbxhulZKQGUakF6Kyk0fMUJNbTMUywwL73XllaGY1kMhLYsigEGmGm
 5iruSmGN+wTccYvh7vfe0XH2Sc1oFL3eRM3jMtBS8wfII6ewCbQTjTreaUPS77km98
 nqcKwFZWjWYTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GKi9+qZO
Subject: Re: [Buildroot] [PATCH next 1/1] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SnVsaWVuLCBBbGwsCgpPbiAyMDI0LTA5LTA2IDAwOjE3ICswMjAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gS2VybmVsIGNvbW1pdCBbMV0gaW50cm9kdWNlZCBNU00gR1BVIGRyaXZl
ciBoZWFkZXIgZ2VuZXJhdGlvbiB3aXRoIGEKPiBQeXRob24gc2NyaXB0LiBUaGlzIGNvbW1pdCB3
YXMgZmlyc3QgaW5jbHVkZWQgaW4gdjYuMTAuIFRoaXMgZHJpdmVyIGlzCj4gYWxzbyBlbmFibGVk
IGFzIGEgbW9kdWxlIGluIHRoZSBhcm02NCBhcmNoaXRlY3R1cmUgZGVmYXVsdAo+IGNvbmZpZ3Vy
YXRpb24uIFNlZSBbMl0uIFRoaXMgaXMgYSBjb21tb24gc2l0dWF0aW9uLgo+IAo+IFRoaXMgbWlz
c2luZyBkZXBlbmRlbmN5IGlzIG5vdCBkZXRlY3RlZCBpbiB0aGUgQnVpbGRyb290IENJLCBiZWNh
dXNlCj4gdGhlIHJlZmVyZW5jZSBkb2NrZXIgaW1hZ2UgY29udGFpbnMgYSBweXRob24zIGludGVy
cHJldGVyLiBTZWUgWzNdLgo+IAo+IEZvciBpbmZvcm1hdGlvbiwgdGhlIExpbnV4IGxhdGVzdCBr
ZXJuZWwgdmVyc2lvbiB3YXMgdXBkYXRlZCBpbgo+IEJ1aWxkcm9vdCBjb21taXQgMmI2ZGJhMDBi
ICJsaW51eDogYnVtcCBsYXRlc3QgdmVyc2lvbiB0byA2LjEwIi4KPiBTZWUgWzRdLgo+IAo+IFRo
ZSBpc3N1ZSBjYW4gYmUgb2JzZXJ2ZWQgYnkgcnVubmluZyB0aGUgZm9sbG93aW5nIGNvbW1hbmRz
IG9uIGEgaG9zdAo+IHdpdGhvdXQgdGhlIHB5dGhvbjMgaW50ZXJwcmV0ZXIgaW5zdGFsbGVkOgo+
IAo+ICAgICBjYXQgPDxFT0YgPi5jb25maWcKPiAgICAgQlIyX2FhcmNoNjQ9eQo+ICAgICBCUjJf
TElOVVhfS0VSTkVMPXkKPiAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NP
TkZJRz15Cj4gICAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAgICAg
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gICAgIEVPRgo+ICAgICBtYWtlIG9sZGRlZmNvbmZp
Zwo+ICAgICBtYWtlIGxpbnV4Cj4gCj4gVGhlIEtlcm5lbCBidWlsZCBmYWlscyB3aXRoIG91dHB1
dDoKPiAKPiAgICAgICBHRU5IRFIgIGRyaXZlcnMvZ3B1L2RybS9tc20vZ2VuZXJhdGVkL2EyeHgu
eG1sLmgKPiAgICAgL2Jpbi9zaDogMTogcHl0aG9uMzogbm90IGZvdW5kCj4gICAgIG1ha2VbN106
ICoqKiBbZHJpdmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZToxNzY6IGRyaXZlcnMvZ3B1L2RybS9t
c20vZ2VuZXJhdGVkL2EyeHgueG1sLmhdIEVycm9yIDEyNwo+IAo+IFRoaXMgY29tbWl0IGZpeGVz
IHRoaXMgaXNzdWUgYnkgaW50cm9kdWNpbmcgYSBuZXcKPiBCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfUFlUSE9OMyBjb25maWd1cmF0aW9uIHRoYXQgd2lsbCBuZWVkIHRvIGJlCj4gc2VsZWN0
ZWQgaW4gcmVsZXZhbnQgc2l0dWF0aW9ucy4KPiAKPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTBm
ZGRkMDQ1Zjg4ZTM0ZDYxNjA3ODVhM2E1ZTUwNmQzNzQ1NjY0NTQKPiBbMl0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVl
L2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWc/aD12Ni4xMC44I244NjgKPiBbM10gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI0LjA4LXJjMy9z
dXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlP3JlZl90eXBlPXRhZ3MjTDQwCj4gWzRdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8yYjZkYmEwMGJlMjdh
MDliYzdlODhmYWYwODcxZjgyYmY5NTU4OWNmCj4gCj4gUmVwb3J0ZWQtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBsaW51eC9Db25maWcuaW4gfCAxMSArKysrKysrKysr
Kwo+ICBsaW51eC9saW51eC5tayAgfCAgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saW51eC9Db25maWcuaW4gYi9saW51eC9Db25m
aWcuaW4KPiBpbmRleCA0MjlhN2VhYmVmLi43ODIzNjY1ODZjIDEwMDY0NAo+IC0tLSBhL2xpbnV4
L0NvbmZpZy5pbgo+ICsrKyBiL2xpbnV4L0NvbmZpZy5pbgo+IEBAIC00OTIsNiArNDkyLDE3IEBA
IGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUEFIT0xFCj4gIAkgIHN1Y2ggYXMg
IkJURjogLnRtcF92bWxpbnV4LmJ0ZjogcGFob2xlIChwYWhvbGUpIGlzIG5vdAo+ICAJICBhdmFp
bGFibGUiLgo+ICAKPiArY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9QWVRIT04z
Cj4gKwlib29sICJOZWVkcyBob3N0IHB5dGhvbjMiCj4gKwloZWxwCj4gKwkgIFNvbWUgTGludXgg
a2VybmVsIGNvbmZpZ3VyYXRpb24gb3B0aW9ucyAoc3VjaCBhcyB0aGUKPiArCSAgQ09ORklHX0RS
TV9NU00gaW4gdjYuMTAgYW5kIGdyZWF0ZXIpIHJlcXVpcmUgYSBob3N0IHB5dGhvbjMKPiArCSAg
aW50ZXJwcmV0ZXIuIEVuYWJsaW5nIHRoaXMgb3B0aW9uIHdpbGwgZW5zdXJlIGhvc3QtcHl0aG9u
Mwo+ICsJICBnZXRzIGJ1aWx0IGJlZm9yZSB0aGUgTGludXgga2VybmVsLgo+ICsKPiArCSAgRW5h
YmxlIHRoaXMgb3B0aW9uIGlmIHlvdSBnZXQgYSBMaW51eCBrZXJuZWwgYnVpbGQgZmFpbHVyZQo+
ICsJICBzdWNoIGFzICJweXRob24zOiBub3QgZm91bmQiLgo+ICsKPiAgIyBMaW51eCBleHRlbnNp
b25zCj4gIHNvdXJjZSAibGludXgvQ29uZmlnLmV4dC5pbiIKPiAgCj4gZGlmZiAtLWdpdCBhL2xp
bnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPiBpbmRleCAxNmQ5ZjE5NDcwLi45MjAzNWQw
ZGE5IDEwMDY0NAo+IC0tLSBhL2xpbnV4L2xpbnV4Lm1rCj4gKysrIGIvbGludXgvbGludXgubWsK
PiBAQCAtMTM4LDYgKzEzOCwxMCBAQCBkZWZpbmUgTElOVVhfRklYVVBfQ09ORklHX1BBSE9MRV9D
SEVDSwo+ICBlbmRlZgo+ICBlbmRpZgo+ICAKPiAraWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX05F
RURTX0hPU1RfUFlUSE9OMykseSkKPiArTElOVVhfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9u
Mwo+ICtlbmRpZgo+ICsKPiAgIyBJZiBob3N0LXVib290LXRvb2xzIGlzIHNlbGVjdGVkIGJ5IHRo
ZSB1c2VyLCBhc3N1bWUgaXQgaXMgbmVlZGVkIHRvCj4gICMgY3JlYXRlIGEgY3VzdG9tIGltYWdl
Cj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MUykseSkKPiAtLSAKPiAyLjQ2
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
