Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AFBC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0414079D;
	Thu, 12 Jun 2025 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQlu2DFcIJPF; Thu, 12 Jun 2025 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D823A408B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D823A408B4;
	Thu, 12 Jun 2025 20:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A25F183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C59440906
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOGHcb7QGCLt for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBB8440456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB8440456
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBB8440456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 294D01C10A0; Thu, 12 Jun 2025 22:08:12 +0200 (CEST)
Message-ID: <73d25abf-78d2-4df3-a848-8df261a575b8@rnout.be>
Date: Thu, 12 Jun 2025 22:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250602190418.939289-1-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250602190418.939289-1-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=H28Talo9zYF/GbjNeG+j2S46e04Yty0riX18kvmWWag=;
 b=H4AwdH82wxX1NcvSEPDYHLjVIlvDk5yNBfzXycwO8MiQxY5FXCxNx6W2DRteIY4CXiApym
 zHKwRcC8P8wII5KPg6EiWuoD2r+FPMoEZq5yvYqszkWFzfk/r1sOMzsZi45f2ajZoLM7h5
 HMkPMJzAy5ONWzhNscLxkm1xcHz06ceX2cpNUR4Os6Kam4j8ZhYbNg4p+xvB+S+LDBHHnX
 02YSb8j9ES/rSjCkfjEsSihLQ589ieEbuWaP9pfXaWmo4iZ/wiAY9jmn39J+qrvDj8V4IG
 ivpZkwaXrIhPPQ7/69v4J0VpdnkZTA2sc8wn1/Ue1e69p6BrJIRq5sT+TFcdeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=H4AwdH82
Subject: Re: [Buildroot] [PATCH] package/ninja: ignore CVE-2021-4336
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



On 02/06/2025 21:04, Daniel Lang via buildroot wrote:
> CVE is filed against a different project.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ninja/ninja.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> index b7bc1a4f1c..805fef4541 100644
> --- a/package/ninja/ninja.mk
> +++ b/package/ninja/ninja.mk
> @@ -10,6 +10,9 @@ NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
>   NINJA_LICENSE = Apache-2.0
>   NINJA_LICENSE_FILES = COPYING
>   
> +# Filed against a different project called monitor-ninja
> +NINJA_IGNORE_CVES += CVE-2021-4336
> +
>   define HOST_NINJA_INSTALL_CMDS
>   	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
