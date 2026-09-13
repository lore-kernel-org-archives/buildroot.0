Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37705C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25BE6063F;
	Sun, 13 Sep 2026 07:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1dhDNlsWW26; Sun, 13 Sep 2026 07:43:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8EAB860602
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789285434;
	b=BHm+lmbjBokfspiCqM8tGYU/yg9btO2ZTs0/bsbjIJLcIBrxh1IhqZ32UH798UDq4Twp
	 yTrIQFNqlTG1JUafryYjPdlzZm0bl9syZhHE0xI6V4t1gy3OL/pb+mdQD/waRPa183yAP
	 L0YW9WcI3gms1MNupOqdFmQwAupI3HX+8BiEQ5Bk0ZgCibN0ms3XIlS63lEcxqwDr/X9A
	 TS8V4s7qKWRuLGKicRXNflnAYEKB/znTNbeKfLJnXCPV7ELqKoZ2FLDfJOf+oVemSXkB5
	 LrRBXFSlnWBZGe4rC5Lm76ibPXOUMFS0SIk2OBmqvWwZViXnrPhzzUh0eTpTU2zZYEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789285434;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:Date:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=n6EaUNu9L0Nx/Q0DOLgMABzQ/4DnB7H8Y7z4pQPnKJk=;
	b=ImuI44lSd+4216DK/6LRSa0xNFDKjuSrWq9WMZaP40x10fR+sDdju9uj/1LEwvTmT0NE
	 JC4zxoq+Szgg1Ea8VcLZR1K1BmC8VSNMpwRkZu+yhfzLW3jX1sLYoUKIRCYHkU4R08Eqj
	 4qBGqXCsrdfEi898GFD/QhfhF2XtF5YOW5goURIRui73ySxqt93x5Bf2CSMY6F3Pl4gY0
	 3SCfsuKandKmqiXSCWKc6uLtIdjmZSNrwmF8p8oI6Y+e4lGA4AIeTYfoVFQdDnETg3FuQ
	 lfqsYPJCGc83peuEoG1PjzP5DW0TicQntkxZksWd4Flpop+hHzU4GZkFzV2RjJPG2XA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789285434;
	bh=n6EaUNu9L0Nx/Q0DOLgMABzQ/4DnB7H8Y7z4pQPnKJk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BOszz2ouYdp2nyAcCD2aG8JdCpmNCMHopL/KISEgya3Dpw+ZN2crKhFN4iC7oKk2e
	 mAZ8j9rf0OWRSps5mvBZ9kEmaBRg3698zWsRnyvIDTF1+qK/kNfJJooxEVrWokmLuc
	 g21pqGJsns6ZiL1PVe+IKEBYySfyrEd4C9oBhNsE7nDeoJKUZ4oDh6H59vtLKgalmW
	 5PzXiaVLd0J3RMLzFp8eFHN1M0QpjLiw7EVZ6FVyeShraf0MCnL19h8gRA33RKxFJ4
	 RsLw3UTJQeUBBADNTR1wCh/GUgofpSegBGLDqZxJjL09UmL6itkHLq31/mVnV8IlAd
	 rgv0SfSYQhD4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EAB860602;
	Sun, 13 Sep 2026 07:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E74F2E3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FECA80E16
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBWh8K8oBZ89 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:43:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 92AD180E10
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789285431;
 b=KRZGvC6y7dOPFd8cPel7yEKqPDZD6rCdYqr0OtuiVs0WG+UyzVjXL/wwhOl/kQWBL9W4
 Lv3Pp46tnWRgGjs935BB60hQPcPGXnzUxofJqkEzqyH8SZn0YhvvykLT98Mrg7SXOKfrK
 umS8q1jwoSN8qdAXf8SC3BmFJSSkzFqXgR71abr+QYI8c4Oz4M5nsySNg9WoxIICt5Hk1
 QlWhMeuEkRBVlRZ0Z+VyaZr2Fk2rhKo+tYsOdb6YUMQHbJJxMEggdhX6VRDWyzHXVl8Vt
 kx9gg3jqko4gMwXunFnx61kofYDIuorE8Qvy1Hx1sOy8sZaQRFcRUxDnTJW1XtMGIHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789285431;
 h=X-Greylist:Received-SPF:Received:Received:Received:DKIM-Signature:
 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=fYz+my+R5AsqCCw9gLbnj06qcDLiU1MRI1HkVPWl9dE=;
 b=oh1anIObQMvhWV7X1c82obabat5RHe4ZZdazc5uk5YSWAdOHoVKMc/iC/75GAM2iHc3c
 ljs5LXiyh/BFXG9+QHYTLWFBqA68F1x0nK5HRz8EjdGSXaz54MyqTudeYenaFqRGJdrsv
 ag66dIxxebv/X8FWqY0uoxOv5OhFtbpk4GvITAMXncmBl5BAThCccGag03Zcg/zsAywO8
 8BSiG0xSwCW28wsatK3Qd1TF98wJp0BXuNZ/FkBhYz1muvw6dCDhdz7y3hZ9Mc8PMKfBX
 iI9xD3hPjHBVmwYdO8z2GbX6u/x++N3xAG/ENVg3K860ij4ZPcgkLl3XLWTV3kHWYHg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vNiZT+p7; 
 arc=none smtp.remote-ip=185.171.202.116
X-Greylist: delayed 492 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 13 Sep 2026 07:43:50 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92AD180E10
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 07:43:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D4DD5C6344C;
 Sun, 13 Sep 2026 07:36:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3D24260435;
 Sun, 13 Sep 2026 07:35:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 002B811C7AF95; 
 Sun, 13 Sep 2026 09:35:33 +0200 (CEST)
Date: Sun, 13 Sep 2026 09:35:32 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <aqZSBEd2SO0aHS6V@windsurf>
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-3-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911080611.55857-3-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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

Hello,

On Fri, Sep 11, 2026 at 10:06:10AM +0200, Francois Perrad wrote:
> see https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac
> 
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Thanks for the patch. However, as you know, we need some indication on
what created this problem: which version bump, or which change in the
package. Otherwise, the maintainers of our LTS branches will not be
able to figure out whether this fix needs to be backported or not.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
