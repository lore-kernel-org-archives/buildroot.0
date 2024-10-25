Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7413AD116FC
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 06:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D718193E;
	Fri, 25 Oct 2024 06:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_PWScCwyQGf; Fri, 25 Oct 2024 06:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F98E81951
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F98E81951;
	Fri, 25 Oct 2024 06:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67B6C2318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C2C60A84
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgmWvOcpz4-k for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 06:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9007160A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9007160A67
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9007160A67
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 06:17:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3F6BC0002;
 Fri, 25 Oct 2024 06:17:00 +0000 (UTC)
Date: Fri, 25 Oct 2024 08:16:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241025081659.185173ee@windsurf>
In-Reply-To: <20241024202237.2629544-2-bernd@kuhls.net>
References: <20241024202237.2629544-1-bernd@kuhls.net>
 <20241024202237.2629544-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729837021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VarM+9YYO8tZe9zSpVXTvxrtdhhWHPQyT54n7vudXg4=;
 b=WI2Y7UyX0SM0R6jmqly7OdFzCdfbkhQyUioVbdVQaa47esu3wjqJlrceTs1bchibGn2IcN
 qxBsP+k35Nn+JHSYAOEHuHVSyCxgTlBdF0849MC+qIvnRcfdQsepUdAEiXPJ8IELCLZH7E
 j0kV+JCkwFWqez1GH4VzrxZXEcE9cjHPrpLGCt2zZCuXwEuPkhiYXcnsfcyAwCcehPENg0
 zDvONuo5d58G9okgFrPdWmm/BArJe3bvPpGS/iRztkLhOMqe6inGh5r6xwG1c1KGPLfZe8
 M+BRU5mvcBT2rtc2daafzm1xgAfW4AH5o7DcXV/I4WvcWP3vi2DkUr5dxQF1fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WI2Y7UyX
Subject: Re: [Buildroot] [PATCH] package/kodi-pvr-waipu: bump version to
 21.8.7-Omega
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

On Thu, 24 Oct 2024 22:22:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
