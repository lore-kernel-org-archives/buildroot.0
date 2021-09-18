Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA42C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F186261108
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 07:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F186261108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9056079F;
	Sat, 18 Sep 2021 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWoNnKZD8g5d; Sat, 18 Sep 2021 07:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A36E613BB;
	Sat, 18 Sep 2021 07:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAA591BF23F
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA8C082C1E
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 07:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSPZe3ve42S1 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 07:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91DED82861
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 07:59:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 20F09B0051E;
 Sat, 18 Sep 2021 09:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631951976;
 bh=FDEZtt4cln5ndoXxvlFFfpNYLwHH5VM0ginccVMvayA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJhZQ4Cl+OVuurcUHl7Md90TK5GHmuCedqxrqygmK1D8/NWeSNkm/Ah9UDB2Kndj7
 /Oj390OXjvWBx99KONJN75z4N6FqZfxP/Vt2+O57e2h/PQvCGQ3oyxyEgp2qnfP+B5
 MvJSV/o3ueICxnHjVnnn/PwQTPfUIyUc3ViBwVP7lucaXKeJoYgY2JGULPYNmMQP8q
 OqgK0jZQ+hhV1j27IKH3J9sXX+9qI3NVjSe9+jdJDXi0s1oKFu1Y2ahdg/sEsxSno2
 ov4hRFEzLr6Bed90gFXvKVt5VdH0bpmnuFhuq+ParSof6EZHSR1lR13B6GbfLZjoiN
 M5vqi7tWPv2/w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 09:59:27 +0200
