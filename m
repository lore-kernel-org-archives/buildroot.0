Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD8EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:05:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEEF561AE4
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 18:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEEF561AE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F9083BDF;
	Thu, 21 Oct 2021 18:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_js_K3TuthJ; Thu, 21 Oct 2021 18:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F59683BE6;
	Thu, 21 Oct 2021 18:05:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBD3B1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB06D83BE6
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 18:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIOchGZYuRAy for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 18:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 313EA83BDF
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634839520;
 bh=LobAnKhDdLisn3u3dX5OEZnDoroaXo1w/4/5B76V3m4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=cIjiV8NPsfZdBa+IqNnb1NLI6so0vItmJYJIn+4EZFMc8/DqcDJMyAfy4qINB90Di
 6aupSLMxP10JCSV5ggwIgkeinmW+A9GmQa/B8uW5kE8xg6uM1FHFFGhHKhtJh/Q+8R
 SDqyB0qPbNwUy26BaU7EpivzUwdJH5Qx55+W3VI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.165]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1md5140Xq2-008GHR; Thu, 21
 Oct 2021 20:05:20 +0200
Date: Thu, 21 Oct 2021 20:05:18 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211021200518.147305ab@gmx.net>
In-Reply-To: <CAPi7W81Hg1EoxXJ7-LqqSJXGXmuD9kiRX-sNk_6xV3Km4q0NAw@mail.gmail.com>
References: <20211020190423.3547893-1-fontaine.fabrice@gmail.com>
 <163480816021.2663858.13418966210945898355@Monstersaurus>
 <CAPi7W83vxd8_KX=UCxVNZoKYxODXnKkTxUmu3saKJYStK9JLdw@mail.gmail.com>
 <163483383168.4018488.6875581227372699361@Monstersaurus>
 <CAPi7W81Hg1EoxXJ7-LqqSJXGXmuD9kiRX-sNk_6xV3Km4q0NAw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:u5Fhqq7JU1NX+ogSX1lyM1KVtJRMqu+kXpUQSuzB9ga7YchnLPl
 UMMZsfTy8ZhUDgBkfWuKe6N7LlN91j4VW3pZMJvehbBOCJhIdqrxVR5D56ScXTJuJVRVWpk
 Qb8kCPYIUaXad/0lkk6j2hiYIdkrsGTS6+O3N5IUt4ulGzJKlNdoqz8+DjR6s3JQtWRvV/K
 c4Yvl+wbm/r7/kQYTSGZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v1jbc76zAGY=:LSkzhwZNj0RPVqvJNonTy3
 4sL3bF/GXRHRYmW0fM79G/f/5yaBgGAS/XfFnCB5gFVAQMw3uqdcYbg+2R+SOm/Z5xJezYAt+
 +BsWWlLyxgtOqU7AIXKr5W9htYPxis0uxqNWl+PQn8niP8wbx2hfapMiR3rtMT4NUgJY4nj+0
 YBN4vsT7//1O5t2gbETGZYwcNz8I867bWia+mKcApqsuBAN4ZbTChQyyHseguq+WdnQmLzRUm
 EtlLjtDzzTtL+T0P9qEBcHaBAe0pfLm6P3cbE4bXXNbc/bLVlm8/1ywFIXeBHKC7rRivwKRZ1
 cOPLycWNVp2EbVAx9jvwe3GfpPSnofhPw8wC6r+tKF/oEAdCOyuGduQvkvoDwwwiu1wpoqjn1
 R5D00WE58/wyrTaPn//Y2bLL189n5+jAyaWaj7W7PmIfCPL/4CtW4IsCoEykL1Vs7f0RrIFRB
 OkYlq6gt8+zvqf5APrPaQy5RpIUF8I61klocmbyojo8VbHhvPiDda4jTfVc6mSbmWh/xFLV/L
 ZqiN1TA4x3PmacEiPIJMQeozrMc9WylKHZ/8QeTYV2iS7iCCLdq8I3FsNre7RF9WwVbqJ6fTp
 U12WlpX9P2Tam8dqjrrQhgIiCW13G1EJ4H9FGSs/ievkGZ3oU8IzFtjIhtsGV1eUQfdjg2ccj
 QIGu1ZUr3yNbczEf4s0YMl1AZ1ECR6Ot4s6GAQ7RFs7kWi8uaW2gbVh30QDwG55okAOLPo0KG
 lH6Mwkh+Wu9z2bMkZsI+ZOCun/W2VO+hPIAGZW3WGvdIAqUKPENsFdXOUSsn03FvpDspANAO1
 aDBTDC4VzHDY7YSG82BuebGeLllXAxywcokjvUlh/e9I13lHyH09HcIUoGXqLuWrEKzAVedBL
 Sh8AVlBcIiEN00YxYSkl4TOI9JS3WPR7+2/8UVpSOXcK4LaXDCRYHNAOEYLl6eHzFwOrJFYvW
 DorSNx3jlVpK4y9e/DMBpFhkjVmD0ebJFQduzxO9E4QzPbCkPp6j5g2bcenjhsg/ylwnNQAZS
 WTQ1aUCRJn/x2YLsX6b8Mg6ftdh55Qcrn4HwpvPhbe7PdF5m0uvweFQMqNK+4BQxddPw4U4oT
 QP0WzqJvSQbRws=
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: disable compliance
 tool
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk9uIFRodSwgMjEgT2N0IDIwMjEgMTk6MDU6MzggKzAyMDAsIEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gTGUgamV1
LiAyMSBvY3QuIDIwMjEgw6AgMTg6MzAsIEtpZXJhbiBCaW5naGFtCj4gPGtpZXJhbi5iaW5naGFt
QGlkZWFzb25ib2FyZC5jb20+IGEgw6ljcml0IDoKPiA+Cj4gPiBRdW90aW5nIEZhYnJpY2UgRm9u
dGFpbmUgKDIwMjEtMTAtMjEgMTc6MDU6NTEpICAKPiA+ID4gSGkgS2llcmFuLAo+ID4gPgo+ID4g
PiBMZSBqZXUuIDIxIG9jdC4gMjAyMSDDoCAxMToyMiwgS2llcmFuIEJpbmdoYW0KPiA+ID4gPGtp
ZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+IGEgw6ljcml0IDogIAo+ID4gPiA+Cj4gPiA+
ID4gSGkgRmFicmljZSwKPiA+ID4gPgo+ID4gPiA+IFF1b3RpbmcgRmFicmljZSBGb250YWluZSAo
MjAyMS0xMC0yMCAyMDowNDoyMykgIAo+ID4gPiA+ID4gRGlzYWJsZSBjb21wbGlhbmNlIHRvb2wg
dG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZQo+ID4gPiA+ID4gcmFpc2VkIHNpbmNl
IGNvbW1pdCBlMWQzN2FiMGE3YjJiODczNWU2OWMwNzA1MTk5NzhkMjg5OGQyZTc5IGFuZAo+ID4g
PiA+ID4gaHR0cHM6Ly9naXQubGludXh0di5vcmcvbGliY2FtZXJhLmdpdC9jb21taXQvP2lkPTAy
YmMxMTA4NTc4ZThiOGViNjhmYTdkOWFlM2VlZWE1NTg3MjM5MzE6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gL3Vzci9sZnMvaGRkX3YxL3JjLWJ1aWxkcm9vdC10ZXN0L3NjcmlwdHMvaW5zdGFuY2UtMS9v
dXRwdXQtMS9ob3N0L2xpYi9nY2MvYXJtLWJ1aWxkcm9vdC1saW51eC11Y2xpYmNnbnVlYWJpLzEw
LjMuMC8uLi8uLi8uLi8uLi9hcm0tYnVpbGRyb290LWxpbnV4LXVjbGliY2dudWVhYmkvYmluL2xk
OiBjYW5ub3QgZmluZCAtbGd0ZXN0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRml4ZXM6Cj4gPiA+ID4g
PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMWJiOGFhMWRlMzEw
ZjNkMjdiNzRlYzdkODc0OGQxNzBhZDQ0NGUyCj4gPiA+ID4gPiAgCj4gPiA+ID4KPiA+ID4gPiBB
bnkgaWRlYSB3aHkgd2UncmUgZmFpbGluZyB0byBmaW5kIGd0ZXN0PyAgCj4gPiA+IE5vcGUsIEkg
ZGlkbid0IHRha2UgdGltZSB0byBmaW5kIG91dCB3aHkgdGhpcyBpcyBmYWlsaW5nIGFzIEkgdGhp
bmsKPiA+ID4gdGhhdCBsYy1jb21wbGlhbmNlIGlzIGp1c3Qgbm90IG5lZWRlZCBpbiB0aGUgY29u
dGV4dCBvZiBidWlsZHJvb3QgKGFzCj4gPiA+IGd0ZXN0IGlzIG5vdCBpbnN0YWxsZWQgb24gdGFy
Z2V0KS4gIAo+ID4gPiA+Cj4gPiA+ID4gT3VyIG1lc29uLmJ1aWxkIGZvciBzcmMvbGMtY29tcGxp
YW5jZSBjb250YWlucyB0aGUgZm9sbG93aW5nOgo+ID4gPiA+Cj4gPiA+ID4gIiIiCj4gPiA+ID4g
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQ0MwLTEuMAo+ID4gPiA+Cj4gPiA+ID4gbGliZXZl
bnQgPSBkZXBlbmRlbmN5KCdsaWJldmVudF9wdGhyZWFkcycsIHJlcXVpcmVkIDogZ2V0X29wdGlv
bignbGMtY29tcGxpYW5jZScpKQo+ID4gPiA+IGxpYmd0ZXN0ID0gZGVwZW5kZW5jeSgnZ3Rlc3Qn
LCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ2xjLWNvbXBsaWFuY2UnKSkKPiA+ID4gPgo+ID4gPiA+
IGlmIG5vdCAobGliZXZlbnQuZm91bmQoKSBhbmQgbGliZ3Rlc3QuZm91bmQoKSkKPiA+ID4gPiAg
ICAgbGNfY29tcGxpYW5jZV9lbmFibGVkID0gZmFsc2UKPiA+ID4gPiAgICAgc3ViZGlyX2RvbmUo
KQo+ID4gPiA+IGVuZGlmCj4gPiA+ID4KPiA+ID4gPiBsY19jb21wbGlhbmNlX2VuYWJsZWQgPSB0
cnVlCj4gPiA+ID4gIiIiCj4gPiA+ID4KPiA+ID4gPiBXaGljaCBpbXBsaWVzIHRoYXQgbGliZ3Rl
c3Qgd2FzIGZvdW5kIGR1cmluZyB0aGUgY29uZmlndXJhdGlvbiBwaGFzZSwKPiA+ID4gPiBidXQg
bm90IGR1cmluZyB0aGUgbGlua2luZyBwaGFzZS4uLi4KPiA+ID4gPgo+ID4gPiA+IElzIGxpYmd0
ZXN0IGJ1aWx0IGFzIHBhcnQgb2YgdGhpcyBidWlsZCBjb25maWd1cmF0aW9uPyBJZiBpdCBpcyAt
IEknZAo+ID4gPiA+IGV4cGVjdCBsYy1jb21wbGlhbmNlIHRvIGdldCBidWlsdCBhZ2FpbnN0IGl0
LiBJZiBub3QgLSB0aGVuIGl0IHdvdWxkCj4gPiA+ID4gYXV0b21hdGljYWxseSBiZSBkaXNhYmxl
ZCBieSBvdXIgYnVpbGQuLi4gIAo+ID4gPiBZZXMsIGl0IGlzIGJ1aWx0IGFuZCBmb3VuZCBieSBt
ZXNvbiBvdGhlcndpc2UgbGMtY29tcGxpYW5jZSB3b24ndCBiZQo+ID4gPiBidWlsdCBidXQgZm9y
IGFuIHVua25vd24gcmVhc29uLCB0aGUgbGluayBzdGVwIGZhaWxzLiAgCj4gPgo+ID4gWW91J3Zl
IG1lbnRpb25lZCBhYm92ZSB0aGF0IGd0ZXN0IHdvbid0IGJlIGluc3RhbGxlZCBvbiB0aGUgdGFy
Z2V0Li4uIFNvCj4gPiAuLiBJIHdvdWxkIGV4cGVjdCB0aGF0IG1lYW5zIGl0IGlzbid0IGluIHRo
ZSB0YXJnZXQgc3lzcm9vdCwgYW5kIGNhbid0Cj4gPiBiZSBsaW5rZWQgYWdhaW5zdC4KPiA+Cj4g
PiBTbyBpdCBzZWVtcyB0aGF0IGZvciBzb21lIHJlYXNvbiBtZXNvbiBmaW5kcyBhIGhvc3QgcGFj
a2FnZSBpbnN0ZWFkIG9mIGEKPiA+IHRhcmdldCBwYWNrYWdlPyAgCj4gZ3Rlc3QgaXMgaW5zdGFs
bGVkIG9uIHN0YWdpbmcgKGJ1dCBub3Qgb24gdGFyZ2V0KToKPiBHVEVTVF9JTlNUQUxMX1NUQUdJ
TkcgPSBZRVMKPiBHVEVTVF9JTlNUQUxMX1RBUkdFVCA9IE5PCj4gCj4gSXQgc2hvdWxkIGJlIG5v
dGVkIHRoYXQgbm8gcGFja2FnZXMgYXJlIHVzaW5nIGd0ZXN0IGluIGJ1bGRyb290Lgo+IElNSE8s
IHdlIHNob3VsZCByZW1vdmUgaXQgdG8gYXZvaWQgdW5leHBlY3RlZCBidWlsZCBmYWlsdXJlcyBh
bmQKPiBpbXByb3ZlIGJ1aWxkIHJlcHJvZHVjaWJpbGl0eSBhcyBJIGFzc3VtZSB0aGF0IGxpYmNh
bWVyYSBpcyBub3QgdGhlCj4gb25seSBwYWNrYWdlIHRoYXQgaGFzIGEgImhpZGRlbiIgZ3Rlc3Qg
ZGVwZW5kZW5jeS4KCkJ1dCB0aGlzIGlzIG5vcm1hbCBiZWhhdmlvciBmb3IgYSAobWF5YmUgc3Rh
dGljKSBsaWJyYXJ5IHRvIGJlIGluc3RhbGxlZAp0byBzdGFnaW5nLi4uLiwgYW5kIHRoZSBmYWls
dXJlIGlzIGEgY29tcGlsZSB0aW1lIG9uZSBhbmQgbm90IGEKcnVudGltZSBvbmU/IElmIHlvdSB3
YW50IHJlcHJvZHVjaWJpbGl0eSB5b3UgaGF2ZSB0byBhZGQgYSBvcHRpb25hbApkZXBlbmRlbmN5
IG9uIGd0ZXN0IChhbmQgZml4IHRoZSBsaW5rIGZhaWx1cmUpIG9yIChhcyB5b3Ugc3VnZ2VzdGVk
KQpkaXNhYmxlIHRoZSBuZWVkL2NoZWNrIGZvciBndGVzdCBpbiB0aGUgZmFpbGluZyBwYWNrYWdl
Li4uCgpJIGtub3cgbW9yZSB0aGFuIG9uZSBjdXN0b20gcGFja2FnZSB1c2luZyBndGVzdCAob3B0
aW9uYWwgb24gdGhlCnRhcmdldCBoYXJkd2FyZSBmb3IgcnVudGltZSB0ZXN0cykuLi4KClJlZ2Fy
ZHMsClBldGVyCgo+ID4+IERvIHdlIGhhdmUgYSB3YXkgdG8gZGlmZmVyZW50aWF0ZSB0aGVzZSBp
biBidWlsZHJvb3Q/ICAKPiA+Cj4gPiBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBzb21lIGJ1aWxk
cm9vdCB3aXphcmRyeSB0aGF0IHdvdWxkIG1ha2UKPiA+IGxpYmNhbWVyYSdzIGNvbmZpZ3VyZSBw
aGFzZSBzZWUgb25seSB0aGUgcGFja2FnZXMgdGhhdCBhcmUgaW5zdGFsbGVkIG9uCj4gPiB0aGUg
dGFyZ2V0IHdoZW4gYmVpbmcgYnVpbHQsIGJ1dCBpZiBidWlsZHJvb3QgZG9lc24ndCBzdXBwb3J0
IGluc3RhbGxpbmcKPiA+IGd0ZXN0IGF0IGFsbCAtIHRoZW4gaW5kZWVkIHRoZXJlIGlzbid0IGFu
eSBwb2ludCBzdXBwb3J0aW5nCj4gPiBsYy1jb21wbGlhbmNlIHdoaWNoIHJlcXVpcmVzIGl0Lgo+
ID4KPiA+ICAKPiA+ID4gPgo+ID4gPiA+ICAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gPiA+ID4gLS0tCj4g
PiA+ID4gPiAgcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rIHwgMSArCj4gPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVyYS5tayBiL3BhY2thZ2UvbGliY2FtZXJh
L2xpYmNhbWVyYS5tawo+ID4gPiA+ID4gaW5kZXggOGFiOTVmYjQyYS4uNjM4YzlhYzU1MyAxMDA2
NDQKPiA+ID4gPiA+IC0tLSBhL3BhY2thZ2UvbGliY2FtZXJhL2xpYmNhbWVyYS5tawo+ID4gPiA+
ID4gKysrIGIvcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rCj4gPiA+ID4gPiBAQCAtMTcs
NiArMTcsNyBAQCBMSUJDQU1FUkFfREVQRU5ERU5DSUVTID0gXAo+ID4gPiA+ID4gIExJQkNBTUVS
QV9DT05GX09QVFMgPSBcCj4gPiA+ID4gPiAgICAgICAgIC1EYW5kcm9pZD1kaXNhYmxlZCBcCj4g
PiA+ID4gPiAgICAgICAgIC1EZG9jdW1lbnRhdGlvbj1kaXNhYmxlZCBcCj4gPiA+ID4gPiArICAg
ICAgIC1EbGMtY29tcGxpYW5jZT1kaXNhYmxlZCBcCj4gPiA+ID4gPiAgICAgICAgIC1EdGVzdD1m
YWxzZSBcCj4gPiA+ID4gPiAgICAgICAgIC1Ed2Vycm9yPWZhbHNlCj4gPiA+ID4gPiAgTElCQ0FN
RVJBX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMzMuMAo+
ID4gPiA+ID4gIAo+ID4gPiBCZXN0IFJlZ2FyZHMsCj4gPiA+Cj4gPiA+IEZhYnJpY2UgIAo+IEJl
c3QgUmVnYXJkcywKPiAKPiBGYWJyaWNlCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
