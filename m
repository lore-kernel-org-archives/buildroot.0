Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED247CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 18:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A7760A82;
	Sun, 17 Sep 2023 18:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A7760A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyzD1vKjX1eR; Sun, 17 Sep 2023 18:10:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFFF60AD5;
	Sun, 17 Sep 2023 18:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAFFF60AD5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E13A21BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAE5F60AD5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 18:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAE5F60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnGZZYxPgXRk for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 18:10:03 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9337860A82
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 18:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9337860A82
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52f3ba561d9so8264936a12.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694974201; x=1695579001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXX3oKkWT/Ms7V8sVN9ZuIywF/WB+8nyUnIbhEvsdAw=;
 b=TcGwuQIusV2on2owX0m2y/gfbtgsva4XZSVSOcRfo8f53gQYNUEGYNasu0GvgwtKwF
 CTeG+fQoCrfThc4QvEMwTTW/sleH5bOjkrWdlelCnz8tUF94GcRYYZEVjwnjtwwckBcG
 WtfGT0R3AmT/zmAI8t6SH1203TrUQXpDKmfKmxKEpeEYQjz5VR1L6KP7S0YInK0kzY8a
 mCRPFpmyPz2TmRLoV/ZVlEClXbClf04aQsPwQUxviyWZ1DItJKgdoZ3Cz09smNMOpBuo
 dGi8wvwl3qWePVz0c8za1qCSNhuuUw7/RjgrBek9KRIuzML2ajsKA5rD+Gk8O+oQMNGN
 Mpng==
X-Gm-Message-State: AOJu0YyRdi6kVa0lFfXIaxaPbnmdA4nLQuXD0ou8AComzt9yp6YPE7ey
 Po+UmSA0UO3pvB41liXJAmixgpE6hfUFGLuL6Zk=
X-Google-Smtp-Source: AGHT+IEJKFHBRu4s9uhIyp5q0/kjuwAn7SDWFBSTe4uBx7Xva5xDkCyaTu+4R+H3lQoeJDV5SaF73Q==
X-Received: by 2002:a05:6402:4405:b0:51d:b184:efd with SMTP id
 y5-20020a056402440500b0051db1840efdmr14701124eda.20.1694974201372; 
 Sun, 17 Sep 2023 11:10:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0564020c0400b0053120f313cbsm33024edb.39.2023.09.17.11.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 11:09:58 -0700 (PDT)
Message-ID: <d7c4ff7c-8cbe-fcc4-4c4a-a05b084481d9@mind.be>
Date: Sun, 17 Sep 2023 20:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-2-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-2-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694974201; x=1695579001; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pXX3oKkWT/Ms7V8sVN9ZuIywF/WB+8nyUnIbhEvsdAw=;
 b=NsAOK6weJ+7J1klg77tz7PEGumowivX4a4salk9nkQqtRL5dgQLrdh5skCubOhcbXd
 Vsc0yHZ46RpgWyEQbsBwOznqzRESGq8Z2DrP4w2vQon4IBEnT5yYBTMryeMITGurHbHO
 XaXEV0raXQqzHORUOYYlfD5bGP4HI37d70VrEZPbN2fTp9VymrMDxkyHj/WlhfC8Qziu
 TYhQ6un+NmnQcWCzH6ZDeQzFfnFWZ7CvtoJ3C2bGNuiv25e8ZJyxJX55UeK06zCW/T0V
 oKxs+0gCkdD3r6V1EY3irRHvwgSkF1yfuzrb2hNkfTiDm1TTOWB/7dBXlE94nEiMyyju
 bwNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NsAOK6we
Subject: Re: [Buildroot] [PATCH v2 1/5] package/petitboot: fix
 HOST_PROG_SHUTDOWN value
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/09/2023 17:58, Reza Arbab wrote:
> HOST_PROG_SHUTDOWN currently references a file that doesn't exist. Fix
> by setting it to /usr/libexec/petitboot/bb-kexec-reboot, which this
> package already installs but doesn't use.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/petitboot/petitboot.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 8b4c14207ec4..8d220f88f45a 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -21,7 +21,7 @@ PETITBOOT_CONF_OPTS = \
>   	--without-twin-x11 \
>   	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
>   	HOST_PROG_KEXEC=/usr/sbin/kexec \
> -	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
> +	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
>   
>   # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
>   # package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
