Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7026C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 572416139E
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 572416139E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8784057C;
	Mon,  4 Oct 2021 15:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJn1Q112M178; Mon,  4 Oct 2021 15:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A98A4053B;
	Mon,  4 Oct 2021 15:23:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7B51BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A99684A59
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwPbVLisiwqb for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:23:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25A1C84785
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:23:26 +0000 (UTC)
Received: from smtpclient.apple ([151.34.26.130])
 by Aruba Outgoing Smtp  with ESMTPA
 id XPoKmhZ4tKBZzXPoKmZ0Ua; Mon, 04 Oct 2021 17:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633361005; bh=lYijyjURc2LKc6sqtxZ5CZNnEoL0f9kpGaGbf8Qi3WI=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bbbbP+EarvKWaT8k6tKNflb7f1XYc/DUC5iSnvMtFDW5L/Kqnyk2VBplSu4HMZa/f
 HEPQOyDxGwKlCx8qfiXkuG93NcJtiaLE5OmHtu/HQRFwYYbGBG0Y2jiJpbYlV3SSw6
 y2LFZC6V9tYUTB2OEAL6Nkd/mbiBF70Nvox42CWbZl0OoUvsjEpwo4xUQFniXCgyDt
 mFbRP1MV3W01ma2bpvvcfwfKZ8oA1vD99ZZluFOzEgN3ABQ6lN8rr+NUo42wyhGMSN
 vsVo927/eGunI345ckukAg7CDWZ+0ysut6WpxRqNFVMI7DzPYuMVQrZb5FseEbrkp3
 Bhm0rANd5OpKQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 4 Oct 2021 17:23:23 +0200
Message-Id: <1462D59B-55E2-4933-AD39-7EF25B2FBE9E@benettiengineering.com>
References: <20211004150113.GB1504958@scaer>
In-Reply-To: <20211004150113.GB1504958@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfNK/o67eqk4iqsrcbrJiv8sBwh0BJAMooC+TrkB/+UXWZDnEdeb+5VaP9AXsoIfSpPfGHT+1M5LqhmeNH0hHoOllR8HrbednUV3IAlsCE/W4/SqZ7r1c
 fAKS+miOyUrPL4hQOpDVn2P79FoRsS0RgKSHaUbpAdcz9R/sJL8t4SyGfe2zp2p2/YFV2pfFN9/XJeRDHG+HUVMAEut5DiNI94fY+iDe7/joQsx8aEwxGz81
 jurYhcJy4owUMsGAK0G6eDM6m2HHXgfUYIixxDbLblLU7T5lL/tEkSxDwXPze9X4PxQcl9bmeDagStWm8UmXk4HvTmoGqy1++y3tUsc9EWs=
Subject: Re: [Buildroot] [PATCH v2] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsIFlhbm4sIEFsbCwKCj4gSWwgZ2lvcm5vIDQgb3R0IDIwMjEsIGFsbGUgb3JlIDE3
OjAxLCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gaGEgc2NyaXR0bzoK
PiAKPiDvu79QZXRlciwgR2l1bGlvLCBBbGwsCj4gCj4gT24gMjAyMS0xMC0wNCAxMzo0NiArMDIw
MCwgUGV0ZXIgS29yc2dhYXJkIHNwYWtlIHRodXNseToKPj4+Pj4+PiAiR2l1bGlvIiA9PSBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JpdGVz
Ogo+PiAKPj4+IFRvIGJ1aWxkIG1lc2EzZCBmb3IgbTY4ayB3ZSBuZWVkIHRvIHBhc3MgLW1sb25n
LWp1bXAtdGFibGUtb2Zmc2V0cyBDRkxBRwo+Pj4gc2luY2UgJ3N3aXRjaCcgYmxvY2tzIGFyZSBw
cmV0dHkgd2lkZSBhbmQgbGVhZCB0byBidWlsZCBmYWlsdXJlLiBUaGlzIHdheQo+Pj4gJ3N3aXRj
aCcgYmxvY2tzIHdpbGwgaGF2ZSBhIDMyLWJpdCBhZGRyZXNzaW5nIGJ5IGRlZmF1bHQgaW5zdGVh
ZCBvZiB0aGUKPj4+IHN0YW5kYXJkIDE2LWJpdC4gVGhpcyBjYW4gYmUgZG9uZSBvbmx5IHdpdGgg
bTY4ayBnY2MgdmVyc2lvbiA+PSA3LngKPj4+IGJlY2F1c2UgZ2NjIGZsYWcgdXNlZCB0byBmaXgg
dGhpcygtbWxvbmctanVtcC10YWJsZS1vZmZzZXRzKSBpcwo+Pj4gYXZhaWxhYmxlIG9ubHkgZnJv
bSB0aGF0IHZlcnNpb24gb24uCj4+IAo+Pj4gRml4ZXM6Cj4+PiBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy82MGM0NjUzYzJhOTMxMjVlZGJkZDBiZWI0M2NkNDczMDE2NDM0
NjRhLwo+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gLS0tCj4+PiBWMS0+IFYyOgo+Pj4gKiBhZGQg
Z2NjID49IDcueCBkZXBlbmRlbmN5IHRvIENvbmZpZy5pbiBhcyBzdWdnZXN0ZWQgYnkgWWFubiBN
b3Jpbgo+Pj4gKiBpbXByb3ZlIGNvbW1pdCBsb2cgYWNjb3JkaW5nIHRvIENvbmZpZy5pbiBjaGFu
Z2UKPj4gCj4+IC4uCj4+IAo+Pj4gKyMgbTY4ayBuZWVkcyAzMi1iaXQgb2Zmc2V0cyBpbiBzd2l0
Y2ggdGFibGVzIHRvIGJ1aWxkCj4+PiAraWZlcSAoJChCUjJfbTY4aykseSkKPj4+ICtNRVNBM0Rf
Q0ZMQUdTICs9IC1tbG9uZy1qdW1wLXRhYmxlLW9mZnNldHMKPj4+ICtlbmRpZgo+Pj4gKwo+Pj4g
K01FU0EzRF9DT05GX09QVFMgKz0gLURDTUFLRV9DX0ZMQUdTPSIkKE1FU0EzRF9DRkxBR1MpIgo+
Pj4gKwo+Pj4gJChldmFsICQobWVzb24tcGFja2FnZSkpCj4+IAo+PiBEb2VzIHRoYXQgcmVhbGx5
IHdvcms/IG1lc2EzZCBpcyB1c2luZyBtZXNvbiwgbm90IGNtYWtlLgo+IAo+IEFwcGFyZW50bHks
IG5vOgo+ICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzI2YS8yNmE5
N2UwODBjNDljNDJjMDZlZDU5ZWM2YTlkNTFkODFiMGFiODgyL2J1aWxkLWVuZC5sb2cKClN0cmFu
Z2UsIEnigJltIGdvaW5nIHRvIGZpeCBpdCB0b25pZ2h0LiBJIGRvbuKAmXQga25vdyBob3cgaXQg
Y291bGQgYmUsIGJlY2F1c2UgSeKAmW0gc3VyZSB0aGUgc29sdXRpb24gd29ya3MuIFNvcnJ5CgpH
aXVsaW8KCj4gCj4gRGFtbiwgbm90IHN1cmUgaG93IEkgbGV0IHRoaXMgc3BsaXQgdGhyb3VnaC4u
LiA6LS8KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4gLS0gCj4gLi0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
