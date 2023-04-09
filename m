Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45E3C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7984032A;
	Sun,  9 Apr 2023 13:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7984032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bI87yF6h2woN; Sun,  9 Apr 2023 13:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B194015E;
	Sun,  9 Apr 2023 13:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B194015E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7026E1C2C89
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5075582044
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5075582044
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydQbtGlejUJo for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:44:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EAAD8203A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EAAD8203A
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:44:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so1484251wms.1
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047877;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1GUSDsUT99UU/OPl6G8JbOGu0vFGSNB4l1CNHzYeto=;
 b=LzohG4V5ZmM4DYoxd3mJaKs5m+g/32A5/Qi4Unvs4c73owtzR43aP/quD+eXkgO/h7
 q6r0qfVcBXziuBJWsgOch6vAREA/QwdsU6yHnyzSad6sKmCPbFZObZWBPu+4lrP8qARn
 WTgO8AN3JhTDJAjSHiApJRmBhez9htlG0JOLP913Hrpct6gmrooq9gMuH0H74nkXCIws
 /AkoQdI2r5iCx115doyhfi+j4OkT1EtToK13H6Kazg+mtEtVHZFAWJdBA9DjzBCWTOkO
 lzV+onUbV061XQ15y4xZxRRRN1H/ddOhxS5HS1Fq9U6APy7/rHlouuh0wc7bArzq1y+6
 NU6Q==
X-Gm-Message-State: AAQBX9dL2bPE5A5RbD8XklLueQqQq/zy4h2OYKmOoDKTUFiT9JfbnoJ2
 ccNvWQSvx/2kDnHEzNgjyoUpmw==
X-Google-Smtp-Source: AKy350b+AvXGl5+9xHF6t4/1RlfuRDYx35QIHnvDSTZNud0lAbT52eOvp3KtH1yoK63PY+7pn7eIjQ==
X-Received: by 2002:a7b:c38d:0:b0:3ed:8bef:6a04 with SMTP id
 s13-20020a7bc38d000000b003ed8bef6a04mr3202188wmj.27.1681047877641; 
 Sun, 09 Apr 2023 06:44:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003ee58e8c971sm10581053wmq.14.2023.04.09.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:44:37 -0700 (PDT)
Message-ID: <b4a0d86d-9163-8ae0-2300-0f346c2a5f8c@mind.be>
Date: Sun, 9 Apr 2023 15:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Simon Rowe <simon.rowe@nutanix.com>, buildroot@buildroot.org
References: <20230406105412.116596-1-simon.rowe@nutanix.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230406105412.116596-1-simon.rowe@nutanix.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047877;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1GUSDsUT99UU/OPl6G8JbOGu0vFGSNB4l1CNHzYeto=;
 b=Z1YJmPBqbrmizeJM7RurD1mEHOdl9MPez/2Jl2Zian/L0a8MjfUiwuvPdlQw64C+bX
 /3olr3NwV2YzxiZUkeDGxdcx/NwgnYZNnLUh9AYQPRkeyOwv7gToDMaDxyY1UqIn8Dz+
 y2TPweduDonSbCX2QFaNewaa+JwmR6dIeD0b45ADaRl/7S71E48oocTLCfYN4gwUly7j
 Ay9HZN6O+9yjEZV3IMsuzaDdGZ84s47mc6evykMPR/4AyLmKGy9MNGPT33O6/IOCKWwU
 MSuWvdQg8RmNMWwtd/uSsmLpPbaI0Gzhpi9tQmYkRpNep0LuXRkmuzBT0XjENMdbz4zH
 mybQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z1YJmPBq
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: install udev rules
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



On 06/04/2023 12:54, Simon Rowe wrote:
> mdadm contains various udev rules to manage RAID assembly and create
> symlinks, install them if udev (or equivalent) is enabled.
> 
> Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
> ---
>   package/mdadm/mdadm.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> index 0a2eb4e5bd..a5dfb55168 100644
> --- a/package/mdadm/mdadm.mk
> +++ b/package/mdadm/mdadm.mk
> @@ -27,6 +27,7 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>   MDADM_DEPENDENCIES += udev
> +MDADM_INSTALL_TARGET_OPTS = install-udev
>   else
>   MDADM_CXFLAGS += -DNO_LIBUDEV
>   endif
> @@ -36,7 +37,7 @@ define MDADM_BUILD_CMDS
>   endef
>   
>   define MDADM_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin $(MDADM_INSTALL_TARGET_OPTS)

  I moved the "install-bin" part to MDADM_INSTALL_TARGET_OPTS as well (and 
changed the = to += for install-udev).

  Applied to master, thanks.

  Regards,
  Arnout

>   endef
>   
>   $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
