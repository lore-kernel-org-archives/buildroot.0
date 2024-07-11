Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE5AC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 22:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E62B40284;
	Thu, 11 Jul 2024 22:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLtYVnvoc_tl; Thu, 11 Jul 2024 22:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAAF840287
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAAF840287;
	Thu, 11 Jul 2024 22:11:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3611BF860
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8763D60652
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 22:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndfz5ZjK0Hv1 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 22:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F82B6071F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F82B6071F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F82B6071F
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 22:11:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-367a9ab4d81so780531f8f.1
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 15:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720735862; x=1721340662;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SRDps0LzE/jKKNaxwdUT6YumshkdntnjLsa65oePv0E=;
 b=StwuTuMt+e7GKANM43lR4hgbc38R+RocLVd+QXChnUqIW8Vuzp2Y9eRmktnABPl+Wm
 JGMmIfvUsPgw0HDyvHxTH0cCT8DnDSDqFcDnh18VHQo2BoFPA6duP5iakYrm7cB58e/e
 LZOPs7yTV6GPHNPLUFHEmv7JHdCqv/0XDZqh75kZzG/fLP+mTtZHMSkWJRKwigoggT6N
 qhp6rJnkKgp6DKg5mjzQpNPI1Hs2NQvepUugOZAwBunYcokwDIsqTbRrRMORguSN57j7
 U9M5ZHgeH52tCB2yd4AEQwF3jNZoRaCYU3Asgi2/VaCToh9+PA8BTK+5a3MSmPxi87xJ
 QWVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4dRAEQ38u+zoMG/AKylaKLxKTxw+COlNlg4GlGc6OYRrrf+aZQyRdcRFGBiGt6Mgl/4owrVid+WCbUOkriIwHE6Rj1KMlQw==
X-Gm-Message-State: AOJu0YxCmsYXJ9Ie39t9+i8uU3MvoTwJeyayFwL3eYmBbHj8vGO/5WMM
 8V+KMkFryzPeHR/jnST1Cs78hgsYn60el3VXFZx3/k+nfmEeJqFLwcCHKY0z54g=
X-Google-Smtp-Source: AGHT+IEJZETAeduTvN14mU/3QljYBGW1SWDKMIyYFQLg5/uAOCYZPM3nOxNFkpS77/63MOGhPlQoKg==
X-Received: by 2002:a5d:688d:0:b0:367:f05a:8f6c with SMTP id
 ffacd0b85a97d-367f05a906fmr2335343f8f.57.1720735862072; 
 Thu, 11 Jul 2024 15:11:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde84660sm8714856f8f.25.2024.07.11.15.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 15:11:01 -0700 (PDT)
Message-ID: <e2f68a06-d423-419f-b691-329ed1876e18@mind.be>
Date: Fri, 12 Jul 2024 00:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yegorslists@googlemail.com, buildroot@buildroot.org
References: <20240610093833.1871754-1-yegorslists@googlemail.com>
Content-Language: en-GB
In-Reply-To: <20240610093833.1871754-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720735862; x=1721340662; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SRDps0LzE/jKKNaxwdUT6YumshkdntnjLsa65oePv0E=;
 b=PZvwf+ByCYH12492W4X6JLWrUPiDQJ+wOgsveTczD6qiDzRYNuAeP3Chg2oQtDmX0f
 EDQi71ia9XV//XrRnUgv8geVkyJUwCBkKSGHu24H0w2kFie1NKX+RtGXX3vVSxNmKR7i
 5b/Y3x8a3MjxTjwvjY8UTKY4FkYnvKqRyHps4yuwp/COW+qnGTMpBLrSRIWVkdkbaw8b
 hIZkJBE3UjfM1q9Gvk1L1UDW2da4lEblaVr/DHMvhTc1bHcFcOmrELf3AEkpq0BT9qWy
 /3FhLA0zV3nieHmfUYkggaKMKW7PEG+FrrJQNknisYJd/hSIQ1ONnbyAfwHYO2eY98oi
 F7FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PZvwf+By
