Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 540BE611C3
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 540BE611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E891940107;
	Fri, 15 Oct 2021 20:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRguGPVxyyPA; Fri, 15 Oct 2021 20:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAE0D4018C;
	Fri, 15 Oct 2021 20:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F19D21BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E09E8407FC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpkJrWRTcnSm for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:50:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7602F404ED
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:50:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DA97F7802CE;
 Fri, 15 Oct 2021 22:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634331053;
 bh=OrLZVk0xVHjBKvkRJSaBlF6b9GoHQq9ADdqxKIWGD9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVCJUbcdacdWGl6vyjRTVWm9k4YYHfwOaH5VfNTquohhKwlauCiuq1XvRE6d4UYQt
 6/UYKvSUPFX68EshdilLD8Bz8Vfy7vGcfHcrLUnQiPcFTJUDB38hQEr8wHI6EM1bWr
 vc6vsah+iCulIChDrYQsIEHMs54O9FEsqPR3ol7FZDMOtGaaUisY4qolMfhTCue50D
 ya/jY66gIJTpq/rhP9d3l+q2oTRktWEK3tiVSdQjiOkQlpgrMVRqHR830K+sShSDYb
 8L/j8d9dWOftDrs0Bf2DbQ4z4bK4dzRF43zT6CAdfGs7MA6nMdpHk1DCh5lUcSE8lH
 EnhktI2zOZuNQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Oct 2021 22:50:44 +0200
Date: Fri, 15 Oct 2021 22:50:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20211015205044.GF368016@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-3-kory.maincent@bootlin.com>
 <20211006181104.GD2081069@scaer>
 <20211007102318.556f7fc2@kmaincent-XPS-13-7390>
 <20211007095326.GA2814782@scaer>
 <20211007144351.629d2de0@kmaincent-XPS-13-7390>
 <20211007162931.GH2081069@scaer>
 <20211011122736.3b0df127@kmaincent-XPS-13-7390>
 <20211014200207.GC368016@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014200207.GC368016@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: thomas.petazzoni@bootlin.com, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMTQgMjI6MDIgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bh
a2UgdGh1c2x5OgpbLS1TTklQLS1dCj4gU2lkZSBub3RlLCB1bnJlbGF0ZWQgdG8gdGhpcyBpc3N1
ZTogd2UgaGF2ZSBhIHBhcmFsbGVsIGJ1aWxkIGlzc3VlIHdpdGgKPiBncnViMjoKPiAgICAgMjAy
MS0xMC0xNCAyMTo0NTo1MiAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL2hvc3QvYmluL2k2
ODYtbGludXgtZ2NjIC1FIC1ESEFWRV9DT05GSUdfSCAtSS4gLUkuLiAgLVdhbGwgLVcgLURHUlVC
X1VUSUw9MSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1JLi9pbmNsdWRlIC1ER1JVQl9GSUxFPSJ1
dGlsL2dydWItZnN0ZXN0LmMiIC1JLiAtSS4uIC1JLiAtSS4uIC1JLi4vaW5jbHVkZSAtSS4vaW5j
bHVkZSAtSS4uL2dydWItY29yZS9saWIvbGliZ2NyeXB0LWdydWIvc3JjLyAtSS4vZ3J1Yi1jb3Jl
L2xpYi9nbnVsaWIgLUkuLi9ncnViLWNvcmUvbGliL2dudWxpYiAgLURfTEFSR0VGSUxFX1NPVVJD
RSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtT3MgLWZuby1z
dGFjay1wcm90ZWN0b3IgLURfRklMRV9PRkZTRVRfQklUUz02NCAgIC1EJ0dSVUJfTU9EX0lOSVQo
eCk9QE1BUktFUkB4QCcgLi4vdXRpbC9ncnViLWZzdGVzdC5jIC4uL2dydWItY29yZS9rZXJuL2Vt
dS9ob3N0ZnMuYyAuLi8gZ3J1Yi1jb3JlL2Rpc2svaG9zdC5jIC4uL2dydWItY29yZS9vc2RlcC9p
bml0LmMgPiBncnViX2ZzdGVzdC5wcCB8fCAocm0gLWYgZ3J1Yl9mc3Rlc3QucHA7IGV4aXQgMSkK
PiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1MiAuLi9ncnViLWNvcmUva2Vybi9lbXUvaG9zdGZzLmM6
MjA6MTA6IGZhdGFsIGVycm9yOiBjb25maWctdXRpbC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5Cj4gICAgIDIwMjEtMTAtMTQgMjE6NDU6NTIgICAgMjAgfCAjaW5jbHVkZSA8Y29uZmlnLXV0
aWwuaD4KPiAgICAgMjAyMS0xMC0xNCAyMTo0NTo1MiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fgpbLS1TTklQLS1dCj4gQnV0IGZvcnR1bmF0ZWx5LCBpdCBsb29rcyBsaWVrIGl0IGlz
IGZpeGVkIHdpdGggdXBzdHJlYW0gY29tbWl0Cj4gNDJmNDA1NGZhZjNjIChNYWtlZmlsZTogTWFr
ZSBsaWJncnViLnBwIGRlcGVuZCBvbiBjb25maWctdXRpbC5oKS4KCkFuZCBhcHBhcmVudGx5LCB0
aGlzIGlzIG5vdCBlbm91Z2gsIGJlY2F1c2UgSSBzdGlsbCBoaXQgdGhlIGlzc3VlLCBhYm91dApv
bmUgaW4gZml2ZSBidWlsZHMsIGFsd2F5cyB3aGVuIGJ1aWxkaW5nIGkzODYtZWZpLi4uIDotKAoK
QnV0IGdpdmVuIGhvdyBpbnZlbnRpdmUgdGhlIGdydWIgYnVpbGRzeXN0ZW0gaXMsIEkgZHJlYWQg
dG8gZXZlciBoYXZlIHRvCmxvb2sgYXQgaXQgb25jZSBtb3JlLi4uIDotKAoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
