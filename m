Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF02D3C909
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 11:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EEFE6063A;
	Sat, 19 Oct 2024 11:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PvJvwhKbtS0; Sat, 19 Oct 2024 11:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B1060652
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B1060652;
	Sat, 19 Oct 2024 11:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF2814961
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA8DE40551
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkD1TG5xnSJJ for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 11:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F75A4035F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F75A4035F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F75A4035F
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:39:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C81940002;
 Sat, 19 Oct 2024 11:39:35 +0000 (UTC)
Date: Sat, 19 Oct 2024 13:39:34 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Alexey Lukyanchuk <skif@skif-web.ru>
Message-ID: <20241019133934.645d6625@windsurf>
In-Reply-To: <20241011124545.2395991-1-peter@korsgaard.com>
References: <20241011124545.2395991-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729337975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqgIgFc+th/xsVA7Z/YJJU8SzE2OSyEL9ee2ZfqXPGs=;
 b=JkE94Ji8m9Fio4+2A+4lMgskkawGiU7lGncmgxSLUrgZ1PftPMQMS352nreSRGMLTza6hs
 oo3Q2cZemVz8F+QSIseJmArqk4EX1BTH+caoc1LUqY699DnF7u2py0POT40sWJBG5M9c9j
 isUlj3vAZzdu62D8YUl5LtcREZokqL00KR7wqqwXMrEcuJO8WIRGjIAhmYgJBrMJRR62+T
 4F8lSk0jumIc5vbsBolM/O42yi0ImhyMW9IJWpV7eIMTDl0ZnW/Uihad2cxrwLM+vGVIKk
 fa0QfYsEnRwC3jgjVoqW3uAhK83cwOISIPscmKXZ1916oUwi5ByN8FjJb051KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JkE94Ji8
Subject: Re: [Buildroot] [PATCH] package/zabbix: correct license info after
 7.0.3 bump
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

On Fri, 11 Oct 2024 14:45:44 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Commit b315dc5fbf40eb0a (package/zabbix: bump version to 7.0.3) updated
> zabix but forgot to check the license info, leading to legal-info failures.
> 
> Both files have changed - COPYING now specifies AGPL 3.0, so adjust hash and
> license identifier.  README is now just a oneliner stating 'Please refer to
> README.md' (which also does not have any license clarifications), so just
> drop it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/zabbix/zabbix.hash | 3 +--
>  package/zabbix/zabbix.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
