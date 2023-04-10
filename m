Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF4CC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A231409AB;
	Mon, 10 Apr 2023 20:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A231409AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8AAdhSqvTvv; Mon, 10 Apr 2023 20:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DE8410CB;
	Mon, 10 Apr 2023 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DE8410CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A611BF345
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C181681C6E
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 20:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C181681C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9Ez4KqRT9cW for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 20:05:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9850681C56
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9850681C56
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 20:05:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso8238743wmr.0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681157131;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xlfaNWKZT8u2i9jUczNCuEyGblh95YMnoOwXiE2uQ5E=;
 b=CcbN6yY7y2nmC+pM9puvdy+KClthRmqo8wom7KA90blLZENjwuENJAMHTjsdcbJ6Oj
 pJTmHIV1Lp1Sa8iOns54btAfZhlQ5BeKivX9csM3839uSF8z5MzhLh4k3de/R43Bjfi1
 JrOuwOiMkqsi92gf/kO+LgS9Gg+h2ZIyX1YXQe0RWBaitxxzebuyvs1RmvH+zq3IJb1T
 w+OIAfJmnwB5vP1N8T1zI8WjjA118xgPqTBSCmlQtWRSTRBXtD/aMRsrOJ87cZWxTTQO
 jT1OkIRdFAtWhea6OBiEKOxHnIjwjMCVyjiYTAZ8HfXzyV2ibfec7//SnpFB5JgB210d
 PWQw==
X-Gm-Message-State: AAQBX9d+uTUW/vEbVmjqCGmepYC5Vj3gYFfEZP9txtYSa5EKzLJ8qCat
 LkCGPUHMm/KKNhBVNasw1Vq9avyIliSr8ltRM2k=
X-Google-Smtp-Source: AKy350acculXsZ2rWDr8xAnyxBKruRCZMI2ADTXf83CFYWn2AqDDqAmw1z3HssZrfnOX2sGci5mEGQ==
X-Received: by 2002:a1c:f219:0:b0:3f0:68ce:5465 with SMTP id
 s25-20020a1cf219000000b003f068ce5465mr7795782wmc.7.1681157131352; 
 Mon, 10 Apr 2023 13:05:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b003ee8a1bc220sm18465550wms.1.2023.04.10.13.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 13:05:30 -0700 (PDT)
Message-ID: <61711366-1626-c45b-8083-ea967cdb30b4@mind.be>
Date: Mon, 10 Apr 2023 22:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: yann.morin@orange.com, buildroot@buildroot.org
References: <7653_1674026058_63C79C4A_7653_242_1_e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <7653_1674026058_63C79C4A_7653_242_1_e5a79e14d6b9a1d81047cdd6605184ecae6803f8.1674025553.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681157131;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xlfaNWKZT8u2i9jUczNCuEyGblh95YMnoOwXiE2uQ5E=;
 b=VVA42gLYHtiYv8CUfN/9aKoZGas31fK2x10QPmVJPM6Q4icYV+tVy3KIHMF+NSB+AA
 gaz9yLyflODoawp3x/XCq5bmLSnyvKFvkiY5EMX9noqnqNDrvdYckztZLtZAX2RT761O
 tADVs8/K9ycpd7huS1bJ3roOIyQOQR19UjcBNLNekhgAw3iiaiIlEu4wkySsd9dYe9NG
 ocnmKlO50oazNHJhOjeoDRMnDXtkwN9nE1fEaI6Titq+U/p+cqAzH/Q2hXc4k3zIva3j
 exRpb+PVRZDZb1ciaALKT18xwimZYvJRHfEVymNqB6+GsqTdTsl9DJZAqnKbbV2R8XC8
 4q7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VVA42gLY
Subject: Re: [Buildroot] [PATCH 1/2] package/doc-asciidoc: specify TOC depth
 for all formats
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/01/2023 08:14, yann.morin@orange.com wrote:
> Commit 17feaf00160d (manual: set toc depth to 4 for html outputs) did
> not explain why it set the depth of the table of content (TOC) only for
> the html and split-html formats.
> 
>  From memory, but it is a bit fuzzy after all those years, the TOC for
> HTML documentation was by default deeper than for the other formats, so
> it was really useless to expand it more than one-level deep, while for
> other formats, the default was acceptable.
> 
> However, it does not make much sense to limit/enforce the depth of the
> TOC only for specific formats, and keep the default for the others;
> indeed, there is nothing that prevents the default to change with
> various versions of asciidoc and the rendering backends.
> 
> Render all the formats with the same, explicit level of TOC.
> 
> We move the assignment of _A2X_OPTS above the comment, because the
> comment does not apply to the TOC setting. Also note that the previous
> assignment to an empty value was completely superfluous...
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

  Applied to master, thanks.

  I did fix up the Author entry, though - for some reason, your name dropped 
from it. I guess there's a mailserver somewhere that borks the From line... I 
think it's sufficient to pass --from to git-format-patch to fix this.

  Regards,
  Arnout

> ---
>   package/doc-asciidoc.mk | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 2bd761edfb..931c5136d4 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -86,11 +86,13 @@ ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
>   $(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
>   endif
>   
> +$(2)_$(3)_A2X_OPTS = \
> +	--xsltproc-opts "--stringparam toc.section.depth 1"
> +
>   # Handle a2x warning about --destination-dir option only applicable to HTML
>   # based outputs. So:
>   # - use the --destination-dir option if possible (html and split-html),
>   # - otherwise copy the generated document to the output directory
> -$(2)_$(3)_A2X_OPTS =
>   ifneq ($$(filter $(4),html split-html),)
>   $(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
>   else
> @@ -161,11 +163,9 @@ $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
>   
>   $(2)_ASCIIDOC_CONF = $$($(2)_DOCDIR)/asciidoc.conf
>   
> -$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML,\
> -	--xsltproc-opts "--stringparam toc.section.depth 1")
> +$(call ASCIIDOC_INNER,$(1),$(2),xhtml,html,html,HTML)
>   
> -$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML,\
> -	--xsltproc-opts "--stringparam toc.section.depth 1")
> +$(call ASCIIDOC_INNER,$(1),$(2),chunked,split-html,chunked,split HTML)
>   
>   # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
>   # from reaching the template recursion limit when processing the (long) target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
