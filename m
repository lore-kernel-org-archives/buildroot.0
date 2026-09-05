Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E8C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 18:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6D480EE3;
	Sat,  5 Sep 2026 18:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmQAXV162zSN; Sat,  5 Sep 2026 18:50:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8F16080EE9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788634240;
	b=Fm9W6cAia7evty08mVQm0mp80EHoEhnRyNcTnCSoxkvZH+NGYJGCzJIfLUEh3n7ppd+W
	 ZM5QYJj35u+XDQkAWckIExv7ARFteHQGcTCmoNi1R8DXBw7q6xquWMC4l5YZjPQ1k1cVZ
	 SsCoXvSRDr3oVN42Z99Mx3Czfasr9HkjCooMHL8Ou1AxQ4Pgfad9vy5DJ88pJJGCveFXh
	 2ocFB+t0glj16oxeXRVmnGxjbT2l5lTQe/nxxVRR7Kct2+oAWv8FU2qwTq8Ngsy6R2MO2
	 QMLmbS7WQBWfQGhxcon7NP9Zx+RJwJWr0Cem/NGE735188WF15wGbVYjQk5CFFrIzNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788634240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iAP1NdrCnz8/pozP7KIGpeTyVkKWejWV4R7u/OxfswM=;
	b=Jw2Crj8C3O66WqdsiUaWZTSytu5eBAxzfmqqFD8J2Beq0g/jZ8Wh/gIMfWG6Z1QIGRq9
	 xx1wLAfMGP5JfOB09y5t+9HC/3Z3xOs+JCt3VpIodYf898+0NdgbM/JRLKOH5rQVpyNZN
	 A5JiMDkQZXw38CX0VaBf6yDA2DYy45OFOwfdaH/v3shOfG1FIjBm1uIXHRuTjahIiigGH
	 SEhffZADnC6UdVtYwNZS5DoR0wpSDduxxQ9fprlT3MoHBIWee2ZYAwVEFpbb+zjUUy+gU
	 F+QYrbALg81YdDDdSoc1MKswo36u5+RyjZPoGRHxhqw0UA9nuGgDAaugD0Uj5/oqVPQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788634240;
	bh=iAP1NdrCnz8/pozP7KIGpeTyVkKWejWV4R7u/OxfswM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rkjmvNiHD6LOsiBnSAogwcAtZ+tSjo+KsR/neZgE1GJUnuJinfSEGG8gVFVO6L7Vi
	 pmL407mzmhPxk0RSjycNB2yumbNKBSTjXYSBJs2SuK/MJhFNrwAh9GcV4uM1zHFuiu
	 qjdoye4DEroQaLPRQMXBJOrw+SHsCASg+IgW2FnfDnorNnDm1VVuZDXU5xbIm4HgS2
	 zB4AT/jVNLnaHdxM2STqITiQs45/GDVl0Qaxoptw8Qu49qTc6rhPveZxhPXVGw+obR
	 i4Bif3LaGqLWR0jwXlf2K7BmUSdqJgxeyWmdYgUWR5W5SqgPLY9eL+5GU70ASxSYaa
	 v0fvRZlzR994Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F16080EE9;
	Sat,  5 Sep 2026 18:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6BF49D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EC1540074
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIFeOec1_mc9 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A5C1140049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788634238;
 b=cf4Gdorg0G3PsX6i59yOpbatCDK4gF3wKFTOovsLIjDFMcxWzA7jq9BV502JizWfNDsP
 MgQfCEKVqS26CwPizfZGdEJ9XEs5ejXRic3yH5EcgkuzJpgJq/55phJ+1+XqzasimzUf7
 fvMWiJwZ7hzsSrdWedeox8pASsS14ZJJFVjpSrylc6Ian0A5EiNb+J9WxC+NNhuRCBBFK
 VhkbQY62mqUWVjryR4YT1dYJJSdlkGU3iqDhe6vpQEpjykCBd949bX1yt5NBEML994FKM
 Dpr9TXeFmZDCijezUSesFdk7HaBYCGutqFf88dc+5iT0oSTCwAQolTxsc/B6YLYFyDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788634238;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IYsSiPlpzC3k9ON8HhUTUsAQ+xWxcGJbnNPlNZG4hsU=;
 b=YQxC84TiJYdV+VzI8AN9U0W5cpcQTFLWNWySy/f0uTRjSIhk7Hosq3skVHHdy29YMwRy
 oJaiUZGoU+MefS5CtVewRE3S/IaeNVbkmReO2li2syyXfv0Fe5+SneHMw2jnW2lrXR1VI
 +vhObo6xI1Qsk7wiopByGTIzYcOZZ/hc++N3mxhK5m8spTpgPFStHMq3+oCHiApPfruto
 7KiPhKfn7Dt1zpkyWdORBZoGH8E+uhjWB0SZKgNpsdniw7ccaWoh8uH/5o0inzbN9Wuhn
 sGYpyPXbXbCO7Kco634LY1MmjCU9cAbZh0kDXQdBcHkPdt7mq8nN+qY0CvLfmSN58UA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C1140049
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EAF29527F; Sat,  5 Sep 2026 18:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 20:50:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f6e5d88361b45fa11e81a712d0fd0b3cfb88040
X-Git-Newrev: 9556895e784fa87c0cb0b9da2b6f86aa270431a6
X-Patchwork-Hint: ignore
Message-Id: <20260905184937.6EAF29527F@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-bootlin: drop duplicate
 BR2_TOOLCHAIN_HAS_THREADS selections
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9556895e784fa87c0cb0b9da2b6f86aa270431a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Regenerate the Bootlin toolchain Kconfig file with
support/scripts/gen-bootlin-toolchains to remove duplicate
BR2_TOOLCHAIN_HAS_THREADS selections.

Commit 184d47a7adb8 ("support/scripts/gen-bootlin-toolchains: add new
script to support Bootlin toolchains") initially introduced this issue.

Although commit a33e1af4a01c ("support/scripts/gen-bootlin-toolchains:
avoid selecting _HAS_THREADS multiple times") fixed the generator script,
the Config.in.options file was not regenerated accordingly.

This is a non-functional cleanup, as repeated Kconfig select statements
are harmless.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options   | 432 ---------------------
 1 file changed, 432 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
