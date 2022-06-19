Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0914C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0188239A;
	Sun, 19 Jun 2022 15:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0188239A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNnZSza9VfaU; Sun, 19 Jun 2022 15:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9349D81C6E;
	Sun, 19 Jun 2022 15:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9349D81C6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CECAE1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A830240948
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A830240948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmngEPSBwFYo for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67205405AE
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67205405AE
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:43:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n20so10046812ejz.10
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gRheH5D5PMGDRCt3TQbWcGVEWBkspGduSOc3eszGoIw=;
 b=SkO/+u9PiEAFKyylYFv5Nu+540o1ZdMe0wUwI8qOmUfLjrw8F/YGwJj2ndMNmodL3e
 BeKzG8WsW4MC28N+zqHm/oj2VZnycTBM+0hiBAzwf23oPTptROC2pgalbX/lr31ZAoZm
 sH5Rnhxn3r5ib/ARvVrTtBjJpM9NztK13m53B4CGKlnwMAQLU475RFGofGAGtq9HpE6l
 DZV6eP5cLg8VjYfi69XBJe/uWJSOdLeK7/gcz7AUgAlQacA4OV9NCKT2UlXRikawNevd
 UglAkj+kQjSQQQzoUgHJ4cXkaHI8QhGjUX4iWKvwV1QSlEEypldepBQrTfHlodek5oVM
 FKaw==
X-Gm-Message-State: AJIora8rWjs+TPyezr+tR8U5IpAsSYnRa2MSRwnxB3LHtn4bLk3aEVHY
 o+9n/kBxOjS0ky/mxl84BhmlRA==
X-Google-Smtp-Source: AGRyM1v3pnrkd+U9sY9MSRl+tkpOH5UQbWJQ8uA6SBzAuiui4C0eKXCiTKjW0gDUcpjCDRPYNQu9dA==
X-Received: by 2002:a17:907:c1d:b0:70f:469a:3d73 with SMTP id
 ga29-20020a1709070c1d00b0070f469a3d73mr17257763ejc.248.1655653404630; 
 Sun, 19 Jun 2022 08:43:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a170906265b00b006fe89cafc42sm4741995ejc.172.2022.06.19.08.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:43:24 -0700 (PDT)
Message-ID: <ce2ea475-17d2-a4bc-480d-07369c80a0f1@mind.be>
Date: Sun, 19 Jun 2022 17:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20220613185045.381829-1-fido_max@inbox.ru>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613185045.381829-1-fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gRheH5D5PMGDRCt3TQbWcGVEWBkspGduSOc3eszGoIw=;
 b=gpqlUWu9bFiFWN/uwHEiT0jZTSZ/AmZIzmdylsJ4P8ppOhLzSLhINxBnDhhw0mMvO/
 VE9df+JRHoRlypVZ2NuuJNU5LbSFWXshUplqPM+4rTkfIoqa8jnea5oBjGB304X1TWng
 5GY8o/Z5zeCfzqkttUvS4i3LoQePV2WEuQnUThJiDlAqwmVtT0q8AAJVyVlCIPnd/zic
 VbTVhEiBcCEdmG745JKIi3d9iHIZukDkEcsFu3rCNQI2Qk9XWqKwxb2uS+LdInl/r2gW
 33VYDYIPJ0R71ysWqCy80Ugwg5O8KaP4sugrgOHEunggF7lnna7XUSDHU5YKLUUrNOjO
 YOaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gpqlUWu9
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.7.0
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



On 13/06/2022 20:50, Maxim Kochetkov wrote:
> Release notes: https://github.com/timescale/timescaledb/releases/tag/2.7.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/timescaledb/timescaledb.hash | 2 +-
>   package/timescaledb/timescaledb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
> index f186684339..6a9d7b2379 100644
> --- a/package/timescaledb/timescaledb.hash
> +++ b/package/timescaledb/timescaledb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  226af207105cc9e2d1744b303e475204a947047103f0e5697de4e8949e4dde75  timescaledb-2.6.1.tar.gz
> +sha256  9b30952da1186733f144c1ec3aa0c6332379207e5035e81037bd34e1ec9cefb3  timescaledb-2.7.0.tar.gz
>   sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
> diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
> index 16fba11e21..dce9ea031d 100644
> --- a/package/timescaledb/timescaledb.mk
> +++ b/package/timescaledb/timescaledb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TIMESCALEDB_VERSION = 2.6.1
> +TIMESCALEDB_VERSION = 2.7.0
>   TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
>   TIMESCALEDB_LICENSE = Apache-2.0
>   TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
