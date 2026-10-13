Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC279CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FEA80A53;
	Tue, 13 Oct 2026 11:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUEI_j_ZJdZQ; Tue, 13 Oct 2026 11:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1988280993
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791889991;
	b=FAiaUyqtj6TYxuOAQJIBmMvtWUejUxRlyMh5SROmgtEWsXXKe9K6KVe8NtiuagWvqnzp
	 UBqBxvDHoH/3jliS/oXCqzd9T/ShdYFrfpwkys1knFUM+UwEfJ4C7WWiBAdfkui7PVae3
	 GIL/pVtp16tA+PFCtUSdOdzyFFOatCU8pAGJ3586lSVtbXo5IKc7cH/L36Mda7HlePb6A
	 Xc9PCVzXVqPw5itxF+Ocl20tLL+vt7k2Qc5anQrfJzxulm3GvEBQtu8/Xs/MY0Y8Lb1/2
	 veqv4Cln4urImc4Eodz4+u0ZeMUydBqdRbmlcKVhkdoN4gRJJbKT0HKO5tMb48EiOXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791889991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PuUJA9uLB/Q2qB/Adh5XHMU3yoMp86mPyJyj0ovPYNk=;
	b=YqjtQjbkmRCqcwC0zyyvRES5+hdHuPgMRKyrAcmc/MCM+TVVQgK1YEOWM7yjFqn9zVG5
	 sWB38yCjF/Tq23VoKlWDNABtDUPMwka7twqTO8j487j9kQe5wgJmxPTI6YC/CES5po3iJ
	 RMCvW9IAlSJvYU0Yiy+gJMUHXKtgmEP0+E4CSpLLc82okxwo8IB3yT+4y5reOgZp1zlR0
	 GMUBJ3sflBv82/EGHhlaUbGe81H1+FTQFujBeWpu3KRQVmMhy6vjDpCcIVhvQjN4fMyM9
	 u+WxmsJ0QFaqKUSAjWCLLaO/f2mSLQYfjGNcM1ZobtNHW5REMTlpPxQiqVMxD4XRglA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791889991;
	bh=PuUJA9uLB/Q2qB/Adh5XHMU3yoMp86mPyJyj0ovPYNk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldEoGBKcQJA74TopWNVSPN0ve+4OmACRN0uXNnEleWTD6patR/4UXTKPpyu1q9S3Q
	 Xtmh9X9ABO8GJJDUNdleoh0XB1rngryL387SVEi6M++ngPEOnVCSYBJxKSTjnmcNCg
	 FX90RW4d9FgrhBSmXWsv1AjgDa9YOwhTemAarxP4Pt8ZA4/2qirtWElxIgU7kgTWIu
	 GyxnM57AgLRApwPnHTKoQ3m0rPgVP6Px7qGQXqhez4xfVIZO+kh8Asusl076ixHOD0
	 C+OgmgOsq6AHzlq2dgPj+rrVxfDUtCLR3SR82EdS8tx3tnKSH2ibiiAYy+QyqxEAr1
	 T1ja5NL4DJIjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1988280993;
	Tue, 13 Oct 2026 11:13:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 976CDDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C79240277
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zh4nepE-tLlq for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D0535400C5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791889988;
 b=eP4xV0OQ15BFffcE7t35TBQ4wZPuNFdksxi51GhppNAsFuKaI4n4r5d2xxW2xkZ/HuCI
 GtbWK+p5B7sTNGNkABFO8tzv+V6nY6DYdPfIxsJsUMJa3TVOXXTcZpRMIVlj226mGJ1hp
 L7vNiEcpjaSkMSX6rNNzwyPNPjIszU9U1AuflRpd+AMwk4BKo+PHNVZSoxpcFQ3oPpwPn
 7dmHIlJLvm/lwKSLryBKCLzGYlh/lf+7C7arfoLOwe0R/z48A61cVsRCbgc+WOv+wprb6
 DjofzhERRxC2YAYE6BtJziyEaXLPVkHjOKpVl3miiwUqvnFsK4RbUShP/Uknvqgl+yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791889988;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=byWd2cEIwFsfxmG0/Tz/GWUlf9iCE09zyQ3+Q4B0cdI=;
 b=nS9QE1yOkcwqwIF5HFMGDtm0p1yF0JH15MFWKgYdrzzuM8Vai5oTVgXgnhtZ+cTb6oF1
 gvSpsBUDXXQn02iWYGp4J/O2XnLbzDmvtUjmyn+0CaI1PCu3hOj0ASigkoDxttzA0GXWf
 E4I/VIb+mn5v8ZFWYrgJNXh2CEzgocO/aJR8ntJU+g2xQxE7kGAP4OIvXR2XiMyIeSh8O
 sDe0vP+QTw8SDtypSVoJ5um+EYerF4wrDm17tiDvdeobopsEYezMr67qAFvkbb73oWf0g
 9ZHdSN917Z2rQ9nfzgalWN2IrikspZKaTG5/SYeXpXuNeBdG+qoycGgnsSxUuQ+Ah8g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=oFSSZEZ0; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=oFSSZEZ0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0535400C5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:13:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=oFSSZEZ07D9tC1p125HxE9iX/Aj/w/FY0eHG4hO0/34TwLKFHdcb6aIaVuTOypVXU9FBTb4B83VZ9As8X7bNLWgq6mkdT4gxJ5dQIdUBFdMzyd+fHhaUce/BVOWJ+VMvDreISQJ4ojEQoYcRej3zL712tPX25JYcB5XCijFNiM1sBVvh+Q8rgKYipsGlgsxrA6ql+SyFnMqoGIeBpqBD9aNV7Qq9W6UKthMUnwBQQkvdShefXUy5u/3pwe9fEDj0dn4W/McK3+6QIfNd3AJYS7ubJRWyoxwlQjTrY1VlceGwg7YYj601cXevZ7fJaJfzZRowsc8xFfTfdVd+egmm3g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=FQ8ENo10ir6cMMqi59DaiPuYKVqQunn2GORqQF4P8ec=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -506049225; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 11:12:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xGaR8-0000000BG1u-1TTR;
 Tue, 13 Oct 2026 13:12:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nevo Hed <nhed+buildroot@starry.com>,  buildroot@buildroot.org,  Paul
 Cercueil <paul@crapouillou.net>,  arnout@rnout.be
In-Reply-To: <as3sjbzkJ8Teyy8t@windsurf> (Thomas Petazzoni's message of "Tue, 
 13 Oct 2026 10:34:06 +0200")
References: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
 <as3sjbzkJ8Teyy8t@windsurf>
Date: Tue, 13 Oct 2026 13:12:50 +0200
Message-ID: <87ld81ua4t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/umtprd: expose package build options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> +config BR2_PACKAGE_UMTPRD_SYSLOG
 >> +	bool "Send output to syslog"

 > Where is the output going otherwise? Shouldn't sending the output to
 > syslog simply be the unconditional default?

 > Peter, Arnout, any opinion on this?

Looking at the code, it indeed seems to be a build time switch:

https://github.com/viveris/uMTP-Responder/blob/b174b03a3c2641a578b9299e540994a35b2f03a9/inc/logs_out.h#L46

Which is not so nice, but oh well.

So I guess it does make sense with the option, unless we say that it
should always log to syslog given that it is a daemon.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
