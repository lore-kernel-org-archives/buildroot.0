Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A06FCA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0476405CC;
	Sun, 11 Oct 2026 12:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vvh3DUmd60Xt; Sun, 11 Oct 2026 12:53:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03DE7405AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723190;
	b=X4Y9JXf2mZREOQEn/e7dteK110l2loof5rWK4rQlkV0MKb3AmcKH8k0/Phoi4bs+E2n0
	 F8GWAOMGjVSG6j2mnXYfVp88yvmJrEhzPxU+XV94vNUgr/PyHwSgHFvbm71KrnNw39jVt
	 Gf7B63pi/E0aUBHMuYWiVPEv81Fs4exWFwu+axdPyqZa0scgWx3YlQvmITTMpN7iWQ5aV
	 DAX+MJOwWGMm+F+t0b0HC5huzSSu6BNwkjwJiyaqUYX1C8YByHtH1vDZAPO+MqtUZXjnz
	 vPkHzVH8TDykr0IJ/B94yz/C7XV/OWPSItRoCHLqUajyASdqaVXr/ZZdVRoONt/6BWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 In-Reply-To:References:Message-Id:Date:MIME-Version:X-Mailer:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=2gHd6c5VRlXR2vOdiJGmObQ9JZF7BHG5KVcghtJPoLg=;
	b=G+6Ej9pzEFbmzAJ/YHlrcwlhE9FxlVjw1zAp1A2iEB2DTgRtTVEMrDVGvOSkTbn8SFOO
	 beIFSrkPtmToyIkYyRAvju1V4zEWbfLMPP5c1MExI6QiuxDgsOUp9PPBFQsGiA33P9S3F
	 I3IKgXjC/IAcWItvy3Sv7cBZB+AnKrj6pD9vPMDDVZF4g7ZkjDAsJQOuBVqlOEph2HR4d
	 7DLCNI+UJZzC2Uk1eKT2+ZSsQ/aJL5eq11xJg/SQtLT1OymrTpQPGJCePDri4ar6sJb4I
	 f43Qgt1xaOsNOhYhJhiYhtoZ4PeeJP7cpjjP0Yhy8CizYj/1DtFrskw6RwsGiVaNkhA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723190;
	bh=2gHd6c5VRlXR2vOdiJGmObQ9JZF7BHG5KVcghtJPoLg=;
	h=To:In-Reply-To:References:Date:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=fV3iVTi+solBL9T7NQBojFKgx0glF9afaEDJtLOb3Vd1L1QwGsThcBIzla1afxGac
	 nzHZXbNbuz1LCEKSszPpQ0/mS4VGsugk1u1mwmbdUbK3cpMCFp/wQa6dwNRUh/d7RQ
	 gFlrJTQ1hSW01kOfgfNHvPjNl2c2Msfq1Gtg7UZ5uYpt2hTPkBuvGxhPgMIkJXo1NW
	 faAaprRi9LfP3+Zbcwkpea47ep7l0WjIP11KRFIbQQBAeKimf8Jn4F1eiMC00e6ut0
	 VB9p1E52gRa+nDU+ZprjCAYQPZJsFnjfoGtz1eI1GegruyqSNAkdQCbk6zg/xY37T3
	 axkzo/IfxDehw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DE7405AA;
	Sun, 11 Oct 2026 12:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEBB5111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B06CA80A96
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyEVv77jBjlV for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 12:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 77B0D808C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723187;
 b=jrzpU/3gPJJkGszPf2Q+VDKZOMOOJXotgWT5a48VqPG+90CR7BNAWHx5ctn387B3vF+P
 JvZIlp6xLDZDTcSofJ2LyqjFGao2LUCBxRP1E4vkR2jhEAjBlKUL8HoH1CahbPxdvSRo0
 QMywv5o9Q+OdjVSwGYtSlJXJkIVlOerlKKMxZGGuEOlszFMnoLWYwzFP0UAcqZS40LYuo
 iKf99r4k3IyV8Yxb3Ub/SSFULfL5tskWA60gplfU6WOxsvPEwp4rHWsqnvbNUSs0hBBdU
 9bKHYPh5/b36EV8TkWSRrTHfWSGrNuPbDG9em/920VBmiOaO55DCo/eI/RsBX5vSQ6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723187;
 h=Received-SPF:Received:DKIM-Signature:From:To:In-Reply-To:References:
 Subject:Message-Id:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Mailer:X-Last-TLS-Session-Version;
 bh=8s5AOTau+eSCJGwnj4TtrYctzkjBQALSf/LgwcWHZBk=;
 b=ewuxxiwHor6IkzXq48PjfIccatp7B7LGcWlGB89rQp7ZQq9ENKFb7IMBg5KbZyHY38gv
 /0HmR+WfWUKstitMwlK4YF8YhgAl1i5OaCLbI0Summty53c1p7PeAOC8AhsxHIa/40Z7g
 zz+6Vn1itsPu9/dB0TD1m9MW0Uv8dCIfLzUiWn74NZcRN/3eG7fxW5mz/3XjGGd49XWwv
 DQoTuTTXCwgiKSGjbk3zyFYXkRupC6ZiMEqeKf/Tq3fVCs65erkhVsGUf6LJDw66p2Pe6
 dqDLs0Q79/C9wfIK1dHdIwykmev9UI49HY95C2RFb+fK+dTDSJX1l9nDiTB8/dSMIRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=mbNHNDs5; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B0D808C6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 915C8B979F97; Sun, 11 Oct 2026 14:53:02 +0200 (CEST)
To: buildroot@buildroot.org, Nikita Kiryushin <kiryushin@ancud.ru>
In-Reply-To: <20241122174608.12470-1-kiryushin@ancud.ru>
References: <20241122174608.12470-1-kiryushin@ancud.ru>
Message-Id: <179172317708.176660.6762338298502489825.b4-ty@b4>
Date: Sun, 11 Oct 2026 14:52:57 +0200
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/contribute.adoc: mention
 mailing list subscription requirement
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 22 Nov 2024 20:46:08 +0300, Nikita Kiryushin wrote:
> The mail address used to contribute via buildroot mailing list
> is required to be subscribed to the mailing list. Otherwise,
> messages sent to the mailing list will be automatically rejected,
> as server only accepts email from mailing list subscribers.
>
> This behavior is not explicitly stated in the documentation
> for contributors (aside from recommendation to subscribe
> as the first thing for contributor to do). This may lead to an
> unpleasent surprise to developers, who prefer reading mailing
> lists using archives.
>
> Add mention of mailing list subscription requirement to 'Preparing
> a patch series' section of contribution manual.
>
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>

 Applied to master, thanks!

 Regards,
 Arnout

> ---
>  docs/manual/contribute.adoc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index ffaff6f857..8de0520667 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -375,6 +375,9 @@ $ git send-email origin/master
>  Note that +git+ should be configured to use your mail account.
>  To configure +git+, see +man git-send-email+ or https://git-send-email.io/.
>  
> +The mail account used has to be subscribed to the mailing list,
> +otherwise your message will be automatically rejected.
> +
>  If you do not use +git send-email+, make sure posted *patches are not
>  line-wrapped*, otherwise they cannot easily be applied. In such a case,
>  fix your e-mail client, or better yet, learn to use +git send-email+.
> -- 
> 2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
