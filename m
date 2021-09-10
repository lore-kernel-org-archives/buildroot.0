Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E495CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885576120A
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 885576120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5303840678;
	Fri, 10 Sep 2021 21:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAps9CnefOpK; Fri, 10 Sep 2021 21:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76A52404E1;
	Fri, 10 Sep 2021 21:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67EE31BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 565F284ABD
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlujggCO2V6L for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A753182EB5
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F1AEC20039F;
 Fri, 10 Sep 2021 23:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631309693;
 bh=iZdue2yjUu76ZQ8gFvPr+iq/QJgRokVnJP3agLZ3fDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lgolva8W7X+d7SJzqDr9kLnJs9rWLh93Cq/WYhQqO1QoCaOufH90AzH/dNJYAypNI
 zZbS/9kIqyYgFuJ+C94KcroYB4OJ6tVYI4gUnBA8x1Co+EWX/eITh34YA+rSCBo7K9
 0RBDpNt4WM7JfKGnpf3riGHNbU4bYuXTvdLTV3SQUaFaGFvGA58f+MqzxdrTLIUbXR
 6GuiIoTG342gbSDpGz+IREhVDzpe4wjnWF3GNPR7cBh5k0p0qAe1A+Fa1OOlUkmuZE
 OMCK7GU2hy5pgWBZgk432WARHuRpcbGBU0/ZedyzrcZrmjpKVzjQebD4NXo61hbdyv
 9KshNStXbVY7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 23:34:46 +0200
Date: Fri, 10 Sep 2021 23:34:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20210910213446.GG1053080@scaer>
References: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210908145526.3543-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5] package/bayer2rgb-neon: update URL in
 Config.in file
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMS0wOS0wOCAxNjo1NSArMDIwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IFRoZSBVUkwgcG9pbnRpbmcgdG8gcGh5dGVjLmRlIGlz
IG9ic29sZXRlIGFuZCBub3QgZXZlbiB1c2VkIGJ5Cj4gQnVpbGRyb290Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KClNlcmllcyBvZiA1IHBhdGNoZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJl
Z2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2JheWVyMnJnYi1uZW9uL0Nv
bmZpZy5pbiB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmF5ZXIycmdiLW5lb24vQ29uZmlnLmlu
IGIvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4KPiBpbmRleCBlZDA2NWMxZWQ3Li44
ZmQxOGI0ZmE5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYmF5ZXIycmdiLW5lb24vQ29uZmlnLmlu
Cj4gKysrIGIvcGFja2FnZS9iYXllcjJyZ2ItbmVvbi9Db25maWcuaW4KPiBAQCAtOSw3ICs5LDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX0JBWUVSMlJHQl9ORU9OCj4gIAkgIHRvIGRlY29kZSByYXcg
Y2FtZXJhIGJheWVyIHRvIFJHQiB1c2luZwo+ICAJICBORU9OIGhhcmR3YXJlIGFjY2VsZXJhdGlv
bi4KPiAgCj4gLQkgIGh0dHBzOi8vZ2l0LnBoeXRlYy5kZS9iYXllcjJyZ2ItbmVvbi8KPiArCSAg
aHR0cHM6Ly9naXRsYWItZXh0LnNpZ21hLWNoZW1uaXR6LmRlL2Vuc2MvYmF5ZXIycmdiCj4gIAo+
ICBjb21tZW50ICJiYXllcjJyZ2ItbmVvbiBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyssIGR5bmFt
aWMgbGlicmFyeSwgZ2NjID49IDQuOSIKPiAgCWRlcGVuZHMgb24gQlIyX2FybSAmJiBCUjJfQVJN
X0NQVV9IQVNfTkVPTgo+IC0tIAo+IDIuMzIuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
