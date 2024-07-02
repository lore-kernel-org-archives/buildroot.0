Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0A2C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DA781148;
	Tue,  2 Jul 2024 19:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbtjo9EPTk-k; Tue,  2 Jul 2024 19:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F36810E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F36810E8;
	Tue,  2 Jul 2024 19:49:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81C6C1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E3C84157B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqnRP0oKePd8 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:49:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBA3B40D17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA3B40D17
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA3B40D17
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:49:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso18960685e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719949746; x=1720554546;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6hdoHSEMppmWjFpfI8W9B9PpWOS7ssPZeoRZsoSpyZw=;
 b=sRpB51Adh1c/dAz4bWWjYA/kXf7iAoAucZnDzHMr8UBJEgYUOWLw+wsOZ/UePAVSMB
 HB8bttZqpHy6yyvoApw5BE12lucWLEiZIIxTg0qxxolNr5mqBvnhhzPswbGNupHa1w58
 h6fREf84JoKl6je/EKImSICbCMA/sw5VfDLF14SPn+pI2aqM7Gy/TQxAgpaf406cNFuS
 a6IDnPi5r2qN95Pg9U+XTk9STNXcS55P1vcbbUf0soqXCEmgXeTWjDBvWi9g7SDvifgt
 okbTY4tHJnfDDWMfgCbMNREXhSy/fpgLWKUtVtdljBejd1xOyK3Iz1vfjRrVLYNidXd7
 mVKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYo1Tz3eZaxqbre5PUCJOqu5e21a7+haSf/7g0sT1s1kJjFfw9wFrXAhFU2KZINLeJLExbuoUKJwIbMWFl+5uWQguInYLKsg==
X-Gm-Message-State: AOJu0Yy8ecvUl4fQMAp8eMPSbKNfHq0tJDc7Ag4ezc/xDQ5pdpw/bQrA
 dcx5RqWoNFDDCTDxVeNG1iwaDmQ+vL8as1x9Hv1KUxtIEeDEu3Cc7RjDhPBxVDU=
X-Google-Smtp-Source: AGHT+IHfRBSAla1cJVB7om2nyTuhlllgnpS7BHcmH5UaK1c/USerWhg6VD5B+p+NMwP0CBTjUgbnzw==
X-Received: by 2002:a05:600c:4589:b0:425:6911:eb00 with SMTP id
 5b1f17b1804b1-4257a02c894mr62000675e9.5.1719949746035; 
 Tue, 02 Jul 2024 12:49:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097fd4sm208527265e9.29.2024.07.02.12.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:49:05 -0700 (PDT)
Message-ID: <43baf0fb-27a0-4fb1-b3ad-d1eaa999d77c@mind.be>
Date: Tue, 2 Jul 2024 21:49:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20240702185943.2035638-1-yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <20240702185943.2035638-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719949746; x=1720554546; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6hdoHSEMppmWjFpfI8W9B9PpWOS7ssPZeoRZsoSpyZw=;
 b=aylfeybcGWKqe8zgp8xi2Wi2D4xZvyAWs46eIHfaue2jqED5XHP9kQ0zReuQH3Xg/m
 sLuGg/nzjdir2sPOY3x9UNC1mDwNPq44K0aaYj7NH6h7FPkZAg+bm5RPVemJjHyn5pjP
 BkXj44De0u18R99THMf0EypG0N31lVBxzh4BEGwANuXehd23ZCAZNpLeRYz4bXn0ge+1
 1vWyVsR1S+iesmOf1vhq9XsxTC4ZoGphtHyAERrQnpMrzEhe1vU36pz/c4UPfSIKPVus
 J6PyLIhNhd9Yw98qqjuPMQYPy4Mi4wSFpg+hl822AAFc4mcXBOhxDNWGwPsouAt67qnc
 2Tng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aylfeybc
Subject: Re: [Buildroot] [PATCH v2] package/daq: workaround for upstream
 changing the archive
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Yoann Congal <yoann.congal@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 20:59, Yann E. MORIN wrote:
> Upstream has changed the archive for hte 2.0.7 release since we bumped
> in c1f820bd88a5 (package/daq: bump version to 2.0.7). Comparing the old
> archive as it is on s.b.o. with the one currently available on upstream,
> gives a few deltas, mostly;
>    - (C) years changed in comments
>    - version string changed from 2.0.6 to 2.0.7
>    - changes (that look legit) to autostuff
>    - a file dropped (Visual Studio related)
> 
> Of course, that means the hashes changed, and no longer match what we
> have.
> 
> Downloading the file manually and letting wget set the timestamp on it,
> reveals the archive is dated 2022-06-08T13:51:59. So, for more than two
> years now, we've been relying on the archive we cached on s.b.o.
> 
> So, we can't just change the hashes to the new ones, nor can we replace
> the archive on s.b.o.
> 
> Instead, we use the same trick as was used in c617ebbc977d
> (package/python-*: fix hashes for cargo-vendored python packages): we
> use the actual, real URL with a query parameter as the _SITE, and we set
> _SOURCE to a different name so as not to conflict with the previous
> archive.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yoann Congal <yoann.congal@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> 
> ---
> Changes v1 -> v2;
>    - fix typoes
>    - add Yoann in Cc
> ---
>   package/daq/daq.hash | 4 ++--
>   package/daq/daq.mk   | 6 +++++-
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/daq/daq.hash b/package/daq/daq.hash
> index 0fa1edecc2..82323ed404 100644
> --- a/package/daq/daq.hash
> +++ b/package/daq/daq.hash
> @@ -1,7 +1,7 @@
>   # From https://www.snort.org/downloads/snort/md5s
> -md5  ea796f001d1b00302e4e69e337ab2460  daq-2.0.7.tar.gz
> +md5  60e5ddcafb985fac7374884d28f299d1  daq-2.0.7-modified.tar.gz
>   # Locally computed:
> -sha256  bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
> +sha256  d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279  daq-2.0.7-modified.tar.gz
>   
>   # Hash for license files:
>   sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
> diff --git a/package/daq/daq.mk b/package/daq/daq.mk
> index 8a5394a63c..27abd4d2f5 100644
> --- a/package/daq/daq.mk
> +++ b/package/daq/daq.mk
> @@ -5,7 +5,11 @@
>   ################################################################################
>   
>   DAQ_VERSION = 2.0.7
> -DAQ_SITE = https://www.snort.org/downloads/snort
> +# Upstream re-published a modified archive for the same 2.0.7 version, so change
> +# its name locally, to avoid conflict with older BR versions which had a hash
> +# for the previous archive.
> +DAQ_SOURCE = daq-2.0.7-modified.tar.gz
> +DAQ_SITE = https://www.snort.org/downloads/snort/daq-$(DAQ_VERSION).tar.gz?buildroot-path=filename
>   DAQ_LICENSE = GPL-2.0
>   DAQ_LICENSE_FILES = COPYING
>   DAQ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
