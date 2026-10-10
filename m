Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B26DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD816064D;
	Sat, 10 Oct 2026 15:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeLz__oeBBBa; Sat, 10 Oct 2026 15:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03CFF60662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645433;
	b=AtnmtnEKP4wKvNazCcwGlUpL7qmV1eabl6rBilFqLkZHTNmIZtZXUh3QdWggFQtDz7PL
	 C7O3vtwfFdk0GVGAbZsQ8NFnaLAbJ7sZPdvFUKawvtn52YrQKG2/ny0uJSe50g42hludv
	 4JnnsMm5+hJUtDfTB7EHaWGoPaMH8jH/jXnJG4hm15LqrG9wdECT0Ltp7lz+IrK6sfMEL
	 2kGqj7EV0KfvLlMb0FWz6BKNqVd4FRIZ+IbykN9YzqwrlJVCaGZNVIxXlVCY+1TGILbDp
	 5qVa80AcWGZqJCfTbb4YcaT1X0tlKSo6dS3IZQpW3nsgHYLW51m/tTAshbuRqmBR4ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=uZf1B8GuLPGV0UfhceP/swKOiypkfMqkCAcJRXJ1HaQ=;
	b=WtKqNyfi22qhiRuWvC7xtdmAAGBDXfk/qgpD6TzZxM21IMz4wv+Uw16OCvPEqsizpA9k
	 mb8bnreDQuSLZO25EOS9apLAKsaV87k/pGku4Y480ryJN7FLW61AfhEWiIPugywKtHLB+
	 ugKUFQVLLvtA24265Esm3MCBN0Eerg36/BreXmu4EYvpbqibnzq87CZ/DOlBL67QfCCec
	 ABJI8C2C8Zjyqs35wUulF2CW14KbtvAs7nPLws5cPiPqb8sSkgMYJI8oU6j1jp8BhSWjc
	 hoo0UkGIV1SWAaGIHFN2GALpm7+wDXlAGKbEN/CbCDXBWa++EU9lHqlGBoY3NBUNvug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645433;
	bh=uZf1B8GuLPGV0UfhceP/swKOiypkfMqkCAcJRXJ1HaQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lTkk7ssAObEu8I8qrlKL4TkQsBHgpCaECUS6LzTfDc/Ul0csj1muqQcQ9W0H93i6k
	 ah6t3W5FaEs8OJhgqhiGmwdDVGSOzObD6QjMyTN6ZGGCb/8XHtzeeI27I4kIRCXLYq
	 qMj2LrpdASXS8FsbW5BcM5qvGvB8MrMoF1Bhso3gkRl/OPXZJUk47JTOq1U3Ww7bOC
	 M6UpIpcrv3Os0DBEBDr2nOylP+VHLSq9Fsq7VAR3Pl/PVxM0QzJ0xdd8P9w3j1ML2g
	 XJGpIwh8cDC1WBNf4nOg75LF0rKv4MpFEqeyLtlEYCz/FnA6RIuwdMVUI4aE6IMNqm
	 ZF4q9kvrGxFrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CFF60662;
	Sat, 10 Oct 2026 15:17:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6332F105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5474460662
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7lKunvepx6h for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:17:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6ADA96064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645430;
 b=kAL1Gbf53ZVHy85d3ZPFqQPL98haGdk3cK28QjHswzXkZvUa7bSkarGgAUH6z1AkDLNH
 oUErVORVZsKmfK88kcqbKl3dv/fgwmr2m8K8hbfmnu85DwE3g24jQt1izTmXnGnoNdSl3
 2FXr6sInAwrr3hPblitmQCuFQBu0YEisNK8K+Iz9JOzUbsBKNYPibUbU5s7vmhXYDxRDb
 qTrBHRBOIyk161Ou37JsKdZDGhMvrZFG1740wSt19cYMcKkZp98zhQDF3KuxaCPWGmQhf
 c7SoZx1iBIMQ/cccHdDZQk9yYjjhljVe60kHviypdHXpDIJoTsZMSrUGdEDxHgHGwEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645430;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=XU/kHZ0JsisDr9UR7NYJvI7EwNWcwQSxdjifQlqOdVU=;
 b=bqHtTKB4pndE+/eCbk6XcLQfhMbq6vUdGT4e/4QpsbcvJCBDmluS5P18ghxdGyJA2lde
 XvIW+K1KYJybcmHigLXUyMeEfONnH1Kp3ulGdT/WJFNbejEhOx4YPlCSkYyveejDfgUTR
 lZLjE6098dejzxxRC8t1R4SsXG8ZYr3AQAjQO1AlSG8LwmDr38hOTL+kbFbb2LTMTQmUi
 O7aKggQ1tw0lyWJLAZXJ4zIxMYE9Zy8y2tiYKSF8J63UJJjVZkIeL6rzsmjlydfXPlEvO
 KMzRjkJLnRdnNVVQCMngB8Uj4XR5fZ2AUh/yV3TMya+/Q3YvTu3TVXvmtmRZio1cCcw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=H6zTW2lL; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ADA96064D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:17:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD622B97A134; Sat, 10 Oct 2026 17:17:03 +0200 (CEST)
