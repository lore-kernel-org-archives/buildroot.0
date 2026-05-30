Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A07CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA6A85244;
	Sat, 30 May 2026 08:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnw071RzpY9p; Sat, 30 May 2026 08:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3418F85018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129705;
	bh=YRjy8iSTzBqTod7k2oXbaDd6xm+pVDpxbNx5hhGk4B4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JWO/ob5ztFURI47HHPvEyr/Heq1cjCBFIA3B9O8tfSbWtC4nFDjZ31I/bEPNDD0k7
	 z9ou6nuu9/WhmI/RG5zn/AvTOqEbxiwwna/tX24GGMF5qmJVxWt7JqG3hnUWKhAvxY
	 HDSkCc8+uHddG0yv1MEXzhuux2i3Bh5sS7spSDIW4yFBuX/RmREGMqQH9JOchhzzkz
	 9MoUWsfBaEjzSLiqX4e2vX1iRPjiU9jp8bMa5pd84W2j1xpnl57QjxY5zbWnt/EHfu
	 6TFQlTI8bkL8GgUGjR94we+dcgkmDATsfFl5nXa+/aLEX/IbTy4rgfK1DgViWqFb8g
	 WuU+cJKsIaw6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3418F85018;
	Sat, 30 May 2026 08:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D06FD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DEB740608
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCW61wcFsyNt for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ADF340363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADF340363
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ADF340363
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A279B97C44C; Sat, 30 May 2026 10:28:18 +0200 (CEST)
Message-ID: <0fabc0d7-274f-4297-99e2-6589f86ab22d@rnout.be>
Date: Sat, 30 May 2026 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260529204350.971888-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529204350.971888-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780129699; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=+dgzP05W6tU8sH6jTyLdsoTP9cOhjNWkZ5nGIg4qEgY=;
 b=SIPaPBLHl/ENFnQH8hY9idEbLSYUfqkWbAxCmgBP/nk69mpDqufA+U34eqUq+3sRFHX/ZC
 mdJTQ/N2hqXzpF0Cnb9hS+4jMEs9vhlLlbyiJ4iea66CZssbGWI4bOa404vKO/ijjKhSq7
 ViRvIaf87lij2LuG23fwGyzPcIj1hJ6v6U0MGqLIP+dh/fhFKzha6IlYOxFw29s6hqVDtL
 IWutpfNS93jk2aRqAE2ovQL+/mGHwhN9gsv9RcXkkgWeqkD4zfGBi8CZOS4uaCufLq/VHO
 e0hkaAHxNZVYJEPXx28/LzDfEdjAeIK7tkP7GvJUgbqYhZ+C+slWydMY9cS2Ew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=SIPaPBLH
Subject: Re: [Buildroot] [PATCH] package/podman: ignore CVE-2026-33414
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



On 29/05/2026 22:43, Peter Korsgaard wrote:
> As stated in the advisory:
> 
> The affected code is only used on Windows, all other operating systems are
> not affected by this and can thus ignore the CVE patch.
> 
> https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
> 
> So mark it as ignored.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/podman/podman.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/podman/podman.mk b/package/podman/podman.mk
> index 80107f3d9e..f601f7e6d7 100644
> --- a/package/podman/podman.mk
> +++ b/package/podman/podman.mk
> @@ -33,6 +33,10 @@ PODMAN_TAGS += libsubid
>   
>   PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
>   
> +# Windows only issue:
> +# https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
> +PODMAN_IGNORE_CVES += CVE-2026-33414
> +
>   ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
>   PODMAN_DEPENDENCIES += btrfs-progs
>   define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
