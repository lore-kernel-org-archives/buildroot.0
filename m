Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E927CA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D01412EE;
	Sat,  3 Oct 2026 12:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hj-x6QMxasmU; Sat,  3 Oct 2026 12:35:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8D9EC412B6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030915;
	b=pQOEDntTzMYfZ+2E4+KObkbGHsk7x1Yxl7VbIqLIM/Kty3Q+BLL9P2ITkVZuP6WfX2JZ
	 nX4Upa4IeR+nM9CHEL/GquHmShy2TjYH+4nxitCAEjJf9QoADldHiw//tXXQnco/M4UJN
	 JQgYD4SftaVXSqBWbKUtX7HJOjApUfezs3SWxCEDc3S0nY6gvaAZZZOYtciS4jV8LR0HN
	 KjFkOLDTVR6/yP+VLexncokHWztKjDiJskmu9Z7OCWnHDj450wF1LDLXPPHCDaTm9Jnti
	 i7OUTOw3KbTMv6dk0JPEKq3Znc5Eugddk49SGUD9NEtMvs7TurzkiCgM8ZX84P0ZFsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rxZMpqB8LfWy6SOQ5V2/fx0Mc7Vh21dpfxzSIDhOxX8=;
	b=To2ubczmr7a5ybKgRgbCV9ujlEyJ1PsJ4MJ1Sxus4usnafzGglViR2j+lFaVHKzWRIgG
	 WRB040zUhp5qwKxQkQaeGscccrBkFcrHXUfe/72aMwA+EvjORwcjIopDx1U1WnYJMzwKe
	 /T1MYGVxZtfJ1YZixeEVcs3jNjCwnkDVTwZX4OinpXi0ujEuj+JkwGnABx+2+X36x4Oud
	 IZUzLZG1jniVwUQPJwfamLDNR4goQElQT7nVzCf1/vyV1PpUqxh1gmYLqHUtWx8GHDSjt
	 TSw+cuk70hhCQt1ewAQ+O5O2DKJbAx6kDNtuz2ku+iqD+kFUByDz1YK3ErAz4ZRNROQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030915;
	bh=rxZMpqB8LfWy6SOQ5V2/fx0Mc7Vh21dpfxzSIDhOxX8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HhbjYEayOXAX/auxrAcS65FkBGCN1C4gDBE6jx9wWAT8XE6uDKlrKfUn8KlQsvnsx
	 6yWa6xZMr8uvZm5YqpntHP0x0LJiib27NmLa4YIPJWnDxe7Nw5aMWgpLzVH5BDTsBT
	 ZVdAO2RHNjKPLYVB6NCqB6O+3LUhD38cfzi6rtQ5vkuajO8izQmB12C4f8YuIjQVjI
	 OiCEM7MpxJqeOa9VtZjGKAom/thwQPyRrUP/++jCKl5Bf8FF2/d+4dC4BJYKY0SRRl
	 v8l/YzvUcbchf8jVCldEJcG6urOnmPkpXvZHB7+h7fyVtsVOLOfiXfXn4rGWIJopM0
	 mmFFrnN1n+QBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9EC412B6;
	Sat,  3 Oct 2026 12:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B00476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 309B460667
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgGtNxZc56gk for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:35:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7E1160652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030913;
 b=B3n5OAqX07GhtHCtMJWvqWRjlhoqoM8LiE55RF5l4s1jcIfHOnte5PE/al037/pk24gP
 QuVWVGGleID+zBbEVyRUEt2LCW8NWded0de4T5pTdlzW2sqo/xPrFt0cbiYps3hmrRbBJ
 WbDadAtd7vUR4pyxseYj+lDt3DN+van5A3cW50IDzfICFcWU+Jg/FzeDebepAnCNQT6ES
 duin6qDl10mAFpDmD/OYwTS4rEauWQWxlo82ThUgtfStb/8F3veXNR0BUta7RruC2laXU
 pzySyCLGP6pl4UDGFdA/NHlRhjlzogWbhGGD2oNpanI9DSWd5zQ3SvhlouTA+PY/8zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030913;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rHpxp1ttTXRprObl/2coROYLflBkC2SWUvdRVE2jxK4=;
 b=ZZJsDYItlKZMX3/2qa250F1kaccrDe/f4/6rAxza06JMrvk9BpSeDZl7cjnxY39LvJ8X
 Vp8lh0LvUPO0BfksbH+LRnXxU6x+spT6WdgF7XFeIkNOtYM/h9C/qD+uPrGJ70n7TLI1b
 Guv1eivY4x8XZsgJx0j0uutc9f1a4XS6WhFzO0lqwQcsvsIjcc0hsRlFdgu82Ir6tC1fe
 TA0dvSBYRlTfPvpvqPCFgfFLL2NIsPlr+3E8wcJVenu23qbs0pQn750Yv57tfLw90mxX/
 WoK8IISYINF1vSLgj1+dyB+rQJrR54QfVEejLNJwKZGEcZmbr/h6zgGPA8gEB58KXrQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wv6Ae8GI; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7E1160652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 992D74E41128
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:35:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6EC0E604FF;
 Sat,  3 Oct 2026 12:35:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A777B10328366; 
 Sat,  3 Oct 2026 14:35:08 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:35:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD2d0lxEq8wtxbE@windsurf>
References: <20261003084453.545653-8-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-8-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to
 version 6.0.5
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

On Sat, Oct 03, 2026 at 02:43:53AM -0600, James Hilliard wrote:
> Add the host-python-setuptools-scm build dependency.
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
