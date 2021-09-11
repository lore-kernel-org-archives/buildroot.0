Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E635C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:16:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE4B161205
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE4B161205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82879400FC;
	Sat, 11 Sep 2021 16:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JbjEv7HgPGM; Sat, 11 Sep 2021 16:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9CE401C3;
	Sat, 11 Sep 2021 16:16:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C84781BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4892407CA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfpTH7WVXCjx for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:16:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8B93407C7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 16:16:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 75305B00565;
 Sat, 11 Sep 2021 18:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631376981;
 bh=jixksXwQRfulb9Daba6JoE83CLgglnptnaXtvn48Vm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oaq+n1QmUUA5BdHQKyGj3RaZAx2lNRM3CozEwLoAWYyN0LafJ+fVdFY/SwUFn59Yt
 DXr1gNOyMUTvY2/YbAJ5hWPlfVbdOhzdUZvIqBo14wtH66asJRpgPvGr4HmGeWKrx1
 d06RMpJh44+VKvHhus0iysSGSDKt5aXArBE9MOQu4x9QyB7lyRM/hZrFIE1Etevhf2
 h/QB9tdI8W0pdz+To+S0n4/O6e4g7LZn+1j2m+sP7XkcitdpH+3uHrvw6vaQAC0uTE
 bN/sVrypr39cwYCU8WWCF6tuwlyk15BKWbhbDuU1eaSgzNIOJLBlAoWtnPiVsyQvQX
 VWAOjy9eJXmTA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 18:16:14 +0200
Date: Sat, 11 Sep 2021 18:16:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911161614.GR1053080@scaer>
References: <20210908164536.474998-1-fontaine.fabrice@gmail.com>
 <20210911125500.GN1053080@scaer>
 <CAPi7W82x1VFV2Lb+=m=7fhzV7MDc0743TjkDN9n0nXNYefPUsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W82x1VFV2Lb+=m=7fhzV7MDc0743TjkDN9n0nXNYefPUsg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix MKIMAGE_ARCH handling
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMS0wOS0xMSAxODowNyArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiAxMSBzZXB0LiAyMDIxIMOgIDE0OjU1LCBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+ID4gT24gMjAyMS0w
OS0wOCAxODo0NSArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+IEZp
eCBNS0lNQUdFX0FSQ0ggaGFuZGxpbmcgdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWls
dXJlOgpbLS1TTklQLS1dCj4gPiA+IC1pZmVxICgkKEtFUk5FTF9BUkNIKSx4ODZfNjQpCj4gPiA+
IC1NS0lNQUdFX0FSQ0ggPSB4ODYKPiA+ID4gLWVsc2UgaWZlcSAoJChLRVJORUxfQVJDSCksaTM4
NikKPiA+ID4gKyMgRm9yIGkzODYsIHdlIG5lZWQgdG8gY29udmVydAo+ID4gPiArIyBGb3Igb3Bl
bnJpc2MsIHdlIG5lZWQgdG8gY29udmVydAo+ID4gPiArIyBGb3Igb3RoZXJzLCB3ZSdsbCBqdXN0
IGtlZXAgS0VSTkVMX0FSQ0gKPiA+ID4gK2lmZXEgKCQoS0VSTkVMX0FSQ0gpLGkzODYpCj4gPiA+
ICBNS0lNQUdFX0FSQ0ggPSB4ODYKPiA+Cj4gPiBCdXQgdGhlbiwgeDg2XzY0IHNob3VsZCBzdGls
bCBiZSBjaGFuZ2VkIHRvIHg4Niwgbm8/Cj4gTm9wZSwgeDg2XzY0IGlzIHJlY29nbml6ZWQgYXMg
YSB2YWxpZCBhcmNoaXRlY3R1cmUsIGhlcmUgaXMgYW4gZXh0cmFjdAo+IG9mIHRoZSBjb21taXQg
bWVzc2FnZToKPiAKPiAgICAgICAgIHg4NiAgICAgICAgICAgICAgSW50ZWwgeDg2Cj4gICAgICAg
ICB4ODZfNjQgICAgICAgICAgIEFNRCB4ODZfNjQKPiAgICAgICAgIHh0ZW5zYSAgICAgICAgICAg
WHRlbnNhCgpBaCwgcmlnaHQsIEkgb3Zlcmxvb2tlZCB0aGF0IGluIHRoZSBsaXN0LgoKV2hhdCBn
b3QgbWUgY29uZnVzZWQgd2FzIHRoYXQgeW91IHNwZWNpYWxseSBtZW50aW9uIG9yMWssIGJ1dCBu
b3QKeDg2XzY0LCB3aGljaCB3YXMgYWxzbyB3cm9uZywgYnV0IHdlIGRvIG5vdCBzZWVtIHRvIGhh
dmUgYW55IGJ1aWxkCmZhaWx1cmUgYXNzb2NpYXRlZCB3aXRoIHRoYXQsIGRvIHdlPwoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
