Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD14C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 09:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D496844AA;
	Wed,  3 Jul 2024 09:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_6x8GG8DwQ7; Wed,  3 Jul 2024 09:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A0A8403F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A0A8403F;
	Wed,  3 Jul 2024 09:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFFA1BF30A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A85660E60
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iv0syXMt60Um for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 09:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 649D860BB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 649D860BB1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 649D860BB1
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 09:01:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4256788e13bso37296005e9.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 02:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719997265; x=1720602065;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jrrfXm3FDfUyrgAv291odCn7Hg+5OyoFkvo7y0CpbDU=;
 b=H6AcJPmjJpnRdGss5x/+1VqRX8BH2uhPdoOaCus/GFtzviUsVfUup7VHN6eXZDsyGv
 f2N5Np5lpYDFpDRz6e77h4xWVhu9PstJ9OrRwKdgpopMqcV9XDBqruhzztxPieZxM9jm
 tPYAWCrYdTosnbBaA3aa7mtzS6QK806zRtpztS3BvVhfNQRtZAzHlyYPzeL7lnrXV6Bg
 x7E8pFQGXX6LNpxuJEAwAUBSU+VyeuGNasMkDw+9v8sd596bLfNKxjS6qWhS0AmsOo8V
 V41g+5Y/KCzEnnJHfByKAHLSlYlNxG92N+zQpkdNDOsBmw/p1JM5ZRm7pWs1yzRDcmtE
 17HA==
X-Gm-Message-State: AOJu0YyJODrmYkGPsJ5A0y/2OsxSPR/2AbLhPsEjrlVcQV67hJSRS8Bc
 Dh5OTRV5Ppay9wuvnxl8tEaP3MqQYsY3MoKL2cXZM4qPkeJmN0Hy1tQrGKHHWAo=
X-Google-Smtp-Source: AGHT+IHV7VlVRwV0Mu+je3UNwkzHMeWbiGX5RIEcDpbfLFGDTR6HMZI5ZqSTXOUF8vE+H3+2dBwLIA==
X-Received: by 2002:a05:600c:12c6:b0:421:de92:a9b1 with SMTP id
 5b1f17b1804b1-4257a030224mr74832055e9.16.1719997264840; 
 Wed, 03 Jul 2024 02:01:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257a4d4cd1sm167009155e9.28.2024.07.03.02.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 02:01:04 -0700 (PDT)
Message-ID: <2bcc6028-6245-49b5-9d1d-79e1b19bb9bd@mind.be>
Date: Wed, 3 Jul 2024 11:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Al Walker <al@inline.audio>
References: <92110F02-FA7C-4C28-BADE-CF912167AA1B@contoso.com>
 <b71d6073-be4d-4d57-8472-cff1e74adbf3@mind.be>
 <66454736-8ADB-4A13-AEAA-68AE4E95C533@inline.audio>
Content-Language: en-GB
In-Reply-To: <66454736-8ADB-4A13-AEAA-68AE4E95C533@inline.audio>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719997265; x=1720602065; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jrrfXm3FDfUyrgAv291odCn7Hg+5OyoFkvo7y0CpbDU=;
 b=Ip3EKbaVa0umPuopvWSJORetxlFv2dnBFx8Mzs8GjWsw8U2OfNWCz7av4omxKBdvAO
 /2xTbFsd1gPwT15L2wM/KZjkNidWwxLhAPiKdqFgn4KqiGaCN0lVeSNxOwCpgO1OEBG0
 u4XWRfZjmsN+ZZ5HhxehU5ZmvDVQSmioJqTAV9oz3sSMzXQkbxyJW9+mBHCQBuFseIXB
 DDUaUj+2Z3zQt3rQ0IBMa9mSUvZw1s4bbYjOQhwka0u/hu3rTMo7903AWpN2FEBYxJ4O
 PMlWLagJnFRoG35x+ZtHu7p2UKFzuL0togiQk18ACS7hP1KuRxJKMj4keOlYwEW3eTsU
 TclQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ip3EKbaV
