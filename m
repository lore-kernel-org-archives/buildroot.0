Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381FFCA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D767940608;
	Wed,  7 Oct 2026 08:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXTMgByOvG9V; Wed,  7 Oct 2026 08:25:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E7E974061E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791361549;
	b=ZzGEg07WnEdKgFjBSrbW0cgG9a92YP4mRlxH8mAWBql6NnIN7oVSjeoY3R9ReO9eQHS8
	 Q7STus3NiL5STIm6SZ/M4jrKc+f63HGtWdZKSN8Bg5DaBSikqj1zQj2oi3LRiLF1tK/e/
	 H20MQ/DyjaWb9J4eVpvKmad+zW4BRPx+B0pJD7BOJSyA7yJyGsNdzPruU+plQlzCp/E01
	 787wEXpPXbTenK+6c2ooECLRoBn5HSO3ZVIwpZQdxWQ//VOisdk3Y2ebkVXpP9d44C+Cp
	 vWu/j94ub9fGKAROo5lxi7WVt9XqwCosv0UpOrDAIfHtQcVpe57BngKR5iK+B0K5yzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791361549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 In-Reply-To:References:Date:To:MIME-Version:Message-ID:User-Agent:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VXDuCcA1j9WzQ4sF/PCcyyQZjvzWcMfR/zqZSMC/QVU=;
	b=NTevSJI4F4jolrIiETSe/WL/H5zt/f1kNI6dgtljQYTCjwcx31cvxbhR1OfXuS+WPOiH
	 y+1D4En3vfhhwg2iZbkCgNhYovGvOCHdIyO4JD+Wo4OJ18m7uJMnCZA3XUbdpmKTkbbsH
	 Kg5nhVLRKHKr+Mr3nhZqB5dtXsCsanCGEzoEat879emAhm7YNFXZXVetGQ4CzelAFcOn+
	 PR6JGFgD6O5Mw39tOHUGE6RMwMmFZYIi5DyY4O0tyyrzmpihA3lS/FBeRcHmmdX7klq/E
	 LG8XvIyC9z/ewF/UDcqQ3Gty+DNLEKTiGGUx4Bu6rtjG1Asvf5DE9jKaOoOWZ1/Wncw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791361549;
	bh=VXDuCcA1j9WzQ4sF/PCcyyQZjvzWcMfR/zqZSMC/QVU=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=fgog9DTmM+F9HbOb6hYHUYln0Ur8QmMUJj9gfVxeNqwySX+TOF1aTaRJMyKlXr+BG
	 u0nYyITXlqxSK86bctEFUmvnCTI/qFZvzBDoLc0Qxk3bGl3XHnrOBWRQbO5DYOOkUC
	 oB48XIFznwa6KJ0Ed1EUzi27oqhuGcRfcrPTfZ5hmWZEGvIY0Dj+Yo8JF0+9XZiZcH
	 F469xZDR8nKiSRmgxYlWNChK1bfG3qBcyk7D/V5RZm7/l2eU6yeEwKwvU99zvpnXTU
	 rzu8Jgid3VJ0eXHaANikllcgKDSB9+tdTeWkEoc/nvyUbLKVauac+x/Hgo/y/Gy6k+
	 8rgSywCE/Kmsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E974061E;
	Wed,  7 Oct 2026 08:25:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2574C2AA
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1767C80F11
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SbtLXwspyAo for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 08:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 59B0980E33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791360873;
 b=UrLViRyZnMuRaKBtOMlBDChgd6K3f6eW23DvLlCz5MrtjEcvRNmRdxKTlV7/klGd6KIj
 0W/jWhLC+vASVdDatYUJTnNUcPpbmluIKtezptbUnZHZAfY7/BmIR1q8O728gWYNFYtvQ
 D7qn6234f43zqjKIqwrpJlyVndXba7M0ZgwOlBx7TW+Y85ABfw99H/jGWkaGYZEYJcojk
 7B1fhr1Wc5A0PNc6finLnRdkbcYcAL7c+XW6o9liqhr4qTA5AVqEGBAE3SEwCbAiXLRZX
 mP1cBe0JyUsPICp+CNXjFnF+XHhCl80JxivHNn1cAe57EkCbTNRd/jQ0up4AZLc5Fvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791360873;
 h=Received-SPF:Received:DKIM-Signature:From:In-Reply-To:Content-Type:
 References:Date:Cc:To:MIME-Version:Message-ID:Subject:User-Agent:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=7BQlRSHwji7wdxi+E+xywUiQarWSUoBAhgpxzT3e6ks=;
 b=Unz2dZw+/187u/3XxTE903+nVKMPDmKMttG18nRpEw3rt8hAPZYi/GRNKx2KUUYVYMXJ
 jNAtcwGVjv9e1f19PvXt6D1jgLek1ZPkeji4/XUm01u7CDPEESIEfPz4T22mePV+5JTSg
 N2ZP7UIrItLDIa5IdMwMjQAqQeN4iBqAeDJZMi4Z/oYhohuvCAaAnnnKzQHuFc/KD30zr
 BApL+stBxRkBNF4a5Wx+MXLQz6eQuhRdzAwlPpwHXtdDW2SGX0trHPim9bXkZ2xLlFJ6T
 0qaWVj+xdfsQ3hqopooUUo2J2DDPI03uKe5Uw/o37Pb7ys+A9K1E//GReIYS4Rj9vsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=Vl07Xefm; 
 arc=none smtp.remote-ip=195.201.24.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59B0980E33
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:14:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 205A11814BB; Wed, 07 Oct 2026 10:14:28 +0200 (CEST)
In-Reply-To: <asX702U1MaEA4kVo@windsurf>
References: <20261002075640.2350126-2-buildroot@heine.tech>
 <20261002075640.2350126-3-buildroot@heine.tech> <asX702U1MaEA4kVo@windsurf>
Date: Wed, 07 Oct 2026 10:14:28 +0200
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <d3efbcd6-f129-e101-5e9a-fc55b1427a26@heine.tech>
User-Agent: SOGoMail 5.12.11
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2_2/4=5D_package/sqlitecpp=3A_di?=
 =?utf-8?q?sable_stack=5Fprotection?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wednesday, October 07, 2026 10:00 CEST, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, Oct 02, 2026 at 09:56:31AM +0200, Michael Nosthoff via buildroot wrote:
> > SQLiteCpp has an internal setting for stack protection which
> > defaults to "on".
> > Since Buildroot passes this options itself this is not needed.
> > 
> > Fixes:
> > br-test-pkg/bootlin-x86-i686-musl
> > https://gitlab.com/heinemml/buildroot/-/jobs/16865965418
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Thanks for the patch. Since this is a fix, we need to know which
> commit introduced the issue, so that we can figure out whether it
> needs to be backported to our LTS branches or not. Which version bump
> of sqlitecpp unconditionally enabled stack protection support causing
> this issue?
> 

The package was initially added in e74059b39ce2f which contained version 3.3.1.
This already contained this option [0]. So the issue has always been there
and the fix should be backported to all maintenance branches.

Regards,
Michael

[0] https://github.com/SRombauts/SQLiteCpp/blob/3.3.1/CMakeLists.txt#L80

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
