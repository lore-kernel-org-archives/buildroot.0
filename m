Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD6DCA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5581281108;
	Fri,  2 Oct 2026 19:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTzXfj1LZ8uo; Fri,  2 Oct 2026 19:13:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6CEF880EFA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790968409;
	b=sZZ98AXPiadbKV+h2dPkB60fXy2FIzeoyQZLvq1k8E/nja3GZd3aeLpuQfFMGgswGYK7
	 ISqQAH0kEuhXYnmxH+17beiPMhj1zPb+N5MhcNSjV9HhpAPocP6//7tLMJwegNZ9mrrWt
	 2za1FB4TqfnPVLNiVF1wxvItxfuzPdwl35luVa7VJUuMlDuw/SlOnyMDoxOYD3g7hz+IJ
	 uL2NkHPfdpgop4Z2QFeioA5+JtphU9tMdUODQSAAJHcERZ0A+ATYT7p9AmkYhXEvqWdTB
	 sMIkeSIWpLIaob/B37QimUNNgO6FgmJi0JULHCLwM/c4/29Xi97jIRFZSM9GcdbHn5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790968409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 In-Reply-To:References:Date:To:MIME-Version:Message-ID:User-Agent:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vvc4UgwwNjSrO1e6sxCAqwThd+x3hzBxqbaVyKFaJ6k=;
	b=otjTS3WITWAp7LQ44aVy7V/3SilMGtF0k8SSNZ5Hjra1ob5ZBMbIHK+rDbRWhz1MJG73
	 ELhA+bVO6ViRcsWtIDUVE30USBe1WgA1qHljXI4Z2O2xe3Bx9hglBNnfU3VGxjB53KG5X
	 VEQbhkXd2c01VKuYyyZDBnBZNMWj+AcVazGSiGzvHNPGRtZIAPlbNNm6EVxsEf3SQnpwx
	 BLepq+Oz4dwnuqi+AnEqHbEZNpJYsrp/3hxHaJ+FBpVn3B6CHHKoV/4FRA7y6JLXEHNi6
	 m0EgPRKvYnfu7O3+SNdvBLRMJ8wmLDBql6XyK1NVlsfVY64SYZDr4nFhrx7cBDS4Pfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790968409;
	bh=vvc4UgwwNjSrO1e6sxCAqwThd+x3hzBxqbaVyKFaJ6k=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=V6DaY24FFR9sohN3uO8Y2l13Nic4DSFySlw/xY/Ao+9n7YAOiGyqWG5wmfxcAY61I
	 U1ta5UrimJd6d80I637KX7CCM+S8VJEXKmEUD2EEEtpnxhCr+uK7Pp+5hbVJu2c/0L
	 KG8gdPqSCKRRoBf7o60QXOMN5ivgVR7M4EEPrM9tEx/BDIuvkYI9lG+IqtnFQql3bq
	 Fz1nMCtZlqWFK7H1Ysk/WpOgnqcuxUgrSdOp13/UYR8irhmB/2dk7jwzB7d+tqDO2D
	 3PiTTPWRqw3kGtlw8RDN/jWProjTj3wAew/pegnObdtt61pufBOHSeMxCoMl/c+ddu
	 zk+xYJlsvGpxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CEF880EFA;
	Fri,  2 Oct 2026 19:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E918282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34CF560BC0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYTn4gY1qBMA for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:13:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD14E60894
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790968407;
 b=fvnmAFIE02pzGmsGzoS19qJHiMAXzneWSNn864TZifdyj2eRpkZE8PUHP5vP1uNe9paN
 k/Vk6JkLvvzwYMb0GfBDqPqHl85m0v8YKkVsbwaiGfOJx4oGYy+73CZL4PYVJMyd2Dbue
 vPKSTeIo5AQCI51KoGhp2aMJFa4BVGOZqhu3gXcfYqwZZglkz+2LT4eSu3lXZC9qx8CGG
 gIIeckZqEctsScLrYjerk+s8qaDDkILv1CdSvI2epKGxIOwRy+ZM0bbcj3I9CjaP7w326
 gLTVOSB78iz4+EFh0hYIPc6nwLsp9Y8ON4QUAKN89FCvatpywOxxW78gkRH9UEXThgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790968407;
 h=Received-SPF:Received:DKIM-Signature:From:In-Reply-To:Content-Type:
 References:Date:Cc:To:MIME-Version:Message-ID:Subject:User-Agent:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=lQNRojQDodvWOuBEmLKt+GACV1xDMUIfzr8ZVqk70B0=;
 b=LH9B0gOJp2Q4BwPYDYNxaT/cDh+nlo2tzy2XXywlKx8lF/OLbMW+uEBb2e2TUgFltohl
 VcjwavqRFr1KFQmSkKh3PWXdXsDADIJVGl39TWHtuR745qJDQ2nw3I90AiwSYJbzvvahJ
 F5/0prFrV8yyj/G6gMvYWseC2nEC9U+qy70rP7bvxL0cL5a5uIljHA+QRG2bXICRUqwYa
 chQZ3EuavQD92TPTUrqJSECAfG5vEh+QOgBMkX/Ey6EtJT0JaBdi5+4tGkjfBZuDBJrhw
 mv4ysjOH7/Ry1zfLFJeJ6DI//7cKBqyK3zRU/ztOfivbt6KCCx4fAz3e6TVTPbp95mA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=MMBJ9E3V; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD14E60894
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:13:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 4F85E1814BC; Fri, 02 Oct 2026 21:13:21 +0200 (CEST)
In-Reply-To: <d3670794-5862-45c6-bbcf-67fcb0d56775@green-communications.fr>
References: <20261002153654.2415899-2-buildroot@heine.tech>
 <d3670794-5862-45c6-bbcf-67fcb0d56775@green-communications.fr>