Date: Sat, 18 Sep 2021 09:59:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918075927.GF1053080@scaer>
References: <20210915211357.31028-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915211357.31028-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/qt5location: fix musl compile
 (pthread_getname_np)
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UGV0ZXIsIEFsbCwKCk9uIDIwMjEtMDktMTUgMjM6MTMgKzAyMDAsIFBldGVyIFNlaWRlcmVyIHNw
YWtlIHRodXNseToKPiAtIHB0aHJlYWRfZ2V0bmFtZV9ucCBub3QgYXZhaWxhYmxlIHdpdGggbXVz
bCBsaWJjLCBhZGQgcGF0Y2ggdG8gZGlzYWJsZQo+ICAgdXNhZ2UgZm9yIG11c2wgKHBhdGNoIGlu
c3BpcmVkL3BvcnRlZCBmcm9tIFsxXSkKPiAKPiBGaXhlczoKPiAKPiAgIC0gaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvZWQzNzJhNGE4ZTUwZDllMjBiZTU4OWVlZGE0MGM5
Mjg4OGQ3MDliYwo+IAo+ICAgcGxhdGZvcm0vZGVmYXVsdC90aHJlYWQuY3BwOiBJbiBmdW5jdGlv
biDigJhzdGQ6OnN0cmluZyBtYmdsOjpwbGF0Zm9ybTo6Z2V0Q3VycmVudFRocmVhZE5hbWUoKeKA
mToKPiAgIHBsYXRmb3JtL2RlZmF1bHQvdGhyZWFkLmNwcDoxNDo1OiBlcnJvcjog4oCYcHRocmVh
ZF9nZXRuYW1lX25w4oCZIHdhcyBub3QgZGVjbGFyZWQgaW4gdGhpcyBzY29wZTsgZGlkIHlvdSBt
ZWFuIOKAmHB0aHJlYWRfc2V0bmFtZV9ucOKAmT8KPiAgICAgIDE0IHwgICAgIHB0aHJlYWRfZ2V0
bmFtZV9ucChwdGhyZWFkX3NlbGYoKSwgbmFtZSwgc2l6ZW9mKG5hbWUpKTsKPiAgICAgICAgIHwg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICAgfCAgICAgcHRocmVhZF9zZXRuYW1lX25w
Cj4gCj4gICAgIFsxXSBodHRwczovL2dpdGh1Yi5jb20vdm9pZC1saW51eC92b2lkLXBhY2thZ2Vz
L2Jsb2IvZTY0ZGQ2N2Y0M2M0MDlkMmIyZGIwODIxNDA4NGU4NDJkOTJhZDYyMC9zcmNwa2dzL3F0
NS9wYXRjaGVzLzAwMTQtbXVzbC1zZXRfdGhyZWFkX25hbWVfbnAucGF0Y2gKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gLS0tCj4gIC4uLmds
LW5hdGl2ZS1maXgtbXVzbC1jb21waWxlLXB0aHJlYWRfZy5wYXRjaCB8IDQ1ICsrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NWxvY2F0aW9uLzAwMDEtM3JkcGFydHktbWFwYm94LWds
LW5hdGl2ZS1maXgtbXVzbC1jb21waWxlLXB0aHJlYWRfZy5wYXRjaAo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3F0NS9xdDVsb2NhdGlvbi8wMDAxLTNyZHBhcnR5LW1hcGJveC1nbC1uYXRpdmUt
Zml4LW11c2wtY29tcGlsZS1wdGhyZWFkX2cucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDVsb2NhdGlv
bi8wMDAxLTNyZHBhcnR5LW1hcGJveC1nbC1uYXRpdmUtZml4LW11c2wtY29tcGlsZS1wdGhyZWFk
X2cucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmY4M2Fh
MWIzYTYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1bG9jYXRpb24vMDAw
MS0zcmRwYXJ0eS1tYXBib3gtZ2wtbmF0aXZlLWZpeC1tdXNsLWNvbXBpbGUtcHRocmVhZF9nLnBh
dGNoCj4gQEAgLTAsMCArMSw0NSBAQAo+ICtGcm9tIGFjZjc1Mjc1N2VlNGJmMjkxMzI4OWVlMTE0
MmY0OTY4ZmRiMjJhNGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFBldGVyIFNl
aWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiArRGF0ZTogV2VkLCAxNSBTZXAgMjAyMSAyMzow
NTo1MiArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIDNyZHBhcnR5OiBtYXBib3gtZ2wtbmF0aXZl
OiBmaXggbXVzbCBjb21waWxlCj4gKyAocHRocmVhZF9nZXRuYW1lX25wKQo+ICtNSU1FLVZlcnNp
b246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArLSBwdGhyZWFkX2dldG5hbWVfbnAg
bm90IGF2YWlsYWJsZSB3aXRoIG11c2wgbGliYyAocGF0Y2ggaW5zcGlyZWQvcG9ydGVkCj4gKyAg
ZnJvbSBbMV0pCj4gKwo+ICtGaXhlczoKPiArCj4gKyAgcGxhdGZvcm0vZGVmYXVsdC90aHJlYWQu
Y3BwOiBJbiBmdW5jdGlvbiDigJhzdGQ6OnN0cmluZyBtYmdsOjpwbGF0Zm9ybTo6Z2V0Q3VycmVu
dFRocmVhZE5hbWUoKeKAmToKPiArICBwbGF0Zm9ybS9kZWZhdWx0L3RocmVhZC5jcHA6MTQ6NTog
ZXJyb3I6IOKAmHB0aHJlYWRfZ2V0bmFtZV9ucOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMg
c2NvcGU7IGRpZCB5b3UgbWVhbiDigJhwdGhyZWFkX3NldG5hbWVfbnDigJk/Cj4gKyAgICAgMTQg
fCAgICAgcHRocmVhZF9nZXRuYW1lX25wKHB0aHJlYWRfc2VsZigpLCBuYW1lLCBzaXplb2YobmFt
ZSkpOwo+ICsgICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgo+ICsgICAgICAgIHwgICAg
IHB0aHJlYWRfc2V0bmFtZV9ucAo+ICsKPiArWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS92b2lkLWxp
bnV4L3ZvaWQtcGFja2FnZXMvYmxvYi9lNjRkZDY3ZjQzYzQwOWQyYjJkYjA4MjE0MDg0ZTg0MmQ5
MmFkNjIwL3NyY3BrZ3MvcXQ1L3BhdGNoZXMvMDAxNC1tdXNsLXNldF90aHJlYWRfbmFtZV9ucC5w
YXRjaAo+ICsKPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgu
bmV0Pgo+ICstLS0KPiArIHNyYy8zcmRwYXJ0eS9tYXBib3gtZ2wtbmF0aXZlL3BsYXRmb3JtL2Rl
ZmF1bHQvdGhyZWFkLmNwcCB8IDMgKystCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjLzNyZHBhcnR5L21hcGJv
eC1nbC1uYXRpdmUvcGxhdGZvcm0vZGVmYXVsdC90aHJlYWQuY3BwIGIvc3JjLzNyZHBhcnR5L21h
cGJveC1nbC1uYXRpdmUvcGxhdGZvcm0vZGVmYXVsdC90aHJlYWQuY3BwCj4gK2luZGV4IGM3Yzc5
YjQuLjNmMTM1ZWIgMTAwNjQ0Cj4gKy0tLSBhL3NyYy8zcmRwYXJ0eS9tYXBib3gtZ2wtbmF0aXZl
L3BsYXRmb3JtL2RlZmF1bHQvdGhyZWFkLmNwcAo+ICsrKysgYi9zcmMvM3JkcGFydHkvbWFwYm94
LWdsLW5hdGl2ZS9wbGF0Zm9ybS9kZWZhdWx0L3RocmVhZC5jcHAKPiArQEAgLTExLDggKzExLDkg
QEAgbmFtZXNwYWNlIHBsYXRmb3JtIHsKPiArIAo+ICsgc3RkOjpzdHJpbmcgZ2V0Q3VycmVudFRo
cmVhZE5hbWUoKSB7Cj4gKyAgICAgY2hhciBuYW1lWzMyXSA9ICJ1bmtub3duIjsKPiArKyNpZiBk
ZWZpbmVkKF9fR0xJQkNfXykKCldoYXQgYWJvdXQgdUNsaWJjPyBIbW1tLCBhcyB1c3VhbCwgaXQg
aW1wZXJzb25hdGVzIGdsaWJjIGFuZCBkZWZpbmVzCl9fR0xJQkNfXywgc28gdGhpcyB3b3JrcyBi
eSBjaGFuY2UuLi4KCkkndmUgY2hhbmdlZCB0bzoKCiAgICAjaWYgZGVmaW5lZChfX0dMSUJDX18p
IHx8IGRlZmluZWQoX19VQ0xJQkNfXykKCmFuZCBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gKyAgICAgcHRocmVhZF9nZXRuYW1lX25wKHB0aHJl
YWRfc2VsZigpLCBuYW1lLCBzaXplb2YobmFtZSkpOwo+ICstCj4gKysjZW5kaWYKPiArICAgICBy
ZXR1cm4gbmFtZTsKPiArIH0KPiArIAo+ICstLSAKPiArMi4zMy4wCj4gKwo+IC0tIAo+IDIuMzMu
MAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
bGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
