Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA25C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1864961216
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 19:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1864961216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACAAB61BEC;
	Fri, 17 Sep 2021 19:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEWuNTVBpFWv; Fri, 17 Sep 2021 19:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11EC160BC5;
	Fri, 17 Sep 2021 19:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED85D1BF350
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D621A404A9
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 19:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlhH28jtISPy for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 19:43:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9E9E407B2
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 19:43:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6E9595FF67;
 Fri, 17 Sep 2021 21:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631907809;
 bh=cT82jgRzIAUwLN4RQYgdFgUIy4bM5CPFXVD7J4VOJ6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tC01tZhl9JWYsj0GY8KnTIzQTLtRe1yOaeBASW4QzANttcXLIMObS/2tvokn/ZTOI
 UfDhmz//BC/2Lw58IPm6cJ5/WPIHOlBUPZuRDfiADn+jmGVJkBhfs3fOJa3big5W8P
 wdv+9/qcEZ+VVdqCd14VBmgQvvZPfK1K04y1jZ9Dp58w5sCIDo3zXMs5aCy+VK2y6D
 8rT4Xs0xkdYl13lD+kSiCc8R6Fb9Qkr1jt6CSAOzNiEsmTeP1w2VSbcg0rzvKgvYue
 Wz7umxGiyZvRJ4U+msC5ElbWJWIk9TAmmJOZ5CxHPW+PpSZN1NS8Lq1Wg05YRZhEmX
 u/Yu4YhAvJUUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 21:43:14 +0200
