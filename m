Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA9D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9318940B38;
	Sat, 26 Oct 2024 11:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BltIAnvKO5w; Sat, 26 Oct 2024 11:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D6124098C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D6124098C;
	Sat, 26 Oct 2024 11:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1AC15C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A107C4098C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ohfa9-d4Qw3Z for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:40:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AC96408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC96408F0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AC96408F0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:40:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 566CE60002;
 Sat, 26 Oct 2024 11:40:41 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:40:40 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
Message-ID: <20241026134040.7084d913@windsurf>
In-Reply-To: <20241009-check-package-requirements-v2-1-df3e7b79788b@collins.com>
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-1-df3e7b79788b@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729942841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5c/Xpe8wESqegDucyj/H/t5UN8lBylCHtG+GjXrT28=;
 b=ApCx8brVZ5/BUWFd0lDAq386ZsGAtFe8cF4OfEIeOf/tu2m87WMJ9QRDGpL9vACOe3igt9
 6vKYz3gNlfUCmTldtGzgDwG2Sef+5GOwHBSwJ+1ur6XWYfQFSeyS5pqIj0iTy1ikvtNeO1
 YjUEzGzVH9c+86/YutFUqhWd8/1s3zmhqwMwOL/uZfqGwZek1CduVWOhHymuy7imWpIwy4
 UfWBsn7DtdIAwl+nr7x4uY+sn/t5ekYPRiahcE7aFuZSThUBQg+NmxYz8iTpnsvU2ryN3n
 RGrlq9szf6lIwnxJqxJU+C7HVbJ66uEJQyG8IFEsX4/lZ+msmF8yIMPVYG0vbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ApCx8brV
Subject: Re: [Buildroot] [PATCH v2 1/3] docs/manual/adding-packages-tips:
 mention check-package requirements
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

On Wed, 09 Oct 2024 14:14:56 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Call out the requirements to run check-package and mention that Docker
> can be used to run check-package without installing dependencies.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  docs/manual/adding-packages-tips.adoc | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to master after rewording the part that bothered Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
