Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFDBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62DD60F39
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C62DD60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C8934025A;
	Tue, 26 Oct 2021 20:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mczl_mc6BQ1a; Tue, 26 Oct 2021 20:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09FD403AF;
	Tue, 26 Oct 2021 20:00:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69C961BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662A0607AE
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZE2L6z2eK4N for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:00:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B0B360680
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:00:25 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id g10so1223851edj.1
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=08QhTQJ06tueaEvLZ8jk/oj+Ak2kfiPAsfboSj7Pb7o=;
 b=VepJ5Q/rbyy10VkCGVprSJlfwflrot8d4Ol9Bqr0e+Atcy+Qep3eZw6z7p3yrqrfZ3
 LYYnGGeyURnhTitmpVZ6ZpSAukK5stVIdK+2N3FxbCyYLcy2MvHHWvTv2M6tvyVUjVX6
 v1hhTEpbYTPVu3Q7a+O8nD7TW8QZ0wPEE9zRrMfIhpHKbuYBAzUWMx+5hBOzrRqfWWyU
 nh9QusJ9D9ahyn8HAcuE1M8viRIhbN+Kh5BToG5ySYiZLJs/eSzUDxly4EWuuW77U1GF
 A0Ig/E0BESJB4Mlql30Gwk/CLOoLEnjrkvHJRVGgO2ZWjmaLmg53L24eRLhGSSDL76je
 UG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=08QhTQJ06tueaEvLZ8jk/oj+Ak2kfiPAsfboSj7Pb7o=;
 b=B6vaRLWPs2pe/BJFxR2kP/nvyGF0e2FdAa3sso2IbFSK3GicRWe2H4ZONsjnOulsik
 gyiJzSvX2aTXsQ/ZnDC8zPdXHB/hVJNJIuf0B4dpQo43U3HBU7WLZ41a0iscXMml1h8i
 esVZqQYxmg16SwnaApdjxwV/u2D4E7S4x4DRFvllsXyqkIbN1vz2FFNKvmjGTLKhHVQp
 etX7cg3iQpHccemLHspS7u8A5xX6VF6uJbCawMXL8oxaxFL5vtSVgDNvzVdRjeElG5W9
 KKJptHkNZ0grpMK7EUtHwZ5VXHdEOPUr0KcaNqKrIEzT8tTDyGQnLkjjH303QaDvPlC+
 yMgA==
X-Gm-Message-State: AOAM532dGTGHqdmbiJ4NT/EnxlOFkH5NapX/lnozPfT9JycDay5jxxii
 jkQKRkcdd001SQCfokt/739ngw==
X-Google-Smtp-Source: ABdhPJyk0P5mBZ3kQd0sUVcQbCq3b8a4+nvRcHKkA6Htw7xdOLBMe+m4Y2tStMsbLKOaM4QSTxwseg==
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr33719775ejb.6.1635278423569; 
 Tue, 26 Oct 2021 13:00:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sg16sm4077188ejc.67.2021.10.26.13.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:00:23 -0700 (PDT)
Message-ID: <2ad78e47-7cd6-cc72-5494-59a044ef84e8@mind.be>
Date: Tue, 26 Oct 2021 22:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211025075659.3845637-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025075659.3845637-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix meson options
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



On 25/10/2021 09:56, James Hilliard wrote:
> Fix teletextdec name and remove vdpau which is no longer available.
> 
> Fixes:
> output/build/gst1-plugins-bad-1.18.5/meson.build:1:0: ERROR: Unknown options: "teletextdec, vdpau"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index d8b2e2a5d3..d3f089bfed 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -59,12 +59,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>   	-Dofa=disabled \
>   	-Dopenexr=disabled \
>   	-Dopenni2=disabled \
> -	-Dteletextdec=disabled \
> +	-Dteletext=disabled \
>   	-Dwildmidi=disabled \
>   	-Dsmoothstreaming=disabled \
>   	-Dsoundtouch=disabled \
>   	-Dgme=disabled \
> -	-Dvdpau=disabled \
>   	-Dspandsp=disabled \
>   	-Dsvthevcenc=disabled \
>   	-Dtranscode=disabled \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
