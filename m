Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B35C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 190A140924;
	Sun, 16 Oct 2022 15:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 190A140924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xAZUeU3Zf-vv; Sun, 16 Oct 2022 15:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18EF7405C7;
	Sun, 16 Oct 2022 15:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18EF7405C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6C191BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1480813B1
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1480813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VrUDGKvQ6_l7 for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:44:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 902CC813AF
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 902CC813AF
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:44:31 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id n7so8790738plp.1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 08:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6C9+XEML+AtyeUgm3vLvdHGvp43kXhjfOvHI5/IH1c=;
 b=Sc+e6STMp0OIPDh/lsSIqp/Y34T1+QUxrEiphS+CPX9O9SFOgBz01I8Y9ys3C1vEDP
 ueoFFjyiXqqm4rKUVwi3/Yzoi2nWwvrYDcncS6iqlvsBrVaj7/BQtB2OxrEvLnrSIQcP
 +cF31N0Ww5KKR/89ezZW4vmFuJwqITiBISkSJnniv3lJ2Sua9S9HTB0Cv5GqBivUiyql
 A7webxoE1EqELtPudZF6Smx2sYlU+bfDw3ZvUIj8bNud2x3heoGHN54GaKwT0t8WLg8Y
 7EONc0rce1gd4wr63kms3JZ1QNy3GQ/NrQKJB2qLEtuZqUbtnfrVeS4gA4rVGnrvE8Uj
 Y8Qg==
X-Gm-Message-State: ACrzQf0DLcF78PKZKQiew9ZvfqRtTlMOdeYbvczHzOiNoaXDC1Xqqw+t
 nsJqYPWZB3JKKTqg5RUk4dzEjfDdjJtF6cGuUN68y2s8+EA=
X-Google-Smtp-Source: AMsMyM7/GkdOC4nL/96bxv1xD5yc0yCW3Y4vXx3ECopXBtndKMoEGmMpsnsloWsy0scrwbqVCyQ/6swELWeBkWAArvo=
X-Received: by 2002:a17:90b:3b82:b0:20b:516:5ff5 with SMTP id
 pc2-20020a17090b3b8200b0020b05165ff5mr8587111pjb.92.1665935070898; Sun, 16
 Oct 2022 08:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
 <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
 <20221016075056.GI2503@scaer>
