Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A0C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414AF422B9;
	Tue, 26 Jul 2022 17:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414AF422B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JbhtIj8t5WKQ; Tue, 26 Jul 2022 17:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1C2422AF;
	Tue, 26 Jul 2022 17:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1C2422AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 812E81BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A607401C5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A607401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MB3Oz3ZgcHvS for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:55:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32978400FB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32978400FB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:55:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k11so20739160wrx.5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SoQ7wH8nx3tphrseXzLZTh72qonKvdoelgmsKXwMqMU=;
 b=ZhXsA/h7rDCf2CEYJOE3aLBumMKFaOeZVlaaIh6suj0pGDGTv5oBf6oMF6k8CK9Kf8
 WM1IsA/nR1bF2tKDe/JG/IAkn+hJ38pi8wHNaEXFu+VCYEV8YxRYJbdETBB9h4WTcpkg
 iqSCObRcJe9VGUbsIicWaWhv0x0btoqiTHhdYRaviX0kbI3HSfDIkZ2at4T2fp8hnqB3
 m0ovzKfYKFqdpLyM6LqqWH2ywfSzyR9d6rlGhW1pUqEarIWz4JssNj0ItOQaxzs+YlXQ
 f72PWV2W2PAHPPsOcqWBb0ovDFQbw9EsZPUxXMpZnp9I2ewWIAFZAuMYbuz7NggJFTGx
 DtLQ==
X-Gm-Message-State: AJIora/wM4wmbxRMsa9yefdG+jT47JFvYOjVFbiyZazOZvn9Sy7SKlIs
 j0/XvqBen/epA+kyKLufIUtQ1Q==
X-Google-Smtp-Source: AGRyM1t0pHLFjmDXmI4CoYRqq5rPot1QQB5mWz2FgwEcc4jcZjjRLqTao7txZ19OOdakwOXIYKI23Q==
X-Received: by 2002:adf:e492:0:b0:21e:45af:5070 with SMTP id
 i18-20020adfe492000000b0021e45af5070mr11555150wrm.483.1658858143658; 
 Tue, 26 Jul 2022 10:55:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm24781450wmq.38.2022.07.26.10.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 10:55:42 -0700 (PDT)
Message-ID: <f15e5b88-a42d-26aa-28ed-cf7acdf63e60@mind.be>
Date: Tue, 26 Jul 2022 19:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
References: <20220104215541.23003-1-matthew.weber@collins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104215541.23003-1-matthew.weber@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SoQ7wH8nx3tphrseXzLZTh72qonKvdoelgmsKXwMqMU=;
 b=MdrIKTN7wuuxJqIOK+16a27TDj92J0upkzIdVLQbQJ8XA7tP9knCZA8X4XKVAJ2d5N
 mTVyrs7skcDtED2Xjvl8A8dJ0PKE3RjeMxltZ/Oj1JK4s/TLOgcyfZ92MsxbUaDy7buD
 +Fi62nadg/WbLhBtxlymtQrWA08AQRtyKOoZdBVyg4dWR/llOtc2dqHAJXq8+8eTB7Fm
 QcVA0zneHr+doWS87M+ZhopDzNhy8F3/kS4McjEYHqIctP5SO1t0AEUPqOYq2XWJYz9R
 EHrrn8hwAiH40UkbZb7C2CRRz+wKqAMsrRVnZfv4f/hZZwHmd+QkpUBHsanEbl+G99p9
 IAbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MdrIKTN7
Subject: Re: [Buildroot] [PATCH v9] package/freeradius-server: new package
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 22:55, Matthew Weber via buildroot wrote:
> From: David GOUARIN <dgouarin@gmail.com>
> 
> FreeRADIUS is an open source server which implements
> a protocol for remote user Authorization, Authentication
> and Accounting.
> 
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@collins.com>

  Finally applied to master, thanks. I still made a large number of changes.

      - remove second patch, superseded by other patches;
      - add upstream links to patches;
      - add 3 more patches to avoid looking in host directories;
      - explicitly add dependency on !static inherited from talloc (redundant
        with glibc, but future-safe);
      - simplify Config.in comment;
      - check hash with PGP signature;
      - add conf opts for runtime paths;
      - add conf opts to disable unsupported modules;
      - add more optional dependencies;
      - enable/disable all modules that use a dependency;
      - search defaults file in /etc/default, not /etc/sysconfig.

  I also created an upstream pull request for all the patches that are not yet 
upstream.

  Regards,
  Arnout

> ---
> Changes
> v8 -> v9:
>   - A systemd unit is installed if systemd is enabled. The default provided
>     by `freeradius-server/redhat/radiusd.service` was not used because of
>     extra options not compatible with Buildroot. The unit is instead based
>     on a simplified version of that upstream file.
> 
> v7 -> v8:
>    - added dependencies to include libpcap
>    - version bump to 3.0.25
> 
> v6 -> v7
>    - resolve rlm_sql module compilation error (Newer GCC)
>      (remove mysql_version.h as mysql.h is included)
> 
> v5 -> v6:
>    - cleaned up patches to all be git formatted
>    - added depends on BR2_USE_MMU
>    - rebased on master
>    - added CPE info
> 
> v4 -> v5:
>    - better package patches formatting
> 
> v3 -> v4:
>    Taken in account Thomas review
>    - fix build with BR2_COMPILER_PARANOID_UNSAFE_PATH
>    - import patches inside package directory instead of downloading them
>    - remove config.cache file, pass the answers on the command line instead
>    - add comments for weird TARGET_DIR and R directives
>    - remove broken python optional feature. Managed to get it to build
>      with python 2.7, not 3.0 and it still fails basic testing
> 
> v2 -> v3:
>    - As suggested by Matt, merge with pending upstream patch. Included most of it,
>      including patches based on Yocto work :
>      http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/freeradius/files
>      Didn't kept all the --without directive, as they do not seem useful, nor
>      the custom INSTALL_TARGET_CMDS.
> 
> v1 -> v2:
>     - fix invalid characters in Config.in
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
