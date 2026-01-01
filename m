Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05302EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0F540864;
	Thu,  1 Jan 2026 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyOd2wgRXWq5; Thu,  1 Jan 2026 09:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD824083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260962;
	bh=iQ3aiuSx8bXyyZGX8tgBij3ddn2mfPQQ85PH13t1wCg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o7q3Jy8FQDM8htQbX3Kp8mNAa1RXYxxAodehZ6F2amrA1LkKNN2e0xWKd1nYenetC
	 HAJBpMVFnsdVWvR6M+uYmi7DFh5sAYq8vIIu0MsVJEmYlIqRtCvio67HAwGK2eqHSi
	 D8kWtLyRBaEtxpy8tFqC+8/8d2dcumOBaTE5oJoZIukm3KTHnny21FLxPL3+Ew5kAz
	 ywWDfzJEalVt6d0SAQcF9wGhREUuVcIh0eg/LKhu5+Hsw44TnKhPhF5zkq6rkoXU0E
	 6ezi2QwOsoywYPwkjn+HhRD9MheMpQKF3UkzA+QZO73HRtFj3Dj33pX+cSxIDKYBl0
	 gQXY8FCl8SWUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD824083B;
	Thu,  1 Jan 2026 09:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E96351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB46F40168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A25Lw8WdIqxC for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A77AF400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A77AF400A5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A77AF400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F30464E41ED2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C35B3606B6;
 Thu,  1 Jan 2026 09:49:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34B5B113B072B; Thu,  1 Jan 2026 10:49:17 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104708.656de89c@windsurf>
In-Reply-To: <20251231222954.529580-1-james.hilliard1@gmail.com>
References: <20251231222954.529580-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=50jgljrnwvw3MEk822AvKjgjFWDiHRlTZuj8ZFypFIM=;
 b=jW56LoR3INxpelULJpb8VjWOVGA0HMp7y7ZZajFpQ5YAz+YXiXJ+hq/+Qvrv9tioGhWQKB
 CliAQ9q/XQTMA8Rcr1YgxTZsgyrKE0KPp4esWzYihNxt1hOA37g4eqYVdEQsrIvcrCcwAw
 J+6M0Q7F9ezUkmqFefd59GaeZnIM2cCe+7yWz4fw+oFeCMmgvYI9tD7N3HacLPIWQxbnhy
 6EDtBqYHqgtorCJLNXaWH2bcMxEyubwiJqobaRtDrHOpespA70mLM6ySYipLMePL5WOtTo
 bmzw88u7Iba3oBRDJ1yLFTUdlteK6VkveVQKWFFpvkVP87XRArjLNc6pFSaO4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jW56LoR3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to
 version 2.9.11
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

On Wed, 31 Dec 2025 15:29:54 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-psycopg2/python-psycopg2.hash | 4 ++--
>  package/python-psycopg2/python-psycopg2.mk   | 4 ++--
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
