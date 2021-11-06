Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32927C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:22:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C007D61139
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C007D61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 726DB401C5;
	Sat,  6 Nov 2021 18:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyxh4nc7eOna; Sat,  6 Nov 2021 18:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC3254017D;
	Sat,  6 Nov 2021 18:22:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE941BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE40340226
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2xmfD3VjxTP for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 18:22:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 339284010B
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 18:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636222969;
 bh=1EExlwj1dfTRaTHJ3eL+38pcAOP5uc+VeCVXE010SlQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YUOb9QsBfFwB2fHIXOMMakwkQosMlL7LY0EKW+arszJVGca5ZYBel8MwJK0TOsJER
 VtfRe5fXfI3+FMEGxGGkR7VbRS4xBApkuP/eTeSXEedqYXdvuNXH0uqi3/0duXSHsz
 0YFAySrQxpzehwEGrFwFzMzi5FasXlgfc1893D4U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.26]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRTRN-1n4XYS2yEH-00NQ9d; Sat, 06
 Nov 2021 19:22:49 +0100
Date: Sat, 6 Nov 2021 19:22:48 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211106192248.0d0f54fc@gmx.net>
In-Reply-To: <CAPi7W81qAmWugakUGrAdEWn+Xy0qDQD=HGDpRNKaUaRBdNgVXg@mail.gmail.com>
References: <20211106112805.7076-1-ps.report@gmx.net>
 <CAPi7W83i0YREgz0aSHmnZhtuWBJKBAoGKZR3ebKWhrV1rP51HA@mail.gmail.com>
 <CAPi7W81qAmWugakUGrAdEWn+Xy0qDQD=HGDpRNKaUaRBdNgVXg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ce6hNv4KbPpx99tsOXucl10+vL3ak7QU2L4F70NFKajTVIgU6Pk
 kZKilSxeTKTqRpuq3p5LYfUbjgjW0w6Jw7jj4vl5TX4P7OKAmA7egPuTLmDwgNpJjBiftB/
 3c5Oh2Tlqb4WVHZ8r0tDxoZSXDr45yy54z73P7YiDc02QGH7MTkSuIU+e7H3rrKgS2o7QsO
 phyoRR4qGG4oSAPNYGK+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e6jQ/p3vrp4=:IEAgeRHxpS8A0DaoMovDKA
 2vebUQwVMVHcXQ5akv12/kGNXmvo5gb2HkwY7xQ5G4JmfUfsLS81vWooddMTdOwv6gcdkKKM2
 CwHxaCdWrBtM6NCRhqUXZRextTKc8+Tajdhlhf8Q6emAtGUXm5j14n74OwUVVzpMEyKU1WMHM
 gamL+SGs/YSqzEUhsnUIj8FFPiiydOKgAgIbwd0vGD9yIiCUfmW+iU2GC2klEVlDdGP9dRnZH
 lQWvRgFnNG4WJCjasPPdJbvHIiN5aNOBtiGbXBkK4tfcR6VsNxg7URv8J4ReCLQZVXDgvZJoZ
 43EuO9LiIMGokoXWAf9/3pSwn+F8vEYs3VlsB9q2pE7LNXRAAm3HGX8PaKzl8deuFL+Yn7HU1
 LlVTh3EYmG/12uNVvvn4Tg8l1p7l5cqT2DGwXvYQyNjaWyZnWUVywzvzSej9roAYTpVxvw6Zf
 GOSdXYpPRQvo1h0Dr0kkeKT7jinjsDlf8EzubDgNmCVm48nhuUzkYht/dsH5WQtvKYC4ly/p6
 3WKmith21deGSVgRCEXP0wXDgQDzxRDPHIGRkQkXj45RyumipcCA/10ShOAy55QytAf3Ka9/R
 M/5XDX3LycUsCv9w5AMPM37O8K/h5B/U0qQUcgMcg2g0W6qIUP5R6ZzwUvgUaAChQBxzQ/I5U
 ZNHJp8pVUKBYZF/8oJi72X8v0aOSOV+neK6VS5WvYaV8x6S6xK7eMVDsAfihda/0O8fKFMG4M
 Zm4czoauc+8KWYLy0vjKIOVvJylFniNcynzHpskzEFRAtR5umjIwdFeP/Dgoackos5lAQmXYs
 JZDkSL19TBPLIA5LIN0uxxl7Cx9FDvvoJvLXwDOL9dp8u2jLD4J1wjhzKUDe1wTO1YaNcib0c
 v4k3l5kYSLYNXcVpG1Lu638nQ9BqU4+GUOW0FNCPyqzcdzZcbeyiUynyDOGQcotlSW+PTHNjR
 uElIVhpqianUayI1F758oUX8Sx0NrK65xiYpeA596oUey/vToz2tWbqw8mbRIxIh6CUMsEpNO
 ljB+vCymXd+MU5nZAdoDPn4YlpiNeESW/7LsCqOfBzPYYmPLitqgjnpCukx6mIb1tLRoeOM8U
 nzL3qoq9s8jEqk=
