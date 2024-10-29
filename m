Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20457D74942
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC94160590;
	Tue, 29 Oct 2024 21:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cH_19MSUMgV6; Tue, 29 Oct 2024 21:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCCF6605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCF6605DD;
	Tue, 29 Oct 2024 21:35:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C63494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C918169A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dpf3FnJ4xE_n for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCCC6815AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCC6815AB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCCC6815AB
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3FBC40003;
 Tue, 29 Oct 2024 21:35:11 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:35:10 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20241029223510.3aa46a4c@windsurf>
In-Reply-To: <20241001092057.612830-1-buildroot@heine.tech>
References: <20241001092057.612830-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730237712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6hvog724uNrSv1flYWmKROwaGgdDt0xMliPAkPdbRU=;
 b=fyzlgN3JqbzcyIekptMqWXLWq/HbhABKj4dcANod6TSGdsTCeWvYL5Zt/qhj9K7d/NwrN1
 ElJlEoQNTiDysUUOlZqQpC5Z7gPUqopNHP/t7MY1ZbF9iVES9JmUQuLLkDCSx9vFFVwrqd
 z/OqgOjHN72EorGCL9hwOWbkIX5rAfl/1PHnKJjruZkIHhFB3RsPdSM9EpqIGb/s5ZADhs
 r1SK618vIxwlJWV9/hCDwiyU/i+EFlG+KpwpLbiIY4kK+JUaljY10zQrCgCzh9lYzgKFJg
 KSrITuzZk431IxcVOagz00e4IdNybUhvjOLB1xjS8/893YT1ImK5lTTThux+nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fyzlgN3J
Subject: Re: [Buildroot] [PATCH] package/linux-pam: adjust login pam file
 for lastlog
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Oct 2024 11:20:55 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> when pam_lastlog.so is not installed login issues an error
> that it is not able to load it.
> 
> Hence only enable the entry when pam_lastlog.so is installed.
> 
> Fixes:
>  login[649]: PAM unable to dlopen(/lib/security/pam_lastlog.so): /lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
>  login[649]: PAM adding faulty module: /lib/security/pam_lastlog.so
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/linux-pam/linux-pam.mk | 5 +++++
>  package/linux-pam/login.pam    | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks. It would be really good to have runtime
tests to test this kind of packages, with its different
features/options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
