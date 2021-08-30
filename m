Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEA7C4320A
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 08:45:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4419E61008
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 08:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4419E61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0010D40206;
	Mon, 30 Aug 2021 08:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7Yw0Bj9uR7F; Mon, 30 Aug 2021 08:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1CDD40238;
	Mon, 30 Aug 2021 08:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B93D41BF28D
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 08:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4DA180DD1
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 08:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYEzzRCv8FCF for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 08:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE5E480CD1
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:45:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 67BD05FF9E;
 Mon, 30 Aug 2021 10:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630313129;
 bh=SxHocUASjDSN8vcWSInwgW12J4bkiTTteKS2/GPR93I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JHQx1qelvVGBasw1opp1VvtCT9Gk2op53ymHV00xyRve8I5w8i97Zv7+EsminQ/nu
 uwE16ru5xbe8Ddr68kptasfkkjWAU8PcVm53Ij7hGoIDQHPxpFjUJTpmJG1LX2vMns
 jRTVX2b1p/ALf1xJr3WG4HiQoeydAp9hmtvStKEckxe9nSZ3LUaJAyDKBQieqNrDIP
 nV5MA3gWR6JpYpNOfaJBhsgL+Tmlhjtw8dKsZLRF8OBS+uJLM1Ze2GtC2e/99WrGvC
 j8ugWv/CPw8z6sskJ8478As31Q7yMm4YKBSHM3fvgdQ3fwB3+k8BYMbNkUbewbP/Q8
 XRp6oWODn6reQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 Aug 2021 10:45:14 +0200
Date: Mon, 30 Aug 2021 10:45:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jonah Petri <jonah@petri.us>
Message-ID: <20210830084514.GI1053080@scaer>
References: <20210826193424.1650108-1-jonah@petri.us>
 <4bdc9d7d-b4ce-4834-c7ef-eff9865f82fb@mind.be>
 <8ec58237-a9ee-5d95-bf88-305cb5533139@petri.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ec58237-a9ee-5d95-bf88-305cb5533139@petri.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sm9uYWgsIEFsbCwKCk9uIDIwMjEtMDgtMjkgMjA6MjUgLTA0MDAsIEpvbmFoIFBldHJpIHNwYWtl
