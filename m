Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B765AE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C482816E3;
	Fri, 20 Dec 2024 21:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZPwc4gW8_9m; Fri, 20 Dec 2024 21:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65CFF81746
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65CFF81746;
	Fri, 20 Dec 2024 21:01:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45832920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25104607B6
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWip3T21vypj for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 21:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.155;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47D7060666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D7060666
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47D7060666
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 21:01:14 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id DA6ED209202F;
 Fri, 20 Dec 2024 22:01:12 +0100 (CET)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 4vJMRoM7ePM9; Fri, 20 Dec 2024 22:01:11 +0100 (CET)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id BEDDD2092286;
 Fri, 20 Dec 2024 22:01:11 +0100 (CET)
Received: from int-subm015.mykolab.com (unknown [10.9.37.15])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id 83F7620D3282;
 Fri, 20 Dec 2024 22:01:11 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 22:01:11 +0100
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241109175509.1364647-1-ju.o@free.fr>
References: <20241109175509.1364647-1-ju.o@free.fr>
Message-ID: <a2ad6326ce72106f3d6c3397116e089f@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:content-type:content-type:message-id
 :references:in-reply-to:subject:subject:from:from:date:date
 :mime-version:received:received:received; s=dkim20240523; t=
 1734728471; x=1736542872; bh=T9Ld0HZ/xYhBnNTW1BKRTzg7r3MqzXiNDYr
 Qt94Y7OI=; b=jd5mlCdl7GIKYqifFc8Vxv+uQuu0cmn71CfoNOtErGIriSrUCZL
 nKR+34vgwRnM5p0hhauBLGPmelqjDCH6EpCNsSgvV5dTc7fYep0sNW5dEyatAY9g
 t3EUxHMkJFXjSnqGmDAU2fkWhgsDfGp9BJPuxyDQ5QEXBlwjMjgN9X7Lp5LSYErL
 LfWzJoXTwuUlRK8w3NszwMbVhuUuOgRlTG23f241rxy7yeo8F1u9vDMMZe7wziQC
 7dXimC0ghAXKsOqbm+ft0w0rRS8gHziw1HGXnAI5Cq/7QlusUnlLRTr6crWAptbs
 pdzai0JbCR5ErcHpMyVPseMJlJp1CmCI6Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=jd5mlCdl
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH 1/2] package/proj: add an option to build
 and install apps
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 2024-11-09 18:55, Julien Olivain wrote:

> The proj package includes command line applications. Those have always
> been disabled in Buildroot. Those applications can be useful for
> scripting, and also for runtime testing the libraries.
> 
> This commit adds a package Kconfig option to enable those apps.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
> package/proj/Config.in | 12 ++++++++++++
> package/proj/proj.mk   |  2 +-
> 2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/proj/Config.in b/package/proj/Config.in
> index 6d172e2ee9..86966a4d10 100644
> --- a/package/proj/Config.in
> +++ b/package/proj/Config.in
> @@ -14,6 +14,18 @@ config BR2_PACKAGE_PROJ
> 
> http://proj4.org/
> 
> +if BR2_PACKAGE_PROJ
> +
> +config BR2_PACKAGE_PROJ_APPS
> +    bool "build apps"
> +    select BR2_PACKAGE_LIBCURL
> +    help
> +      Build and install proj command line apps. Those command line
> +      applications are: cct, cs2cs, geod, gie, invgeod, invproj,
> +      proj, projinfo, projsync.
> +
> +endif
> +
> comment "proj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
> depends on !BR2_INSTALL_LIBSTDCPP || \
> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index a17a0a1feb..d6457b0e5b 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -20,7 +20,7 @@ PROJ_CXXFLAGS += -O0
> endif
> 
> PROJ_CONF_OPTS = \
> -    -DBUILD_APPS=OFF \
> +    -DBUILD_APPS=$(if $(BR2_PACKAGE_PROJ_APPS),ON,OFF) \
> -DCMAKE_C_FLAGS="$(PROJ_CFLAGS)" \
> -DCMAKE_CXX_FLAGS="$(PROJ_CXXFLAGS)"


-- 
https://zgyarmati.de
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
