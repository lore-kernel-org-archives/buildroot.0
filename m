Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88212CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5353383DCD;
	Wed,  1 Oct 2025 19:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaehSpadK_Yk; Wed,  1 Oct 2025 19:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 535AF83EF0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535AF83EF0;
	Wed,  1 Oct 2025 19:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6A761CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9824C61461
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVOGF01ASlCF for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7008361457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7008361457
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7008361457
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:47:48 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433] (unknown
 [IPv6:2a01:e0a:12:eba0:a14e:ad95:d6a9:3433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id E0212C089C;
 Wed,  1 Oct 2025 21:47:44 +0200 (CEST)
Message-ID: <bad4b626-6f6c-4eef-8e8d-0a5af5aa235d@grenoble.cnrs.fr>
Date: Wed, 1 Oct 2025 21:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dylan <ohitsdylan@outlook.com>, buildroot@buildroot.org
References: <15f12d6e-87b8-4faf-bbe7-8da6bc440015@grenoble.cnrs.fr>
 <IA0PPFC38B3687C9C75440A153CF5B108B7CBE6A@IA0PPFC38B3687C.namprd19.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <IA0PPFC38B3687C9C75440A153CF5B108B7CBE6A@IA0PPFC38B3687C.namprd19.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1759348065;
 bh=/Dw8AABo+Ej+Z8+cFTa2Bzp47/Gt34h+7xOLBOPo3GQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=I55wxkw9O9SWg59ZyoeLbJR7EllaIKrQYH1Wuh9drOkOvAJPWYHfVF1xThc9s7AcC
 xM7PctTg2Qvmv8PPpO2BtWG16jdVVr0jJj9Vm0NVAuPzgerfgAi26MxPJn5xkqSRmf
 riq1cvynbK4B9agrJVjY/1fXitoALHEiTrfJjr8moueTgldFK5vHEfUrZvX2frWEoJ
 KnylUpAKbEILnwNViNSaiuLC3WaVIy6YMUTp56Mg0vyiqF2AGIMi94THRmKSlkxjum
 YAj7kzb7sRPJGbLHLRsgrCGdux4dyqmmVGVTZRwdGqqbgrgHYK3/0n+NMpzOWrjAu4
 HJfGQMvJkMumg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=I55wxkw9
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyNS0xMC0wMSwgRHlsYW4gd3JvdGU6Cj4gQXBwZW5kaW5nICJhLyIgYW5kICJiLyIgdG8g
dGhlIGhlYWRlcnMgaW4gdGhlIHBhdGNoIGZpbGVzIGRpZCB0aGUKPiB0cmljayEgSSdtIGN1cmlv
dXMgdG8ga25vdyB3aHkgbXkgcGF0Y2ggZmlsZXMgZGlkIG5vdCBpbmNsdWRlIHRoaXMuCj4gQ2hl
Y2tpbmcgbXkgbm90ZXMsIEkgcmFuIHRoZSBkaWZmIGNvbW1hbmQgbGlrZToKPgo+ICAgICBkaWZm
IC11ICJvbGRfZmlsZSIgIm5ld19maWxlIiA+IGZpbGUucGF0Y2gKPgo+IHdoZXJlICJvbGRfZmls
ZSIgYW5kICJuZXdfZmlsZSIgd2VyZSBpbiB0aGUgc2FtZSBkaXJlY3RvcnkgdG9nZXRoZXIuIEkK
PiByYW4gdGhlIGRpZmYgY29tbWFuZCBmcm9tIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyB0aGVzZSBm
aWxlcywgdG9vLiAKCldoZW4gY3JlYXRpbmcgcGF0Y2hlcyB3aXRoIGdvb2Qgb2xkIOKAmGRpZmbi
gJksIGl0IGlzIGN1c3RvbWFyeSB0byBydW4gaXQKYWNyb3NzIHR3byBmdWxsIHRyZWVzLiBGb3Ig
ZXhhbXBsZSwgYXNzdW1pbmcgeW91IGhhdmUgdGhlIHByaXN0aW5lCnNvdXJjZXMgaW4gYSBkaXJl
Y3RvcnkgbmFtZWQg4oCccHNwbGFzaOKAnSwgeW91IHdvdWxkIGRvOgoKICAgIGNwIC1hIHBzcGxh
c2ggcHNwbGFzaC5vcmlnICAjIG1ha2UgYSBiYWNrdXAgb2YgdGhlIGZ1bGwgdHJlZQogICAgY2Qg
cHNwbGFzaAogICAgJEVESVRPUiBwc3BsYXNoLWNvbmZpZy5oICAgICMgaGFjaywgaGFjay4uLgog
ICAgJEVESVRPUiBwc3BsYXNoLWNvbG9ycy5oICAgICMgaGFjaywgaGFjay4uLgogICAgY2QgLi4K
ICAgIGRpZmYgLXJ1TiBwc3BsYXNoey5vcmlnLH0gPiBjdXN0b21pemF0aW9uLnBhdGNoCgpUaGUg
cGF0Y2ggZmlsZSB3b3VsZCB0aGVuIHN0YXJ0IHdpdGg6CgogICAgLS0tIHBzcGxhc2gub3JpZy9w
c3BsYXNoLWNvbG9ycy5oCTIwMjUtMTAtMDEgLi4uCiAgICArKysgcHNwbGFzaC9wc3BsYXNoLWNv
bG9ycy5oCTIwMjUtMTAtMDEgLi4uCgpJdCBkb2Vzbid0IG1hdHRlciB3aGF0IHlvdSBoYXZlIGlu
IGZyb250IG9mIHRoZSDigJgv4oCZLCBhcyBsb25nIGFzIHRoZXJlIGlzCmEgc2luZ2xlIOKAmC/i
gJkgYmVmb3JlIHRoZSBmaWxlIG5hbWUuCgpJZiB5b3Ugd2FudCBzZXBhcmF0ZSBwYXRjaGVzLCB5
b3UgbWF5IGRvOgoKICAgIGRpZmYgLXUgcHNwbGFzaHsub3JpZyx9L3BzcGxhc2gtY29uZmlnLmgg
PiAwMDAxLXBzcGxhc2gtY29uZmlnLnBhdGNoCiAgICBkaWZmIC11IHBzcGxhc2h7Lm9yaWcsfS9w
c3BsYXNoLWNvbG9ycy5oID4gMDAwMi1wc3BsYXNoLWNvbG9ycy5wYXRjaAoKVGhhdCBiZWluZyBz
YWlkLCBnaXZlbiB0aGF0IHBzcGxhc2ggaXMgcmV0cmlldmVkIHZpYSBnaXQsIGl0IHdvdWxkIG1h
a2UKbW9yZSBzZW5zZSB0byB1c2UgYSBnaXQgd29ya2Zsb3c6CgogICAgIyBUYWtlbiBmcm9tIGJ1
aWxkcm9vdC9wYWNrYWdlL3BzcGxhc2gvcHNwbGFzaC5tazoKICAgIFBTUExBU0hfVkVSU0lPTj01
M2FlNzRhMzZiZjE3Njc1MjI4NTUyYWJiOTI3ZDJmOTgxOTQwYTZhCiAgICBQU1BMQVNIX1NJVEU9
aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wc3BsYXNoCgogICAgIyBSZXRyaWV2ZSBhIGNs
b25lIG9mIHRoZSBwc3BsYXNoIHJlcG8sIGFuZCB3b3JrIHRoZXJlLgogICAgZ2l0IGNsb25lICRQ
U1BMQVNIX1NJVEUKICAgIGNkIHBzcGxhc2gKCiAgICAjIENyZWF0ZSBhIGJyYW5jaCBvZmYgJFBT
UExBU0hfVkVSU0lPTiBmb3Igb3VyIGN1c3RvbWl6YXRpb25zLgogICAgZ2l0IHN3aXRjaCAtYyBj
dXN0b21pemF0aW9uICRQU1BMQVNIX1ZFUlNJT04KCiAgICAjIENvbW1pdCBhIGNvdXBsZSBvZiBj
aGFuZ2VzLgogICAgJEVESVRPUiBwc3BsYXNoLWNvbmZpZy5oICAgICMgaGFjaywgaGFjay4uLgog
ICAgZ2l0IGNvbW1pdCAtYSAtbSAnRGVmYXVsdCB0byBmdWxsIHNjcmVlbiBtb2RlJwogICAgJEVE
SVRPUiBwc3BsYXNoLWNvbG9ycy5oICAgICMgaGFjaywgaGFjay4uLgogICAgZ2l0IGNvbW1pdCAt
YSAtbSAnU2V0IGEgYmxhY2sgYW5kIHdoaXRlIGNvbG9yIHRoZW1lJwoKICAgICMgQ3JlYXRlIG9u
ZSBwYXRjaCBmaWxlIGZvciBlYWNoIG9mIHRoZSBsYXN0IHR3byBjb21taXRzLgogICAgZ2l0IGZv
cm1hdC1wYXRjaCAtMgoKUmVnYXJkcywKCkVkZ2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