To: buildroot@buildroot.org,
 =?UTF-8?q?S=C3=A9bastien=20Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Oct 2026 17:17:00 +0200
Message-ID: <179164531733.132027.9861630720533363662.b4-ty@rnout.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260612121516.1634-2-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
 <20260612121516.1634-2-sebastien.guillaume@vendeeconcept.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/11] package/gawk: add CPE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxMiBKdW4gMjAyNiAxMjoxNTo1NCArMDAwMCwgU8OpYmFzdGllbiBHdWlsbGF1bWUg
d3JvdGU6Cj4gRnJvbTogU2ViYXN0aWVuIEd1aWxsYXVtZSA8c2ViYXN0aWVuLmd1aWxsYXVtZUB2
ZW5kZWVjb25jZXB0LmNvbT4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGllbiBHdWlsbGF1bWUg
PHNlYmFzdGllbi5ndWlsbGF1bWVAdmVuZGVlY29uY2VwdC5jb20+CgogQXBwbGllZCBzZXJpZXMg
dG8gbWFzdGVyLCB0aGFua3MhCgogSSB1cGRhdGVkIGFsbCBjb21taXQgbWVzc2FnZXMgd2l0aCB0
aGUgcmVzdWx0aW5nIGZ1bGwgQ1BFIElEIGFuZCBhIHJlZmVyZW5jZQp0byBhIENWRSB0aGF0IHVz
ZXMgdGhhdCBDUEUgKHdpdGggYSBkaWZmZXJlbnQgdmVyc2lvbiBudW1iZXIgdXN1YWxseSkuCgog
UmVnYXJkcywKIEFybm91dAoKPiAtLS0KPiAgcGFja2FnZS9nYXdrL2dhd2subWsgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9n
YXdrL2dhd2subWsgYi9wYWNrYWdlL2dhd2svZ2F3ay5tawo+IGluZGV4IGZiYjYyMGJlN2QuLmM3
YmU2M2E2NjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nYXdrL2dhd2subWsKPiArKysgYi9wYWNr
YWdlL2dhd2svZ2F3ay5tawo+IEBAIC0xMCw2ICsxMCw3IEBAIEdBV0tfU0lURSA9ICQoQlIyX0dO
VV9NSVJST1IpL2dhd2sKPiAgR0FXS19ERVBFTkRFTkNJRVMgPSBob3N0LWdhd2sKPiAgR0FXS19M
SUNFTlNFID0gR1BMLTMuMCsKPiAgR0FXS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtHQVdL
X0NQRV9JRF9WRU5ET1IgPSBnbnUKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCU0lHU0VH
VikseSkKPiAgR0FXS19ERVBFTkRFTkNJRVMgKz0gbGlic2lnc2Vndgo+IC0tIAo+IDIuNDcuMwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
