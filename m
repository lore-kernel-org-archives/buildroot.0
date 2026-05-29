Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F2CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30FB56132E;
	Fri, 29 May 2026 15:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSkAoUsaJmEq; Fri, 29 May 2026 15:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576B66133F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069182;
	bh=+fdRY8BIh3SJqwFkGkqbbnmrS0bBuRO26ScApXCWFl4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NDhPEGGAymTg0mkYIyJyFCos642pqknkGmECDs2TpD98MZYC8AqsPSsX4cVQS5/L/
	 GNJhdvLwtf/Im81QWlNOLN7zK8wZbhJ+3tHq8yepanWrc5Rq4NhJRr/X9s/gxdrDXl
	 e2QsTj7hqUVBnX/bL1KLs8ifw32Attqs70MYOINUXbtpg33i2aaCBu9YJn2YDabrzk
	 JwehWgK0MqIEj/svyJ6Fh1jEEhB8IUxT2rAk3ddsFNejjWg4WGG6FUpqb3xVKfvo56
	 7a4jhKLws7eAIai/vw9yHmmAgV8KbU8T4uYoxeW/m/Ed5zYlIZC4c9Yg4K2LWQmAOh
	 K3KXSCAtSZKzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576B66133F;
	Fri, 29 May 2026 15:39:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C493288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A08D40457
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOscbHJQySeb for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:39:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 819D3401F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 819D3401F2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 819D3401F2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1D06C4E42D8C;
 Fri, 29 May 2026 15:39:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0CDC601FA;
 Fri, 29 May 2026 15:39:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D4F910888CBC; 
 Fri, 29 May 2026 17:39:35 +0200 (CEST)
Date: Fri, 29 May 2026 17:39:34 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <ahmzJzMLwCMwxmMB@windsurf>
References: <20260529150631.447940-1-thomas.perale@mind.be>
 <20260529150631.447940-4-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529150631.447940-4-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780069175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=7a+DMmzvnglmBQxVoaBXXULfoXElVr+CgYji8v1DuN4=;
 b=a3ldfo2HVNfIrqc8rTSFdbVyI2tT1unUCmPjW1VFgHyU5KDWXIh+dL3P3LdFjh24W50W6L
 1jl9eQB/9IFcWd4uOuVHAH+vPjHpTSfjRxK2+P3UvwdvCfzm2vasafCW13wC0Pi/1PDQ76
 XOYrrbuZcXZ5qoPI5mjP4BTflsVDCZpnLS8dWzV0e4QIHdQlfn3pYFImqtZ0WUUjfu7x5R
 L1d+H49CzyqpUkCpcMikuVz3sxavq+E6/uXCTM0VEt1V5vXEG8ZK3+UZajDEO381j4pM9R
 z9CA1f6pih7lTASqoAWeEvfxqHExAV/cooCg7afT0BwEIYmNy5CzRJJRFZFbPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=a3ldfo2H
Subject: Re: [Buildroot] [PATCH v2 4/5] support/scripts/cve-check: fix
 vulnerabilities with different analysis
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

On Fri, May 29, 2026 at 05:06:30PM +0200, Thomas Perale via buildroot wrote:
> Before this commit, only one entry per vulnerability ID was added to the
> output. In CycloneDX, if you need to provide different analyses for
> different affected components with the same vulnerability ID, you must
> create multiple entries with the same ID.
> 
> When running `cve-check` with the `--include-resolved` argument, the
> analysis of some vulnerabilities would get overwritten, which led to
> undefined analysis results.
> 
> This is especially true when running the analysis on multiple components
> with the same name but different versions. For instance, if the input
> SBOM includes both the `gnupg` and `gnupg2` packages, CVE-2025-68973
> could be included. This CVE might be exploitable for the `gnupg` package
> but resolved for `gnupg2`. Therefore, a single analysis entry cannot
> cover both cases.
> 
> This commit fixes the logic for adding vulnerabilities to the output
> SBOM. A vulnerability is now added as a new entry if:
> 
> 1. A vulnerability with the same ID doesn't exist yet.
> 2. The affect of the new vulnerability is not the same as the one
>    already present.
> 
> For the CVE-2025-68973 example this would result in the following
> output:
> 
> ```json
> [
>     {
>         "id": "CVE-2025-68973",
>         "analysis": {
>             "state": "exploitable"
>         }
>         "affects": [
>             {"ref": "gnupg"}
>         ]
>     },
>     {
>         "id": "CVE-2025-68973",
>         "analysis": {
>             "state": "resolved"
>         }
>         "affects": [
>             {"ref": "gnupg2"}
>         ]
>     }
> ]
> ```
> 
> 45 vulnerabilities were concerned by this bug over the Buildroot tree.
> 
> Co-Authored-By: Tim Soubry <tim.soubry@mind.be>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
