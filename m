Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A885E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 115E960B77;
	Tue, 30 Dec 2025 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovDJ7y05677e; Tue, 30 Dec 2025 13:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5332A607C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099950;
	bh=hgcHojD7Gehl2+oP15z74Y015BkNH2dpAtYaKnc80Bs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vx7JgFQjMTb7n1tJvEM1zC0XnuWNPI6jHsUXSupHv+Z5OAzMLgOcGWblXA37Qo8yB
	 xHP2IOkUzIa3YftWmq7RyW+/o8BmdkpBfzajl3hO+PRwM9LV2z5S/lTz7Yvrhx4t0G
	 HNLx3ej/cCMJThR11ns4gu8jSBJwCBTlSwquxRUyRs4xShW7I+BUOAbNU5t3hMvU/b
	 9L9LwR/3iu+/TWylra4TZRW445o4HYDAkNFhqztA90fvz6WR+NfKWHcbat0u3FAKtW
	 6E5WzWsH12MK1PpiDGYWrrUDJvo5IRHsER/P4QMHtMJK2UdV6r1SvGDg2Oz4G6jl7H
	 Mo2C/OgkcuJuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5332A607C3;
	Tue, 30 Dec 2025 13:05:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B56F4177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C2D64013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgL3PM8r8Qcc for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84AAB4013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84AAB4013B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84AAB4013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CD2731A2534
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D51D6072C;
 Tue, 30 Dec 2025 13:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E33EC113B0392; Tue, 30 Dec 2025 14:05:44 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140331.708c7356@windsurf>
In-Reply-To: <20251228234931.2896108-1-james.hilliard1@gmail.com>
References: <20251228234931.2896108-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bQmJU8Lvj0rf7TOV+vixt2WUxKI8fHbZMByPEbk/s6A=;
 b=suqP//UhAZeIEXouv189JD8rY7YPtnG8jzuVL92L5qL80Le44TLaye+VE4mN65gOno8wtR
 5bzgfR02VezA2vTXNaKLpmPkrZrV+ycllM2fWqv3JVat1Ung4XY80R2cXdkKknJif41mGg
 biHUSYdjZzF0c0sx8ztdpayNLUo+FyxZOkrFzG03sSK4lE5OwZf+8cZV7gETvDooaXtzae
 ZCYh5Ev4crgxcUR5uYcCk/zFC8o+iRlHo4QUj+PnlcpeQZW23B0LmVkjWDofepWXvVTRXe
 E0Au2+Ie+16t09KgOuiGj6vt6gGqd8gpGccDLpcX9kpd5QatgYsya63CcCMzpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=suqP//Uh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to
 version 2.22.0
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

On Sun, 28 Dec 2025 16:49:31 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-asyncssh/python-asyncssh.hash | 4 ++--
>  package/python-asyncssh/python-asyncssh.mk   | 4 ++--
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