Subject: Re: [Buildroot] [PATCH] package/tftpd: bump to latest git commit
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wNi8yMDI0IDExOjM4LCB5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbSB3cm90ZToK
PiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gCj4g
Rml4ZXMgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGVkIGFnYWluc3QgR0NDIDE0Lng6
Cj4gCj4gdGZ0cC5jOiBJbiBmdW5jdGlvbiDigJh0ZnRwX3NlbmRmaWxl4oCZOgo+IHRmdHAuYzo4
ODo1OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYnNkX3NpZ25h
bOKAmTsgZGlkCj4geW91IG1lYW4g4oCYc3NpZ25hbOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4gICAgIDg4IHwgICAgIGJzZF9zaWduYWwoU0lHQUxSTSwgdGltZXIpOwo+
ICAgICAgICB8ICAgICBefn5+fn5+fn5+Cj4gICAgICAgIHwgICAgIHNzaWduYWwKPiB0ZnRwLmM6
ODg6NTogd2FybmluZzogbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlvbiBvZiDigJhic2Rfc2lnbmFs
4oCZIFstV25lc3RlZC1leHRlcm5zXQo+IG1haW4uYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToK
PiBtYWluLmM6MzA4OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhic2Rfc2lnbmFs4oCZOwo+IGRpZCB5b3UgbWVhbiDigJhzc2lnbmFs4oCZPyBbLVdpbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICAzMDggfCAgICAgYnNkX3NpZ25hbChTSUdJTlQs
IGludHIpOwo+ICAgICAgICB8ICAgICBefn5+fn5+fn5+Cj4gICAgICAgIHwgICAgIHNzaWduYWwK
PiBtYWluLmM6MzA4OjU6IHdhcm5pbmc6IG5lc3RlZCBleHRlcm4gZGVjbGFyYXRpb24gb2Yg4oCY
YnNkX3NpZ25hbOKAmSBbLVduZXN0ZWQtZXh0ZXJuc10KPiAKPiBSZW1vdmUgYW4gdXBzdHJlYW1l
ZCBwYXRjaC4KPiAKPiB0ZnRwZC90ZnRwZC5jIGhhcyBjaGFuZ2VkLCBoZW5jZSwgY2hhbmdlIGl0
cyBjaGVja3N1bS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgLQo+ICAgLi4udGVybi1xdWFsaWZpZXItdG8tZml4LWdjYy0xMC54
LWJ1aWxkLnBhdGNoIHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgcGFja2FnZS90ZnRwZC90
ZnRwZC5oYXNoICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4gICBwYWNrYWdlL3RmdHBk
L3RmdHBkLm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQo+ICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvdGZ0cGQvMDAwMS1Vc2UtZXh0ZXJuLXF1YWxpZmllci10by1maXgtZ2NjLTEw
LngtYnVpbGQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5j
aGVja3BhY2thZ2VpZ25vcmUKPiBpbmRleCA4YTIxYjNmMTU1Li5hZWNmMTRiMWUzIDEwMDY0NAo+
IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25vcmUKPiArKysgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4g
QEAgLTE0NjAsNyArMTQ2MCw2IEBAIHBhY2thZ2UvdGFza2QvMDAwMi1Vc2UtY29ycmVjdC12YXJp
YWJsZXMtZm9yLUdudVRMUy1kZXRlY3Rpb24ucGF0Y2ggbGliX3BhdGNoLlVwCj4gICBwYWNrYWdl
L3Rhc2tkLzAwMDMtQ01ha2VMaXN0cy11c2UtcGtnLWNvbmZpZy11dWlkLWRldGVjdGlvbi5wYXRj
aCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgIHBhY2thZ2UvdGNmLWFnZW50L1M1NXRjZi1hZ2VudCBT
aGVsbGNoZWNrIGxpYl9zeXN2LlZhcmlhYmxlcwo+ICAgcGFja2FnZS90Y2wvMDAwMS1EaXNhYmxl
LXRjbC1jb21wYXRpYmlsaXR5LWxheWVycy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAtcGFj
a2FnZS90ZnRwZC8wMDAxLVVzZS1leHRlcm4tcXVhbGlmaWVyLXRvLWZpeC1nY2MtMTAueC1idWls
ZC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgIHBhY2thZ2UvdGZ0cGQvUzgwdGZ0cGQtaHBh
IFNoZWxsY2hlY2sgbGliX3N5c3YuSW5kZW50IGxpYl9zeXN2LlZhcmlhYmxlcwo+ICAgcGFja2Fn
ZS90aS1nZngvMDAwMS1uZXdjbGthcGkucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gICBwYWNr
YWdlL3RpLWdmeC8wMDAyLWZpeC1idWlsZC1vbWFwbGZiLWxpbnV4LnBhdGNoIGxpYl9wYXRjaC5V
cHN0cmVhbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RmdHBkLzAwMDEtVXNlLWV4dGVybi1xdWFs
aWZpZXItdG8tZml4LWdjYy0xMC54LWJ1aWxkLnBhdGNoIGIvcGFja2FnZS90ZnRwZC8wMDAxLVVz
ZS1leHRlcm4tcXVhbGlmaWVyLXRvLWZpeC1nY2MtMTAueC1idWlsZC5wYXRjaAo+IGRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGM5NjQ1NTUzNDcuLjAwMDAwMDAwMDAKPiAtLS0gYS9w
YWNrYWdlL3RmdHBkLzAwMDEtVXNlLWV4dGVybi1xdWFsaWZpZXItdG8tZml4LWdjYy0xMC54LWJ1
aWxkLnBhdGNoCj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDI5ICswLDAgQEAKPiAtRnJvbSA2Zjk5
NDE2NmQ4NTcxOTYxYTA4NDc5NzM2YWU4NmM1YmFhMmJiNDdmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+IC1Gcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPgo+IC1EYXRlOiBGcmksIDcgQXVnIDIwMjAgMTI6MDc6NDUgKzAyMDAKPiAtU3ViamVjdDog
W1BBVENIXSBVc2UgImV4dGVybiIgcXVhbGlmaWVyIHRvIGZpeCBnY2MgMTAueCBidWlsZAo+IC0K
PiAtUGF0Y2ggZnJvbQo+IC1odHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3RmdHAv
cmF3L21hc3Rlci9mL3RmdHAtaHBhLTUuMi1nY2MxMC5wYXRjaC4KPiAtCj4gLVNpZ25lZC1vZmYt
Ynk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0t
LQo+IC0gdGZ0cC90ZnRwLmMgfCAyICstCj4gLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAtCj4gLWRpZmYgLS1naXQgYS90ZnRwL3RmdHAuYyBiL3RmdHAv
dGZ0cC5jCj4gLWluZGV4IGQxNWRhMjIuLmQwNjdmOTYgMTAwNjQ0Cj4gLS0tLSBhL3RmdHAvdGZ0
cC5jCj4gLSsrKyBiL3RmdHAvdGZ0cC5jCj4gLUBAIC00OCw3ICs0OCw3IEBAIGV4dGVybiBpbnQg
bWF4dGltZW91dDsKPiAtICNkZWZpbmUgUEtUU0laRSAgICBTRUdTSVpFKzQKPiAtIGNoYXIgYWNr
YnVmW1BLVFNJWkVdOwo+IC0gaW50IHRpbWVvdXQ7Cj4gLS1zaWdqbXBfYnVmIHRvcGxldmVsOwo+
IC0rZXh0ZXJuIHNpZ2ptcF9idWYgdG9wbGV2ZWw7Cj4gLSBzaWdqbXBfYnVmIHRpbWVvdXRidWY7
Cj4gLQo+IC0gc3RhdGljIHZvaWQgbmFrKGludCwgY29uc3QgY2hhciAqKTsKPiAtLS0KPiAtMi4y
Ni4yCj4gLQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3RmdHBkL3RmdHBkLmhhc2ggYi9wYWNrYWdl
L3RmdHBkL3RmdHBkLmhhc2gKPiBpbmRleCA2NmU2YjBkMjZjLi4zZmFiOWRiYTA3IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvdGZ0cGQvdGZ0cGQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvdGZ0cGQvdGZ0
cGQuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hh
MjU2ICAwZWIyM2NlY2E1NGVhYzM2NDhjYTQyNTRhNDY2NDI0MTQ4M2RkYzZiZWYzNjk1OGUxY2Yy
M2JjOTk0ZDE1ODYzICB0ZnRwZC1iMmIzNGNlY2M4Y2JjMThmZjZmMWZjMDBiZGE2YWU2ZTkwMTFl
NmM3LWdpdDQudGFyLmd6Cj4gK3NoYTI1NiAgOWJkYjNlMmFiMmI2OGU0ZDhjZDA1N2QxMDIzOTVj
MzYyYmFmMDdjN2IwNTJmMWQ1ZTQwZTUxOTBhZmVjYzE1ZSAgdGZ0cGQtZTUyYWY0MjA3YTZlMDlh
MWJhMjFmNjFkNmY4NWQ4YjJiMWU2ZWZjMC1naXQ0LnRhci5nego+ICAgCj4gICAjIEhhc2ggZm9y
IGxpY2Vuc2UgZmlsZQo+IC1zaGEyNTYgIDY3NzU0ZWJkOGYyNjU1NzFkMzIyNmFjOTdlNTIxYjFi
ZDZmZDhhNjEzNjNlY2Q0YWI3ODA2YTZmOTBlZmFiOTIgIHRmdHBkL3RmdHBkLmMKPiArc2hhMjU2
ICA1OTM2ZDA3NjRjYjZlOGYyZjVjZThhMTFjMjQ5ZDgxMDM3YjVmMjc1ZjU5ODNlODUzOGVlNGZi
ZTU3MTk1MzY5ICB0ZnRwZC90ZnRwZC5jCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGZ0cGQvdGZ0
cGQubWsgYi9wYWNrYWdlL3RmdHBkL3RmdHBkLm1rCj4gaW5kZXggY2VhYzI0MTE5ZS4uODFiNjdm
ODJjZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3RmdHBkL3RmdHBkLm1rCj4gKysrIGIvcGFja2Fn
ZS90ZnRwZC90ZnRwZC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiAgIAo+IC1URlRQRF9WRVJTSU9OID0gYjJiMzRjZWNjOGNiYzE4ZmY2ZjFm
YzAwYmRhNmFlNmU5MDExZTZjNwo+ICtURlRQRF9WRVJTSU9OID0gZTUyYWY0MjA3YTZlMDlhMWJh
MjFmNjFkNmY4NWQ4YjJiMWU2ZWZjMAo+ICAgVEZUUERfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9uZXR3b3JrL3RmdHAvdGZ0cC1ocGEuZ2l0Cj4gICBURlRQRF9TSVRFX01F
VEhPRCA9IGdpdAo+ICAgVEZUUERfQ09ORl9PUFRTID0gLS13aXRob3V0LXRjcHdyYXBwZXJzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
