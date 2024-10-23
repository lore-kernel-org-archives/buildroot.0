Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5846ACFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C452810A5;
	Wed, 23 Oct 2024 20:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 821JMfYXQTMr; Wed, 23 Oct 2024 20:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404B4810EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 404B4810EA;
	Wed, 23 Oct 2024 20:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FA74960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA63360851
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Urz49UD4lUlO for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF62960771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF62960771
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF62960771
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DAB1E0002;
 Wed, 23 Oct 2024 20:22:30 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:22:29 +0200
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241023222229.718faa77@windsurf>
In-Reply-To: <20241021100941.11360-1-nicolas.cavallari@green-communications.fr>
References: <20241021100941.11360-1-nicolas.cavallari@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22cOLJ9wfZ0EzNye5i+Ct9Qj1yKYaIHp5R2nRrUNfpU=;
 b=iESQpIK8EmUh6s6q9jqEWN8Gy02n6Pe0kHjFmzvbS/z/IPTaFskIp1AnnfwnGJT0/kTeM0
 KZjqtPc7NjawfL4oRMWJ+6dIFP8vfOWWOnNvbEriTwmH4zWRA37RpspB6lWsVo+fj3C3or
 9LvZokkT19oqo/nUEiPrEfVpMh4tcag74VJcO0pIpqsB0jT01qeJfciMowX5uuQq2P0Gyh
 wWS4v6KcyvNf/pVQ5OYGSP4E7ToXCwJ1vIFfJKEdGBdY0SKV6bGQHGbxhuSn0GOK6wqOdY
 LKWXLH3IsaIM/rlgOj1ItyAIbs+tdr5l0IlSZeZxodjmtXLXBO0NS2lhtooc8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iESQpIK8
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.2
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

On Mon, 21 Oct 2024 12:09:22 +0200
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Fixes a minor API issue.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/libgit2/libgit2.hash | 2 +-
>  package/libgit2/libgit2.mk   | 2 +-
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
