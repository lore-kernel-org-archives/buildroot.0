Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CA0CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F8C814BC;
	Sat,  3 Oct 2026 17:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coscvs9AO-Gc; Sat,  3 Oct 2026 17:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3455181401
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049526;
	b=JUPt+TCMR4XbQDTpLt24S22L6HJmdBiPlJNHIQTNIPoJidzDwTECfNxKs1f8QakP9eDr
	 f93N8q5E03ijY9Ay6QYNyXXNCTuMbDYjuD8aTRLokxHYdg7LJxW9glEzddjTYSOxJtf+0
	 C45k3nWN7F2oZS3n36zEzFdb1tu19+oSXXr32aYY4+4F3N7VUiWLy5p6xOx/K5ZY5hAYA
	 5unTjW032ctpEEGLWmvYmNtejZeva2EtagAqFBlPjBuq0mmHBMCqNOCs4Djpl7c8bOFb9
	 kyr/lkS7ri7vWb8YasZFseHY/aPB8fmICju27HmfCEKpYSi9rDbPEVAetGogGcAebuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4MDd2aaQZ54J3XKofnQPAhWWEJUU4eJbE1V126t2BhE=;
	b=HtW96m9L93iZwHrZ7qotelxlCLpJNbDBDfEaq42D09FhMJx73qHNrwkqTl9B3XTJA+PG
	 TJsxEz2SbWTy50pON5gFRmdPUTYSj1lM8jQ91b0ZDgrBpijLMpph5SfjIQJCJGLsUFmaZ
	 eHrsIgbGpQSgiKOm7JWJN/UUjpXBP3QaCu+AflXGDGHVtdnj9mHw4ND1WrMQKHq1kV1DL
	 Ht4l7IMf3qbyuI1kYnD8eTNc18tRdzLdHFRe9XFJKYQsjP/0RS5Do7Jk+CUeN+7PtXLDD
	 EdxWHfUQU0iShlLJJ4C1gZe9664rJMt20MZOrgcJxvC8ZKWCnWzP4yy3GqfxY5Kr6ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049526;
	bh=4MDd2aaQZ54J3XKofnQPAhWWEJUU4eJbE1V126t2BhE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OOgcXf4YoqjjhGTGMGi0iWX8i3o+eFdNX4VGMRHlMAXPiwXMhEIwcvlwj6XG2ZSJC
	 v0pCZpJ9XU0R3maRpS0cjVaqJ1Mw0e51MlUju+sr58oqXIejU339cpavRv13I48TgA
	 iGp/g5ickOaDZ9h2oRqIv9cjhZBXDU+tKfqZVQwuRFn3xU9jJPgua6SNhak/yCsDCA
	 1kLR2FNJrgznn8YBXY/lAH44Cqn0un1z8HT6TcID3b1Fy9OobtsP3RUnzQDgbdtlOt
	 nIVL3asV6i9yYYcbbaVDs0FPifEsMQEPXE0DuxnpwMe7KdLcrwKZvL9jdrJ9eisI/0
	 lc16uYU9XO9mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3455181401;
	Sat,  3 Oct 2026 17:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 178ED263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2383606B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ILNOkFoFriy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:45:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B5A75606A0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049523;
 b=Y6xsfZgGAXOsvI8r/9jDSQlX8JgLbeql14veffP5DhC2QXiJSJaN57F2lxtKux7LPPHE
 gYVn2/O7JEEATHJrDWS7/G4eW0I3BNVyILhoJ8dWcme1CTUwzaKWAXZPod4AcJwkHHIJh
 XRh9sxkc7zBmrLAhjA9Amu5EAleWe4lSivByPTgV9YvJyJkTuSYFIpRFW2at0O+mnV/Ar
 IPCaMkhCtwfyfulZXXGMJlEGI9FGuNE9dqaLHO4XmGsr7AxlMP3NDzhSXDeo5xa1SKS04
 0Ijha95oduvNxK29Nugfo/TOKkPPrlSCWArL82QAXuFQjW0IlOrJgxvMM47RjzeO/SA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049523;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DF6K8SCBihpah8rGWcv12BcTfCenep0acjssrmdu+yE=;
 b=RxnyAHJ7K2W5Y+iXUtyr/NvKZQlr4rGyJxR2CFC7z235OeICFYA0xwSCAikHv+5XaBQ+
 DC2WGzeF2F1WUH1/mOnf4njFoF23GpMKrvj1dB2CNqWhLjxviF/WhVqDV4P/up9Y6+OEB
 dKzvaN54MijoTiCYit2BHzLyTORn4VIz3hAmy7zxtyl9JqGXHxHCd4gCOJ6cdCI9m9Lt1
 QJLwoQ+blQiC+ywutim+NQoN+NxnQTZ6WpfyFZ4hrUc6BUVczLPqtqc28+6sH2IGD/VdE
 PJaQ32/i5T2QN7XacP8FkYM8avx9nXruu0CIc7xGdeaR7RIMaqbOKSP8v6+PnUQmR4Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MOP8LfZa; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A75606A0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:45:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 50FC44E41138
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:45:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 08ED5604FF;
 Sat,  3 Oct 2026 17:45:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32EB410328170; 
 Sat,  3 Oct 2026 19:45:18 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:45:18 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asE-6UqiQfOGAIf4@windsurf>
References: <20260412184526.104865-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260412184526.104865-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/screenfetch: bump to version 3.9.9
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

On Mon, Apr 13, 2026 at 12:15:24AM +0530, Shubham Chakraborty wrote:
> - Fix macOS resolution comma character
> - Fix Proxmox distro detection
> - Fix WSL disk size calculation
> - Fix tcsh shell detection via /proc/$PPID/exe
> - Fix e16 theme detection
> - Add generic aarch64 CPU support
> - Drauger OS logo update

This AI-generated changelog is really silly. It's just a random subset
of the changes made in the upstream release. Better put a link to the
upstream release changelog.

> - Remove downstreamed patch for awk detection

"downstreamed" doesn't mean anything in this context. Rather you
should have said that the patch is dropped because it is part of the
3.9.9 release.

I've fixed the commit message and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
