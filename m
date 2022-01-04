Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62716C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7674093F;
	Tue,  4 Jan 2022 16:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ugQPqNt0uE9; Tue,  4 Jan 2022 16:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58FC640936;
	Tue,  4 Jan 2022 16:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E42C1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1EA81D18
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiVOIyvwEpjq for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:45:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B2E081C6F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:45:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z9so80853166edm.10
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fEDYYP6C3c9SyACuHYwvnvsEASU/o1l1dCczw2W79ds=;
 b=Gl5Oks8cOpMC2Knlvtz/l6bkNX+Chh4LgzGb+VUAf9TCIFJJXfWUW3eseuWZ1gIf/l
 1LM20AQs2f3UN6r2p67rAcqJJNsjc0ZFJ3/l5JkgV3+EU0L8Oy0FTo6SDvTsJZehUrJ1
 iHnBC4VwHHZl7tmyESLSRK+aOxN6faTh4B0VjUkaiej43TTDPcndaM7/4m1kOq/c/+6b
 65EEEEY9/6xpdDUdoWXegmu0R7iEIODZwWdTmOc9aQvUKCq3Gj8fuwwJHO2n29lgNOST
 WIabeaE9nJz/Umv6FLW2aB+/Ri2gK0tCTM35cT3qmuV/x+M2sWMFHrYFYySdTqXMjVgB
 SEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fEDYYP6C3c9SyACuHYwvnvsEASU/o1l1dCczw2W79ds=;
 b=agbhHMvTvZjOR/rcLoxy9zcQ/cdklITHWLhKIJ5wwloLwkPXMyAhZ13xCnLubMBwgn
 o/aG1IdWNPkwblFRntbXameRcOqbcdRcNcDp496IjylPvcS/iYJXpCTIh6+3olI9qKr6
 5EA3BjUJad5eXPQHTPqYJ6iU0ie/hcwmokZMefRiWL71JYcoypviXEkTgJox9axJDsh4
 nUI8um8k3B2KS7kjuJtPXdmd3MsrfH7teLdUoOr/ntEJvgt03HpznwWTCLFt4YQOMRxt
 1CYcXpmOMY4JSaNnVgpPQSVEcAq+DYsPXjW9hjB7yR2rOD9yr25OnjEYmYDQzLPqbtFB
 afVw==
X-Gm-Message-State: AOAM532xcFjWYmUtQtvX9Umd2OwrYfuVoil8Ok6Hgx5CMg0L/HJcBWm0
 HTyszJxryI6B2J4IsgZEMF/XmA==
X-Google-Smtp-Source: ABdhPJyGufy/EQOriK29UpoFrU8YshK2cFLVriXwCRrrfhV/SYi0ZGmhALi8liTHc80GnZVccOnZyQ==
X-Received: by 2002:a17:906:d0d8:: with SMTP id
 bq24mr39729224ejb.63.1641314706500; 
 Tue, 04 Jan 2022 08:45:06 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sd5sm11691467ejc.37.2022.01.04.08.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:45:06 -0800 (PST)
Message-ID: <29663017-0e83-de96-8fd6-ac2752b503fc@mind.be>
Date: Tue, 4 Jan 2022 17:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101142616.1176357-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101142616.1176357-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix avahi build
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 15:26, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 27908c6eab768d0b9fd3444a929b3f1b1510da71:
> 
> ../output-1/build/pipewire-0.3.40/meson.build:348:0: ERROR: Dependency "avahi-client" not found, tried pkgconfig
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d1707ad82159aafbddb69c503109bf2e830f0f29
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pipewire/pipewire.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index efda3ad695..7043745cc1 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -82,7 +82,8 @@ else
>   PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_AVAHI),y)
> +# avahi support needs avahi-client, which needs avahi-daemon and dbus
> +ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)

  BR2_PACKAGE_AVAHI is redundant with BR2_PACKAGE_AVAHI_DAEMON, but I kept it 
anyway since it's IMHO a little clearer that way.

  Applied to master, thanks.

  Regards,
  Arnout

>   PIPEWIRE_CONF_OPTS += -Davahi=enabled
>   PIPEWIRE_DEPENDENCIES += avahi
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
