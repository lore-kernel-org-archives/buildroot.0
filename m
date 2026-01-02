Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68805FA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA5A4088A;
	Fri,  2 Jan 2026 22:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjaDceAdefEf; Fri,  2 Jan 2026 22:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F52D40865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393937;
	bh=7GFWQeNZzb+8Xw2st/duR8onglBbWbAanSmc6P4bNh0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SZROLJioeqbLH63i/+uoedEugEJlD3i7JsYyEW5X3hha7Jmj9oivhQpQNAqvMrLEv
	 ga67Mx6c8Goh0+yYwgdM1uwWknlZvcmgTX5+xFEo2Lu/jIMKlXdamXKWqB1MG5cTK8
	 pvTQXkUmCzdzzjOxT6ow2eGcHp644KKSCxMp3fWZPO2zAiHqCx+u/ZqHjefoFR0bqY
	 Fkib35rfRPEzDaIfVXBQ3fB9hcNEOc9EcgtIePdrilW+f6Z6WcQZMCqmXuJ7CpcCwt
	 mgpWOFdZdcMfWH9ElHKCBz2WOYPjOeRIzMzua1TBMzzMlVTNUpIVoY4vjv66eBU2d+
	 OcdYk6SMc6djA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F52D40865;
	Fri,  2 Jan 2026 22:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02752249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2916608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9M7vvRj41N8 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F214D608F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F214D608F2
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F214D608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2DE4AC1BEB8;
 Fri,  2 Jan 2026 22:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C9BC1606C7;
 Fri,  2 Jan 2026 22:45:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1BAF8113B023D; Fri,  2 Jan 2026 23:45:31 +0100 (CET)
Date: Fri, 2 Jan 2026 23:45:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260102234530.4d8450fe@windsurf>
In-Reply-To: <20260102224115.491959-1-james.hilliard1@gmail.com>
References: <20260102224115.491959-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4VFwKVaepBJ2hgZwQBqyH1QOCYDRmFeP/pI3qSen1mY=;
 b=mso3OB5lDP3OjtEFTcRd/q68bd5mSNA2kWtj3H+MN/psDGr1AypNApIsH1IN0zBs/EQu7B
 gh+fVt5sqJ4DfIBgGZljwxlEE9lLyCkAivr1BcqR2LUWIXrmgNNfYZdEbnw2mu8VcS6elZ
 OcurI+l8sm+t3cdGCz17CoI1QTRmQ+nxRpn436oYGvzv5OkR01O07vR4fM6UXTNbutWwHr
 vXuVG6IWJHK4/YZzM05lqWcDSGyUVyliq7l6BBrrHjDgcRzB2MlId25MTZzNXuuWl+m8gU
 cK0e87m0rBirtdAAJGPhxvK3MTejIjY4ImlzhVOmSWjWW+mpxjmXmsl0Go0C8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mso3OB5l
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-context: bump to
 version 6.0.2
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

On Fri,  2 Jan 2026 15:41:15 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to move to license file autogeneration:
> https://github.com/jaraco/jaraco.context/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/jaraco.context/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
>  package/python-jaraco-context/python-jaraco-context.mk   | 8 +++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