Subject: Re: [Buildroot] Buildroot Newbie
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDI0IDEwOjAwLCBBbCBXYWxrZXIgd3JvdGU6Cj4gSGkgQXJub3V0LAo+IAo+
IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcXVpY2sgcmVwbHksIEkgZnVsbHkgdW5kZXJz
dGFuZCB0aGF0IGV2ZXJ5b25lIGhhcyAKPiB0aGVpciBvd24gcHJpb3JpdGllcy4KPiAKPiBJJ20g
YXdhcmUgb2Ygc3RtMzJtcDE1N2FfZGsxX2RlZmNvbmZpZyBoYXZpbmcgZm9sbG93ZWQgdGhlIFNo
YXduIEh5bWVsIERpZ2ktS2V5IAo+IHNlcmllcyBvbiBlbWJlZGRlZCBMaW51eCBhbmQgZ290IHRo
ZSBCdWlsZHJvb3QgYnVpbGQgdXNpbmcgaXQgcnVubmluZyAKPiBzdWNjZXNzZnVsbHkgb24gYSBT
VE0zMk1QMTU3RC1ESzEgYm9hcmQsIGJ1dCBJJ20gYWx3YXlzIG1vdGl2YXRlZCB0byBzdGFydCBm
cm9tIAo+IGZpcnN0IHByaW5jaXBsZXMgYW5kIHVuZGVyc3RhbmQgaG93IHRoZSBkZWZjb25maWcg
ZmlsZXMgYXJlIGNyZWF0ZWQuIEkgY2FuIHVzZSAKPiB0aGUgc3RtMzJtcDE1N2FfZGsxX2RlZmNv
bmZpZyBhcyBhIHJlZmVyZW5jZS4KPiAKPiBJbiBteSBpZ25vcmFuY2UgSSBqdXN0IG5hdmlnYXRl
ZCB0byB0aGUga2VybmVsIGZvbGRlciB1bmRlciB0aGUgU1RNMzJDdWJlSURFIAo+IHByb2plY3Qg
KHBsZWFzZSBzZWUgYXR0YWNoZWQsIEknbSBub3Qgc3VyZSBpZiB0aGUgbWFpbGluZyBsaXN0IHN1
cHBvcnRzIAo+IGF0dGFjaG1lbnRzKSBhbmQgcmFuIGR0YyBmcm9tIHRoZXJlLgo+IAo+ICQgZHRj
IC1JIGR0cyAtTyBkdGIgLXAgc3RtMzJtcDE1N2QtMjQwNzAyX3N0bTMybXAxNTctZGsxLW14LmR0
YiAKPiBzdG0zMm1wMTU3ZC0yNDA3MDJfc3RtMzJtcDE1Ny1kazEtbXguZHRzCj4gCj4gRXJyb3I6
IHN0bTMybXAxNTdkLTI0MDcwMl9zdG0zMm1wMTU3LWRrMS1teC5kdHM6MTMuMS05IHN5bnRheCBl
cnJvcgoKICBXZWxsLCB0aGF0IHNheXMgaXQ6IHRoZXJlJ3MgYSBzeW50YXggZXJyb3Igb24gbGlu
ZSAxMy4gKEVycm9ycyBmcm9tIGR0YyBhcmVuJ3QgCnN1cGVyIGhlbHBmdWwgSSdtIGFmcmFpZCA6
LSkpLgoKICBUaGlzIGlzIGdlbmVyYXRlZCBieSBTVE0zMkN1YmVJREU/IFNlZW1zIHlvdSBjYW4n
dCB0cnVzdCB0aGF0IElERSB0byBkbyB0aGUgCnJpZ2h0IHRoaW5nLi4uCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIGd1aWRhbmNlIHRvIHVzZSBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9EVFNfUEFUSCwgSSBmb3VuZCB0aGlzIAo+IGFydGljbGUgb24gU3RhY2sg
T3ZlcmZsb3cgYXMgYSBzdGFydGluZyBwb2ludC4KPiAKPiBodHRwczovL3N0YWNrb3ZlcmZsb3cu
Y29tL3F1ZXN0aW9ucy81MDEzOTkxNC93aGVyZS1hcmUtYnVpbGRyb290LWJyMi1vcHRpb25zLWRv
Y3VtZW50ZWQgPGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5jb20vcXVlc3Rpb25zLzUwMTM5OTE0L3do
ZXJlLWFyZS1idWlsZHJvb3QtYnIyLW9wdGlvbnMtZG9jdW1lbnRlZD4KPiAKPiBLaW5kIFJlZ2Fy
ZHMsCj4gCj4gQWwKPiAKPiBBbCBXYWxrZXIKPiBGb3VuZGVyICYgQ0VPCj4gSW5saW5lIEF1ZGlv
IChISykgTGltaXRlZAo+IGFsQGlubGluZS5hdWRpbyA8bWFpbHRvOmFsQGlubGluZS5hdWRpbz4K
PiAKPiBtLiArODYgMTMwIDY4MTEgNTI2NAo+IG0uICs0NCA3ODEwIDU0MDEyMAo+IAo+IAo+IAo+
IEljb24gRGVzY3JpcHRpb24gYXV0b21hdGljYWxseSBnZW5lcmF0ZWQKPiAKPiAKPiBDT05GSURF
TlRJQUxJVFnCoE5PVElDRTogVGhpcyBtZXNzYWdlwqAoaW5jbHVkaW5nIGFuecKgYXR0YWNobWVu
dHMpIAo+IGNvbnRhaW5zwqBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZcKgY29uZmlkZW50aWFsLiBV
bmxlc3MgeW91wqBhcmUgdGhlIGludGVuZGVkIAo+IHJlY2lwaWVudMKgKG9ywqBhdXRob3Jpc2Vk
IHRvIHJlY2VpdmXCoGZvciB0aGUgaW50ZW5kZWTCoHJlY2lwaWVudCksIHlvdSBtYXkgCj4gbm90
wqByZWFkLCBwcmludCzCoHJldGFpbiwgdXNlLMKgY29weSwgZGlzdHJpYnV0ZSBvcsKgZGlzY2xv
c2UgdG8gYW55b25lIHRoZcKgbWVzc2FnZSAKPiBvciBhbnnCoGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbsKgdGhlIG1lc3NhZ2UuIElmIHlvdSBoYXZlwqByZWNlaXZlZCB0aGUgbWVzc2FnZSAKPiBp
bsKgZXJyb3IsIHBsZWFzZSBhZHZpc2UgdGhlwqBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsLMKgYW5k
IGRlc3Ryb3kgYWxsIGNvcGllcyAKPiBvZsKgdGhlwqBvcmlnaW5hbCBtZXNzYWdlwqAoaW5jbHVk
aW5nIGFuecKgYXR0YWNobWVudHMpLgo+IAo+IO+7v09uIDAzLzA3LzIwMjQsIDE1OjA4LCAiQXJu
b3V0IFZhbmRlY2FwcGVsbGUiIDxhcm5vdXRAbWluZC5iZSAKPiA8bWFpbHRvOmFybm91dEBtaW5k
LmJlPj4gd3JvdGU6Cj4gCj4gSGkgQWwsCj4gCj4gT24gMDMvMDcvMjAyNCAwNzoyNiwgQWwgV2Fs
a2VyIHdyb3RlOgo+IAo+ICA+IEhlbGxvLAo+IAo+ICA+Cj4gCj4gID4gSeKAmW0gbmV3IHRvIEJ1
aWxkcm9vdCBhbmQgdGhpcyBjb21tdW5pdHkgYW5kIGtlZW4gdG8gY29udHJpYnV0ZSB3aGVyZSBJ
IGNhbiwKPiAKPiAgPiBhbHRob3VnaCBvYnZpb3VzbHkgSSBoYXZlIGEgYml0IG9mIGEgbGVhcm5p
bmcgY3VydmUgZmlyc3QuCj4gCj4gID4KPiAKPiAgPiBJcyB0aGlzIHRoZSBiZXN0IHBsYWNlIHRv
IHBvc3QgdGVjaG5pY2FsIHF1ZXN0aW9ucywgZXNwZWNpYWxseSBmb3IgbXkgaW5pdGlhbAo+IAo+
ICA+IHN0ZXBzLCBwbGVhc2U/IEFueSBoZWxwIGFuZCBndWlkYW5jZSBpcyB2ZXJ5IG11Y2ggYXBw
cmVjaWF0ZWQuCj4gCj4gWWVzIHRoaXMgaXMgdGhlIGNvcnJlY3QgcGxhY2UhIFRoYXQgc2FpZCwg
cXVlc3Rpb25zIHBvc3RlZCBvbiB0aGlzIGxpc3Qgb2Z0ZW4KPiAKPiBnbyB1bmFuc3dlcmVkIChi
ZWNhdXNlIG5vYm9keSBrbm93IHRoZSBhbnN3ZXIgb2ZmIHRoZSB0b3Agb2YgdGhlaXIgaGVhZCwg
YW5kCj4gCj4gdGhleSdyZSBub3QgaW50ZXJlc3RlZCBpbiBkb2luZyB0aGUgbmVjZXNzYXJ5IHJl
c2VhcmNoKS4KPiAKPiAgPiBJbiB0aGUgZmlyc3QgaW5zdGFuY2UgSeKAmXZlIHNldCBteXNlbGYg
dGhlIGNoYWxsZW5nZSBvZiBjcmVhdGluZyBhIEJ1aWxkcm9vdAo+IAo+ICA+IGJ1aWxkIGZvciB0
aGUgU1RNMzJNUDE1N0QtREsxIGJvYXJkLiBUaGVyZSBpc27igJl0IGEgcHJlLWV4aXN0aW5nIHNw
ZWNpZmljCj4gCj4gID4gZGVmY29uZmlnIGZpbGUgZm9yIHRoaXMgdmFyaWFudCwgc28gaXQgc2Vl
bXMgbGlrZSBhIGdvb2Qgc3RhcnRpbmcgcG9pbnQuCj4gCj4gVGhlcmUgaXMgc3RtMzJtcDE1N2Ff
ZGsxX2RlZmNvbmZpZywgSSBkb24ndCB0aGluayB0aGVyZSBhcmUgc3Vic3RhbnRpYWwKPiAKPiBk
aWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28uIFlvdSBjYW4gYnVpbGQgdHdvIGRldmljZSB0cmVl
cyB3aXRoIGEgc2luZ2xlIGRlZmNvbmZpZy4KPiAKPiAgPiBTbyBmYXIgSeKAmXZlIHN1Y2Nlc3Nm
dWxseSBidWlsdCB0aGUgcHJvamVjdCB1c2luZyB0aGUgZGVmYXVsdCBwaW4gYXNzaWdubWVudHMg
aW4KPiAKPiAgPiBTVE0zMkN1YmVJREUgYW5kIGNyZWF0ZWQgdGhlIC5kdHMvLmR0c2kgZmlsZXMg
Zm9yIHRoZSBDb3J0ZXgtQTcgY29yZXMsIGJ1dCBkdGMKPiAKPiAgPiBkaWRu4oCZdCB3b3JrIGZv
ciBjb21waWxpbmcgdGhlIC5kdGIgZmlsZXMuCj4gCj4gV2hhdCBkbyB5b3UgbWVhbiB3aXRoICJk
aWRuJ3Qgd29yayI/IElmIHRoZXJlIGFyZSBzeW50YXggZXJyb3JzLCBkdGMgd2lsbAo+IAo+IHJl
cG9ydCB0aGVtLi4uIFlvdSdsbCBnZXQgYmV0dGVyIGZlZWRiYWNrIGlmIHlvdSBpbmNsdWRlIHRo
ZSBlcnJvciBtZXNzYWdlcwo+IAo+ICh3aXRoIHN1ZmZpY2llbnQgY29udGV4dCkgaW4geW91ciBt
YWlsLgo+IAo+IFlvdSBub3JtYWxseSBwYXNzIGluIHRoZSBjdXN0b20gLmR0cyBhbmQgLmR0c2kg
ZmlsZXMgYnkgc3BlY2lmeWluZwo+IAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRI
IChhbmQgdGhlIGVxdWl2YWxlbnQgZm9yIFUtQm9vdCBhbmQgVEYtQSkuIElzCj4gCj4gdGhhdCBo
b3cgeW91IGRpZCBpdD8KPiAKPiBSZWdhcmRzLAo+IAo+IEFybm91dAo+IAo+ICA+Cj4gCj4gID4g
S2luZCBSZWdhcmRzLAo+IAo+ICA+Cj4gCj4gID4gQWwKPiAKPiAgPgo+IAo+ICA+IEFsIFdhbGtl
cgo+IAo+ICA+IEZvdW5kZXIgJiBDRU8KPiAKPiAgPiBJbmxpbmUgQXVkaW8gKEhLKSBMaW1pdGVk
Cj4gCj4gID4gYWxAaW5saW5lLmF1ZGkgPG1haWx0bzphbEBpbmxpbmUuYXVkaT5vIDxtYWlsdG86
YWxAaW5saW5lLmF1ZGkgCj4gPG1haWx0bzphbEBpbmxpbmUuYXVkaT5vPgo+IAo+ICA+Cj4gCj4g
ID4gbS4gKzg2IDEzMCA2ODExIDUyNjQKPiAKPiAgPiBtLiArNDQgNzgxMCA1NDAxMjAKPiAKPiAg
Pgo+IAo+ICA+Cj4gCj4gID4KPiAKPiAgPiBJY29uIERlc2NyaXB0aW9uIGF1dG9tYXRpY2FsbHkg
Z2VuZXJhdGVkCj4gCj4gID4KPiAKPiAgPgo+IAo+ICA+IENPTkZJREVOVElBTElUWSBOT1RJQ0U6
IFRoaXMgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykKPiAKPiAgPiBjb250YWlu
cyBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBjb25maWRlbnRpYWwuIFVubGVzcyB5b3UgYXJlIHRo
ZSBpbnRlbmRlZAo+IAo+ICA+IHJlY2lwaWVudCAob3IgYXV0aG9yaXNlZCB0byByZWNlaXZlIGZv
ciB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KSwgeW91IG1heQo+IAo+ICA+IG5vdCByZWFkLCBwcmlu
dCwgcmV0YWluLCB1c2UsIGNvcHksIGRpc3RyaWJ1dGUgb3IgZGlzY2xvc2UgdG8gYW55b25lIHRo
ZSBtZXNzYWdlCj4gCj4gID4gb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGUgbWVz
c2FnZS4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhlIG1lc3NhZ2UKPiAKPiAgPiBpbiBlcnJvciwg
cGxlYXNlIGFkdmlzZSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCwgYW5kIGRlc3Ryb3kgYWxs
IGNvcGllcwo+IAo+ICA+IG9mIHRoZSBvcmlnaW5hbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKS4KPiAKPiAgPgo+IAo+ICA+Cj4gCj4gID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiAKPiAgPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gCj4gID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4KPiAKPiAgPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QgCj4gPGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdD4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
