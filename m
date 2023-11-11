Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05436C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 08:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1AF839CD;
	Sat, 11 Nov 2023 08:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1AF839CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1oamfVU9ZrR6; Sat, 11 Nov 2023 08:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 691FB83A05;
	Sat, 11 Nov 2023 08:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691FB83A05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 466AF1BF294
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 08:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 139E9404F6
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 08:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 139E9404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSHPN-r_UC7p for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 08:35:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 101BB400E2
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 08:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 101BB400E2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7a6a:401e:4e08:46b9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BB7BE13F8B9;
 Sat, 11 Nov 2023 09:35:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Nov 2023 09:35:29 +0100
Date: Sat, 11 Nov 2023 09:35:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231111083529.GJ996011@scaer>
References: <20231110104504.2340403-1-jonhenrik@qbee.io>
 <CA+h8R2q=+SNv+2bu2+WR1NbfZ20hD09+eCntZoETnWiDgk-xgg@mail.gmail.com>
 <c394918d-edcc-4d52-9a0d-727ece0cd394@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c394918d-edcc-4d52-9a0d-727ece0cd394@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699691735;
 bh=bHr+uLXwdMKYLskhe80yG7Ef0nJLwDBhz4oaqsJargQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JMvl3bODL3ZZpNtj8ei4azSru66yEwfGmPRsfcEzR3MPdztS0dRW2F86GxFG7Nbdj
 G6FiAeOAdx/I4slOpE8zYQbaVFNMUdX1RFHN/vb7PANrFnYO1U+jiIPF7/bneI039V
 OWF5thO0Oe1DXiCCz2eFXuQl0gudg+55SfBrZmdfaYbqiowJMvwaMsw+roORdJaWA9
 omQy6D+xogl2Xs9Vj71RieCbwNAUAFQEz5J0gKuQYASswWsEGxavb12MekMP51NwSU
 4VO+Uj1AEqz0LX7kVdb1+5d413HCd1x3rbTyeE3ZYZ9wMTk1u4x58dIhazdCY9x/33
 GaCc11IjGU9bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JMvl3bOD
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Jon Henrik =?utf-8?Q?Bj=C3=B8rnstad?= <jonhenrik@qbee.io>,
 Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXJub3V0LCBDaHJpc3RpYW4sIEpvbiwgQWxsLAoKT24gMjAyMy0xMS0xMCAyMDoyOCArMDEwMCwg
QXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gMTAv
MTEvMjAyMyAxODoxNCwgQ2hyaXN0aWFuIFN0ZXdhcnQgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiA+
T24gRnJpLCBOb3YgMTAsIDIwMjMsIDI6NDXigK9BTSBKb24gSGVucmlrIEJqw7hybnN0YWQgPGpv
bmhlbnJpa0BxYmVlLmlvCj4gPjxtYWlsdG86am9uaGVucmlrQHFiZWUuaW8+PiB3cm90ZToKPiA+
ICAgIFRoaXMgcGF0Y2ggYWRkIHFiZWUtYWdlbnQsIGFuIG9wZW4gc291cmNlIGRldmljZSBtYW5h
Z2VtZW50IHNvZnR3YXJlCj4gPiAgICBmb3IgTGludXggZGV2aWNlcy4KPiA+QXJlIHRoZXJlIGFu
eSBidWlsZHJvb3QgdXNlcnMgdG9kYXkgd2hvIHdvdWxkIHdhbnQgdG8gaW5zdGFsbCB0aGlzIHBh
Y2thZ2UKPiA+d2l0aCBpdCdzIHByb3ByaWV0YXJ5IGJhY2tlbmQgaW5kZXBlbmRlbnRseSBvZiB1
c2luZyB0aGUgcHJvcHJpZXRhcnkKPiA+YmFja2VuZD8KPiA+Cj4gPldobyBob2xkcyB0aGUgcHJp
dmF0ZSBrZXkgZm9yIHRoYXQgcHVibGljIGtleSBhbmQgd2hhdCBjYW4gdGhleSB0aGVuIGRvCj4g
PndpdGggbXkgZGV2aWNlIGlmIEkgY2hvc2UgdG8gaW5zdGFsbCB0aGlzIHBhY2thZ2U/CgpUaG9z
ZSBhcmUgdmFsaWQgcXVlc3Rpb25zLCBidXQgdGhleSBhcmUgdG8gdGhlIHVzZXIgd2hvIGJ1aWxk
cyBhIHJvb3Rmcwp3aXRoIHFiZWUtYWdlbnQgdG8gYXNzZXNzLiBJZiB0aGV5IF9uZWVkXyBxYmVl
LWFnZW50IChmb3Igd2hhdGV2ZXIKcmVhc29uLCBnb29kIG9yIGJhZCksIHRoZW4gaXQgaXMgYXZh
aWxhYmxlIGluIEJ1aWxkcm9vdC4KCkFzIFlhbm5Ad29yayBwb2ludGVkIG91dCBob3dldmVyLCBp
cyB0aGF0IHdlIG5lZWQgdG8gaGF2ZSBhIGxpdHRsZQpleHBsYW5hdGlvbiBvbiB3aGF0IHRoZSBr
ZXkgaXMsIGFuZCB3aGV0aGVyIHVzZXJzIG1heSBuZWVkIHRvIGhhdmUgdGhlaXIKb3duLCBhbmQg
d2h5IHRoZSBrZXkgcHJvdmlkZWQgaW4gdGhpcyBwYXRjaCBkaWZmZXJzIGZyb20gdGhlIG9uZSBp
biB0aGUKZ2l0aHViIHJlcG8sIGFuZCB3aGF0IHRoZSBjb21tZW50IGluIHRoZSBnaXRodWIgcmVw
byBpcyBhYm91dC4KCj4gPlRoaXMgc2VlbXMgbGlrZSBhIGNhc2Ugd2hlcmUsIGlmIEkgd2FzIGFk
ZGluZyB0aGlzIHBhY2thZ2UgZm9yIGEKPiA+cHJvcHJpZXRhcnkgc2VydmljZSwgSSB3b3VsZCBp
bnN0ZWFkIG9wdCB0byB1c2UgYSBCdWlsZHJvb3QgRXh0ZXJuYWwKPiA+UGFja2FnZSBmb3IgdGhl
IHJlYXNvbnMgc3RhdGVkIGFib3ZlOgo+ID5odHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRz
L21hbnVhbC9jdXN0b21pemUtb3V0c2lkZS1ici50eHQKPiA+PGh0dHBzOi8vYnVpbGRyb290Lm9y
Zy9kb3dubG9hZHMvbWFudWFsL2N1c3RvbWl6ZS1vdXRzaWRlLWJyLnR4dD4KCk5vdCByZWFsbHku
IGJyMi1leHRlcm5hbCB0cmVlcyBhcmUgbWFkZSBmb3IgcGFja2FnZXMgb25lIGRvZXMgbm90IHdh
bnQKdG8gYmUgcHVibGljLCBpLmUuIHRoZSBwYWNrYWdlcyB0aGVtc2VsdmVzIGFyZSBpbnRlcm5h
bCB0byBvbmUncyBvcmcuCgo+ID5JbmRlZWQ6IHRoZXJlIGFyZSBtYW55IGNhc2VzIGxpa2UgdGhp
cyBvbmUgd2hlcmUgSSdsbCBtYWludGFpbiBhbiBleHRlcm5hbAo+ID5idWlsZHJvb3QgZXh0ZW5z
aW9ucyB0cmVlIGJlY2F1c2UgdGhlIHBhY2thZ2VzIGFyZSBub3QgZnVsbHkgb3BlbiBzb3VyY2UK
PiA+KGJhY2tlbmQgYW5kIGZyb250ZW5kKSBhbmQgdGhlcmVmb3JlIHByb2JhYmx5IG5vdCBvZiBp
bnRlcmVzdCB0byB0aGUgbWFpbgo+ID5idWlsZHJvb3QgdXNlciBiYXNlLgo+ICBJIGRvbid0IHRo
aW5rICJvcGVuIHNvdXJjZSBhZ2VudCBmb3IgYSBjbG9zZWQtc291cmNlIGJhY2tlbmQiIG1lYW5z
IHRoYXQgd2UKPiBkb24ndCB3YW50IHRvIGNhcnJ5IGl0IGluIGJ1aWxkcm9vdC4gSW4gZmFjdCwg
d2UgaGF2ZSBhdCBsZWFzdCBvbmUgb2YgdGhvc2UKPiBhbHJlYWR5OiBhenVyZS1pb3Qtc2RrLWMu
IEknbSBzdXJlIHRoZXJlIGFyZSBvdGhlcnMuCgpUaGUgcG9pbnQgSSB3YXMgYWJvdXQgdG8gbWFr
ZS4KCkl0IHdvdWxkIGJlIGEgYml0IHNhZCBpbmRlZWQgdG8gbm90IGhhdmUgYSBvcGVuIHNvdXJj
ZSBpbXBsZW1lbnRhdGlvbiBmbwp0aGUgc2VydmVyIHNpZGUsIG9yIHRoYXQgdXNlcnMgY2FuJ3Qg
c3BlY2lmeSBhbiBhbHRlcm5hdGUgcHJvdmlkZXIgKGkuZS4KY2hvb3NlIHRvIHJ1biB0aGVpciBv
d24pLCBidXQgdGhhdCdzIG9ydGhvZ29uYWwgdG8gaGF2aW5nIHRoZSBjbGllbnQgaW4KQnVpbGRy
b290LgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
