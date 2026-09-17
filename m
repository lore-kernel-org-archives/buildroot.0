Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FBEC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725BB80ED8;
	Thu, 17 Sep 2026 07:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMzITIQStwao; Thu, 17 Sep 2026 07:40:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 59F9580EDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789630856;
	b=kwpwrPSsj7XZQmi4pOvTS5w6Few04gY/Z060eQemIsKH/0KUoCH1cbzEow9zRk/0wsWy
	 DATVnc4CCtnbiCSmQY3/I7Be1+yJGd/AIKXPLQaUaV78Sf4ATwUvFKqJV3H14GVO1ZVNA
	 wQ7eZc5iO+t9dAWlXPJWIq+nYHlUe/KWfqHuvnUBmOAqragY2YV1dc7FPf4kSU7XkG/wR
	 WxbLsGEf4oGMHk0OGRVxj36fl7cz2pxddN14uEoik1wiwUWf/XmWV7eEvbiV24G3+fmF6
	 2twyyYS1lHUrvf9RMA7LW0uCr1+n6U6kSgY6aLXmNR7t2TfXgl2lZVIjsMbMg0rCMow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789630856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P9UnVegNZ6a3vNP9Vx7qI0+tU2TZ+Yh7xa/oW1QUR60=;
	b=GSz2ehOnTxrcI12FgJHdoGvwMaLQHqFI3DyRvcrNyXfW0ucO7DrQd9YWmtEdREBSbCfl
	 IRBfUDpZuR0CzjeIX9zuMqS8imar1n83KldyDCUt5jZZ4zP+GnfFTxxYFXW3lzpDvE9Op
	 tpXe1sH7ReikrWj/3tzGmv+r/oGBbFS6tE2VaiVsZe4yk0kaNQFF4j+I54RgXhIHh3Y7a
	 cEv6cWTDBqIzPWFNA3vePcmSypbdfrq2IWtEIlTq9MsPDW+RczLa1K/UqYmfsGnNLMLIj
	 3NLnpYc+lmTQI1Irf6R6vhH/lntz82y1gQUbLkqV5x+8IWkbd7svsaCzWFxCUc6/zdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789630856;
	bh=P9UnVegNZ6a3vNP9Vx7qI0+tU2TZ+Yh7xa/oW1QUR60=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O4gC5Wz5Pjs8D5p9OQ3MsqoBiCtZyYoy9o5WR2MK2AlMAjxD/eYIeCogO7Cbq2ECe
	 YK7EkaA2wtjINxLEUIelvK+t2FjJGU6pyn3xHwNly/+RCzlU2q/unjfQtrL7QQoRmr
	 XV2GL/7OM6S+XWJMsfGtG0H6CLK62FnKYLsxmPWlZ3JqT6NF3wvMIr4rZgfiMz8XHg
	 H2XR3ZtdmJDG3e8TqBuXp22HMQ8FYg/8jsDlDjQXNZdURk+6J8BOkHG7iFZFXx3owc
	 d+2U6WacwAS1QhAPj1wKDqRU2cVECSJOMJuJAGfbSQl3e3B43dPeu/r62F1Bx1u88w
	 p/b2yWY9Di1ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F9580EDD;
	Thu, 17 Sep 2026 07:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E11BC422
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE544605E1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6pGhxczLPNp for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:40:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 94E56605D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789630853;
 b=MkDt/AzGbCH90HPYAqUNZoTj1OW1gzwnzhfYtJh2ujtsma1xQnBCVH99dr7lcwbiLZEq
 0qq6n0573hkVU391RNRdJnrWyCnWnZstJ0oP1BboGauyyBT0jY+bsw8ycZUv15c3aHAhu
 nEqD5sVjiCecyo+nNCreOM5YOr/XpDmOjEsJQCIAIc6wjMEI/lilXk4bNQp6la27MRhs3
 mGX2LY1A1IiTOWo0KOj6suZknXRUqmJx4LZQa+aSVAM8q234XVV9uIKv2/XNAgRvEotlV
 +6X/ZgUQTJEP7FVO1jXND8eYzYakgq+BCrSAHxVoUifkz9OnuTgoRDq8Yxskxt8XxnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789630853;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=L91gKPP6v8By+x0+VX4oMqTciVvAidbP6aOBf1PIK70=;
 b=XehyIUkXUHkeR5Y5XRPgWpPd9a1yqqMtwVTa5luvBI0XkCLhUh/thJd8ClXwqbmxE0dy
 GuAapEIOb+JEYPIr2CH+VaaJZgx9zvz0LUUXd5erAsDMaTuFNvgeiNZxeFz/HvNKQwVqc
 rQDbUHZDzpEFXygcVYE7b1fvsw11xm6IOPLv/VnZVT6UaBOKzfKXBAJ4Mhg12DTAwc3O5
 um7gdKP5SYnCFqk2czTXZYA5C1TaLYKvkSZwndHZbiTSDqQQuQ5hZKvklabRmd9TttqXt
 YxS1LfTc69DXwsRNTeWw5NS4i6cL3Kni0ZG3bOegnjhHxbbjORLNUAS6WDn4nXm61AQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kZpQyf4J; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94E56605D5
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 45EB71A0916;
 Thu, 17 Sep 2026 07:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 19AD55FAA3;
 Thu, 17 Sep 2026 07:40:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33F5611C7B05F; 
 Thu, 17 Sep 2026 09:40:49 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:40:48 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aquZfT_fYQSrIKCv@windsurf>
References: <20260915084929.427540-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915084929.427540-1-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.60.1
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

On Tue, Sep 15, 2026 at 10:49:23AM +0200, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.60.1/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

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
