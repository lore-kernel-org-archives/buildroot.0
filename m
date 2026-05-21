Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF2DCD5BAB
	for <buildroot@archiver.kernel.org>; Thu, 21 May 2026 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B1961737;
	Thu, 21 May 2026 20:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr8k-3PClTHK; Thu, 21 May 2026 20:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7029A61798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779394197;
	bh=zVTJdQfkVqCKqvVVAmsEbTN9A8IZpSNOnhsvlKCDWeI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gA1PT0c1LNlssV+yVkmYo4q0U3Lo1US5bAxKSNmJRYQrFMjwD++pfAacaGfNL22i2
	 rJRLuwadpqszVE3rD818wx4LOMSaACOob7rUMQOJpJKO8r+5iatoIiW2VaVB3UXfwL
	 czCv+gtw0+jd2K4zEPYXVr3yedifKXS66wxoEzHt6ZrmrAQ4vDdfLctFcXTuv5t0Ef
	 fYrLIR47E/X4Ll8+aFDScWusQQ+71jua85N3/XFEv5Xmrq1G4db7e8B7XiK9oIaPk2
	 ACWyPdel+4WQztLczVCnanTFx/aqNfzM6dPWeg5cFrRyZrRv6t/PNnRWi1taRbwXO6
	 dCZ7Xd+VeaMGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7029A61798;
	Thu, 21 May 2026 20:09:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C10282
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF5D041881
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YgS1uJzXEaoQ for <buildroot@buildroot.org>;
 Thu, 21 May 2026 20:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7F7B40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F7B40042
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7F7B40042
 for <buildroot@buildroot.org>; Thu, 21 May 2026 20:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75512B97C56B; Thu, 21 May 2026 22:09:52 +0200 (CEST)
Message-ID: <876c5cf4-e9a1-48b7-a511-305124ae8b7d@rnout.be>
Date: Thu, 21 May 2026 22:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260515-virglrenderer-v7-0-1f1814b65ccd@gmail.com>
 <20260515-virglrenderer-v7-5-1f1814b65ccd@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260515-virglrenderer-v7-5-1f1814b65ccd@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779394192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KRJ5XYbRUnvByuGjm/+YGqT8R+oqdiABouXO3+dpWq8=;
 b=FlSephfM3zYizgrQbDUUVVDM49odhUUtpP7RIXYgZPpPIyv35QqtUN+IhMWzPCh7QdA8rU
 DIDWRDpjwPnga6UfxaLPf1XRdh6lah1djbOqDRFe+lw6hAffcso9U3vlzA7Yfo0b7RubiH
 4z4CDZ/HIcFo8E6lKoL+gJfl+T9dj/xgXL0vqFFT18dL7sX3hoVClXFblRmduYLvcYrT4J
 HCtRsnjSF0w+zdyq7+kuONo8HVfui+bloQQgaaaPAXmHMinHGCXeOlxIL0mxWheDxrGOF9
 se5rKrVd6+2JuBNU5Y07WR3+PV0P2KTlfnVYt858oJ16NemtV567wletz9R5qg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FlSephfM
Subject: Re: [Buildroot] [PATCH v7 5/8] package/virglrenderer: Fix build
 with glibc 2.43
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



On 16/05/2026 04:03, Joseph Kogut wrote:
> Add an upstream patch to fix the build with glibc 2.43, not present in a
> stable release yet.

  This should be squashed with the previous commit. No special mention in the 
commit message is needed, it's clear from the patch itself why it is needed.

  Regards,
  Arnout

> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   .../0001-fix-build-with-glibc-2.43.patch           | 39 ++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
> new file mode 100644
> index 0000000000..fda1d9b218
> --- /dev/null
> +++ b/package/virglrenderer/0001-fix-build-with-glibc-2.43.patch
> @@ -0,0 +1,39 @@
> +From 986b5fc57b07c06b5e0b3a3694d06898ebc80163 Mon Sep 17 00:00:00 2001
> +From: Maximilian Hofmann <maxi@maxiicodes.dev>
> +Date: Thu, 26 Feb 2026 23:28:58 +0100
> +Subject: [PATCH] fix: build with glibc 2.43
> +
> +Several glibc functions now return a const pointer if the input is a
> +const pointer and a non-const pointer if the input is non-const, causing
> +a build failure.
> +
> +Fix this by declaring the output pointers as const if they are never
> +modified, and for the lone failure where the output is modified, instead
> +make the input non-const.
> +
> +Signed-off-by: Maximilian Hofmann <maxi@maxiicodes.dev>
> +Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1599>
> +
> +Upstream: https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/986b5fc57b07c06b5e0b3a3694d06898ebc80163
> +
> +Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> +---
> + src/gallium/auxiliary/tgsi/tgsi_text.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/auxiliary/tgsi/tgsi_text.c b/src/gallium/auxiliary/tgsi/tgsi_text.c
> +index db7d7b95..7e37bf79 100644
> +--- a/src/gallium/auxiliary/tgsi/tgsi_text.c
> ++++ b/src/gallium/auxiliary/tgsi/tgsi_text.c
> +@@ -84,7 +84,7 @@ streq_nocase_uprcase(const char *str1,
> + static inline bool skip_n_chars(const char **pcur,
> +                                    int n)
> + {
> +-   char* str = memchr(*pcur, '\0', n);
> ++   const char* str = memchr(*pcur, '\0', n);
> +    if (unlikely(str)) {
> +       *pcur = str;
> +       return false;
> +--
> +2.53.0
> +
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
