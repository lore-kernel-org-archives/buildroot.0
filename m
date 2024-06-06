Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1013EC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D04254191F;
	Thu,  6 Jun 2024 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7J_dOy9v0jVt; Thu,  6 Jun 2024 19:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CAB141888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CAB141888;
	Thu,  6 Jun 2024 19:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5954E1BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45BCD6081B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSYHC7kCj4h1 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CEBC607E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CEBC607E1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CEBC607E1
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-421396e3918so17007515e9.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702827; x=1718307627;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CKQUGzSqIPmZTT/qKkp27gXNdnO9ZfQ2nJssIa655sE=;
 b=NDmHTOD+D9di5/tx+pLjbE/upuVuvvPJugzPU9wf7ZVwPdRKiImTCFvto1IoHRqRIw
 9wH6kPouozbCF9r+wSChP6lxqipTYI5B5dxwZk8okWWPwLuBoTYlhzZsGXAji15Zd/1r
 Qj+b4DK/FNg61RxDxuTF46s30Fh4HAcBp5+Q7WcT6SEOzXsKDN20jmk3oEw3qpRB0/9v
 YnsHhDdFkS1Hf2shumbpE5gX/sQr5cgzm4pQttBfc14KHvBzlbrwHHT3wyJKLKBzP5Zz
 hGQx9giOJ260T36DtqrAePeBwMgACjtehZzbDXgQplxPz7R5sojs4Awb2vmSkAW+3uCr
 wQrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGaPDJlcFjdlhbbT0VriomVx0ozhU4ChV0KHUBw+Kkx/du/CpolgeZZKCl6796SxC1AQGHsewKYrv4TPXu80Y6u4tQSdfiWw==
X-Gm-Message-State: AOJu0YxOtPN2rMxAdi1r8guZxo7J695htuixJeMjGx/B76SddvoXmPHi
 pVTtFprNBPI7OFavTTWhNTNIOqR9bVQ8sEwmx9oG1x/wUbxhmGEK1znwjIFKyV6dp9wymTojRs/
 6
X-Google-Smtp-Source: AGHT+IEtOMrqSXvom/NezjOEIrJz1CsHseufW+oTY8eh4cNOEk3btTPs46lSoYKElxGNgjgqh6R2lQ==
X-Received: by 2002:a05:600c:354e:b0:420:28c7:7260 with SMTP id
 5b1f17b1804b1-42164a0b40amr6313485e9.21.1717702827101; 
 Thu, 06 Jun 2024 12:40:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fd1b56sm2316383f8f.112.2024.06.06.12.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:26 -0700 (PDT)
Message-ID: <8da659ac-9fc1-4c27-9e78-c6e6d4171177@mind.be>
Date: Thu, 6 Jun 2024 20:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
References: <1933723>
 <20240510073213.806802-1-roy.kollen.svendsen@akersolutions.com>
Content-Language: en-GB
In-Reply-To: <20240510073213.806802-1-roy.kollen.svendsen@akersolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702827; x=1718307627; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CKQUGzSqIPmZTT/qKkp27gXNdnO9ZfQ2nJssIa655sE=;
 b=GF7oWTis9SSbR4lBwlbDn4YEXmSCfRmTajmbTmL5b35JEvvP14i9V9/DtxPCB0ln9d
 EG5dhLZecsJPEZEckLX7nFZP5wRi9QTAbvQPsrcpU3L3XT6FDVfcctO6b8GDCeyba72F
 AFNX0Tq4FxbWmH1bUE5Tfa4e6vP2QY7I/NAoesCK4j0P+0iZ3HhvHQG5DtLcOohOsda9
 9e0OmfsmsWK52NIUX5AtvmXBMlaYy0N/nndhkAFD0OKyTb8VVALqRSRyEkZgXHHh/a+W
 YHJHSgTB01NuFLvBm7hv59Dd0iUfQY5+xeYTUOP+XV9zVl8t0NtFFC+ee9hNK/ui2OSj
 kyuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GF7oWTis
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2024 09:32, Roy Kollen Svendsen wrote:
> Fixes the following error:
> 
> ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
>      NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
> Condition values dump:
>      WIN32 = ""
>      WATCHOS = "0"
>      QT_FEATURE_opengl_desktop = "ON"
>      GLESv2_FOUND = "TRUE"
> 
> CMake Error at cmake/QtBuildInformation.cmake:209 (message):
>    Check the configuration messages for an error that has occurred.
> Call Stack (most recent call first):
>    cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
>    cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
>    CMakeLists.txt:208 (qt_build_repo_end)
> 
> To recreate the error, use the following defconfig (based on freescale_imx8mmevk_defconfig):
> 

[snip]

  You could have made that a little bit smaller :-)

> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

  This doesn't match your Author line. Was it committed with your akersolutions 
address on your side? Normally, git send-email should insert a From line if it 
then sends with a different From address and you wouldn't have this issue...

  Anyway, I fixed it up (changed the Author) and applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - Increase BR2_TARGET_ROOTFS_EXT2_SIZE in the defconfig above to make room for
>      the qt6.
> 
>   package/qt6/qt6base/qt6base.mk | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 6857725ef5..211808d2af 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
>   endif
>   
>   ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
> -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
> +QT6BASE_CONF_OPTS += \
> +	-DFEATURE_opengl=ON \
> +	-DFEATURE_opengl_desktop=ON
>   QT6BASE_DEPENDENCIES += libgl
>   else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
> -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
> +QT6BASE_CONF_OPTS += \
> +	-DFEATURE_opengl=ON \
> +	-DFEATURE_opengles2=ON \
> +	-DFEATURE_opengl_desktop=OFF
>   QT6BASE_DEPENDENCIES += libgles
>   else
>   QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
