Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD39C5AD55
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FFE96064B;
	Sun,  9 Aug 2026 20:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ny7O0hslso_1; Sun,  9 Aug 2026 20:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B686061C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786308398;
	bh=rM276CQqDq6JUeOcWXz/zzkMMtO62Tht2tbA0bFMUXo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G4PoQcU7ba3PcKikF8QJBAaIcyuVCvil5ZpNBJyuvE8zbqpbtAkMYP4m/Bxfy/Cw2
	 vRnq8RH+PnOtHK1moOpIg9NOfuzieq4FV/wZVJ24477mPYC2JLmfEdSy6Z1x8aszs5
	 dDQb6VjCXtyUQXfaNJXMp1j10JiobhwiJF2t9wsx/i2NM6UrDpiCdbTQhD9ie+Fwv5
	 fJ3wQy4DY3IvHBy+5A7iyllhA9Dnr89aIhVu+4FqxBYm7c6kmO1I0v7ePcyQYBZeLW
	 qE0hKeZTGe5/HrYgH7TNuoor1rBbqtKYVlEjkvwEPnXThHN2sfEFzFf2zBtOMcWNBV
	 urbxbt2lZchtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B686061C;
	Sun,  9 Aug 2026 20:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5749A282
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EFC80C66
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDXjqqiEwm5G for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:46:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CDDE80C55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CDDE80C55
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CDDE80C55
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:46:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8AFC01A1504;
 Sun,  9 Aug 2026 20:46:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A1D86033B;
 Sun,  9 Aug 2026 20:46:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9C9A11C4955F; 
 Sun,  9 Aug 2026 22:46:29 +0200 (CEST)
Date: Sun, 9 Aug 2026 22:46:28 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <anjnEO13vWbMUlyI@windsurf>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786308390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=HitfxCjqI1urOIz4T1+cj4o4N+qO2YKbH/g/4BIpo14=;
 b=FmBCvLg1vMT5Yhq5SBXWOSb6UgjLo/k40BTCDMgyjiG1J7rExrXqTR/HeReL7pntpg2nFQ
 5MM/SekgSqP64kDrxfyAGRMf/mvOR7wwTbzH3kgxS2i70TMcvX59w5q6G85g5G4sK9gDUr
 mlHTz9NEA3aLze8tFb3SGYJrGufy4OX/EHmVMy1rEpXXQt7OXioCocMS5L19aXa3Ot2Qr0
 Ak6u8+KCaDN76vnYbKXfCp+X5O/n8rCLw1EUXYGiQnCg1oPoEq0G27m7nVprSNT3CSrA9i
 lSzzqfY0VFkxWYkSiPRXbvxMesQroXQ40vZKlbeTZrnEpjkSN349xw+NS8mhag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=FmBCvLg1
Subject: Re: [Buildroot] [PATCH 01/11] package/mender-grubenv: add busybox
 fancy sync fixup
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

On Fri, Aug 07, 2026 at 02:55:00PM +0200, Adam Duskett wrote:
> This prevents multiple `sync: ignoring all arguments` warnings
> when the `grub-mender-grubenv-set` script is called when a
> system that uses busybox sync installs a mender update.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
