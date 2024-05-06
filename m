Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB55CC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B68F980B29;
	Mon,  6 May 2024 20:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-LEhDrXYyG5; Mon,  6 May 2024 20:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A0080DB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A0080DB4;
	Mon,  6 May 2024 20:13:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5993E1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C654058E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8szfjozf0EDi for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 309AA40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 309AA40108
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 309AA40108
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:13:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72217E0003;
 Mon,  6 May 2024 20:13:46 +0000 (UTC)
Date: Mon, 6 May 2024 22:13:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240506221345.1ea81209@windsurf>
In-Reply-To: <20240506200206.111393-1-fontaine.fabrice@gmail.com>
References: <20240506200206.111393-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715026426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yq2caDwdQH/DfO4LlB+n0JQUO/6VIBOpmRjJY4O/xbg=;
 b=FYJ9fT0Ob6a0UNg08xPwGKvOGrJgUvNMIlZG9RZci6MIO+5+sk68FZqC4lR32eMyUUlasw
 1Wc1h0HB07iGJ2m3HmxXDtycwPm7nZ1ZwzAMMmSNZvQ4St+CBK8zOjR+oRXeyCKTpqHzwI
 q1bHdskt+VwSdJtCsh9f/i4/LH7U3zJ35Err1vpj+pES0qYlPU/osRNOhToZQU3PUhS5NM
 QJbE+rXSsIKQZsSwVKDy1X4epDJap5bkc0q6YGDCGCZUB+s8+GS5SxaH4MS4QTZufXlwSR
 rRyrYA17Pgf0tbC317s0WRP3mM9GR+jo25bMlqDpQFN+q67cTomc6VSmVq8zLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FYJ9fT0O
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: add linux-pam optional
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 May 2024 22:02:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> linux-pam is an optional dependency which is enbled by default since
> bump to version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b
> and
> https://github.com/ppp-project/ppp/commit/2883dd07101bf851e2ea368f0c04c91aea85cff2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pppd/pppd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
