Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9C5CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 20:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DCFA4052B;
	Sun, 11 Oct 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9gw9OP3brtk; Sun, 11 Oct 2026 20:58:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 560584053A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752329;
	b=QkuOpSRexbC7eB1KT/yXf6I/lt4mjbfvQDxCOGsc+lC7t2YzgPZCnSxRdOUFKUaIa5pC
	 UDyNRjJguw1eC6mK8fFAEPReSuijKckhjxHMXeTjRVq4pxOS5wmGv4eg6yB9QsX6hNc3i
	 tVLixs1bKcXVwygXfGwhqOa9CHWu1hiYEHmj5DnpFnIKuT+alHsbJLjps7Eltx8VKANj0
	 hRpWXC2vKhxyIH1sHir979kXzrNUj8shkoWdPg+iTz3WxDp52DiJioXcXD/HsrRS7xtWx
	 qwBN4qDwZFr6OrIAm22dzMTGhn/Yf3nAGtF7J62f+ib/uWThlJjqab0jOZDdgmlA+Zw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752329;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=/reDxuT4/6e5xa6zBp7weGadh6zikRbyhDjc24b+/x4=;
	b=akt0DURIUiX1rr1o5BmEJzdgqdtLxbGfSc3v4C9nhZ/qd/SgQ4hG2yYWMCx+doyKmhPS
	 5owSEC2n7/I8tZmC5NCRefvfopUVLzKq+E7rqsLKz5N4zleuSjAl3v8Eg8z5ekdHebu9z
	 dJZVElGldxx+w06zNUbTZ4jBPi2ZBneiBf+IrVOwr4bHWhKxZSpdXvVGKxEOqO6ataQ/H
	 4+eHQ8/bcuM0tpiw76Tl3dvMv/mDDRzPCZPt99/CLI/PfjWiP0CDVWK2mNAUygZzmKSlW
	 YOlt/MEscaBHv9LAUpAKbF21mJ4c7uAUrbJHeBSE2UdbeM7xetOH//vtJ/PSgHQuXkQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752329;
	bh=/reDxuT4/6e5xa6zBp7weGadh6zikRbyhDjc24b+/x4=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l2LgzJJIZbYNiH/IOjoDgVw2Z1pogczFOd9WJLwkaJLiL3wUnruoYx+3a70SyCOQX
	 KiUCQumjSvxGtcW0TLLyJlcV+4CSrkrK319PdqWAakckEhNsZWNga/wIluWkvQBNjy
	 S+GRkLuqBNlUPpJ9s/wbwPyOzhdubQ8UjPXq6jX8yZ5vSxYa87Poy2ha5xtUWx+VOQ
	 xffy0VNkd6N5aokWfolwRpVUHkE2crOZFGzv6sOr9Wvub6El+rzIZPsLvLnJX1b4mI
	 XIhCwN1Lgk4EndoKCK/9f3opHfEZIgloSoAkNPecJ2fjkQsyDyImyHm2wVoOAzB+QQ
	 TbfWuN0g4v9Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 560584053A;
	Sun, 11 Oct 2026 20:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B12102E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 972F480BCD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QLuC47DLn1nN for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 20:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA60480A65
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752328;
 b=JCpHSBruYcwmnxsBRSYkr12+BN3k4cL7YGFHLWU5PhCbsK4DIexPi1mzIYqL5ocopJlw
 TKcoOQ59VOtvgbkgOrGTI2u8wT+zr7FUK3exgALVswd64zqw+VES1pncxpe/yTMbLUu3L
 ktQc0FVMsb4Ho4bxVDmDcLhiyh2c+crSvw4NnK32DrSTfRTth5hnEsCFEetRRA/lrlCzq
 Gv6ATJUtAYhwB4AQAh5/ZmgzaED/xTDjD+yL46uw6S+veKptXrdbvHroTYAMOEu5udUk7
 gPg6WDEvl/oL+D8KIh7MuJZByusyZRsnRzCwmNRDsJTzqC3NNZUUyjZne3wvCD2hrFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752328;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=/OFZe6BjEOOKir587ZBg4VkEJ9mj0fS0fUoC8YzHTko=;
 b=iwY+sreDcDWBQYFq4+7qussJveOzVNEa8Wjk+19pHpOsdmVmH6GWdFGOXoZbYgtOYJ2C
 RqZNrvQ4fUBg4st9jmxyz/K7hjX1aL0MHOxKDSrx/H3OT3D15KgcQ+ArDk89GznHAvX3w
 rb2CDl1Fos4wDUKXgKqtXa95cg15Dkc+CbO+X/VSEojegSEH7kKMtKqEV4swvmkuoE1+3
 QVqweElimt11BHylz5fbZTYezZN3+piOIXn5IlPhvVtlTVT2sqaKqGSMsn4vdkYxN6dkx
 +Wh8QJyHZROC7tMiIij5BzoEYcmh5LKi9j/QJWrPv8n2YkMGNuyr8J7115s3I1kXqMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JBzS0eT6; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA60480A65
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 20:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B412B97A16B; Sun, 11 Oct 2026 22:58:43 +0200 (CEST)
To: =?utf-8?q?Konrad_Vit=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Cc: =?utf-8?q?Konrad_Vit=C3=A9?= <konrad.vite@cherry.de>
In-Reply-To: <20260112142524.82048-1-konrad.vite@cherry.de>
References: <20260112142524.82048-1-konrad.vite@cherry.de>
Message-Id: <179175232232.258080.751184892582244472.b4-ty@b4>
Date: Sun, 11 Oct 2026 22:58:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: add
 'no-tls-deprecated-ec' configuration option
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

