Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AEEC79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D633C607E6;
	Thu, 10 Sep 2026 19:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5GPEoG8XKUl; Thu, 10 Sep 2026 19:48:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A9C460BD7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069704;
	b=AQJpKhqWhQZc8quCNZY/MguBjgqHf7P/B9i2jZZxmBB/mBw7cONlr8GHWBGg/w6Wo+gs
	 Rjsg4SzMg0GmVJLFz60mk5sMyoDfX/ImygkqtUVAv1ycTPcYwBBqkGLw+X58QVzMP9PXc
	 dP+esJxb7I+tsxVbugLRboCkgttckLimJQp22AuS20gQqTlm/W1l8rlk2zEup8xJN+fT5
	 84T1moOpbTnVeTQkiraOtz+58pZKprSIWDNBeWmblnx1MHH0G9yzIxPbW3TaPm+Hd6NmA
	 Vx6vpkGtBr0hnX31Skzc5Alsmf4qG7OB8lYcUCSeNUZOqN4AOeuYZoCQdI0uVm4NKJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1MMvZaveMcRHt+etW/m/wQHUn9kiY6kmc5a0Af+zMsc=;
	b=M9GRzcVqScLrW3CPu1UnpxWUzhQ8VsavIcxxTK0WwjkNKk+OvmooFEFul1zrHCzqh62I
	 W/MM/yNKKT/EPP1PbLw/ONqhkE+M9K0aLDE4PSP+3F2dn1b09sY9UKbJd/PAcAB7uXcZF
	 feT2yKJRXeq7Lv4IvOk2LRbCtwbcqXiDDb8kgOe1M7Xmt4Hz7AKdEWxZbIaTflffzE7Av
	 4Cyq7zYKIV/NQhG09icm/kdkoyFUiN9Ax/tXbxLtNF6YCFot3Lasa0N+ZG/zWjRE8aX2r
	 SL3Wowr1nXfWiqmceTcDZIAD1GV+wFOL+bEzUufScvmPNXFVSzrDCBRxuaixu4L752Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069704;
	bh=1MMvZaveMcRHt+etW/m/wQHUn9kiY6kmc5a0Af+zMsc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dq7/J1j/xmkDExVt19fYQXRaDBtQd83EvFDw3/kUUvA/dvAV+sBCfC/c/YLtytHCg
	 Fy64FaeIkEfqbXJW9LUBhf9Dq1ZaNtxGsp08aFzLcNPSPRzFGWS0dofrmnKHtUSSoI
	 uF42W3FpymCNyGVAv59JvtOU9TMSVSmGBTrxn0sYz5XfGh3+kbn7hrluN3W4LVGxCg
	 9CC11VQojKkumSxFCKAOU+QZgH3oiW+nRJniDo4esIAxyID+C7KtBgXu4jFX9Ve3/W
	 vvax4uJ+rRcblUVIa9+qzl1ER9fM3JsAb+QdL9ppTSYWiIC2tSoPEEm5n9StX4KE0P
	 Ky9VjnAozVhhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A9C460BD7;
	Thu, 10 Sep 2026 19:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02DE4493
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC2381108
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQQ1SuuVpzQK for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:48:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5E82B810F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069702;
 b=aFmSEjLx6zEu+mxO2cBCHbxpeMqPHBJZIg58NVQukT4zFnkR8YY++zcrimQJaAKVAQBd
 NHFLF4cWstwhrwh+q3K0iphVC52AJbW1YpEn0CNWOVnqOKZ+jcM3GTGp9qt/Dj5Tg62ch
 97YDPn4m2aYcmai+md7Ponv84Sxev4bj7qs151K/JrKer+DgPPFC/PDowy1Bopn60D8Wo
 HTZlLeVuIM8kcX/YmhzeoO1KoQh4Ha+rbhI7MDHjOVWzPhlnNnsL/oFrr8fvHLqKQzVRS
 o7hWyaC6n2abjdYVyK+0jjEPtitAErcMfIhy0W20PWI0gdgRbJKzFIoNfTHKyoK8sIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069702;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mQojdHYG3PS8v1Uftho2otxaoycSmf4jc43/sNXqXA0=;
 b=TglXI/0kMnjBkRnfL44Dn89mlMkpUsCjjgFFTrq90ze9ar+LkdXZvPN8YjC9OdpcUNl0
 j0CxnudcfkAqw6eMvIHRGluD3ABPwbz8olvfhNnAOYgxSVZqfzt1vnyR7TcL7lHQGZCNp
 L7PZXvdKdTNZE/FDKNY9Boe5s5fdwOieMkwPwG6s6zisaBDCLLs2aKPUigQoNU83M2OTc
 Lka9r0dCbDKhEofS0dDkOPiAyJQ5UdV13W5q7L9Rik81BE2AZU5UEKk+pAfEuJFQno5jm
 WMZxbsouMiZzhaepSnwL+iua1me8ob4PTeKQkdx8GObX/22z3H6n6pqCkt2nsuWhbjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=F3hryXs4; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E82B810F0
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:48:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CC2C41A011C;
 Thu, 10 Sep 2026 19:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 91FFA5FC38;
 Thu, 10 Sep 2026 19:48:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D554C11C787F4; 
 Thu, 10 Sep 2026 21:48:17 +0200 (CEST)
Date: Thu, 10 Sep 2026 21:48:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <aqMJRlfNRwHTPnDQ@windsurf>
References: <20251230174022.1945745-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230174022.1945745-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-propcache: skip
 dependency check
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

Hello James,

On Tue, Dec 30, 2025 at 10:40:21AM -0700, James Hilliard wrote:
> The python-propcache package specifies an unnecessarily strict cython
> version, disable the check so that we can update cython.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I have now applied this small series. However, your fix to propcache
has been accepted upstream and is part of releases >= 0.5.0. Could you
have a look at testing a bump to a newer version of propcache, and
drop the --skip-dependency-check if the cython compatibility issue is
resolved?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
