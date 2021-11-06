Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA75C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C55F60249
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C55F60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EFE60717;
	Sat,  6 Nov 2021 15:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7YLb8Sxqvgk; Sat,  6 Nov 2021 15:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E991D605C6;
	Sat,  6 Nov 2021 15:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9109E1BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E14140131
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tc-6L-9G5kvs for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9AC6400BD
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:17:22 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id m5so1872557ljp.4
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K6BqEczZTychY6W+aVnye+cRN5FgQdOEKGJHx/mmTi8=;
 b=BBF6ULz4UOKxhvoBs4VUWz1nXR51d6k3yywcJV7GWJ1Q/wff6IyP+l3YfMiNsVV/IQ
 79ZnSLSPYTrl7ZdSmMAqqt4G5nXTOy+Vuxch9OL6CucLfqr4M7BvZ/BsS0xd84I+zBKO
 GApPSsrsEnL7udpPIMqlNPXZ50epryaxw1uPoOpPO/ijOv3MUxxyI//xaPntp1sa5UJQ
 /wMykCoHXpobdP+uVc6W32v+5MbW6cKYDirxysTOLfLQhp+poieL011N0Y1JIUu4hFFb
 JYkJ01uOAC3pgUeuELAXd+UIQt8104whIW4pFgnER+j0g7cwsBCpmWSmxmwHh4mc+lmh
 YVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K6BqEczZTychY6W+aVnye+cRN5FgQdOEKGJHx/mmTi8=;
 b=cF89mAV3WPE8i6lLWGzjTXKpfEXZXolMRmoT/ycHBErpdXPO/0q5fdpuTF/OQ1cbMj
 fjdDrU0uLwe0lBuRURvd4DrDoPaHwPnYHClV/LYBfWfivkgtAMoqMn7+DnLWV6tTwfu1
 dQXIR8cLLeYLhz+Ibb6rU3ucXl0kbBOqPTg/BGjzWRmB7Y2JGz6jL2NIaKHMMeAygXS8
 8X9dxs9KKUKDN2zqdtf9SnmrD6K/TLrpl15sGUW+vHLm7eAfg4+A0v9kuquGhcYdttBx
 nbAcl4Xm4jDgkfWJ2zLvuBh2lcr2y9IlveUIitLz2EQUoRGD8vzo+DYQIY82CfGS73wJ
 xPlA==
X-Gm-Message-State: AOAM530vvS50cxV7P12HbyyFNIlA5S4XD3Iwec64WjAx2EAuR2/fu8jK
 4z676Pn/7jRg/hW6J2iC7NysNQdnI46fvW2YrBgFoEg24oE=
X-Google-Smtp-Source: ABdhPJw4JKrCjblwbU2zNk6Oagr9djTjdoD/JK1fGAcifiVq6+WajVuEIAyIp8ZgLrfWRW8/ww6cCqy5Y3RBOn8yULw=
X-Received: by 2002:a05:651c:513:: with SMTP id
 o19mr44488187ljp.108.1636211840664; 
 Sat, 06 Nov 2021 08:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211106112805.7076-1-ps.report@gmx.net>
 <CAPi7W83i0YREgz0aSHmnZhtuWBJKBAoGKZR3ebKWhrV1rP51HA@mail.gmail.com>
In-Reply-To: <CAPi7W83i0YREgz0aSHmnZhtuWBJKBAoGKZR3ebKWhrV1rP51HA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 6 Nov 2021 16:15:24 +0100
Message-ID: <CAPi7W81qAmWugakUGrAdEWn+Xy0qDQD=HGDpRNKaUaRBdNgVXg@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
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

