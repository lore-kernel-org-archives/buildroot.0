Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9357C79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 18:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C05580CD4;
	Tue,  8 Sep 2026 18:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uDhmfDHX_8N; Tue,  8 Sep 2026 18:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4475C80CA8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788890900;
	b=FNdiTy1EjlzddYKmjg5gnILs4ShDstH+U4ewkM0uyB9nRyxmZZO6c6ersZm0JrCQvoYi
	 JuOmY4Nm1c0OYi62usyAp4f1whzkg7oH49Kf4GeOl1pmp5jKMcxViUO9LoupJSsvVRFbh
	 Tcw1d9yvvJvzTgUd1lKIMcBNrJYmyrYOf7/G+PlT7NphM8s9xPVIrI4ihL/nClr/usGgF
	 X2cAjohOEeEMCP/Q9L+lJS1tqvJ/GCtIxGkA1EFRMqHSSSYNkocOcuZADLRFvLZ2ma/zD
	 Ih2i6msIKTvC6u8Cw/W1gWoT4R8gZW0RPRxLWIaLp+X9sLxxmr5qPvEhxIv7fBqByAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788890900;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Date:To:Cc:Message-ID:In-Reply-To:References:Feedback-ID:
	 X-Pm-Message-ID:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=AGcXWJjGqEqxHAuH15IUukgdfEd5D0/bRQiqDNZdhms=;
	b=K/Bx2/XETNr2GSgvBn6MN8fQv1D0YvtiNirkzvX8lgS2K7IrjoF1p+EF0p2JRxs/NiCS
	 6lv2kM/0VzMqQyRRML/dEAEX345dg83D5PeIYAx3Dr7hXire0GoD+3bfVCtKYOTIemjFU
	 9i7foMnkJYD6YTW/mS0V3yX4/YTxAmN/PEGzXtq/iZ1H2qV2CElV2B1XPl9Sxa4uXejkP
	 Zpa9ajptYHsVmx2HkT4hRfMpdqfwZBTUqgmuPPPymbAM1VYNJQnX45Va4zbog9Lklcs6L
	 xP0KUMZ/JsPlRRbRM8MBGgY9BjlwBPtSNeIw51ogd2kmyZ2MjDm0LdvrUiqdcuXIVSg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788890900;
	bh=AGcXWJjGqEqxHAuH15IUukgdfEd5D0/bRQiqDNZdhms=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SJpkcluo0HgsjtrwuUXqasCauJEOq09tuctnvWb2gEHmFc6isFqyyaRTyy3N4MQwj
	 k3WSX2fLbvQ8fvC2h6f+lZwytZ5vn4yLJMsbh7Xx5T1aXSDJw8f3ESuTmNA3bzffuZ
	 zFd4jySWa07/iytUjZl8r9kQ+oyzlQoJV21g5qobqwF8BsZ5rxhGwvJ1qbwQRNypZP
	 Ftsa2xGMbc8VCRG6WPHkxWy8pA4qLWjgJQaJ+lmDKQKlBCZ1+jVpQ83hB+kgA9DtWo
	 toYBUSXgnL/goUBlm2982sISNgFb59pW5ylEMAUtJnXXy0KihIQQMaohr5GoScrv7o
	 U3UvxdYkYf+3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4475C80CA8;
	Tue,  8 Sep 2026 18:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 633F8268
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 18:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5420E40681
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 18:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toe02NbPBcoO for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 18:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AA0DC40670
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788890896;
 b=oIzXxsEYOK94uE5SI6Ou8EPTn9fio0e+FDkQy8NWiX/a+pvA688DWt/1JqocHOzPzcxu
 5SHDk39gBK3Re6JNozIFBrEaoVDzVeRdE6e5NSPQ2REbfz0tI62HuZDqtC2QnfD2IzDBF
 oQUb+erFG3tJB0yB3iQ/BGxaSUpYIEeg5bESflYgDIBUFfveVfvRSIw1xHzCG5uCYvNHK
 UYeFg64LoEHcv0dzMSkFBkkmLUefGpC+tW3zvhvDDHA1M7mYzGIXXzbz+zxnsxGKj75/K
 3ahUJRYnWhcxpThJ3LtaUmG0nfYZsyOQGsqKtpFmw76BUHwY6aQ3lKOCDBB+HcJ6TQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788890896;
 h=X-Greylist:Received-SPF:DKIM-Signature:Date:To:From:Cc:Subject:
 Message-ID:In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=BrRqGgXsThkLPkyL7ySN3cjCYNJSlHVD6wUSbtMcJrQ=;
 b=UR6kimyoMuh/VEc89M94PSCYIW4Cy11n0w30iw0G8EZgz+I2hLqxRmwgGioLe8CZHAOF
 DvRDnW22IiOw1gmxpOUeQdX5DSrd+RLItVx7AKi5aELcjRdYxpiF0VYpmIs+Z7iDPdhph
 g35k5pSCGTKWDjjEwa/kWZbLlrcuMUXtlhiUniw3fj5r+hKIf969/w/DldxuRTT4c7FqV
 KMwZn/4N941KOpaJC96vpIOngsZnLkklMd8+sqZuu+Bu29lEGTnKcl2swHxpiHUzRwAiX
 TrUyXirU4j5bS0HDliOdpYz3Hd3VwRmTgnc9FNnqEPY/bd/eYEG9Rj4MEX+A/TZZncA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=protonmail.com; 
 dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail3 header.b=vewbw6YK; 
 arc=none smtp.remote-ip=79.135.106.109
