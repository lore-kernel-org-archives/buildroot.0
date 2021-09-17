Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D91C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFC061279
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBFC061279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C12261BFB;
	Fri, 17 Sep 2021 19:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRfw2qoLowv4; Fri, 17 Sep 2021 19:51:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE17361BEA;
	Fri, 17 Sep 2021 19:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9562A1BF350
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8317342576
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNm7tcRiIJFb for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 19:51:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A434242573
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 19:51:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6FDE55FF9A;
 Fri, 17 Sep 2021 21:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631908285;
 bh=dtKrEdz/cdXKTTGH00PWzjfGS9rNrfqAwJ+zw4NiHis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k0YyoapsgFguGbQ48+faqtVADpt9PVcPsgZFr3LUII/B1//dqYNEQh3LQiDKjIFJg
 MCs3z8LrraXaabudbfWIyAWPdm4eKldynbIKW2Zs7CFUp7/nomRb9CYm0q/IW6AbSO
 za1e0OWoR9yzla5VtrfEmpx0yjRIoL76crG2xwYb5Cx8ppqwiqN8+59NklDXN7P8h8
 UHsEGEhtuShSU1aekUulZzGuMlT3e1P+TYxy1qA4P5CN+PfL61BjwkWiPtVLTawAXD
 HFdZcDtIFdm61vKICZ4paaB5ARXnCnlFYdTDrc6d368XsUN7nY4GmsQyhYZZX9fLmq
 IcJciNduhR44A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 21:51:11 +0200
Date: Fri, 17 Sep 2021 21:51:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210917195111.GV1053080@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-11-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-11-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 10/16] Makefile: breaks hardlinks in
 global {TARGET, HOST}_DIR on per-package build
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVydsOpLCBBbGwsCgpPbiAyMDIxLTA4LTE3IDEwOjM5ICswMjAwLCBIZXJ2ZSBDb2RpbmEgc3Bh
a2UgdGh1c2x5Ogo+IFdpdGhvdXQgdGhpcyBwYXRjaCwgYSBtYWtlIDxwa2c+X3JlYnVpbGQgZGV0
ZWN0cyBvdmVyd3JpdGVzLiBJbmRlZWQsIGluCj4gdGFyZ2V0X2ZpbmFsaXplIHN0ZXBzIHNvbWUg
bW9kaWZpY2F0aW9ucyBhcmUgZG9uZSBvbiBpbnN0YWxsZWQgZmlsZXMgKGllCj4gc3RyaXAgb3Ig
VEFSR0VUX0ZJTkFMSVpFX0hPT0tTIGZvciBpbnN0YW5jZSkuCj4gCj4gSW4gb3JkZXIgdG8gYXZv
aWQgdGhlc2UgbW9kaWZpY2F0aW9ucyBzZWVuIGZyb20gcGVyLXBhY2thZ2Uge1RBUkdFVCxIT1NU
fV9ESVIKPiBhbmQgc28gYmVlbiBhbmFseXplZCBhcyBzb21lIG92ZXJ3cml0ZXMsIGdsb2JhbCB7
VEFSR0VULEhPU1R9X0RJUiBpcyBidWlsdAo+IHVzaW5nIGEgZnVsbCBjb3B5IG9mIHRoZSBpbnZv
bHZlZCBwZXItcGFja2FnZSBmaWxlcyBpbnN0ZWFkIG9mIGhhcmRsaW5rcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiBSZXZpZXdl
ZC1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gLS0tCj4gQ2hh
bmdlcyB2MSB0byB2MjoKPiAgLSBBZGRlZCAnUmV2aWV3ZWQtYnk6IFlhbm4gRS4gTU9SSU4nCj4g
Cj4gQ2hhbmdlcyB2MiB0byB2MjoKPiBOb25lCj4gCj4gIE1ha2VmaWxlIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IDMyZmFkMDA0ZmUuLmNjZjIwMjA1NjUgMTAw
NjQ0Cj4gLS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC03MzQsNyArNzM0LDcg
QEAgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMpLHkpCj4gIGRlZmluZSBwZXIt
cGFja2FnZS1yc3luYy1kZWx0YQo+ICAJJChRKW1rZGlyIC1wICQoMykKPiAgCSQoZm9yZWFjaCBw
a2csJCgxKSxcCj4gLQkJJChRKXJzeW5jIC1hIC0tbGluay1kZXN0PSQoUEVSX1BBQ0tBR0VfRElS
KS8kKHBrZykvJChzdHJpcCAkKDIpKS8gXAo+ICsJCSQoUSlyc3luYyAtYSBcCgpJIHdhcyBhYm91
dCB0byBhcHBseSB0aGF0IG9uZSwgYmVjYXVzZSBpdCBkb2VzIG5vdCBsb29rIGxpa2UgaXQKKHNl
bWFudGljYWxseSkgZGVwZW5kcyBvbiB0aGUgcHJldmlvdXMgcGF0Y2hlcywgYnV0IG9mIGNvdXJz
ZSBpdCBkb2VzCm5vdCBhcHBseSBjbGVhbmx5Li4uIEkgZm91bmQgaXQgdG9vIGRhbmdlcm91cyB0
byBhcHBseSBhbmQgdHdlYWsgbG9jYWxseQp3aXRob3V0IGZ1cnRoZXIgY29uc2lkZXJhdGlvbi4g
U28gaXQgZm9sbG93cyB0aGUgZmF0ZSBvZiB0aGUgcmVzdCBvZiB0aGUKc2VyaWVzOiBtYXJrZWQg
Q2hhbmdlcyBSZXF1ZXN0ZWQuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgCQkJLS1maWx0
ZXI9J21lcmdlICQoJChjYWxsIFVQUEVSQ0FTRSwkKHBrZykpX0RJUikvJChzdHJpcCAkKDQpKScg
XAo+ICAJCQkkKFBFUl9QQUNLQUdFX0RJUikvJChwa2cpLyQoc3RyaXAgJCgyKSkvIFwKPiAgCQkJ
JCgzKSQoc2VwKSkKPiAtLSAKPiAyLjMxLjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVzeWJveC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
