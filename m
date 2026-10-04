Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D73CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5F780CCE;
	Sun,  4 Oct 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldWM0G8oje2n; Sun,  4 Oct 2026 15:42:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2FA6480AC6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791128558;
	b=IJVuqUzpOZiNf+U23PzbjWb2FzuoeZaqNeZ8cwmHJcW997zcipAcP2GK8PbW1PJYZpQ4
	 couvgOL4DRMH+Q5NT4zdN27eGp7myEXx7ZkUb+dtHf7RtMoOJ9GwFWQbC+Az0ETpQPSny
	 0+iNRUFUjpKvPj0cSC3y/zbA2CqRJ++uSkmVE9iPZT1mm+UeNbgOMWEvENvVohXpzUNvO
	 T6CLhHMdXYs/XodoyhZ5DR2kTcN+OEwA4gOxCpoI39dcU2vw2e1SlKPHZb4fXg1WnwG60
	 HIGZ1Oa68YxPfB14c/9Vid1MIWx/3lX/84FrlvHlRhFtLOQkmwGepX8R2hc/GxzZ9wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791128558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RQziGSS1fQUnKvte/gW1wZgyRr02+y7ejgiofrmSbeE=;
	b=W3Q1ZeI1Wc0ZL+mBiL+hHaL+nCOcQOp8mOE2Nx9yhUSW7zYdr+r12nQbdd7tyyWf4Q+S
	 SJGRRFNfI4vGQPWky1z9TUc8lBjRl8xC6f5lfAkP72V20ZfxU9sOOYCGCU//fTO+qKDrt
	 +yZ4bBsP09/jG++eaz5OgxEdu8rGQzoHqY//DvlFIGfuF/RmnWLwPY52S8PKtAMDdSvBB
	 Y5XnXBMxjgRXwuLF6j+HDl8kl7BK9z0RTe+5cushUhJo7JqTJgq8Qf+qtNgANAKNbTm0g
	 0lRBFnp/T8dLCIMqYgaowZ1pAdCNBegsOEPnP/MSkVi/LUcDF06WAALSeIGRt+IlwVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791128558;
	bh=RQziGSS1fQUnKvte/gW1wZgyRr02+y7ejgiofrmSbeE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FvijPdOw1KAjjhFOtQ6CcC/5O5Y0GU35q0HatCWOQVVXHXFQR5US41VFVnSxyNyRb
	 LOharlnuP5tn1ZxfPHDdVhvOzMWvJCIh+e2KJz4Wbdn3TdVWyZ36Yueo6FMI6D2/6i
	 6PaDyvLbnWLu9ZOC1XRRFlyY90fqAseo3n5oBTN4WMyQ5td0v/1HKSQrvApbwpDANF
	 eSQIe0XwXY7Bn2UNszJ7bEOTZvvJS49RIRy2aeCFenlp5BiA9sox2LesXhFUVF1pux
	 xxe2sbl+QI7JyC2qG9GqCZvl1fm7j+7tNxmblFa4dnxQHmBDIfAFFv7AuMS7ZGIENh
	 7XjJmKO+zqD2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA6480AC6;
	Sun,  4 Oct 2026 15:42:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79EAA323
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FDF740068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNGLy0GPSHZ7 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DD6DE40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791128555;
 b=thFyThnf6P2LVsMSJT3GoefjmHYyPkgGTcUIFMT3udu1iSUwULEG44bvlU+t3cbNc+R0
 uSHRGs8qQOaNcSiKp415wKKwSAAp5wi/YEce8qfOeiZKhD+dOHbT/c0qn1D2VQUmjhQ+n
 HKFl2+JvnEMD+V8C1sCDI3/Lddhz5mdp7wC2c6dVEANq+6UbLmLGgtMCiTkOpH7wgN3IS
 Ckymdiln8p3Oj6E+scpBorQNVqlpS5okRe1IPJORylRWvyuLrinRC+X5JVPELuOI8LPHb
 vE4LJiJ5tZB4jaBsvjBPoCZT+NUkEs+frpQHNbMHWTF/csOUY6m0qaf+o3O8vRggpNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791128555;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=gDRk2RrAKaqXCFqFup4Gg8YLj0sQZvG6ay9DN1jFs6c=;
 b=cK/LFW+h+7en2ul0HYIgBVmrlT55rgwjHOPwZkPgJc+jqVk/nO/sItYX947MWtWykhgR
 HwPu93gD6/PgX4cjbNt0fbfDeLXL72Fv6NlSHkDZ1LaHqhUN3F2hWq3LFOf04mWQuPN/e
 6VS9Ma9C68SULHm00BNc3XyZSwgEWz5wLtz/QjLgO12MmSj1oFS6YuJ8px38X+/S96fsI
 HcXVGHqQ28JQfvHhHNNj7XzwtH0lLbtsVSMP8lCgeNHeQidgmeO0hrFgnjSHWezKiDSIY
 H/gcgJimxlTNfWs5CPQ//7452DLCb/mEcWTwssv1bUsuGHM4DTg1v+QJmHN+YnBGbkw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=DWyItOcm; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD6DE40049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:42:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8B7E64E41156
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:42:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5FF4D604FE;
 Sun,  4 Oct 2026 15:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E0AD10328192; 
 Sun,  4 Oct 2026 17:42:31 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:42:30 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Message-ID: <asJz0OE5k0gQODfW@windsurf>
References: <20261004145950.1387519-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004145950.1387519-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/gzip: add upstream patch to fix
 build for aarch64
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

On Sun, Oct 04, 2026 at 04:59:50PM +0200, Peter Seiderer via buildroot wrote:
> - add 0001-build-avoid-failure-to-build-on-linux-aarch64.patch
>   (from upstream, see [1])
> 
> Fixes:
> 
>   In file included from gzip.c:61:
>   gzip.h:120:21: error: expected ')' before '+' token
>     120 | #  define head (prev+WSIZE)  /* hash head (see deflate.c) */
>         |                     ^
> 
> [1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=b4ed8e73401968bcad749afb0e636dd3ec205ca7

Which version bump introduced this regression?

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
