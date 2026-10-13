Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDB1CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CBDB60845;
	Tue, 13 Oct 2026 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_uIYHuBchzg; Tue, 13 Oct 2026 21:32:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B5FF06087B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791927149;
	b=JDzMMUaraNbxAknWS3wDs2Iv5P5yqtoZe9MJe5pvGZAHQuGt0W8ikiF9jJVl4yqRaPa8
	 bmII58n1+9erYtMmuPAs2KIDdBHUdll+f0JuB3zNWkTQ6HIft4UjSV5BaDIWZ4kA0bWj4
	 rC5nl0Rq4jRucsVwK6cV54jHbgJOtvL9kbJWZLMANOZS19JrOsj1DA3klpG0Oc9AcqQNo
	 Lj08fQcTYTyB7NW86ESnn7MKIpoJ2L3ZOE0UE5x263CQtBDePgprFDIUB9lEHKP+CytcD
	 4H74vv5xRBdzzb3SJSbeTsIZbnQunAxcCEGrAcVazHwIBTXxjEQV8iFkkVUUK6QE7qA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791927149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xd3rhBKlBpd6e7c5Ngp1DGuBMjHtNvYDXbNLO19+S4E=;
	b=YyJAdU9i7e0ALnV/hcbSGynppV0ldbB7ajsD9RIhoS+pLMPPsjvg60EaT3+jNL/podCj
	 wNaqfJD5V08vTVW4dU8bCX6U3XqvFr/OruTgnquX+4qIHrnYFC15RWKSAo+104kXBQF7N
	 n9Jf8ahhOvKcEVvdkkEDI2OuJcoynnWiXzpC/2XJnTTJewABE8Vi7wvMoWDSyAPzfhPL2
	 vrinIJzFjmpOA3WpRJCtyEu1W1r+gV5wOhqagrYe7Lx0rF7AtHLC+3hpUT+NgQrBTHIi2
	 gmh2uzfHS73ENbk1MMx//Uz6hdhGfbFk3BjSdTp9cKW85pZlQqY3AY5JcOdfqsNKl+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791927149;
	bh=Xd3rhBKlBpd6e7c5Ngp1DGuBMjHtNvYDXbNLO19+S4E=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bGrbQpSxBJDJJBAt3Bkk+i0fMGS4xK14dCzvgoJ5Wib8ZvHCU8zaRw5RyWPBuRpYv
	 Iolk1UMeAaGlqmd8/knahA/6yCM7tbdoeTvvxy9tPwbtdrrN2rfCl4+R+T69LZrdMi
	 bAC4O4tU3x/jmTtJrkvIgALHmCy43tYWSgKZvGKp9AJcPcIe5/zHrxN5RF7EdxO9lP
	 WW0JEpZWxhBWScTLiNpEndwmSEJj2P3JKNt89hiOMIHRMdd7JhZkcG3uDWqNUBnuQ2
	 KQ7x5czDG8iSNgARD6GTOt9b7a/6lZ0R9pRgx+sP0O7ZuTeV17tX4FagWkGqD5HQNQ
	 xyN9YyCrhWSYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5FF06087B;
	Tue, 13 Oct 2026 21:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B57CE1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98080402AA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41E6UXkSLfgA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:32:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1B19C400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791927146;
 b=pvEzO8V3IHRGEC0G39cRnRG8lmhrTdAwsfugfRngH9N+8V0WnrviTvMda6CLTboLwqZj
 A4hKTyEmxIBHE1DxYeyV2Hdc+BdleC7XfenD/JSm+nXXqtpXfv7mDFz3nv87I/CxCi3/1
 lvl+U9PDDsEoN8w4IUSStb0+fIxPp/YU5uVhHEEv9E1mKGEdHsSR5FV0gzvqnrdwvU0el
 Ktq7Q0jWQkv/wdPCZiaSkJXnh+Ux49fRMNibPxe2uCRlHm4xHFQOEza8ozjfN+Dy1RPF5
 EEz+6CC6QBaS/twwbMM9MFhc8FlbZtZb7ilTTvsWTsIuc6lBQ5+yA1q4fantSCm3YoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791927146;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ECHg/OM7b63TOYUBv1c6pER8gGuQxssLjIG0C5CcKXs=;
 b=NRh4PLvmnAvxkSOpqrwZT84lJ81Wqk81unb/jRZ2f3p5WK23OMG1E7Wlnt6iHuWcBvRk
 8g+c9F0dSKRIPFFi7u/5f/qqlt3IlYhfqGduqURrgjR6mzDPnFmqOKbal/aDZVSvmfH21
 6x+3rjulrttCkBAfypRT/UIMlLt5mkiEfzUI3P//IrRb/Vdb9sfLkuRJqEDwKbirIOBDc
 r6Crt94Ec3QlhSgDOkybDwwzjXs9Rxpz8HKC9ikAcB1DSEC5A9HjMyPcN23niXo9N2Oj/
 ru89/JlE4SftiawnGcV7nHz0qVChhyI5AjIHzQs4ngFjZnEZSkQR/33AGFwwKFDNWXA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ka03qSWB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B19C400DB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:32:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E6A1EC653F9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:33:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3549D60362;
 Tue, 13 Oct 2026 21:32:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1871411D719CC; 
 Tue, 13 Oct 2026 23:32:17 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:32:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, 
	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Message-ID: <as6jQzgKTJylsBJa@windsurf>
References: <20261013212037.2419515-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013212037.2419515-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/python-configshell-fb: bump to
 version 2.0.3
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

On Tue, Oct 13, 2026 at 03:20:35PM -0600, James Hilliard wrote:
> Switch to hatchling with hatch-vcs and use the PyPI source distribution,
> which includes the version metadata needed by hatch-vcs.
> 
> Restore the compatibility symlink omitted from the PyPI archive so the
> wheel continues to provide the configshell_fb module.
> 
> Drop the obsolete six and urwid runtime dependencies. Select curses
> explicitly, since it was previously pulled in by urwid.
> 
> Update the license hash for the removal of a trailing blank line:
> https://github.com/open-iscsi/configshell-fb/commit/36306fd6f839b66e958d692230ead8d49883abd8
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Could you report to upstream the issue of the missing symlink in the
Pypi archives?

Otherwise: series applied, thanks!

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