X-Greylist: delayed 557 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Sep 2026 18:08:16 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.135.106.109;
 helo=mail-106109.protonmail.ch; envelope-from=benjamin8532@protonmail.com;
 receiver=<UNKNOWN> 
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA0DC40670
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 18:08:15 +0000 (UTC)
Date: Tue, 08 Sep 2026 17:57:37 +0000
To: John Ernberg <j@j-ernberg.se>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <eteXMUrQDkYrliOFiQQJe0RjiY0NsuvjHjvhMZbaLDtXfgf1YML1TKd1ZOZyLT6TlecNjLt3wAV5zSoTqBgQ9TlNi98Pm6FV8P1GZnq1pU4=@protonmail.com>
In-Reply-To: <CAAHg4ZiXTMa0+QeA0EpiZQsZ8DHgqPMmg+X46asS9wtFLt1SZA@mail.gmail.com>
References: <FfB4hHudSTlCrinyaiQWX0uqh2zlb_Fvqiegzc40Se7JoDDmmXXNpHJlJZvW89FZNi2ymPJRnsaHWAv6IJhOnHqfEfRNfPPvso_7mMTOi9Y=@protonmail.com>
 <CAAHg4ZiXTMa0+QeA0EpiZQsZ8DHgqPMmg+X46asS9wtFLt1SZA@mail.gmail.com>
Feedback-ID: 216224038:user:proton
X-Pm-Message-ID: 0b890c0392db52e469084c1f7c5c6d2425cfdac4
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/usbip: use kernel source when
 available
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
From: Benjamin DeCamp via buildroot <buildroot@buildroot.org>
Reply-To: Benjamin DeCamp <benjamin8532@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9obiwKClllcywgSSBkb24ndCB0aGluayB0aGF0IGV4aXN0aW5nIGNvbW1lbnQgaXMgYWx3
YXlzIHRydWUuIFRoZSBwaW5uZWQga2VybmVsIHZlcnNpb24gYXBwcm9hY2ggdXNlZCBiZWZvcmUg
dGhpcyBwYXRjaCBjYXVzZXMgdGhlIFVTQklQIHVzZXJzcGFjZSB0b29scyB0byBiZSBvdXQgb2Yg
c3luYyB3aXRoIHRoZSBrZXJuZWwgZHJpdmVyLiBJIHRoaW5rIHRoYXQncyBiYWQgcHJhY3RpY2Ug
aW4gZ2VuZXJhbCwgYW5kIGluIG15IGNhc2UgaXQgY2F1c2VkIGEgcmVhbCBwcm9ibGVtOgoKV2hl
biB0ZXN0aW5nIGEgNy4yIGtlcm5lbCBidWlsZCwgIlN1cGVyU3BlZWQgUGx1cyIgVVNCIGRldmlj
ZSBzdXBwb3J0IGhhZCBiZWVuIGFkZGVkIHRvIFVTQklQIGluIGtlcm5lbCA3LjEuNCwgYnV0IGl0
IGRpZG4ndCB3b3JrIGV2ZW4gaW4gNy4yIGJlY2F1c2UgQnVpbGRyb290IHdhcyBidWlsZGluZyB0
aGUgVVNCSVAgdXNlcnNwYWNlIHRvb2xzIGZyb20gdGhlIHBpbm5lZCA2Lngga2VybmVsIHNvdXJj
ZS4KClVzaW5nIEJ1aWxkcm9vdCdzIGxvY2FsIGtlcm5lbCBzb3VyY2UgZGlyZWN0b3J5IGZvciB0
aGUgdXNlcnNwYWNlIHRvb2xzIGtlZXBzIHRoZSBkcml2ZXIgYW5kIHVzZXJzcGFjZSB0b29scyBp
biBzeW5jLCB3aGlsZSB0aGUgcGlubmVkIHZlcnNpb24gcmVtYWlucyBhcyBhIGZhbGxiYWNrIGlm
IG5vIGtlcm5lbCBpcyBiZWluZyBidWlsdC4KClRoaXMgYWxzbyByZWR1Y2VzIHRoZSBvbmdvaW5n
IG1haW50ZW5hbmNlIG9mIG5lZWRpbmcgdG8gdXBkYXRlIHRoZSBwYWNrYWdlcyBwaW5uZWQga2Vy
bmVsIHNvdXJjZSB3aGVuZXZlciBhIG5ldyBmZWF0dXJlIGlzIGFkZGVkIHRvIFVTQklQLgoKVGhh
bmsgeW91LiAtQmVuamFtaW4gRGVDYW1wCgoKT24gRnJpZGF5LCBTZXB0ZW1iZXIgNHRoLCAyMDI2
IGF0IDI6MzcgUE0sIEpvaG4gRXJuYmVyZyA8akBqLWVybmJlcmcuc2U+IHdyb3RlOgoKPiBIaSBC
ZW5qYW1pbiwKPgo+IE9uIFR1ZSwgU2VwIDEsIDIwMjYgYXQgMTE6MTHigK9QTSBCZW5qYW1pbiBE
ZUNhbXAgdmlhIGJ1aWxkcm9vdAo+IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4g
Pgo+IENhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQgdGhpcyBoZWxwcyB3aXRoPwo+Cj4gPiAgIyB1
c2JpcCBpcyBub3QgdmVyeSB0aWVkIHRvIHRoZSBrZXJuZWwsIGluIGZhY3QuIEl0IGlzIHByZXR0
eSBzdGFibGUsIEFQSS13aXNlLAo+ID4gICMgc28gd2UgY2FuIGp1c3QgdXNlIGEgcmVjZW50IGtl
cm5lbCB2ZXJzaW9uLgo+Cj4gQmVjYXVzZSB0aGlzIGNvbW1lbnQgaGVyZSBzdWdnZXN0cyB0aGF0
IHRoaXMgaXMgbm90IG5lY2Vzc2FyeS4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