IHRodXNseToKPiBPbiA4LzI5LzIxIDE6MjEgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
Ogo+ID5PbiAyNi8wOC8yMDIxIDIxOjM0LCBKb25haCBQZXRyaSB3cm90ZToKPiA+PiAgCWZpIDsg
XAo+ID4+LQlpZiBbICEgLWUgJChTVEFHSU5HX0RJUikvbGliL2xkKi5zby4qIF07IHRoZW4gXAo+
ID4+LQkJaWYgWyAtZSAkJHtBUkNIX1NZU1JPT1RfRElSfS9saWIvbGQqLnNvLiogXTsgdGhlbiBc
Cj4gPj4tCQkJY3AgLWEgJCR7QVJDSF9TWVNST09UX0RJUn0vbGliL2xkKi5zby4qICQoU1RBR0lO
R19ESVIpL2xpYi8gOyBcCj4gPj4tCQlmaSA7IFwKPiA+PisJaWYgW1sgISAkJChmaW5kICQoU1RB
R0lOR19ESVIpL2xpYiAtbmFtZSAnbGQqLnNvLionIC1wcmludCAtcXVpdCkgXV07IHRoZW4gXAo+
ID4gIEkgd2FzIGdvaW5nIHRvIHNheTogZG9uJ3QgdXNlIFtbLCBpdCdzIGEgYmFzaGlzbS4gSG93
ZXZlciwgd2UgYWxyZWFkeSB1c2UgaXQgaW4KPiA+aGVscGVycy5taywgc28gSSBndWVzcyBpdCdz
IE9LLiBJdCdzIHVwIHRvIHdob2V2ZXIgaGFzIGEgcHJvYmxlbSB3aXRoIGl0IHRvIGdldAo+ID5y
aWQgb2YgaXQgOi0pCgpIZSEgRG9uJ3Qgc2F5IHN1Y2ggdGhpbmdzIHdoZW4gSSdtIGFyb3VuZCEg
Oy0pCgo+ID4gIFRoZXJlZm9yZSwgYXBwbGllZCB0byBuZXh0LCB0aGFua3MuCj4gCj4gVGhhbmtz
ISBJIGZvdW5kIGl0IHN1cnByaXNpbmdseSBoYXJkIHRvIGZpbmQgYSBwbGVhc2luZyBzaGVsbCBh
bnN3ZXIgdG8KPiAiZG9lcyB0aGlzIGNvbW1hbmQgc3VjY2VlZCAqYW5kKiBvdXRwdXQgYW55dGhp
bmcgdG8gc3Rkb3V0PyIgd2l0aG91dAo+IGludm9raW5nIGJhc2hpc21zLgoKVGhpcyBpcyBhIGJp
dCBsZXNzIGNvbmNpc2UgKHR3byBsaW5lcyBpbnN0ZWFkIG9mIG9uZSksIGJ1dCBpdCdzIHN0aWxs
CnByZXR0eSBlYXN5LCBlLmcuIHdpdGggYSBzY3JpcHQgdGhhdCBkb2VzIG5vdCB1c2UgJ3NldCAt
ZSc6CgogICAgb3V0cHV0PSIkKCBzb21lLWNvbW1hbmQgKSIKICAgIGlmIFsgJHs/fSAtbmUgMCAt
byAteiAiJHtvdXRwdXR9IiBdOyB0aGVuCiAgICAgICAgZWNobyAiRmFpbGVkIG9yIG91dHB1dCBu
b3RoaW5nIgogICAgZmkKCklmIHRoZSBzY3JpcHQgaXMgdXNpbmcgJ3NldCAtZScsIG9yIG9uZSBu
ZWVkcyB0byBkaWZmZXJlbnRpYXRlIHRoZQpyZWFzb24gZm9yIGZhaWx1cmUsIHRoZW4gaXQgaXMg
YSBiaXQgbW9yZSBpbnZvbHZlZCwgYnV0IHN0aWxsIHByZXR0eQplYXN5IGFuZCBjb21tb246Cgog
ICAgb3V0cHV0PSIkKCBzb21lLWNvbW1hbmQgKSIgfHwgcmV0PSIkez99IgogICAgaWYgWyAke3Jl
dDotMH0gLW5lIDAgLW8gLXogIiR7b3V0cHV0fSIgXTsgdGhlbgogICAgICAgIGVjaG8gIkV4aXRl
ZCB3aXRoICR7cmV0Oi0wfSwgb3Igb3V0cHV0IG5vdGhpbmciCiAgICBmaQoKSW4gb3VyIGNhc2Us
IGZvciBCdWlsZHJvb3QsIHdlJ2QgbmVlZCB0byBhZGFwdCB0aGUgZmlyc3Qgc29sdXRpb246Cgog
ICAgWy4uLl0gOyBcCiAgICBvdXRwdXQ9IiQkKCBzb21lLWNvbW1hbmQgKSI7IFwKICAgIGlmIFsg
JCR7P30gLW5lIDAgLW8gLXogIiQke291dHB1dH0iIF07IHRoZW4gXAogICAgICAgIGVjaG8gIkZh
aWxlZCBvciBvdXRwdXQgbm90aGluZyI7IFwKICAgIGZpOyBcCiAgICBbLi4uXQoKPiBJIHRvbyB3
YXMgd2FyeSBvZiB1c2luZyBbWyBiZWZvcmUgSSBzYXcgdGhlIHNhbWUgdXNhZ2UKPiBsb3dlciBp
biB0aGUgZmlsZSwKCllvdSBjYXVnaHQgbWUgcmVkLWhhbmRlZC4uLiBJIGFkZGVkIHRoYXQgYmFj
ayBpbiA0YTVmODc4OTQ2YzM3Li4uIDstXQoKPiBhbmQgbm90ZWQgdGhhdCBiYXNoIGlzIGEgcHJl
cmVxdWlzaXRlIGZvciBidWlsZHJvb3QgaW4KPiBnZW5lcmFsLgoKQW5kIGV2ZW4gdGhlbiwgSSBs
aWtlIHRoYXQgd2UgYXZvaWQgYmFzaGlzbXMgd2hlbiBwb3NzaWJsZS4gQnV0IGluIHRoaXMKY2Fz
ZSwgd2VsbCwgaXQncyBhY2NlcHRhYmxlIGFuZCBhcHBsaWVkLCBzbyBJIHdvbid0IHdoaW5lICht
dWNoKS4gOy0pCgo+IEhvcGVmdWxseSBzb21lIGZ1dHVyZSBkZXYgd29uJ3QgY3Vyc2UgbWUgdG9v
IG11Y2gg4pi6IFRoYW5rcyBmb3IKPiBhcHBseWluZyEKCldlbGwsIFRJTCB0aGF0IG9uZSBjYW4g
ZG8gW1sgISAkKGNtZCkgXV0gdG8gdGVzdCBvdXRwdXQgYW5kIHJldHVybiBjb2RlCmluIG9uZSBs
aW5lLCBzby4uLiBUaGFua3MhIDotKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94
Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
