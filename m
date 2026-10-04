Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75F7CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA6480DC4;
	Sun,  4 Oct 2026 16:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80MOdwk0VSwZ; Sun,  4 Oct 2026 16:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C823580D99
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130125;
	b=OCI1MQ5S3r6KOCvb7+MPW2/dHZ+sMHz32CuWeaF6wAD4GT3w/YH1FagctiziwiMM/8dy
	 /FbWKsWh3G4cyD9r85sQvGPNW7uBV7/gtJ4Ixcx68FJOB60XeqQqjbhF7ekPCCVuGFxze
	 0STW4CKKMrJulaYlHInbY5/A46/aNuq17g2SXDktm7UjWllcQ+H5CYI6il3jV7a/Nnm3A
	 Kx1rIpYeakw0sIJZw3Tdu/oPAmNBRhfFsBbVfOOIxs1+ztavZXgThDqwKdKJtN1dB/AO+
	 lc7+E+wWn4ybCUD3ns0hQ1+AZek1un80BE1Yf4S35sE03LXC/AFdsjnwllYAJUq7HGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8JLpFDlagZu9JlhrQwIjHaC3n3pa0/Y+QwFPmeXXbsY=;
	b=h+XrHSdZ4RYJfvRmW7IqtwL/8586D5iw4NwruDnGqEbYd8zj+CLHyDHXpRJxwJBw5u/Z
	 qN6Swyzu2+5YMIMc/tTvv8zQg0skKeHYsfOw4RmbZ5lg5b4maS8F8pyCKYhRZaGODq3NC
	 ndZDhvd3ID+qZTpoW3X24XFzALfUXURCnPwpSLrDd3JaZtWLVTb5tCZdPsKtTXtgfnoHc
	 zZU3zfC2kUxkrzUo1ncTXv+8blNUIo0Ve8gDIHY2y4FPCOeIgYDMXz4OM3JjwTsM4BhoD
	 xf5MTGMdMSv0Gm6CTLJ1jqwtDezBaGCyHbgcn8cuoJnsxWZGlScYvKxbhrx1FP4cBMg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130125;
	bh=8JLpFDlagZu9JlhrQwIjHaC3n3pa0/Y+QwFPmeXXbsY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DbLClTjxLJbXzyUw6GUv5iphD/04ZouhBL7S2hTNr8AJVESr9vah17+qDVEoMkujc
	 h4W4FTK+VPstl3q2p1bqyMasWIYu622ND8sd5AKn/kheC+E+D0TWoBJA4Q/GrK5kFY
	 CHEIGLi2CeWkNOB+6NFmNlWEGYOI633TZwx3g2wqgtJ9x+EBZr9SZWSKvwrE+3fsRv
	 HY0TEbRSSNwrY2PzaOb5O1v++u6++PB2ZnkT77k6lKnZghgSdrcVLGgTATPpzCm0Wo
	 pT8h7hn0fHsmoXU3uGIcpaNTLR45dlAtBYOiDgTFhOkzgrH8GywwvAfzqKuH9mJgrF
	 qyzT1lwJEu+HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C823580D99;
	Sun,  4 Oct 2026 16:08:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B38334E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF4F80D88
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7CXHR-D3v0B for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 75B7880DFF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130123;
 b=aAKeSmy0jAUMwD1MPnscZBDdPX2n6JgR9y42bhzkETB9QozG2z/5WNBorEmKxwHvvmTl
 E1HNfIk2dP43GYo/tyJxvvZMUSgpw4UWyHLrQyIlw20FI+OIO1opUfijIhuq/jRsxYXNP
 MUNtNXSSiUy5jv5j4TBCpqS+MCBcD1GD784bPF9DBG25S178djhC/Tw4NWL45Gtu3yZBQ
 EJ+z9v7FF9eG783CzBj3bavbGyWmw5z7dx/AWCpE/hv/PG6mp9cabKUh84hlL+MOtw5SY
 S0e+/9NVNbplNprrQgG9gD45SbA0BJzFpYMeA62MpNguUXFyWyj0sdjfBoVdjz9vUZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130123;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rj2YJflFsEAj9arZleArRxOV7qByJs8MRc7xOg8Mtlk=;
 b=QdcMHSPThWuy6XYH3FULS+9QPJn5llqaF/S+VkuzV9effGnSXHG0O3ZLvJPB65gm8JQd
 SU3rsEih3WIoogjThtn97JcY0WEbwXiHMbtdcZpM7cSn1emBJ9N/zcnTipa/zwogbOmDs
 ZZalW2ZGpor3GgJ7LERANiQ43Dp1/QLaldwU7/ABR0S4isjw5BbPK4Bg+ChJq5YjTTz5t
 TbqEXrvynSKg5Y06P/yFAVI5qTmdzRjpgIoNtjFQlvvx+s872xDJbKck0zRvxxzwta8J5
 fMfV/+9ufuh1ivshro9LgSaY/xRqOgwlHYI6v+6mTsKU/va320HoVrCQlEZG/8WS/fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BxKM7WMu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75B7880DFF
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A45D04E4115C;
 Sun,  4 Oct 2026 16:08:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73931604FE;
 Sun,  4 Oct 2026 16:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC0C510328192; 
 Sun,  4 Oct 2026 18:08:40 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ6ApycAFKPbjUb@windsurf>
References: <20261003210833.735937-17-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-17-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.19.1
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

On Sat, Oct 03, 2026 at 03:08:07PM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://sourceforge.net/p/ruamel-yaml/code/ci/6846cf136e775ed0052cdef6ff02330269c86011/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