TGUgc2FtLiA2IG5vdi4gMjAyMSDDoCAxNTowOSwgRmFicmljZSBGb250YWluZQo8Zm9udGFpbmUu
ZmFicmljZUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IEhpLAo+Cj4gTGUgc2FtLiA2IG5vdi4g
MjAyMSDDoCAxMjoyOCwgUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PiBhIMOpY3Jp
dCA6Cj4gPgo+ID4gLSBhZGQgdXBzdHJlYW0gcGF0Y2ggKFsxXSkgdG8gZml4IGNvbXBpbGUgd2l0
aCBncHNkLTMuMjMuMQo+ID4KPiA+IEZpeGVzOgo+ID4KPiA+ICAgLSBodHRwOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81M2IwNmU3MmZiMmQ4YjRjOGI2YmE0MWJhZjc3NWZmMzM2
NTRjZDE4Cj4gPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNTRj
YWU5MjQ3MTFlMjZmMDQwNDVmODIwOGRiMGQ3NzIyOTJhMzkzMwo+ID4KPiA+ICAgc3JjL2dwc2Rj
bGllbnQuYzogSW4gZnVuY3Rpb24gJ25tZWFJbmZvRnJvbUdwc2QnOgo+ID4gICBzcmMvZ3BzZGNs
aWVudC5jOjM3NDozMDogZXJyb3I6ICdTVEFUVVNfTk9fRklYJyB1bmRlY2xhcmVkIChmaXJzdCB1
c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnU1RBVFVTX1BQU19GSVgnPwo+ID4g
ICAgIDM3NCB8ICAgaWYgKGdwc2RhdGEtPmZpeC5zdGF0dXMgPT0gU1RBVFVTX05PX0ZJWCkgewo+
ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+
ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTX1BQU19GSVgK
PiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL09MU1Ivb2xzcmQvY29tbWl0LzY5YWUyM2Jl
OWY5NmI5ZTdkZDY4YTAyNTJmM2FkMDU5ODZiYjIyMmQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gPiAtLS0KPiA+IE5vdGVzOgo+ID4K
PiA+ICAgLSBARmFicmljZTogZGlkIG5vdCBmaW5kIGEgY29ycmVzcG9uZGluZyBidWlsZHJvb3Qg
cGF0Y2ggZnJvbSB5b3UsCj4gPiAgICAgIGRpZCB5b3Ugc2VudCBvbmUgYW5kIEkgbWlzc2VkIGl0
Pwo+IE5vcGUsIEkgZGlkbid0IHNlbmQgYSBwYXRjaCBhcyBJIHdhc24ndCBzdXJlIHRoYXQgdGhp
cyBjb21taXQgd2FzCj4gY29ycmVjdCBhZnRlciBhbGw6IGh0dHBzOi8vZ2l0aHViLmNvbS9PTFNS
L29sc3JkL3B1bGwvMTA3Cj4gSW5kZWVkLCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGdw
c2QgbWFpbnRhaW5lciwgdGhpcyBjb21taXQgd2lsbAo+IGZpeCB0aGUgYnVpbGQgZmFpbHVyZSBi
dXQgdGhlIGNvZGUgYmVmb3JlIGFuZCBhZnRlciB0aGlzIHBhdGNoIGlzCj4gYnJva2VuLgo+IEEg
YmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHVzZSBncHNkYXRhLT5maXgubW9kZSBpbnN0ZWFk
IG9mCj4gZ3BzZGF0YS0+Zml4LnN0YXR1czoKPiBodHRwczovL2dpdGh1Yi5jb20vc3dyaS1yb2Jv
dGljcy9ncHNfdW1kL2lzc3Vlcy81MC4KPiBJJ2xsIHNlbmQgYSBQUiB0byBnZXQgZmVlZGJhY2sg
ZnJvbSB1cHN0cmVhbS4KUGF0Y2ggaGFzIGJlZW4gbWVyZ2VkIHVwc3RyZWFtOgpodHRwczovL2dp
dGh1Yi5jb20vT0xTUi9vbHNyZC9jb21taXQvNjY1MDUxYTg0NTQ2NGMwZjk1ZWRiODE0MzIxMDRk
YWMzOTQyNmY3OQpGZWVsIGZyZWUgdG8gc2VuZCBhIHYyLgo+ID4gLS0tCj4gPiAgLi4uLzAwMDUt
cHVkLWZpeC1idWlsZC13aXRoLWdwc2QtMy4yMy4xLnBhdGNoIHwgNDQgKysrKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2Uvb2xzci8wMDA1LXB1ZC1maXgtYnVpbGQtd2l0aC1ncHNkLTMuMjMu
MS5wYXRjaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29sc3IvMDAwNS1wdWQtZml4LWJ1
aWxkLXdpdGgtZ3BzZC0zLjIzLjEucGF0Y2ggYi9wYWNrYWdlL29sc3IvMDAwNS1wdWQtZml4LWJ1
aWxkLXdpdGgtZ3BzZC0zLjIzLjEucGF0Y2gKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBp
bmRleCAwMDAwMDAwMDAwLi5hOGQ1MzQ4MmI5Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9w
YWNrYWdlL29sc3IvMDAwNS1wdWQtZml4LWJ1aWxkLXdpdGgtZ3BzZC0zLjIzLjEucGF0Y2gKPiA+
IEBAIC0wLDAgKzEsNDQgQEAKPiA+ICtGcm9tIDY5YWUyM2JlOWY5NmI5ZTdkZDY4YTAyNTJmM2Fk
MDU5ODZiYjIyMmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiArRnJvbTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArRGF0ZTogU3VuLCAyNCBP
Y3QgMjAyMSAyMzoyMjoxMSArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gcHVkOiBmaXggYnVp
bGQgd2l0aCBncHNkID49IDMuMjMuMQo+ID4gKwo+ID4gK0ZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgcmFpc2VkIHdpdGggZ3BzZCA+PSAzLjIzLjEgYW5kCj4gPiAraHR0cHM6Ly9naXRs
YWIuY29tL2dwc2QvZ3BzZC8tL2NvbW1pdC9kNGE0ZDhkMzYwNmZkNTBmMTBiY2QyMDA5NmE4YTBj
ZGI4YjJkNDI3Ogo+ID4gKwo+ID4gK3NyYy9ncHNkY2xpZW50LmM6IEluIGZ1bmN0aW9uICdubWVh
SW5mb0Zyb21HcHNkJzoKPiA+ICtzcmMvZ3BzZGNsaWVudC5jOjM3NDozMDogZXJyb3I6ICdTVEFU
VVNfTk9fRklYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5
b3UgbWVhbiAnU1RBVFVTX1BQU19GSVgnPwo+ID4gKyAgMzc0IHwgICBpZiAoZ3BzZGF0YS0+Zml4
LnN0YXR1cyA9PSBTVEFUVVNfTk9fRklYKSB7Cj4gPiArICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiA+ICsgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU1RBVFVTX1BQU19GSVgKPiA+ICsKPiA+ICtGaXhlczoKPiA+ICsgLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy81M2IwNmU3MmZiMmQ4YjRjOGI2YmE0
MWJhZjc3NWZmMzM2NTRjZDE4Cj4gPiArCj4gPiArW0ZpeGVkLUNvbW1pdC1NZXNzYWdlIGJ5OiBO
aWNrIEhhaW5rZSA8dmluY2VudEBzeXN0ZW1saS5vcmc+XQo+ID4gKwo+ID4gK1NpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gK1tV
cHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL09MU1Ivb2xzcmQvY29tbWl0LzY5YWUyM2JlOWY5
NmI5ZTdkZDY4YTAyNTJmM2FkMDU5ODZiYjIyMmRdCj4gPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIg
U2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0Pgo+ID4gKy0tLQo+ID4gKyBsaWIvcHVkL3NyYy9n
cHNkY2xpZW50LmMgfCA0ICsrKy0KPiA+ICsgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4gKwo+ID4gK2RpZmYgLS1naXQgYS9saWIvcHVkL3NyYy9ncHNk
Y2xpZW50LmMgYi9saWIvcHVkL3NyYy9ncHNkY2xpZW50LmMKPiA+ICtpbmRleCBhMmE5Y2VlMC4u
OWM5OGY0ZGYgMTAwNjQ0Cj4gPiArLS0tIGEvbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5jCj4gPiAr
KysrIGIvbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5jCj4gPiArQEAgLTM3MCw3ICszNzAsOSBAQCB2
b2lkIG5tZWFJbmZvRnJvbUdwc2Qoc3RydWN0IGdwc19kYXRhX3QgKmdwc2RhdGEsIE5tZWFJbmZv
ICppbmZvLCBzdHJ1Y3QgR3BzZENvbgo+ID4gKyAgICAgICAgICAgKTsKPiA+ICsKPiA+ICsgICBn
cHNkYXRhLT5zZXQgJj0gflNUQVRVU19TRVQ7IC8qIGFsd2F5cyB2YWxpZCAqLwo+ID4gKy0gICNp
ZiBHUFNEX0FQSV9NQUpPUl9WRVJTSU9OID49IDEwCj4gPiArKyAgI2lmIEdQU0RfQVBJX01BSk9S
X1ZFUlNJT04gPj0gMTIKPiA+ICsrICBpZiAoZ3BzZGF0YS0+Zml4LnN0YXR1cyA9PSBTVEFUVVNf
VU5LKSB7Cj4gPiArKyAgI2VsaWYgR1BTRF9BUElfTUFKT1JfVkVSU0lPTiA+PSAxMAo+ID4gKyAg
IGlmIChncHNkYXRhLT5maXguc3RhdHVzID09IFNUQVRVU19OT19GSVgpIHsKPiA+ICsgICAjZWxz
ZQo+ID4gKyAgIGlmIChncHNkYXRhLT5zdGF0dXMgPT0gU1RBVFVTX05PX0ZJWCkgewo+ID4gKy0t
Cj4gPiArMi4zMy4xCj4gPiArCj4gPiAtLQo+ID4gMi4zMy4xCj4gPgo+IEJlc3QgUmVnYXJkcywK
Pgo+IEZhYnJpY2UKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
