Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69E0C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 15:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841EA608CA;
	Thu, 17 Sep 2026 15:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpQV039Gk6J1; Thu, 17 Sep 2026 15:17:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 546BD60667
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789658258;
	b=f7QiZWlVom4CQbG9fSI7GC2aKYMIEaLzP2YGiwUau67jQxCoUkMwNH7FtAEVxwmwbISa
	 lgb4dJAL9+OmAWXIKXIgi59GsILnpg31jS9AiJebGuK5dqfOhD2E4+5bgM6/txUmZybAD
	 BOPN9eS21WfjHZyxvbbpwxs05IW36TTSZ1JtzPxHhAVABTb9BpJJLXVAsKHVByQgjhv/h
	 qh8eq/LFoHwxBdqPB8Tu+WaRwP48MHLYvz53iD9z5hGZmJe81cOxOrQ/0x8Cx0vjcNuvL
	 99CR5jTRjCV3f5IXgtht4yrn8qMQUkFXbgkUu5MzxH0stpx9J7PvlltgmMjoGVBM56Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789658258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6fl8uGCqoR1p/btU+T8Nvz9Ll1QUrPVOhqNr0Fge6KU=;
	b=OnFIymw5K7OF9Dp7Rt6TrRPOFBMta6ovnDEspSqsE2qo1YoW9UUGkRs0FaiNs1EOvxCl
	 kjUJ2+QQDy1LUnIIHzHSRHyKwKAMCVleaPnHMaOoqOyasFQHggQ0HSzQVW+PVW31ZFWEo
	 YPl0S8K3R48zFPqEW+wGgsujc9ljC0b+nCjdvSxoDFeep/kc9SktMIzcF4UD960V+AXht
	 OlJOqn118fGN4xWYWdzeikT4pkXyh6Gr8aW8nJqMpo1KelZZCY5RA3dtoyOGbv+ebtUvb
	 VNS8SbbYS3QVGzKvnuHDjMbm7uE7kCfxwolZt5Vvq7dEE0J8CkHkR9f8VFbO9lkPjig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789658258;
	bh=6fl8uGCqoR1p/btU+T8Nvz9Ll1QUrPVOhqNr0Fge6KU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kvLepuPTecWIFamXK3GgGNhYBlcr6oWFM0hNYthHEGnWnO0f+ss3Eo5SrBVlse4RM
	 9YpYwFhgmsAry9ISnEyBgWoJPVweJvvaLyRyhxT/CzOniAmnLyOG6TRIVA4AoForD5
	 E+lgEXoFHJ30vm/ZRym5TfR5zKY2qaNDxyeE9httcgH8xrjRTcAMkJ6pfKlij95uCt
	 8M/d/PbHq1jraNqcWkm0Y0Qfj1sSMKsNXZmZUTW46gRBlDJNOi23aVrZfnsjJXJYB6
	 wexv0FdEN3jVF1rcNMZQVe3ouw+/ESsWaC/6TyQ99tNCsz+c/TZ3BpK+0V6J7+tjMe
	 Aco+S7Ex36vZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546BD60667;
	Thu, 17 Sep 2026 15:17:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 467243AF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 382B580AD5
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1zg8U7A9qjF for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 15:17:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E466180AF5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789658255;
 b=D2Lsl1/JL1wSwOeHxYxHT4H9+NUkC86vlS02t7Kq+mNMaf9lT/yhASPRNwdSDSNSdtkK
 kQDza7zqd9CsFe0i+GCNAZ3EQSzS4suhDW1xh8YBk0EvJEV/RiX+uX8dfMvtdfHtQTiWW
 o7cz60oecVNV1nxBCmbuUra6kSzF5D/DRBJWtipCe3owgJVINpsFElrCbMcDT1Ntlq481
 3BuBR1FR3ivCLqegMDTh1bv206JAPkPrYPvTzPf2MX3JmeAnqqAMmL6Zuu9a71Wm5J0k/
 XLaQ4NDJ3KihFJ9NWcmYV4U9LFRA3XyK+l38nOUM2WcCZj5be2YzzVbLxf5MGgwfzzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789658255;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=oaZ0t6ZSse/7u2FoLwlJVB2XUaOzVdPoVtNNiZ4bJD8=;
 b=MK4DdR6r4WyJ5h4MLFEYjseum5/ylsyIyrxrUKjdymXXPx4EA9Ys1uYyigV/6S8QFdgY
 sR61y3c0EjNTsjI+yAeRBkF60f3PEcq3PQYpEqkYwoImXxzfB5ni4gisY8PgucBEwR1lB
 smzysPu2vAus+agYmERv/4dLg4itfJrAHl6+cQ6CWl2WKHpMGcJOvxKYaeBIi28AJqaeR
 FBBaqrOiA/HpnVfuoniZkZyu6UbOXHvH2hb+0TkpzzrhgtI9CAQwZZLav8Qpt3Qo0VNTC
 wdxhvW9L/tCmZA8XF6+n1AuLGpkpsr9PUvoaL17fMuATPVWqoRiDKxpmYIUo3YfsC6Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Rvr43W60; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E466180AF5
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:17:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 773064E407A9
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 15:17:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4BD3E5FAA3;
 Thu, 17 Sep 2026 15:17:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83D6A11C7B064; 
 Thu, 17 Sep 2026 17:17:26 +0200 (CEST)
Date: Thu, 17 Sep 2026 17:17:25 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
Message-ID: <aqwDrABnWBzVts0S@windsurf>
References: <20260820120253.901607-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820120253.901607-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/cannelloni: bump to version 2.1.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Aug 20, 2026 at 02:02:53PM +0200, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

Thanks for the patch, however this is just the change log
2.1.1..2.1.2, and it actually fixes a CVE.

Did you look at the 2.0.0..2.1.2 changes? Any security fix in there?
Or was the CVE fixed in 2.1.2 introduced after 2.0.0, making 2.0.0 not
vulnerable?

According to
https://security.buildroot.org/master/component/cannelloni we are
indeed not affected by any known CVE. But I guess that wrong because
the CVE fixed in 2.1.2 apparently affects 2.0.0 according to the
advisory:

   Buffer overflow vulnerability in cannelloni v2.0.0 in CAN frame
   parsing in parser.cpp in function parseCANFrame, and decoder.cpp in
   function decodeFrame allowing remote attackers to cause a denial of
   service (crash) or possibly execute arbitrary code via crafted CAN
   FD frames.

Looking at the git history, it seems like there are very little
changes in 2.0.0..2.1.2 so it is probably OK to do the version bump to
fix the security issue, but the patch should be titled "security bump
to 2.1.2".

Could you resend an updated version of the patch, with improved title
and commit log?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
