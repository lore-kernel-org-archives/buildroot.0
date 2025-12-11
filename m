Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB3DD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9356241200;
	Thu, 11 Dec 2025 19:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9rkqOPKWru6; Thu, 11 Dec 2025 19:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B5541209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481554;
	bh=bTRQzH+dM4COBw7ANwC7SXcTNnvILjcEG4ytQa0slzg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WNzKbE/ujfHuWQZl8bzr3/ZtMG9M5CD0OO51VcdVEu2EZx4bpSYjpi95kIRSjlxGJ
	 PqhGkv6F0EPLqpRyNwDiFLsg/i1M1Yf+Bc3QV6AJwzCk/MqTZk3whiW3N/uXyWLSJl
	 nvrOwHJoodYO5KL5WGqb+0rU6LJLiR021f085/yeq5fboOORNrSOxbazRes0LfpwiX
	 jpb+e6ForHOYEPuft7b0Zmd5LE/Vby+Lut1jjse7Y7fcO2qznjjUy/Pi51niFuKh2A
	 BGlsoCrmNQNtlO3uvF+jdiZxie4iPaxGlaC32pxUeC0md4VwCAaGj7OYZDvHjs8HKm
	 Jkn+qZBySfjtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9B5541209;
	Thu, 11 Dec 2025 19:32:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 576A92C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E2BB60592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qchOjXVwvdoK for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35826605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35826605D2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35826605D2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DEA7B979EEF; Thu, 11 Dec 2025 20:32:30 +0100 (CET)
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:32:28 +0100
Message-ID: <20251211193228.1100794-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205180454.555029-1-raphael.pavlidis@gmail.com>
References: <20251205180454.555029-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481550; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=STlf8ZHyDlJ1w+S2AbuD/k16JHMIbTjaXK0NPhAQdRk=;
 b=ei3vz5IyHfx2FKvuyhEsaQP+X/OWF61pES+nVQpCdcTLt/ILFcQ5CYKfwqf8bKqU8Yw7te
 ED6+I2zAUufaHZg19OvhJwQw9bb5Ht2yjiiwRB881L3bYxZNhc9fn2aSPVzcElAG2n86uw
 cAeOtHNUDSZzO9WYOQ2taX43MM9CNT56HYBivpLu9kvhxmVPtvCCCfSu1UnKGBGbvHr9QA
 YeUd6VpeN7p/s3wTabC6blk2yLGrIfV3CIexZf/a1sgAkTlAG3PsetMS46fBHwBSCSshnj
 gwoLhBapnPFm6uwVNjIVY8SogJwzFTwmXF0iZRUDx/S6TqSLIBNPZlGCETq5dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ei3vz5Iy
Subject: Re: [Buildroot] [PATCH v1 1/1] package/podman: security bump to
 version 5.7.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Changelog:
> https://github.com/containers/podman/releases/tag/v5.7.0
> 
> This commit fixes the CVE-2025-52881 security vulnerability. See:
> https://github.com/advisories/GHSA-cgrx-mc8f-2prm
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  package/podman/podman.hash | 2 +-
>  package/podman/podman.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/podman/podman.hash b/package/podman/podman.hash
> index e52a353aa7..ff6600ac8f 100644
> --- a/package/podman/podman.hash
> +++ b/package/podman/podman.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  1a35d0030bb8dff31cf45d16d98cddfbf9ceeb2835c82d95b4eacd5a26e482af  podman-v5.6.2-git4-go2.tar.gz
> +sha256  60de04a48c0ecf5006fb8e26543e2275126833aeaf2b5ea02ba492965d96173f  podman-v5.7.0-git4-go2.tar.gz
>  sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index 71eb26b496..31cc9ba349 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PODMAN_VERSION = v5.6.2
> +PODMAN_VERSION = v5.7.0
>  PODMAN_SITE = https://github.com/containers/podman
>  PODMAN_SITE_METHOD = git
>  
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