T24gTW9uLCAxMiBKYW4gMjAyNiAxNToyNToyMyArMDEwMCwgS29ucmFkIFZpdMOpIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gQWRkIG9wdGlvbiB0byBkaXNhYmxlIHN1cHBvcnQgZm9yIGxlZ2FjeSBU
TFMgRUMgZ3JvdXBzIHRoYXQgd2VyZQo+IGRlcHJlY2F0ZWQgaW4gUkZDODQyMi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEtvbnJhZCBWaXTDqSA8a29ucmFkLnZpdGVAY2hlcnJ5LmRlPgoKIEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MhCgogUmVnYXJkcywKIEFybm91dAoKPiAtLS0KPiAgcGFja2FnZS9s
aWJvcGVuc3NsL0NvbmZpZy5pbiAgICAgfCA4ICsrKysrKysrCj4gIHBhY2thZ2UvbGlib3BlbnNz
bC9saWJvcGVuc3NsLm1rIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuc3NsL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
bGlib3BlbnNzbC9Db25maWcuaW4KPiBpbmRleCAwM2QzZGVmODAyLi41NTNmMWIyMTlmIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbGlib3BlbnNzbC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2xp
Ym9wZW5zc2wvQ29uZmlnLmluCj4gQEAgLTIyOSw0ICsyMjksMTIgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0xJQk9QRU5TU0xfRU5BQkxFX1NTTF9UUkFDRQo+ICAJICBCdWlsZCB3aXRoIFNTTCBUcmFj
ZSBzdXBwb3J0LiBEaXNhYmxpbmcgdGhpcyBvcHRpb24gbWF5Cj4gIAkgIHByb3ZpZGUgYSBzbWFs
bCByZWR1Y3Rpb24gaW4gbGlic3NsIGJpbmFyeSBzaXplLgo+ICAKPiArY29uZmlnIEJSMl9QQUNL
QUdFX0xJQk9QRU5TU0xfRU5BQkxFX1RMU19ERVBSRUNBVEVEX0VDCj4gKwlib29sICJlbmFibGUg
bGVnYWN5IFRMUyBFQyBncm91cHMiCj4gKwlkZWZhdWx0IHkKPiArCWhlbHAKPiArCSAgQnVpbGQg
d2l0aCBzdXBwb3J0IGZvciBsZWdhY3kgVExTIEVDIGdyb3VwcyB0aGF0IHdlcmUKPiArCSAgZGVw
cmVjYXRlZCBpbiBSRkM4NDIyLiBEaXNhYmxpbmcgdGhpcyBvcHRpb24gbWF5IHByb3ZpZGUgYQo+
ICsJICBzbWFsbCByZWR1Y3Rpb24gaW4gbGlic3NsIGJpbmFyeSBzaXplLgo+ICsKPiAgZW5kaWYg
IyBCUjJfUEFDS0FHRV9MSUJPUEVOU1NMCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbnNz
bC9saWJvcGVuc3NsLm1rIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKPiBpbmRl
eCAyOGRjYjlkZmMyLi5lN2FjY2Q1NjllIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlib3BlbnNz
bC9saWJvcGVuc3NsLm1rCj4gKysrIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsK
PiBAQCAtMTIwLDYgKzEyMCw3IEBAIGRlZmluZSBMSUJPUEVOU1NMX0NPTkZJR1VSRV9DTURTCj4g
IAkJCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9TSVYpLCxuby1zaXYpIFwK
PiAgCQkJJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1NNMl9QUkVDT01QX1RB
QkxFKSwsbm8tc20yLXByZWNvbXApIFwKPiAgCQkJJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5T
U0xfRU5BQkxFX1NTTF9UUkFDRSksLG5vLXNzbC10cmFjZSkgXAo+ICsJCQkkKGlmICQoQlIyX1BB
Q0tBR0VfTElCT1BFTlNTTF9FTkFCTEVfVExTX0RFUFJFQ0FURURfRUMpLCxuby10bHMtZGVwcmVj
YXRlZC1lYykgXAo+ICAJCQkkKGlmICQoQlIyX1NUQVRJQ19MSUJTKSx6bGliLHpsaWItZHluYW1p
YykgXAo+ICAJCQkkKGlmICQoQlIyX1NUQVRJQ19MSUJTKSxuby1kc28pCj4gIGVuZGVmCj4gLS0g
Cj4gMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
