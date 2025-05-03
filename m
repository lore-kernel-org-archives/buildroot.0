Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A041CC369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4814941218;
	Sat,  3 May 2025 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvxlsUAOZDM5; Sat,  3 May 2025 12:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE7A412CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FE7A412CA;
	Sat,  3 May 2025 12:19:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 162B6C8
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F039583B37
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rjN9963CerI for <buildroot@buildroot.org>;
 Sat,  3 May 2025 12:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55D4B83A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55D4B83A55
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55D4B83A55
 for <buildroot@buildroot.org>; Sat,  3 May 2025 12:19:08 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3e99:697d:40d2:a4e3] (unknown
 [IPv6:2a01:e0a:12:eba0:3e99:697d:40d2:a4e3])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0FF87C03DA;
 Sat,  3 May 2025 14:12:27 +0200 (CEST)
Message-ID: <11ab9ce1-3c31-41f8-9f67-111bb2eb9cec@grenoble.cnrs.fr>
Date: Sat, 3 May 2025 14:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Shishlov, Sergey" <Sergey.Shishlov@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <BN2P110MB14301BD3BE2F37B46B7EE244E08DA@BN2P110MB1430.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US, fr
In-Reply-To: <BN2P110MB14301BD3BE2F37B46B7EE244E08DA@BN2P110MB1430.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1746274348;
 bh=8JMPJ7zavTm7/z0lfNc9HbXhDvNHZ47xNFPWtKlx8b4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=aBQxIYb9DDJ7SUrZZrtRBTrXTli9Pn0ILzZRj0qRlqSailqDtd5u52tQN10zssyc2
 hsdvqkSjf9YSD2Cf6V4/kcw10F2oyQJCiKMKFfKi8QMkZMbqufy4YXID/riIwSBAjS
 sW8MQgg7ZV62LQZmRHvt0KwvMDzu9wxRldIz1LlWisSd9khPYhk6pmSvOC7uxEii4p
 QvVcEIjXDeaf1onMEOonaoDsRLbvG/60nZ1Byj3a4Ayg2fFGX4h+kQsghzK0Brh6ZE
 9/u3rDpWfXWkXj71RhLWvdPYYoIwKI4TjT9Sxwquvi4DYmZ+eTOr3oto+Il1rpc7iU
 lNW04ogH8cq2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=aBQxIYb9
Subject: Re: [Buildroot] Error to build Buitroot images for
 qemu_riscv64_virt_defconfig
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

SGVsbG8hCgpPbiAyMDI1LTA1LTAzLCBTZXJnZXkgQi4gU2hpc2hsb3Ygd3JvdGU6Cj4gSSBhbSBj
dXJyZW50bHkgd29ya2luZyBvbiBhIHByb2plY3QgdGhhdCByZXF1aXJlcyBpbnN0YWxsaW5nIEJ1
aWxkcm9vdAo+IG9uIGFuIFVidW50dSBPUyBydW5uaW5nIHdpdGhpbiBhIERvY2tlciBEZXNrdG9w
IGNvbnRhaW5lci4KPiBVbmZvcnR1bmF0ZWx5LCBJIGFtIGVuY291bnRlcmluZyBpc3N1ZXMgc3Vj
Y2Vzc2Z1bGx5IGJ1aWxkaW5nCj4gQnVpbGRyb290IGltYWdlcyB1c2luZyB0aGUgInFlbXVfcmlz
Y3Y2NF92aXJ0X2RlZmNvbmZpZyIKPiBjb25maWd1cmF0aW9uLCBhbmQgSSBuZWVkIGFzc2lzdGFu
Y2UgcmVzb2x2aW5nIHRoZSBwcm9ibGVtLiBCZWxvdyBhcmUKPiB0aGUgc3RlcHMgSSBoYXZlIHRh
a2VuIHNvIGZhcjoKPgo+IEZpcnN0IEkgdmlzaXRlZCBCdWlsZHJvb3Qgb2ZmaWNpYWwgd2Vic2l0
ZSB0byBnZXQgdGhlIGxhdGVzdCBzdGFibGUKPiBmaWxlczogYnVpbGRyb290LTIwMjUuMDIudGFy
Lmd6LnNpZ2ggYW5kIGJ1aWxkcm9vdC0yMDI1LjAyLnRhci5nei4KPiBBZnRlciBjb25maXJtaW5n
IHRoYXQgYnVpbGRyb290LTIwMjUuMDIudGFyLmd6IGZpbGUgaXMgdmFsaWQgSQo+IGV4dHJhY3Rl
ZCB0aGUgZmlsZXMgKHRhciAteHpmIGJ1aWxkcm9vdC0yMDI1LjAyLnRhci5neikuIFRoZW4gSSBy
YW4KPiAibWFrZSBxZW11X3Jpc2N2NjRfdmlydF9kZWZjb25maWciLiBUbyByZWNvcmQgdGhlIGJ1
aWxkaW5nIHByb2Nlc3MKPiBvdXRwdXQgdG8gdGVybWluYWwgSSByYW4gdGhpcyDigJxtYWtlIDI+
JjEgfHRlZSBidWlsZC5sb2ciLgo+IFdoZW4gdGhlIGJ1aWxkaW5nIHByb2Nlc3Mgc3RvcHBlZCBi
ZWNhdXNlIG9mIHRoaXMgZXJyb3I6Cj4gIi4uLy4uLy4uLy4uL3Jpc2N2NjQtYnVpbGRyb290LWxp
bnV4LWdudS9iaW4vYXI6Cj4gY2lsYWNpY21zc3N0ZGxpYi9hdF9xdWlja19leGl0Lm9TOiBObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5IgoKSSBjb3VsZCBub3QgcmVwcm9kdWNlIHRoZSBpc3N1ZS4g
T24gYW4gVWJ1bnR1IDIyLjA0LCBJIHJhbgoKICAgIGNkIH4vc3JjL2J1aWxkcm9vdCAgICAjIGNs
b25lIG9mIHRoZSBvZmZpY2lhbCBCdWlsZHJvb3QgcmVwbwogICAgZ2l0IGNoZWNrb3V0IDIwMjUu
MDIgICMgc2FtZSBhcyB0aGUgcmVsZWFzZSB5b3UgdXNlZAogICAgbWFrZSBxZW11X3Jpc2N2NjRf
dmlydF9kZWZjb25maWcKICAgIG1ha2UgMj4mMSB8IHRlZSBidWlsZC5sb2cKCmFuZCB0aGUgYnVp
bGQgd2VudCBvbiBzbW9vdGhseS4gVGhlIHN5c3RlbSB3b3VsZG4ndCBib290IHRob3VnaDogdGhl
Cmtlcm5lbCBnb3Qgc3R1Y2sgYXQg4oCcV2FpdGluZyBmb3Igcm9vdCBkZXZpY2UgL2Rldi92ZGEu
Li7igJ0sIGJ1dCB0aGlzCmxvb2tzIGxpa2UgYSBzZXBhcmF0ZSBpc3N1ZS4KCkNvdWxkIHlvdSBw
bGVhc2Ugc2hhcmUgeW91ciBidWlsZCBsb2cgb24gc29tZSBraW5kIG9mIHBhc3RlYmluIHNlcnZp
Y2U/CgpSZWdhcmRzLAoKRWRnYXIgQm9uZXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