In-Reply-To: <20221016075056.GI2503@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Oct 2022 11:44:19 -0400
Message-ID: <CADvTj4rBi3uu2bXJy=Tp76NV6Yjk7--EtDOm0kmxi47XOVsQ=Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6C9+XEML+AtyeUgm3vLvdHGvp43kXhjfOvHI5/IH1c=;
 b=RQCN0stuXQwfwGBDzSeGuC5j+NnMHydf5/2wZkoxZPGCUhJEkZnD0UBAka4uHMSvEM
 uk88PZPnngrk9Z7jAlvLFDm8ugGVuyMKD+ZEvugYeFjSpCo8p7IihZMNkN6XKpO8IqnV
 nY+8X45YHM5z96TBX/RA2lz0bJ9HFQLeSUxJ0cp1KMaJ3WNWNUNvQGGon/YL1AR1CQZ0
 becOZt9fpP4sXrOaSPUFpuWVea8i0E/sVeUzLCUfheJ826R4Cq9JboPcYEV2pdXJ3P0n
 HtMQVTyzkkEZVXvF3jHTLmtVvzeUn+klDMw9vu0Osg6R/A5Zy1yxr5HRKSJQT51JqcaH
 l0Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RQCN0stu
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBPY3QgMTYsIDIwMjIgYXQgMzo1MSBBTSBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBKYW1lcywgQWxsLAo+Cj4gT24gMjAyMi0xMC0xNSAx
OToyMSAtMDQwMCwgSmFtZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4gT24gU2F0LCBPY3Qg
MTUsIDIwMjIgYXQgNjoxNCBQTSBGYWJyaWNlIEZvbnRhaW5lCj4gPiA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBMZSBzYW0uIDE1IG9jdC4gMjAyMiDDoCAwMjo1OCwg
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+
ID4+IFRoZSBiZWFyc3NsIHBhY2thZ2UgaXMgbm90IGNvbXBhdGlibGUgd2l0aCBwYXJhbGxlbCBi
dWlsZHMuCj4gPiA+IGJlYXJzc2wgd2FzIGJ1aWxkaW5nIHBlcmZlY3RseSBmaW5lIHVwIHVudGls
IG5vdyBhbmQgaXQgc2VlbXMgdGhlcmUKPiA+ID4gYXJlIGEgbG90IG9mIHBhY2thZ2VzIHRoYXQg
YXJlIGFmZmVjdGVkIGJ5IHBhcmFsbGVsIGJ1aWxkIGlzc3Vlcwo+ID4gPiAoZS5nLiBkbXJhaWQs
IG11c2VwYWNrLCBzbGFuZywgZXRjKS4KPiA+Cj4gPiBTb21lIHBhcmFsbGVsIGJ1aWxkIGJ1Z3Mg
ZG9uJ3QgcmVwcm9kdWNlIHJlbGlhYmx5IGR1ZSB0byB0aW1pbmcsIEkgbWFkZSBhIGNoYW5nZQo+
ID4gdG8gbXkgYXV0b2J1aWxkZXJzIHdoaWNoIG1hc3NpdmVseSBpbmNyZWFzZXMgdGhlIGNoYW5j
ZSBvZiB0cmlnZ2VyaW5nCj4gPiBidWlsZCBmYWlsdXJlcwo+ID4gaW4gcGFja2FnZXMgd2hpY2gg
aGF2ZSBkZXBlbmRlbmN5IGdyYXBoIGJ1Z3MuIFRoaXMgdHJpZ2dlcnMgYnVpbGQgYnVpbGQgZmFp
bHVyZXMKPiA+IGluIC1qMSBidWlsZHMgd2hpY2ggd291bGQgb3RoZXJ3aXNlIG9ubHkgYXBwZWFy
IHdoZW4gcnVubmluZyBwYXJhbGxlbCBidWlsZHMobXkKPiA+IGF1dG9idWlsZGVycyBhcmUgZ2Vu
ZXJhbGx5IHJ1bm5pbmcgd2l0aCAtajEgdG8gbWFrZSB0aGUgbG9ncyBtb3JlIHJlYWRhYmxlKS4K
PiA+Cj4gPiA+IERpZCB3ZSBjaGFuZ2Ugc29tZXRoaW5nIHJlY2VudGx5IG9uIHRoZSBhdXRvYnVp
bGRlcnM/Cj4gPgo+ID4gWWVzLCBhbGwgbXkgYXV0b2J1aWxkZXJzIHdlcmUgcmVjZW50bHkgY2hh
bmdlZCB0byB1c2UgbWFrZSBtYXN0ZXIod2lsbCBiZQo+ID4gbWFrZSB2ZXJzaW9uIDQuNCBvbmNl
IHJlbGVhc2VkKSB3aXRoIHRvcCBsZXZlbCAtLXNodWZmbGU9cmFuZG9tLgo+Cj4gQnkgZGlzYWJs
aW5nIHBhcmFsbGVsIGJ1aWxkIGJlY2F1c2UgeW91IGFyZSB1c2luZyBhbmEgYXMgeWV0IHVucmVs
ZWFzZWQKPiB2ZXJzaW9uLCB3ZSByZW1vdmUgdGhlIHBhcmFsbGVsIGJ1aWxkIGZvciBldmVyeW9u
ZSwgd2hpY2ggaXMgbm90IHZlcnkKPiBuaWNlIGF0IGFsbC4KCkZhaWx1cmVzIHdpdGggc2h1ZmZs
ZSBtb2RlIGluZGljYXRlIHRoYXQgdGhlIHBhY2thZ2UgaXMgbm90IHBhcmFsbGVsIGNvbXBhdGli
bGUKb24gZXhpc3RpbmcgbWFrZSByZWxlYXNlcyBhcyB3ZWxsLCBpdCBqdXN0IG1ha2VzIHRob3Nl
IGJ1Z3MgbW9yZSB2aXNpYmxlLgoKSSdtIHJ1bm5pbmcgc2h1ZmZsZSB3aXRoIC1qMSBiZWNhdXNl
IHRoYXQgd2F5IGl0J3Mgb2J2aW91cyBpbiB0aGUgbG9ncyB3aGVyZSB0aGUKZmFpbHVyZSBpcyBn
ZXR0aW5nIGhpdCwgb3RoZXJ3aXNlIHRoZXNlIGJ1Z3MgdGVuZCB0byBiZSB0cmFuc2llbnQgYW5k
CmRpZmZpY3VsdCB0bwp0cmFjZSBhcyB0aGV5IG90aGVyd2lzZSBhcmUgdGltaW5nIGRlcGVuZGVu
dC4KCj4KPiBJbnN0ZWFkLCB3ZSBzaG91bGQgcmVhbGx5IHRyeSBhbmQgZml4IHRoZSBwYWNrYWdl
cyByYXRoZXIgdGhhbiBwYXBlcmluZwo+IG92ZXIgdGhlIGlzc3VlLgo+Cj4gTm90ZXM6Cj4gICAt
IGl0ICppcyogaW50ZXJlc3RpbmcgdG8gZmluZCB0aG9zZSBidWdzOwo+ICAgLSBpdCBpcyBzYWQg
dGhhdCB0aGUgZGVmYXVsdCBtb2RlIGZvciAtLXNodWZmbGUgd2lsbCBiZSByYW5kb20sIG5vdAo+
ICAgICBub25lLgoKRGVmYXVsdCBpcyBlcXVpdmFsZW50IHRvIG5vbmUsIEkgbW9kaWZpZWQgbXkg
YXV0b2J1aWxkZXIgcnVubmVyIHRvIHBhc3MKLS1zaHVmZmxlPXJhbmRvbS4KCj4KPiBSZWdhcmRz
LAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IERldGFpbHM6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20v
bWlycm9yL21ha2UvYmxvYi8zZTIwZTM3NmI3YWEyNmZhNDNmODFmMjMzMjNjNzE3YzRjYWUxYmZi
L05FV1MjTDEyMy1MMTI4Cj4gPiBodHRwczovL3Ryb2ZpLmdpdGh1Yi5pby9wb3N0cy8yMzgtbmV3
LW1ha2Utc2h1ZmZsZS1tb2RlLmh0bWwKPiA+IGh0dHA6Ly90cm9maS5naXRodWIuaW8vcG9zdHMv
MjQ5LWFuLXVwZGF0ZS1vbi1tYWtlLXNodWZmbGUuaHRtbAo+ID4KPiA+IE5vdGUgdGhhdCBNQUtF
MSBpcyBjdXJyZW50bHkgYnJva2VuIGl0c2VsZiB3aXRob3V0IHRoaXMgd2hlbiB1c2luZyBzaHVm
ZmxlIG1vZGU6Cj4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjIxMDE1MDA1NjExLjQwNTQ5MzMtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tLwo+ID4KPiA+ID4KPiA+ID4+Cj4gPiA+Pgo+ID4gPj4gRml4ZXM6Cj4gPiA+PiAgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy81ZTEvNWUxYjcyZGIyMDZiMmQxN2Zh
NWNlMzc4YTcwZmRjMmYzZjViZjc3Mwo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gPj4gLS0tCj4gPiA+PiAg
cGFja2FnZS9iZWFyc3NsL2JlYXJzc2wubWsgfCAyICstCj4gPiA+PiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvYmVhcnNzbC9iZWFyc3NsLm1rIGIvcGFja2FnZS9iZWFyc3NsL2JlYXJzc2wubWsK
PiA+ID4+IGluZGV4IGZmNWY0ZTg3YjcuLmMyYTU3NjBhZjUgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9w
YWNrYWdlL2JlYXJzc2wvYmVhcnNzbC5tawo+ID4gPj4gKysrIGIvcGFja2FnZS9iZWFyc3NsL2Jl
YXJzc2wubWsKPiA+ID4+IEBAIC0yNCw3ICsyNCw3IEBAIEJFQVJTU0xfVEFSR0VUUyArPSBsaWIK
PiA+ID4+ICBlbmRpZgo+ID4gPj4KPiA+ID4+ICBkZWZpbmUgQkVBUlNTTF9CVUlMRF9DTURTCj4g
PiA+PiAtICAgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoQkVBUlNTTF9NQUtFX09Q
VFMpIC1DICQoQEQpIFwKPiA+ID4+ICsgICAgICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRTEp
ICQoQkVBUlNTTF9NQUtFX09QVFMpIC1DICQoQEQpIFwKPiA+ID4+ICAgICAgICAgICAgICAgICAk
KEJFQVJTU0xfVEFSR0VUUykKPiA+ID4+ICBlbmRlZgo+ID4gPj4KPiA+ID4+IC0tCj4gPiA+PiAy
LjM0LjEKPiA+ID4+Cj4gPiA+IEJlc3QgUmVnYXJkcywKPiA+ID4KPiA+ID4gRmFicmljZQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4g
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