Date: Fri, 17 Sep 2021 21:43:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210917194314.GU1053080@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-8-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVydsOpLCBUaG9tYXMsIEFsbCwKCk9uIDIwMjEtMDgtMTcgMTA6MzkgKzAyMDAsIEhlcnZlIENv
ZGluYSBzcGFrZSB0aHVzbHk6Cj4gRnJvbTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4KPiBXaXRob3V0IHBlci1wYWNrYWdlIGRpcmVjdG9yeSBzdXBwb3J0
LCBhIHBhY2thZ2UgY2FuIGhhcHBpbHkgb3ZlcndyaXRlCj4gZmlsZXMgaW5zdGFsbGVkIGJ5IG90
aGVyIHBhY2thZ2VzLiBJbmRlZWQsIGJlY2F1c2UgdGhlIGJ1aWxkIG9yZGVyCj4gYmV0d2VlbiBw
YWNrYWdlcyBpcyBhbHdheXMgZ3VhcmFudGVlZCwgQnVpbGRyb290IHdpbGwgYWx3YXlzIHByb2R1
Y2UKPiB0aGUgc2FtZSBvdXRwdXQuClstLVNOSVAtLV0KPiBUaGlzIGNvbW1pdCBpcyBhIG5ldyBp
bXBsZW1lbnRhdGlvbiBvZiBzdWNoIGEgZGV0ZWN0aW9uLCB3aGljaCBpcwo+IGJhc2VkIG9uIGNh
bGN1bGF0aW5nIGFuZCB2ZXJpZnlpbmcgTUQ1IGhhc2hlcyBvZiBpbnN0YWxsZWQgZmlsZXM6IHRo
ZQo+IGNhbGN1bGF0aW9uIGlzIGRvbmUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgY29uZmlndXJl
IHN0ZXAsIHRoZQo+IHZlcmlmaWNhdGlvbiBkdXJpbmcgdGhlIG5ld2x5IGludHJvZHVjZWQgImlu
c3RhbGwiIHN0ZXAgdGhhdCB0YWtlcwo+IHBsYWNlIGFmdGVyIGFsbCBpbnN0YWxsYXRpb24gc3Rl
cHMuCgpGb2xsb3dpbmcgdGhlIHZhcmlvdXMgbWFpbHMgaW4gdGhlIHRocmVhZCwgYW5kIHRoZSBk
aXNjdXNzaW9uIHdlIGhhZCBvbgpUdWVzZGF5LCBJJ20gbWFya2lnbiB0aGlzIHBhdGNoIGFzIENo
YW5nZXMgUmVxdWVzdGVkLgoKSSdsbCB0cnkgdG8gc2NhdmVuZ2UgYWxsIEkgY2FuIGZyb20gdGhl
IHJlbWFpbmluZyBwYXRjaGVzLCBhbmQgbWFyayB0aGUKcmVzdCBhcyBDaGFuZ2VzIFJlcXVlc3Rl
ZCBhcyB3ZWxsLgoKU28sIHRvIHN1bW1hcmlzZSB0aGUgZGlzY3Vzc2lvbiwgdGFraW5nIG15IHBy
ZXZpb3VzIGV4YW1wbGUgYXMgYSBiYXNpcywKYW5kIHdpdGggQXJub3V0J3MgY29tbWVudCBpbiBt
aW5kIChBaGEsIHB1biEpOgoKICAgICAgLi08LS0gQSAtLTwtLiAgICAgICAgICAgICAgICAgUzog
c2tlbGV0b24KICAgICAvICAgICAgICAgICAgIFwgICAgICAgICAgICAgICAgRjogdGFyZ2V0LWZp
bmFsaXplCiAgICBTIC0tPC0tIEIgLS08LS0gQwogICAgIFwgICAgICAgICAgICAgICBcCiAgICAg
IGAtPC0tIEQgLS08LS0tLS08LS0gRgoKIDEuIElmIEMgb3ZlcndyaXRlcyBhIGZpbGUgZnJvbSAo
ZS5nLikgQTogd2UgZG9uJ3Qga25vdyB0aGUgb3JkZXIgaW4KICAgIHdoaWNoIHRoZSB0YXJnZXQt
ZmluYWxpemUgd2lsbCBjb3B5IGZpbGVzLgoKICAgIC0gd2UgY2FuIGd1YXJhbnRlZSB0aGF0IG9y
ZGVyaW5nIGJ5IHRha2luZyB0aGUgZGVwZW5kZW5jeSBjaGFpbiBpbnRvCiAgICAgIGFjY291bnQg
d2hlbiBkb2luZyB0YXJnZXQtZmluYWxpemUuCgogMi4gSWYgQSBhbmQgQiBpbnN0YWxsIHRoZSBz
YW1lIHBhY2thZ2U6IHdlIGRvbid0IGtub3cgd2hhdCB0byBwcm92aWRlCiAgICB0byBwYWNrYWdl
IEM6CgogICAgLSBhZGRpbmcgYW4gYXJ0aWZpY2lhbCBkZXBlbmRlbmN5IGJldHdlZW4gQSBhbmQg
QiBpcyBub3QgYWNjZXB0YWJsZSwKICAgICAgb3Igd2UgY291bGQgZW5kIHVwIHdpdGggYSBsb3Qg
b2Ygc3VjaCB1bm1hbmFnZWFibGUgZGVwZW5kZW5jaWVzLAogICAgICBub3QgZXZlbiAgYWNjb3Vu
dGluZyBmb3IgcGFja2FnZXMgaW4gYSBicjMyLWV4dGVybmFsIHRyZWU7CgogICAgLSBpZiB0aGUg
ZmlsZSBpcyBhIERCIChsaWtlIHRoZSBHTlUgaW5mbyBEQiksIHN0dWZmIGlzICJhZGRlZCIgdG8K
ICAgICAgdGhhdCBEQjsgb25seSBwcm92aWRpbmcgYW4gYXJiaXRyYXJ5IHZlcnNpb24gb2YgdGhl
IGZpbGUgKGZyb20gQQogICAgICBvciBmcm9tIEIpIGlzIGluY29ycmVjdC4KCiAzLiBJZiBhIHBh
Y2thZ2UgaW4gdGhlIEMgZGVwZW5kZW5jeSBjaGFpbiAoQyBpbmNsdWRlZCksIGFuZCBwYWNrYWdl
IEQKICAgIGluc3RhbGwgdGhlIHNhbWUgZmlsZSwgdGhlbiB3ZSdyZSBpbiB0aGUgc2FtZSBib2F0
IGFzIHRoZSBhYm92ZTogd2UKICAgIGRvIG5vdCBrbm93IHdoYXQgdmVyc2lvbiB0byB1c2UgaW4g
dGVyZ2FldC1maW5hbGl6ZS4KCklmIEkgbWlzc2VkIHNvbWV0aGluZywgdGhlbiBmZWVsIGZyZWUg
dG8gY29tcGxldGUuIDstKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
