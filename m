Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3BDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:10:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A052C61391
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A052C61391
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A83061B79;
	Mon,  4 Oct 2021 15:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeR_5iJtbhZj; Mon,  4 Oct 2021 15:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CDA260BDB;
	Mon,  4 Oct 2021 15:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFE421BF32A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCF3340871
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VaRV3yaIZOS for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:10:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B18594087B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:10:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 92FBF13F86E;
 Mon,  4 Oct 2021 17:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633360232;
 bh=ocgyEtJ4m2iZHfGPS1nps7TiSeYQoW+ll9vqv+cCWTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gC3WoiSo6WyzWDMgAxj0e3aWXFtgeGBILFjj70FDCyHtVjQIrOTMEABAweDqIGKSF
 upDjyZBRI48Pdpu0FqZG00afVcwC6f/Ee9o5kotzR31FH9jJT9NCC5QzLlEutDNCdz
 5mLZGcp9giZk2BOH6VDHRRbo/2WnbGF/mS4wUqzO1htCUnDJLP+DynkQhNG3TwjAa2
 BUDFdCC73ntpY7Q+pokAntffupddGe6l9GO7oQXLlNrOzRxvHsVaj/xyWYYvPCwPtP
 0sPZxZbU05i1oQeFnuDRAhKNKFREtnR6Z/FBBbiqPCFRdhJlCezQkXD9qKmJgS5l8P
 SUBn33t5GaXDw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 17:10:21 +0200
Date: Mon, 4 Oct 2021 17:10:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211004151021.GC1504958@scaer>
References: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
 <20211004090036.65722dda@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004090036.65722dda@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] system: add optional rsync with preserved
 permissions
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBKb3PDqSwgQWxsLAoKT24gMjAyMS0xMC0wNCAwOTowMCArMDIwMCwgVGhvbWFzIFBl
dGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4gT24gTW9uLCAgNCBPY3QgMjAyMSAwOTo0MTo0MyArMDMw
MAo+IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToK
PiAKPiA+ICtjb25maWcgQlIyX1JPT1RGU19PVkVSTEFZX1BSRVNFUlZFRF9QRVJNSVNTSU9OCj4g
PiArCXN0cmluZyAiUHJlc2VydmUgcGVybWlzc2lvbnMgb2Ygb3ZlcmxheSBkaXJlY3RvcmllcyIK
PiA+ICsJZGVwZW5kcyBvbiBCUjJfUk9PVEZTX09WRVJMQVkKPiA+ICsJZGVmYXVsdCAibiIKPiA+
ICsJaGVscAo+ID4gKwkgIFByZXNlcnZlIGZpbGUgcGVybWlzc2lvbnMgb2Ygc3BlY2lmaWVkIG92
ZXJsYXkuCj4gCj4gSSdtIGFmcmFpZCB3ZSBwcm9iYWJseSB3b24ndCB3YW50IGFuIG9wdGlvbiBs
aWtlIHRoaXMuCgpBZ3JlZWQsIHdlIGFscmVhZHkgaGF2ZSB0d28gbWVjaGFuaXNtcyBmb3IgdGhh
dCwgc2VlIGJlbG93LgoKPiBUaGUgcXVlc3Rpb24gaXMgd2h5IGluIHRoZSBleGlzdGluZyBTWVNU
RU1fUlNZTkMgd2UgZG9uJ3QgcHJlc2VydmUKPiBwZXJtaXNzaW9ucz8gSSBjYW4gaW1hZ2luZSBi
ZWNhdXNlIHNvbWV0aW1lcyB0aGV5IGNhbiBiZSB3cm9uZyBpbiB0aGUKPiBvcmlnaW5hbCBvdmVy
bGF5LCBmb3IgZXhhbXBsZSB3aXRoIHZlcnNpb24gY29udHJvbCBzeXN0ZW1zIHRoYXQgcHV0IGFs
bAo+IGZpbGVzIHJlYWQtb25seS4KPiAKPiBZYW5uLCBBcm5vdXQ6IGRvIHlvdSByZW1lbWJlciB3
aHkgU1lTVEVNX1JTWU5DIGhhcyAtLWNobW9kPXU9cndYLGdvPXJYID8KClRoZSByZWFzb24gaXMg
dGhhdCBpbmRlZWQsIHdlIGhhdmUgbm8gd2F5IHRvIHZhbGlkYXRlIHRoZSBhY2Nlc3MgbW9kZXMK
YW5kIG93bmVyc2hpcCBmb3IgdGhvc2UgZmlsZXMuIEFzIHRoZSBidWlsZCB3aWxsIChtb3N0IHBy
b2JhYmx5KSBiZSBtYWRlCmFzIGEgbm9uLXJvb3QgdXNlciwgdGhlcmUgaXMgbm8gd2F5IHdlIGNh
biBzZXQgYXJiaXRyYXJ5IG1vZGVzIG9yIG93bmVycwp0byB0aG9zZSBmaWxlcyB3aGVuIHdlIGNv
cHkgdGhlbSwgZXZlbiBpZiB0aGUgc291cmNlIHRyZWUgaGFkIHByb3Blcgpvd2VucnNoaXAgYW5k
IG1vZGVzIGV0Yy4uLgoKU28gd2UgY2FuIG9ubHkgZW5mb3JjZSBhIGtub3duIG1vZGUsIHRoYXQg
aXMgcmVwcm9kdWNpYmxlLCBhbmQgbGV0IHRoZQp1c2VyIHByb3ZpZGUgYSBwZXJtaXNzaW9uIHRh
YmxlIChvciBldmVuIGEgZmFrZXJvb3Qtc2NyaXB0LCBhbHRob3VnaCBJCndvdWxkIHBlcnNvbmFs
bHkgaGlnaGx5IGZhdm91ciBhIHBlcm1pc3Npb24gdGFibGUsIHdoaWNoIGNvdWxkIGJlCmdlbmVy
YXRlZCBpbiBhIHBvc3QtYnVpbGQgc2NyaXB0IGlmIG5lZWRlZCkuCgpUaGlzIGFwcGxpZXMgdG8g
ZmlsZSBvd25lcnNoaXAgYW5kIG1vZGVzICh0aGluayBzZXQtdWlkIHJvb3QpLCBidXQgYWxzbwp0
byBleHRlbmRlZCBhdHRyaWJ1dGVzICh0aGluayBTRUxpbnV4IHNlY3VyaXR5IGNvbnRleHQgc2V0
IGFzIGV4dGVuZGVkCmF0dHJpYnV0ZXMpLiBBbGwgb2YgdGhhdCBjYW4gYmUgc2V0IHdpdGggYSBw
ZXJtaXNzaW9uIHRhYmxlLgoKPiBKb3PDqTogaGF2ZSB5b3UgY29uc2lkZXJlZCB1c2luZyBhIHBl
cm1pc3Npb24gdGFibGUgdG8gZml4dXAgdGhlCj4gcGVybWlzc2lvbnMgPwoKVGhpcyBpcyAqdGhl
KiBtZWNoYW5pc20gdG8gdXNlIHRvIHNldCBhcmJpdHJhcnkgb3duZXJzaGlwLCBtb2RlcywgYW5k
CmV4dGVuZGVkIGF0dHJpYnV0ZXMgdG8gYXJiaXRyYXJ5IGZpbGVzLgoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