Date: Fri, 02 Oct 2026 21:13:20 +0200
To: "Nicolas Cavallari" <Nicolas.Cavallari@green-communications.fr>
MIME-Version: 1.0
Message-ID: <9ecbdcc4-fda2-3d0d-7900-ae12092f1aa7@heine.tech>
User-Agent: SOGoMail 5.12.10
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_support/testing=3A_boost=3A_ne?=
 =?utf-8?q?w_runtime_tests?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmljb2xhcywKCk9uIEZyaWRheSwgT2N0b2JlciAwMiwgMjAyNiAxNzo0OSBDRVNULCBOaWNv
bGFzIENhdmFsbGFyaSA8Tmljb2xhcy5DYXZhbGxhcmlAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+
IHdyb3RlOgoKPiBMZSAwMi8xMC8yMDI2IMOgIDE3OjM2LCBNaWNoYWVsIE5vc3Rob2ZmIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiA+IEltcGxlbWVudCBhIHNldCBvZiB0ZXN0IGNhc2VzIGZv
ciBib29zdC4KPiA+IEVhY2ggc3ltYm9sIGluIGJvb3N0Lm1rIGdldHMgaXRzIG93biB0ZXN0Y2Fz
ZS4KPiAKPiBUaGUgYm9vc3Qgc291cmNlIGNvZGUgYWxyZWFkeSBjb250YWlucyB0ZXN0Y2FzZXMu
IFlvdSBjYW4gcHJvYmFibHkgcGljayBvbmUgb2YgCj4gdGhlbSBmb3IgZWFjaCBib29zdCBsaWJy
YXJ5IGFuZCBjb21waWxlIGl0LCB3aXRob3V0IGltcG9ydGluZyB0aGUgdGVzdGNhc2UgY29kZSAK
PiBpbnRvIGJ1aWxkcm9vdC4KCkdvb2QgaWRlYSwKCkknbGwgbG9vayBpbnRvIGl0LgoKUmVnYXJk
cywKTWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
