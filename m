Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9590FC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A11180845;
	Sun,  4 Jan 2026 10:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulRAvrFV3dHo; Sun,  4 Jan 2026 10:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86EC380CB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523609;
	bh=bPdR7xSGsAXvGP3s48uS+JvEquPkKLD31q4VQ0lTM5Y=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SC6Ozb1+tWSzMRHhStx5+RP2tgMN3FvteDyL+ln8+X0zekfJyAaqLcw3Enoq6jLIk
	 GCmGH0EXpKibeI38R0Gg1bjuDIDPp8EXE1sqLh4yb1nhL4dWeFM7Qx0Wmbnop9ctd6
	 gh8pZQs8Gv2+/I9v8RBiF+eVctQbtKmPX885UUKBWhIV5FFgKF+HMwqiwrYN2RC1Us
	 RAHvUR2iivn4eW9lBwyNYrjFikerXuQK+GfQ8ipymxGFDdXiCQ3xNDHLWRY9CLlwRQ
	 6mfMZjERhZe1hHpUAyY6a9m9nYZ5AZ2k8+QVxnMaBUAn6BVKeUOYYqaRTbs61bDHY/
	 iyLsTejFqfJ7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86EC380CB6;
	Sun,  4 Jan 2026 10:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 894B42DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A244030B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w73l_QG1YmfR for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92AA04011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92AA04011C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92AA04011C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:46:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 42B424E41F46;
 Sun,  4 Jan 2026 10:46:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0ACD06072B;
 Sun,  4 Jan 2026 10:46:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E914A113B0449; Sun,  4 Jan 2026 11:46:43 +0100 (CET)
Date: Sun, 4 Jan 2026 11:46:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Philippe Proulx <eeppeliteloop@gmail.com>
Message-ID: <20260104114643.62af08fe@windsurf>
In-Reply-To: <20260104101205.1381959-1-bernd@kuhls.net>
References: <20260104101205.1381959-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dA5rU8QWHhhoG10JQ8uzi2SVrcrAUu/7F2FeEGcp1eI=;
 b=DStXjWQHcJ8OucFdIM/AL/mb6Hvhw/JcZHhMEqJIH+xd+srCjzbztWpFfEeY9R4KJ6koPM
 7FVT4lfsuaNcTfSgssQIwIBFcuhV5sgWLwx8ZgG3hBK9MdQ8c+9tTypHmrJlnEOJUan8/m
 94CJ3m2Yd00fGJTkD5BDQ9ZFspnxmJmsEfr0UpmM2mV6pJcswdZBFaQG67XnlpYxP69iZl
 p7qrgTyCGN0I6TXO2Njrip53AzWE3BfVB34dYmV8v4y21sA31s9oHAtAqfGOd6TRIT8NPQ
 SCERlTcY3saWVgqR1afSE0qEATA9EDVEvSRSZ6nCbDQLHXBoGYomySNldZ470Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=DStXjWQH
Subject: Re: [Buildroot] [PATCH 1/1] package/babeltrace2: needs C++
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

On Sun,  4 Jan 2026 11:12:05 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit cea219e5180e7117a6002c4a784995c9dad48176 bumped the
> package to version 2.1.2.
> Upstream added a mandatory dependency to c++ in version 2.1.0:
> https://github.com/efficios/babeltrace/commit/c20049fd0678f462f621c80f9e91c1ba16e6b656
> 
> Fixes:
> https://autobuild.buildroot.net/results/a18/a18f8a5561536d0ae649d73e5871d9a7f88275db/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/babeltrace2/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
