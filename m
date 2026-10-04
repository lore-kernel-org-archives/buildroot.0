Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C68ECA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8936606A3;
	Sun,  4 Oct 2026 16:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0TEfDH1lHyl; Sun,  4 Oct 2026 16:08:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C7A360652
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130136;
	b=CvkRxhrvu4/zRw+4Ki4dn4KWAnJltPIvjw4bBh80g8FMIUD7E/tIKZNw5XCj50ZdWEZF
	 AOYguaZP5Vl/roLIkskz5UXpFtloT30kE36loaQdwE3E9Lor2oL+IQwGFnctVp0fpQtp9
	 9UD9yUR0eJKbXcGvQ8TgI8jxRQARGSpKo4wLK9qiViKzUbDCuA79m6oRNsSdZmXiYGAbh
	 K04rwjk57r3P1nO7pcN91fqGp00Kv1lbqmtlBJScwlI6q6zlRZxHK8rozaEz2Z6T7BQMf
	 5Npxdvw9Vv+Jlo0UhiZu96djkKOSEXyJkCuJBLKwYgWbYGE1n1PR4rMKNjZhgExbi0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TTAaMW/eWw5E1AvpRMVtEqtXQRt9E3qqPw+Fnsr1xFI=;
	b=VJk/sXX1ufMYvZxiCli0xOXCc6YJcU6nUb19HIJ2dTqhW/Q1OkQXAw89e17XAAxKcOnA
	 RRgIXC5fbp4yFOEjm1ev8O/o0XBd+kKfiSYBanHsKYGRjlXhNgcImO4KrdVJUpmAQ3fqG
	 +Q+ZntDxS7ErUvM1CselSbB5IL/hrA6JjhysHShgLQ7AlYzeDnwJ0OJ2HAY1R5EDfRBpX
	 VayGbwExZQMifs4uAvnR99njVpcbGlBLf5/DcSaeL0JmbucLP7wTFKDdNH0VR2OcWnf5B
	 qCp9RgI/o87mxT3iAzphECaNqih13go1mJqhk7MRXsPs+DAZn3P4etSetOvEY7qE4wA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130136;
	bh=TTAaMW/eWw5E1AvpRMVtEqtXQRt9E3qqPw+Fnsr1xFI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b0t18vmhn8uLYY8YKGLQROMk2fS5xSho1fdY+VM+WemV+wR5eg52Uqt/31UkAE7JS
	 5+GZcQN15ob+2GlnWExf5L82h/6OoKBlOXdicLGo1XgTsiTvGHVtum13DnH+OO9FDE
	 JAV4zKN+avDh9c5sVtZnqYBhQwZDcknKljlbrBho3Jl0ZWz6c8SGkZM+R2+D3XWJOE
	 5zC2qSs0TSkNT2zKgXdN6MZTgj1TR9n66HJYUEL5MR8MyNR0yy1KnA9cnglbltQSjr
	 38gAD+lOhM9xEJt/31Ff2KEhl/dfBi0Le+X/Bhb3/DIeKdNuIyuGU+vWh3AKJ11O11
	 IFpElVO/TQGeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7A360652;
	Sun,  4 Oct 2026 16:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25AFE34E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 182AD40068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaryhb1-VC-R for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3A53540049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130134;
 b=qEtPF4RzxATHFUQRjXBsqAYq+tHvKRdRc3IPCbJ3UME3BTgTc9lJ34fm4EwRkwOTgXxj
 TQPjv6bPud7VubLaoiVqOunM/dDE9to8tDPspXoLdXLtQCtkDOFbirKzqM5x2NTehtRoL
 +TegCCSTIoXdJfWnmloeWCjQlQvoQ08CMyCaWmhz+8T6M1WgaanRaQNJkYbK8UcPVNGt+
 uZWJkx4JVbraaGrvYEtclCR9uqLCvVyKVozvoOVYb/auhF8F4ja2eqCWwRUQTsPtRGB5H
 KnAuzcoLWxybVtyz0DzZz5A5SL74s8DMv0m++sa8+oFTnfnGdJf9VC3C9ngoKAsPeiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130134;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HwCeP+OfsTlKVSBiT7HFQK9DcMy2fEAudenZ2sW+ACE=;
 b=WfLOQfR+2/BaL1Do6fulsddyRlrrJCkGz8JckTOCz8nHV1l91AyiCcIhwzg9q8nz/Rvt
 cU5yW/yFW05voHSqATISdzkH4IzbKa8jv8UNCi41ks3XhalDh1gZNg8Xqj+tcA4K25kUQ
 hU9DDz767uNU3TqkrDxK8oEH+Eg9vfuONanLeVPb4YCFFJ1JTa+mDLlHt82DCnGc3lTxk
 10hfIHn8XfiwY3B2UK5FgDPP9cxKGC1U+KOU//uyLlxmL5I7G+ThL4tfJrP0iR9SHdCKK
 sTPJvNXQN4ZY7KBVA67D7/PmWVUY0U78puf8Bg0sf0vtrbvqCZMTUntJMwhosuRM+bA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a8CRkop7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A53540049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D06644E41163;
 Sun,  4 Oct 2026 16:08:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A5465604FE;
 Sun,  4 Oct 2026 16:08:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C1FA103281F4; 
 Sun,  4 Oct 2026 18:08:50 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ6C72U-pnXXky6@windsurf>
References: <20261003210833.735937-18-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-18-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-selenium: bump to
 version 4.50.0
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

On Sat, Oct 03, 2026 at 03:08:08PM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/SeleniumHQ/selenium/commit/fbd3b6de2f8f79d9ab0e7c86de462d454ef4de04
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
