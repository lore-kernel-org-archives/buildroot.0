Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF53D1CA05
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 22:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 100EB607AB;
	Mon,  4 Nov 2024 22:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ1MAxdw1-IK; Mon,  4 Nov 2024 22:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2440D607B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2440D607B1;
	Mon,  4 Nov 2024 22:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C600B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB44403DC
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCbsDMYb8ZTK for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 22:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D19A2403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19A2403E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D19A2403E4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 22:19:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0BC2240003;
 Mon,  4 Nov 2024 22:19:49 +0000 (UTC)
Date: Mon, 4 Nov 2024 23:19:48 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241104231948.0d2477c4@windsurf>
In-Reply-To: <20241023220933.3325504-1-james.hilliard1@gmail.com>
References: <20241023220933.3325504-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730758789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZ5s2fx14+7Rz3GyKFGTxOR6cIugg7E5C8R0oZ57ZsI=;
 b=idcWmImyK+c0yv8Y37hC5hciUkD9nPZ5bmVquVecLh9EFAVqbGhiHKIcuXVXbePHQ9XJgF
 DkF78Rv23sVdFQHOl05/vDEWLzSl8oAiFcDfbx8eW4PJG8vGmMyT3vBjLG0nhj0WCmM9Cj
 oJjb8AqCsnOtvIJIdI2RNRAxe3fSCJ14SsfeCZ2woY+h5r/zONQNQOuZqEEm3fvd41oI1s
 IcuQ5jOWvs3oCjZzi+QgUcIeskktxf57gUWP5SjiXCuK7jewkdrp8noLCphEFB7KwBC+jR
 9iMnggIqBxY9h/Lgvo1g9eX8JxUCR2iCvJ0nvUwAh3xuX5n225AmdZo6mBlYFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=idcWmImy
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: add poetry setup
 type
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

On Wed, 23 Oct 2024 16:09:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> As we have many python packages using the poetry(poetry-core) build
> system we should add a setup type for it so that we don't have to
> manually specify the host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  docs/manual/adding-packages-directory.adoc |  2 +-
>  docs/manual/adding-packages-python.adoc    | 20 +++++++-------
>  package/pkg-python.mk                      | 31 ++++++++++++++++++++--
>  utils/scanpypi                             |  2 ++
>  4 files changed, 42 insertions(+), 13 deletions(-)

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