Subject: Re: [Buildroot] [PATCH v1] package/olsr: add upstream patch to fix
 compile with gpsd-3.23.1
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk9uIFNhdCwgNiBOb3YgMjAyMSAxNjoxNToyNCArMDEwMCwgRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBMZSBzYW0u
IDYgbm92LiAyMDIxIMOgIDE1OjA5LCBGYWJyaWNlIEZvbnRhaW5lCj4gPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4gPgo+ID4gSGksCj4gPgo+ID4gTGUgc2FtLiA2IG5v
di4gMjAyMSDDoCAxMjoyOCwgUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiBhIMOp
Y3JpdCA6ICAKPiA+ID4KPiA+ID4gLSBhZGQgdXBzdHJlYW0gcGF0Y2ggKFsxXSkgdG8gZml4IGNv
bXBpbGUgd2l0aCBncHNkLTMuMjMuMQo+ID4gPgo+ID4gPiBGaXhlczoKPiA+ID4KPiA+ID4gICAt
IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzUzYjA2ZTcyZmIyZDhiNGM4
YjZiYTQxYmFmNzc1ZmYzMzY1NGNkMTgKPiA+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzU0Y2FlOTI0NzExZTI2ZjA0MDQ1ZjgyMDhkYjBkNzcyMjkyYTM5MzMK
PiA+ID4KPiA+ID4gICBzcmMvZ3BzZGNsaWVudC5jOiBJbiBmdW5jdGlvbiAnbm1lYUluZm9Gcm9t
R3BzZCc6Cj4gPiA+ICAgc3JjL2dwc2RjbGllbnQuYzozNzQ6MzA6IGVycm9yOiAnU1RBVFVTX05P
X0ZJWCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4gJ1NUQVRVU19QUFNfRklYJz8KPiA+ID4gICAgIDM3NCB8ICAgaWYgKGdwc2RhdGEtPmZpeC5z
dGF0dXMgPT0gU1RBVFVTX05PX0ZJWCkgewo+ID4gPiAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gPiA+ICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNUQVRVU19QUFNfRklYCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vT0xTUi9vbHNyZC9jb21taXQvNjlhZTIzYmU5Zjk2YjllN2RkNjhhMDI1MmYzYWQw
NTk4NmJiMjIyZAo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+Cj4gPiA+IC0tLQo+ID4gPiBOb3RlczoKPiA+ID4KPiA+ID4gICAtIEBG
YWJyaWNlOiBkaWQgbm90IGZpbmQgYSBjb3JyZXNwb25kaW5nIGJ1aWxkcm9vdCBwYXRjaCBmcm9t
IHlvdSwKPiA+ID4gICAgICBkaWQgeW91IHNlbnQgb25lIGFuZCBJIG1pc3NlZCBpdD8gIAo+ID4g
Tm9wZSwgSSBkaWRuJ3Qgc2VuZCBhIHBhdGNoIGFzIEkgd2Fzbid0IHN1cmUgdGhhdCB0aGlzIGNv
bW1pdCB3YXMKPiA+IGNvcnJlY3QgYWZ0ZXIgYWxsOiBodHRwczovL2dpdGh1Yi5jb20vT0xTUi9v
bHNyZC9wdWxsLzEwNwo+ID4gSW5kZWVkLCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGdw
c2QgbWFpbnRhaW5lciwgdGhpcyBjb21taXQgd2lsbAo+ID4gZml4IHRoZSBidWlsZCBmYWlsdXJl
IGJ1dCB0aGUgY29kZSBiZWZvcmUgYW5kIGFmdGVyIHRoaXMgcGF0Y2ggaXMKPiA+IGJyb2tlbi4K
PiA+IEEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHVzZSBncHNkYXRhLT5maXgubW9kZSBp
bnN0ZWFkIG9mCj4gPiBncHNkYXRhLT5maXguc3RhdHVzOgo+ID4gaHR0cHM6Ly9naXRodWIuY29t
L3N3cmktcm9ib3RpY3MvZ3BzX3VtZC9pc3N1ZXMvNTAuCj4gPiBJJ2xsIHNlbmQgYSBQUiB0byBn
ZXQgZmVlZGJhY2sgZnJvbSB1cHN0cmVhbS4gIAo+IFBhdGNoIGhhcyBiZWVuIG1lcmdlZCB1cHN0
cmVhbToKPiBodHRwczovL2dpdGh1Yi5jb20vT0xTUi9vbHNyZC9jb21taXQvNjY1MDUxYTg0NTQ2
NGMwZjk1ZWRiODE0MzIxMDRkYWMzOTQyNmY3OQo+IEZlZWwgZnJlZSB0byBzZW5kIGEgdjIuCgpE
b25lOgoKCWh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyMTExMDYxODA5NDIuMjc4NTAtMS1wcy5yZXBvcnRAZ214Lm5ldC8KClRoYW5rcyBmb3Ig
cHJvdmlkaW5nIHRoZSB1cHN0cmVhbSBwYXRjaCBhbmQgZGlzY3Vzc2lvbiA7LSkKClJlZ2FyZHMs
ClBldGVyCgo+ID4gPiAtLS0KPiA+ID4gIC4uLi8wMDA1LXB1ZC1maXgtYnVpbGQtd2l0aC1ncHNk
LTMuMjMuMS5wYXRjaCB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9v
bHNyLzAwMDUtcHVkLWZpeC1idWlsZC13aXRoLWdwc2QtMy4yMy4xLnBhdGNoCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL29sc3IvMDAwNS1wdWQtZml4LWJ1aWxkLXdpdGgtZ3BzZC0z
LjIzLjEucGF0Y2ggYi9wYWNrYWdlL29sc3IvMDAwNS1wdWQtZml4LWJ1aWxkLXdpdGgtZ3BzZC0z
LjIzLjEucGF0Y2gKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAw
MDAwMC4uYThkNTM0ODJiOQo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL3BhY2thZ2Uv
b2xzci8wMDA1LXB1ZC1maXgtYnVpbGQtd2l0aC1ncHNkLTMuMjMuMS5wYXRjaAo+ID4gPiBAQCAt
MCwwICsxLDQ0IEBACj4gPiA+ICtGcm9tIDY5YWUyM2JlOWY5NmI5ZTdkZDY4YTAyNTJmM2FkMDU5
ODZiYjIyMmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+ICtGcm9tOiBGYWJyaWNlIEZv
bnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+ID4gK0RhdGU6IFN1biwgMjQg
T2N0IDIwMjEgMjM6MjI6MTEgKzAyMDAKPiA+ID4gK1N1YmplY3Q6IFtQQVRDSF0gcHVkOiBmaXgg
YnVpbGQgd2l0aCBncHNkID49IDMuMjMuMQo+ID4gPiArCj4gPiA+ICtGaXggdGhlIGZvbGxvd2lu
ZyBidWlsZCBmYWlsdXJlIHJhaXNlZCB3aXRoIGdwc2QgPj0gMy4yMy4xIGFuZAo+ID4gPiAraHR0
cHM6Ly9naXRsYWIuY29tL2dwc2QvZ3BzZC8tL2NvbW1pdC9kNGE0ZDhkMzYwNmZkNTBmMTBiY2Qy
MDA5NmE4YTBjZGI4YjJkNDI3Ogo+ID4gPiArCj4gPiA+ICtzcmMvZ3BzZGNsaWVudC5jOiBJbiBm
dW5jdGlvbiAnbm1lYUluZm9Gcm9tR3BzZCc6Cj4gPiA+ICtzcmMvZ3BzZGNsaWVudC5jOjM3NDoz
MDogZXJyb3I6ICdTVEFUVVNfTk9fRklYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnU1RBVFVTX1BQU19GSVgnPwo+ID4gPiArICAzNzQgfCAg
IGlmIChncHNkYXRhLT5maXguc3RhdHVzID09IFNUQVRVU19OT19GSVgpIHsKPiA+ID4gKyAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gPiA+ICsgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTX1BQU19GSVgKPiA+ID4gKwo+
ID4gPiArRml4ZXM6Cj4gPiA+ICsgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVz
dWx0cy81M2IwNmU3MmZiMmQ4YjRjOGI2YmE0MWJhZjc3NWZmMzM2NTRjZDE4Cj4gPiA+ICsKPiA+
ID4gK1tGaXhlZC1Db21taXQtTWVzc2FnZSBieTogTmljayBIYWlua2UgPHZpbmNlbnRAc3lzdGVt
bGkub3JnPl0KPiA+ID4gKwo+ID4gPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiA+ICtbVXBzdHJlYW06IGh0dHBzOi8vZ2l0
aHViLmNvbS9PTFNSL29sc3JkL2NvbW1pdC82OWFlMjNiZTlmOTZiOWU3ZGQ2OGEwMjUyZjNhZDA1
OTg2YmIyMjJkXQo+ID4gPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9y
dEBnbXgubmV0Pgo+ID4gPiArLS0tCj4gPiA+ICsgbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5jIHwg
NCArKystCj4gPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gPiArCj4gPiA+ICtkaWZmIC0tZ2l0IGEvbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5j
IGIvbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5jCj4gPiA+ICtpbmRleCBhMmE5Y2VlMC4uOWM5OGY0
ZGYgMTAwNjQ0Cj4gPiA+ICstLS0gYS9saWIvcHVkL3NyYy9ncHNkY2xpZW50LmMKPiA+ID4gKysr
KyBiL2xpYi9wdWQvc3JjL2dwc2RjbGllbnQuYwo+ID4gPiArQEAgLTM3MCw3ICszNzAsOSBAQCB2
b2lkIG5tZWFJbmZvRnJvbUdwc2Qoc3RydWN0IGdwc19kYXRhX3QgKmdwc2RhdGEsIE5tZWFJbmZv
ICppbmZvLCBzdHJ1Y3QgR3BzZENvbgo+ID4gPiArICAgICAgICAgICApOwo+ID4gPiArCj4gPiA+
ICsgICBncHNkYXRhLT5zZXQgJj0gflNUQVRVU19TRVQ7IC8qIGFsd2F5cyB2YWxpZCAqLwo+ID4g
PiArLSAgI2lmIEdQU0RfQVBJX01BSk9SX1ZFUlNJT04gPj0gMTAKPiA+ID4gKysgICNpZiBHUFNE
X0FQSV9NQUpPUl9WRVJTSU9OID49IDEyCj4gPiA+ICsrICBpZiAoZ3BzZGF0YS0+Zml4LnN0YXR1
cyA9PSBTVEFUVVNfVU5LKSB7Cj4gPiA+ICsrICAjZWxpZiBHUFNEX0FQSV9NQUpPUl9WRVJTSU9O
ID49IDEwCj4gPiA+ICsgICBpZiAoZ3BzZGF0YS0+Zml4LnN0YXR1cyA9PSBTVEFUVVNfTk9fRklY
KSB7Cj4gPiA+ICsgICAjZWxzZQo+ID4gPiArICAgaWYgKGdwc2RhdGEtPnN0YXR1cyA9PSBTVEFU
VVNfTk9fRklYKSB7Cj4gPiA+ICstLQo+ID4gPiArMi4zMy4xCj4gPiA+ICsKPiA+ID4gLS0KPiA+
ID4gMi4zMy4xCj4gPiA+ICAKPiA+IEJlc3QgUmVnYXJkcywKPiA+Cj4gPiBGYWJyaWNlICAKPiBC
ZXN0IFJlZ2FyZHMsCj4gCj4gRmFicmljZQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
