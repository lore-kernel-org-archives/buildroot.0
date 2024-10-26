Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886AAD10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5294940B38;
	Sat, 26 Oct 2024 11:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTi5ksX8sZwh; Sat, 26 Oct 2024 11:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0895640B3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0895640B3B;
	Sat, 26 Oct 2024 11:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21C2B5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0081A40B3B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVnKh63VnYtk for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A1C754098C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C754098C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1C754098C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:41:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A352560002;
 Sat, 26 Oct 2024 11:41:10 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:41:09 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
Message-ID: <20241026134109.2a7cfda5@windsurf>
In-Reply-To: <20241009-check-package-requirements-v2-2-df3e7b79788b@collins.com>
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-2-df3e7b79788b@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729942871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVkK+p0fdh3vcU0REctr1Q3uwn2weJVgICSa5b9BECU=;
 b=dwHoCp6ydGgaLGzgVKaCpZGRxmNaoxMZTBpnl7Uzj7EHhf+KG2kVbdtFIkbeVzlB58SNSD
 /JBTPCyzt04R23WCUj3CqIw7j4MFr9O1ZEI8U7gn+hjf2SXzMD3fYaMgGrEpbu2ehJczjx
 co9ON4Wl6qSaXX1kecnHygc4gq+KxcYXpICuuTz2PIOE2fbwyn0ouWmkdGADNEmE94gp7l
 JRfGKzzFzYawijmidJR+bcdEGG0cRkCHojC+NkN7AME+3n15DHPLdayUFPbRt5uzoQ5X2Z
 jUKGErCwXB1qJx5XeVU2AL0AAZrD0P7w5K+LeWrNoGCQfNqxdgxNK+Uat19aVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dwHoCp6y
Subject: Re: [Buildroot] [PATCH v2 2/3] utils/check-package: add inline
 script requirements
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

On Wed, 09 Oct 2024 14:14:57 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The check-package tool requires some PyPi package to be installed before
> it can run. This is typically done by manually installing them into the
> user's global Python environment or setting up a virtual environment,
> then manually installing each dependency.
> 
> Python recently defined a format for managing script dependencies as
> inline metadata[1]. This can be used with the `uv` tool to run a Python
> script and automatically install the minimum required version of Python
> and PyPi dependencies.
> 
> With this change, it's now possible to run check-package with
> 
>   uv run -s ./utils/check-package
> 
> Note that, because check-package does not have the '.py' file extension
> we must specify the `-s` or `--script` argument. That argument was added
> very recently in release 0.4.19[2].
> 
> I set the minimum python to 3.9 as that is the oldest version still
> supported[3]. I verified 3.9 works by running
> 
>   uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore
> 
> [1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
> [2] https://github.com/astral-sh/uv/releases/tag/0.4.19
> [3] https://devguide.python.org/versions/
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> Changes in v2:
> - fix utils/check-package to use Python v3.9 [Arnout]
> ---
>  utils/check-package | 7 +++++++
>  1 file changed, 7 insertions(+)

In fact, I had applied an earlier version, but I fixed the 3.8 -> 3.9
issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
