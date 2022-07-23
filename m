Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E61C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32B6617B8;
	Sat, 23 Jul 2022 08:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E32B6617B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppyvleM2XRjM; Sat, 23 Jul 2022 08:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F8661AB0;
	Sat, 23 Jul 2022 08:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F8661AB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4541BF2C7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 423F7617B7
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 423F7617B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nJYxuzQ2U3I for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:38:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 369F6617B6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 369F6617B6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:38:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g2so1269267wru.3
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 01:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GR9sftGRIefrsLuSCvnOPY6mcb7PToqiHHILHHtvJ/w=;
 b=CuNchwh7RiDCCL92pvZcBf0kov+x8GxkCYqhceCB1Vm/+EILYxzSyVshPuN3fSCdEW
 QqcHOORQHoJeNUXsRBQTUOtFYu7v2NceLg4aDXe4EK5pfqKCe5ef+B6rwbAmmewOT+Zn
 4IjtSoxTst4pjrVDR3k7SV+gYf2F2KWoEoYjuUm/+SZ1k9LTZe7gVNOoxoeT7Pu9eca/
 xfiNMFP2jqBTn/gqz61bOOfvoZ1B+rQ0tiANqAgE4wP2hipRvlQZ7JNe0JZXpOD9VJDl
 aSsOaHzX25DRYitnW6u6/IbUhGMSd7az6Ibaxaw+O4D2+JWP7ZaiHnm5uloDbx0qohpD
 D6gw==
X-Gm-Message-State: AJIora+FtYLZAnEqK4+f1FjxPqfBsrTvqMERlu84mSyB6o/Qpaq1b2Dc
 SJzSsu8dHfOKI3gb2qVDNpAJYA==
X-Google-Smtp-Source: AGRyM1sTEyIxurrzfHodV/4c+/NYl6ZfhiLI+Sj1G81EdkBymtXp3vH2KdU9e4y3DcaENkGSxYO46w==
X-Received: by 2002:adf:ce0c:0:b0:21d:929e:1522 with SMTP id
 p12-20020adfce0c000000b0021d929e1522mr2100300wrn.126.1658565486343; 
 Sat, 23 Jul 2022 01:38:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d58cb000000b0021d63fe0f03sm6622505wrf.12.2022.07.23.01.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 01:38:05 -0700 (PDT)
Message-ID: <213bb2fb-ecf4-cf3a-4af6-5ec20124b0fb@mind.be>
Date: Sat, 23 Jul 2022 10:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220722045722.6986-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220722045722.6986-1-bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GR9sftGRIefrsLuSCvnOPY6mcb7PToqiHHILHHtvJ/w=;
 b=HZdvQdLhx+Qy1TOk3LSeWy0qutfb7bXuQ8gejnnT7phdzzstfs+NQDN9nrshE0pnhr
 FIfeN9kfc8afipozc+sRteyR9qxpu7wSSoNH+llrLwSM6OS5Ru89sIQOPb6KcOS/6OtP
 09cDg2aPu+H4gH2FNZGr0mjf6vNwApQIxpLagIiqRWUQIBbZuZVtK1A5I4OIKH/1NXJc
 ZHCaGg9VTz/gi6HunIOJZZcvMOFBtqQJ4T521r/uJa+WOcxFZHgznO9/g3A6tU61e/H8
 0/W/qNyGCpwp86G/ZszgztK1EIgao0oRKUBoj8nGC9DyG4FNfgkH9jLmapnGQCipVPeR
 FAtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HZdvQdLh
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.1.6
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/07/2022 06:57, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>   package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
> index 676375601a..9e0932ec0c 100644
> --- a/package/intel-gmmlib/intel-gmmlib.hash
> +++ b/package/intel-gmmlib/intel-gmmlib.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b429cdff2c236274f2b9a32ac4ac2ed5d1655d3c87c557fe0fb7de6b6c906f18  intel-gmmlib-22.1.5.tar.gz
> +sha256  d60d9d2a8740f95a244b6e2113265ba6e6c915eaada6d644ecc4c8d436344a6e  intel-gmmlib-22.1.6.tar.gz
>   sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> index cc4b200104..1f8454dcdc 100644
> --- a/package/intel-gmmlib/intel-gmmlib.mk
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -INTEL_GMMLIB_VERSION = 22.1.5
> +INTEL_GMMLIB_VERSION = 22.1.6
>   INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
>   INTEL_GMMLIB_LICENSE = MIT
>   INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
