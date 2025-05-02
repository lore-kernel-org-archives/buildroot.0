Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C20C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0160B81F1A;
	Fri,  2 May 2025 11:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7y8_w7aaiC2; Fri,  2 May 2025 11:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3256B81F68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3256B81F68;
	Fri,  2 May 2025 11:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F009D229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B7940AAB
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_NgIChIyfln for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00BD84094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00BD84094B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00BD84094B
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:10:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F03D41C0FC1; Fri,  2 May 2025 13:10:41 +0200 (CEST)
Message-ID: <f3339d8a-aeae-48a8-8319-430d08a1cef0@rnout.be>
Date: Fri, 2 May 2025 13:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>
References: <20250423173349.474898-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250423173349.474898-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UsHHvavJlmuSVIfaK7CgIHEMaIixfuhkMB2ZddSoyQc=;
 b=kfhI9gKTXgw2KI99kp1Dw9hpfXf5KPHbxwC/rN3yRtstKuHwCSn/9HWbDolbW7Wgpxcsjc
 tD6fu2Ka5j2X7HVmLLsgLFEfoHd3bNSqe5rxDOjYvR+62M9kZxFsn0IDX777Qm2xl+yQNy
 2dlo8wRkPNddQ+j6kzwto6ifCYb2fjTHwoHg9KdWMKXLftz++DCUulSb5UF/o/6tsBjtgD
 afs8Bmca+v/o+nGVaxd8bQj7yj4XOeP+L4gU0Y/MtB/kWlQAd4mZRfoLH5zCyeui6NLspc
 ulC1ZOIRnG7D6y9X7LvEHhxM5F9CJhXjeRF5zmx+FSWYnNX42IMa6tE7QdACvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kfhI9gKT
Subject: Re: [Buildroot] [PATCH 1/1] package/micropython: bump to version
 1.22.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2025 19:33, Thomas Perale via buildroot wrote:
> This version bump removes CVE-2023-7152, which was incorrectly associated
> with the micropython package in pkg-stats.
> 
> Although the CVE fix was already present in 1.22.0 the CVE only applied
> to the preview version of 1.22.0. The CPE ID of the 1.22.0 matched with the
> CPE ID of the 1.22.0 preview version as well.
> 
> This patch bumps to the latest patch-level version available in the 1.22.x
> series to include additional fixes, rather than just adding the CVE to the
> 'MICROPYTHON_IGNORE_CVES' list.
> 
> The LICENSE hash has been updated, as the licenses used for the ports and
> libraries have also been updated in the LICENSE file.
> 
> For more details on the version bump, see the release notes:
>    - https://github.com/micropython/micropython/releases/tag/v1.22.2
>    - https://github.com/micropython/micropython/releases/tag/v1.22.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/micropython/micropython.hash | 4 ++--
>   package/micropython/micropython.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
> index 43551866b9..bbfde0e89f 100644
> --- a/package/micropython/micropython.hash
> +++ b/package/micropython/micropython.hash
> @@ -1,3 +1,3 @@
>   #locally computed
> -sha256  a042764f0b6f6d92b267454c5bd5afcb83fc3900119f2583672aac571e661924  micropython-1.22.0.tar.xz
> -sha256  d9e0e0395867c899090e150213bc2b417e970c17355a8d48300089875b3c8037  LICENSE
> +sha256  bb3ba34848a7620663b6a7cba22af45d3056fc79328c2ceb943874b5478d8756  micropython-1.22.2.tar.xz
> +sha256  fe63a3fbd0731f6530e0783224763bceef972e516cab4b8513ca4d7b05be9713  LICENSE
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 125a0edcfb..558ef86534 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MICROPYTHON_VERSION = 1.22.0
> +MICROPYTHON_VERSION = 1.22.2
>   MICROPYTHON_SITE = https://micropython.org/resources/source
>   MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
>   # Micropython has a lot of code copied from other projects, and also a number

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
