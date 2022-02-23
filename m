Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9839C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7804151F;
	Wed, 23 Feb 2022 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfSf1B7H8njV; Wed, 23 Feb 2022 20:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3B74156E;
	Wed, 23 Feb 2022 20:28:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1C21BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68EDD60FC1
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCX1Uzl7aE1i for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A1E660AA8
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:28:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s1so12957586edd.13
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=goRnqAchln2GAC2Rf6R+LsvR5e6D9rIQOhglivs55YQ=;
 b=Iq/0YsF0Lvf85U7uf196O47ZRFaXDkeqEoj89rYbxbhSVpAhTXohILFeC6J/OGtp6A
 zcoANe/Qv5fy5nY5zX9++bxL8elEzDfaLyN5WypC/vAFud8XrSpfzZofLwJgRDMpVZ26
 yWaehe26mJgtb2SZaNwZ1OY9a0vKx8jFujF2+Hq76JepYwbJFODZQfiGoXHBsJGUr+xK
 nhBgyAMOJC8kXlpv1DI9JhtICKfsKfW39psk7w5j2oav1eDpcM0bggXBlNNPKAtTmqPO
 WcvRgnOKAMoEmIzSbGvEi9LV3aELuOhtjRmucjN9uZIHeQ6if6AdYdeouFrBcMvj7xWU
 up1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=goRnqAchln2GAC2Rf6R+LsvR5e6D9rIQOhglivs55YQ=;
 b=iYOCQPZP/CxeCwXEG55eQa1eyi/zqdgYwrnS+V7gi6LDVoeEnaNKkzsT1FGBvzjQk+
 /1hy3j/JHqPqFI8rgLtb5Hvktq0nQkicfcqN34bBVUhJaZOB9Qv6Inyz/s6nYKelbbyc
 YmIhONo2xxP3LFpn8KJH8uaxv4ZouV7uZz0/IySqqCPnYBTG5uMPWQ4Ur6FIS6mVWb75
 zP78MBr0kxpX/iH8Bazynh2X0bYDHFZH2WdxU2Zkz3f8IItyScrV4CFpqPQHi7AjpqnL
 1mjkPDumzLP9OmuaKClWZObrwrtV0YtSSOYqLF38JAAcIkjdxHQuWHLbO+jo19blxK9S
 CxzQ==
X-Gm-Message-State: AOAM531w+C5WNmte/jre9dSY2sTE8m1+0eE46wkpSyPMCt5Pf7SNRnI+
 /aQ0/guODlEobGkk+YwgB7O1yNVjSqwA3A==
X-Google-Smtp-Source: ABdhPJwsM8TtL4pKS5an3v5X8iqs6rTnsxY29nt7tBuVTYtx9ciOBcprCKbNy/v5peExoKZSy6hzig==
X-Received: by 2002:a05:6402:142b:b0:413:2b86:7af2 with SMTP id
 c11-20020a056402142b00b004132b867af2mr1136494edx.102.1645648081772; 
 Wed, 23 Feb 2022 12:28:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b14sm279727ejb.160.2022.02.23.12.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:28:01 -0800 (PST)
Message-ID: <aca890fa-8ce8-ce5a-b127-2a51018cb2e5@mind.be>
Date: Wed, 23 Feb 2022 21:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220216204538.2450673-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220216204538.2450673-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dialog: bump to version
 1.3-20220117
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



On 16/02/2022 21:45, Fabrice Fontaine wrote:
> https://invisible-mirror.net/dialog/CHANGES.html#index-t20220117
> 
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14596
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dialog/dialog.hash | 2 +-
>   package/dialog/dialog.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
> index 2286590b66..3136d18b2b 100644
> --- a/package/dialog/dialog.hash
> +++ b/package/dialog/dialog.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
> +sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
>   # Locally computed
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
> diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
> index 1c98d354e3..681f8ec9fe 100644
> --- a/package/dialog/dialog.mk
> +++ b/package/dialog/dialog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DIALOG_VERSION = 1.3-20200327
> +DIALOG_VERSION = 1.3-20220117
>   DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
>   DIALOG_SITE = https://invisible-mirror.net/archives/dialog
>   DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
