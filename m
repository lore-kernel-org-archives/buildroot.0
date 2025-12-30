Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A31E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA1F780AAE;
	Tue, 30 Dec 2025 13:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgYzSwaIY1jt; Tue, 30 Dec 2025 13:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6160280887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099954;
	bh=jh1xe0tbxX/mG3YcW7NWNgoFO8fYV/xllcGMbJ1g5UU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a270RL3u7yq9VunG006N5SPamJmfqnGprYKNT+uR0XAFeQwVQley3fvJOUY6Et6Ro
	 8aOP03diH5NXfgfAJ6/j/NV32o3VpQEV+rHAdA37OVyWvz8jz8QIvtbZnQwCXIcyC0
	 6WuGf5p0/XtwWfAeAzsOayL5Qv9A6jfOoSD1FWwux82US9OMbScMqLu08zap/4BBKM
	 56yYLieS9oVyhGFiKa04V2jnLL+T0i3wCJNQFbllcKM5HtizktpqG1eUJZFUr78akV
	 X3gcGLHzBvgPdZK/AjR0ClI6A+GEc0z2lG6lTM+j/RECzLKIByzDl550V40rM0JEm+
	 0PZJhYA6FKVBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6160280887;
	Tue, 30 Dec 2025 13:05:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 841D2D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7530860A66
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQIGhGEQoNxF for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D91CD60B76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D91CD60B76
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D91CD60B76
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B69524E41E82;
 Tue, 30 Dec 2025 13:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BF3C6072C;
 Tue, 30 Dec 2025 13:05:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79A88113B0392; Tue, 30 Dec 2025 14:05:47 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20251230140340.41b66a8b@windsurf>
In-Reply-To: <20251229004042.3100499-1-james.hilliard1@gmail.com>
References: <20251229004042.3100499-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4YVOJfBbOe1BXiC202Oc+PHf7Ou/Hlf5cBsZfdABJ9s=;
 b=KVuRsh05lIE6IKANHfXwUDsiTkIVkaen0UB0xcqCWhvid6gNUpxUa4XxIw+ZpGNv7Crc9d
 V33+w25LeVKQvRDTtSct5mQ3yJmBbF/rMKWFjceJOJpy5PQKuytsmbT3RVUlUB0scqZ4ng
 GqLRaZC0kM4hPrrliN63fp4BDDsAzVYvipYvFVjSZ5P1k/ePY2m5+YS7iEhK1vaTcSIUlQ
 HMGignhcGk+hqyXpG1CWrXVJLF7QJWQh5a2QWVc8icqgCZQzPUzgLPjCUtmMLxK2xbnYrZ
 j7McwwjGdcWkG5DhkTNHDnPufC3suxnb/iKkmI65LCvXJzmk4EIHlMA//6KlFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KVuRsh05
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 12.0.0
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

On Sun, 28 Dec 2025 17:40:42 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add libavif support.
> 
> Add new python-pybind build dependency.
> 
> Set --skip-dependency-check since pybind isn't detected properly by
> the pep517 build frontend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pillow/Config.in          |  1 +
>  package/python-pillow/python-pillow.hash |  4 ++--
>  package/python-pillow/python-pillow.mk   | 14 +++++++++++---
>  3 files changed, 14 insertions(+), 5 deletions(-)

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
