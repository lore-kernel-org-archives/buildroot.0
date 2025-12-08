Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C188D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 20:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC9483C46;
	Mon,  8 Dec 2025 20:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDHi8eFravvz; Mon,  8 Dec 2025 20:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E331C83C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765224386;
	bh=F6CXqWIXm5R2xBnXlTUDVrjSFb07HXcSWdnrFLkXTtk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X4p1up9TrOgrtilxh+u71UmqmHv7QjaP8p7IgbJGXzonYP0S5XVE7MSPbOiiudsLu
	 ihGsBWw1KXHcyDDEWrVrs5P/ZqdBfl9qm9v5jbbcxkqLIzTgUPZwS3ObduE3c+W7cj
	 Z9sopyou3Plz070+JpQtBAK2lhLg+2rbYkn1wKXm1QDfq+ArKdCdiPQzUPHifmowzm
	 Rdyu3/OSS9/2TPwfNEz2Os+g7Q5qDLPZdhEcWwT64iaIyCIWRTzagQfvwFtqQ+9p60
	 Cd5D7wNSjZmeqUZNf36gh5kMI10VbhEuZxwX/umfGR2TNyPhTvdhgKywz5osnGjbj1
	 68Q3RAabYH+AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E331C83C47;
	Mon,  8 Dec 2025 20:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C069F151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A64CD60B12
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXRRPBTSdTLK for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 20:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52A9C60B08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A9C60B08
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A9C60B08
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 20:06:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1CC4AB00548;
 Mon,  8 Dec 2025 21:06:19 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 21:06:19 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 21:06:19 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251208121916.971146-1-vincent.stehle@arm.com>
References: <20251208121916.971146-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <06a6d61a4c779db00bb368a69453c9e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765224381;
 bh=fKWYcn8vi2eEX0iSc+cUAPtujMsT9/WemQjFkZnGjr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uUAGWQS+n0cHcdUxksoSmxDnOKjss/YuyYotVU+nVQcaki9E53sBB/6N+A9UJKvRv
 XSxbnnzUHw6iKGShQDJ+XOydpvF1ZcA21S5FJIpRsU5C8x20GsPnkFPXZnXv7O+ATL
 1GYFTtwoco3wg9f/5z+czE/m0NhHC+4jN51MxinIthDkolMcMmhYQedeWzxmQ5sJ8G
 EGQJOytrF74J3r5OZbZKjtSAhWiXIhB8IapR4jevYtlQv9WjQ0EFI/OJY/qzm6bALK
 02H5ZLqVAlwJY374Ilq0L2QAP12nJy6dcrzcCXK2O5QyIpp8hrD3ldi/zJiLMRiE8m
 9yT47IbuzSwVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uUAGWQS+
Subject: Re: [Buildroot] [PATCH next] configs/arm_fvp_ebbr: bump Linux,
 U-Boot, OP-TEE, TF-A and FVP
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDgvMTIvMjAyNSAxMzoxOSwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IC0gQnVtcCBMaW51
eCBrZXJuZWwgdG8gNi4xOC4KPiAtIEJ1bXAgVS1Cb290IHRvIDIwMjUuMTAuIEFkZCB0aGUgZGVw
ZW5kZW5jeSBvbiBHTlUgVExTLiBSZWZyZXNoIHRoZQo+ICAgY29uZmlnIGZyYWdtZW50OiBhZGQg
c21jICYgcG93ZXJvZmYgY29tbWFuZHMsIGFkZCBFU1JUIGFuZCBkdW1teQo+ICAgY2Fwc3VsZSB1
cGRhdGUsIGFkZCBTTUNDQyBmZWF0dXJlcyBkaXNjb3ZlcnkuCj4gLSBCdW1wIE9QLVRFRSB0byA0
LjguMC4gQWRkIHRoZSBkZXBlbmRlbmN5IG9uIHB5dGhvbi1jcnlwdG9ncmFwaHkuIExvY2sKPiAg
IG9wdGVlLWNsaWVudCB2ZXJzaW9uIHRvIGJlIHRoZSBzYW1lIGFzIG9wdGVlLW9zLiBBZGQgYSBw
YXRjaCB0byAKPiBvdXRwdXQKPiAgIGxvZ3MgdG8gdGhlIHNhbWUgVUFSVCBhcyBhbGwgdGhlIG90
aGVyIGNvbXBvbmVudHMgYW5kIGluY3JlYXNlIGxvZwo+ICAgbGV2ZWwuIFJlbW92ZSB0aGUgdW5u
ZWNlc3NhcnkgZGVwZW5kZW5jeSBvbiBkdGMuCj4gLSBCdW1wIFRGLUEgdG8gdjIuMTQuMC4KPiAt
IEJ1bXAgRlZQIHRvIDExLjMwXzI3LiBEaXNhYmxlIHRlcm1pbmFsIDEsIG5vdyB0aGF0IGFsbCB0
aGUgbG9ncyBnbyB0bwo+ICAgYSBzaW5nbGUgdGVybWluYWwuIEVuYWJsZSB2aXJ0aW8gbmV0d29y
ay4gUmF0ZSBsaW1pdCB0aGUgc2ltdWxhdGlvbgo+ICAgYnkgZGVmYXVsdCwgZm9yIGNvbnZlbmll
bmNlIGF0IFUtQm9vdCBhbmQgR1JVQiBjb3VudGRvd24sIGFuZCBmb3IgCj4gbW9yZQo+ICAgcmVh
bGlzdGljIGRlbGF5cyBpbnNpZGUgdGhlIHNpbXVsYXRpb24uCj4gLSBTd2l0Y2ggdG8gQm9vdGxp
biBwcmUtYnVpbHQgdG9vbGNoYWluLgo+IC0gQWRkIG1vcmUgbW9kdWxlcyB0byBHUlVCLCB0byBo
YXZlIG1vcmUgY29tbWFuZHMgYXZhaWxhYmxlOiBlZmkKPiAgIGNvbW1hbmRzLCBwbHVzIHJlYm9v
dCAmIGhhbHQuCj4gLSBBZGQgZXVkZXYgdG8gcHJvYmUgTGludXggbW9kdWxlcyBkdXJpbmcgYm9v
dCwgZm9yIExDRCBzdXBwb3J0Lgo+IC0gQ29uZmlndXJlIGV0aDAgd2l0aCBESENQIGF1dG9tYXRp
Y2FsbHkgZHVyaW5nIGJvb3QuCj4gLSBSZWZyZXNoIHRoZSBkb2N1bWVudGF0aW9uLgo+IAo+IFRo
aXMgY29uZmlndXJhdGlvbiBoYXMgYmVlbiB0ZXN0ZWQgb24gYW4geDg2IGFuZCBvbiBhbiBBQXJj
aDY0IG1hY2hpbmUuCj4gCj4gVGhlIGZpcm13YXJlIGFuZCBGVlAgb2YgdGhpcyBjb25maWd1cmF0
aW9uIGhhdmUgYWxzbyBiZWVuIHRlc3RlZAo+IHN1Y2Nlc3NmdWxseSB3aXRoIG90aGVyIE9TZXM6
IERlYmlhbiBMaXZlLCBvcGVuU1VTRSBUdW1ibGV3ZWVkLCBZb2N0bywKPiBPcGVuV3J0LCBCdWls
ZHJvb3QgQUFyY2g2NCBFRkkgYW5kIEZyZWVCU0QuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgoKQXBwbGllZCB0byBuZXh0LCB0aGFu
a3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
