Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187F4D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D73F7607EC;
	Sun, 27 Oct 2024 18:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olzdCkV8-sRR; Sun, 27 Oct 2024 18:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03CFE60886
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03CFE60886;
	Sun, 27 Oct 2024 18:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E324DAEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB20F60810
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUiDxGUgvKGM for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA28F606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA28F606D6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA28F606D6
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32517FF804;
 Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:44:14 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Falco Hyfing <hyfinglists@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241027194414.2788affb@windsurf>
In-Reply-To: <20241026225918.3853690-1-james.hilliard1@gmail.com>
References: <20241026225918.3853690-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGBNPgbqJVpoJLLvPlnzOJ42h0AiqxkSD87xg43ZXg8=;
 b=YYOyMgGlwGmzHXWJupEmKJgfTGg0aNiaLnhoADurLVALlDkdekT+onjkph+eyE2GS06cq1
 FDXOYdc6DZ5DexTCNZ1LEfsHx5nrq9mzREw/TzKKw47e9tYIF2txfpdIUS8bp0rrV/xVsX
 Ny5P1BuM3oBVql+hytWl1XgegD781ZC64ln0A20OnqSI/1NKK8i9v75QkJx5KWOwwdqR//
 0+6/fLQQCPrT5aTvqTj300riK7neJXxTN3k/lQvP5K6XC74OKxsflWsxWk9cyyK5rnM442
 4CSc0lLk1MHyAzDGQ0GnHKpV+qxbd/DjmLNFwS7CRC4+Z9td4Z1SoNOJuTIZ/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YYOyMgGl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.7.4
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

On Sat, 26 Oct 2024 16:59:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
