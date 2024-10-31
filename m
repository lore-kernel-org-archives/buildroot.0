Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10807D767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 17:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FDD600CB;
	Thu, 31 Oct 2024 17:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AWmd06ujWDZ; Thu, 31 Oct 2024 17:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4E760610
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4E760610;
	Thu, 31 Oct 2024 17:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 084A05E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5434018E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOh0yiuTlnmo for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 17:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9155140158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9155140158
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9155140158
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 17:49:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 837B61C0006;
 Thu, 31 Oct 2024 17:49:40 +0000 (UTC)
Date: Thu, 31 Oct 2024 18:49:39 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20241031184939.1f2fb8fe@windsurf>
In-Reply-To: <ZyNxnz3raEBsZU7x@waldemar-brodkorb.de>
References: <ZyNxnz3raEBsZU7x@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730396980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0t+xpZABYwsAw25mMZezq2t0j669mpbVz/H5FgVT3c=;
 b=MvPW09kn7XDmdadB8Afm3c1kI0cCMsIzuPpfvu5hdf2pngOYvBqLNE81HKPkwSvgmpoKpW
 SEKOYW30UkNdigb3WgBzZbGaELdmvkagy5LA8eA4Ee4raP/f7OkAyjUpatT/v+lu2xQr+o
 /jijPVPs8PR392Os39js+s6JwJFxX1Ql4Vt6RywyC1TKnvCV5x4KzwY77dgHmXUOs8FUSU
 DABAvc8OKU6wm5HxOoEHd2uXvlOkYtoH0T+WzymqiIdbZkBnAHbw/qN6cVu0dCRaa+/Nt6
 E9K8kAAjVjFMRT0s8EYhLeiMN9UFB+izl1rS7Ld0LT10ngHm9b5NSTPjAF134Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MvPW09kn
Subject: Re: [Buildroot] [PATCH] package/zabbix: update to 7.0.5
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

On Thu, 31 Oct 2024 13:01:35 +0100
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for release notes:
> https://www.zabbix.com/rn/rn7.0.5
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/zabbix/zabbix.hash | 2 +-
>  package/zabbix/zabbix.mk   | 2 +-
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
