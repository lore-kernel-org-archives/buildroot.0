Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E0BC6FD20
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E30408202B;
	Sat, 25 Mar 2023 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E30408202B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIRRvBkRJz6w; Sat, 25 Mar 2023 20:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E3C82026;
	Sat, 25 Mar 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E3C82026
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76E4D1BF32D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F7F060AB1
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 20:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F7F060AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nh6pQ6NmNy-Q for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 20:27:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8924560A99
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8924560A99
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 20:27:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b20so21044746edd.1
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 13:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679776058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pFglTf8VJMcq6glrnugWh71z2fsgdTf75dOxoVfVhgQ=;
 b=lf2B1dlxnUUwza4krJxHMl5GK4AJxOwSvLLxma/FyIor+GcAtlv5MYCpNUPjj3NOhW
 t8YqHrl4Pn9xmzFzs8J37Gq4CzCQZCcv/uBsJZlM78NW5NTk3HV0c0AtYjFMsSurUf3i
 mqG/Kp1vYGaNhlzMiHX+GTt2UcUGFseXFOYfTaLJySl1KqRMUE7Kw5LAmI1o7/hRTqGF
 nX31l4cVWG/nDND9HDu/FW0fIFi2996bO6UT1w8YpbNdAaY8uskTZOtAYOyE+YOWYR7R
 3KEB5LwI+8YFJ1da1IOMqT3aAz5diBjAEh5r2YL2bLWWSXPiXECFfA7sfccxyGXXxl8C
 8vhQ==
X-Gm-Message-State: AAQBX9e+N6cbnLgs/rzq+vrzsyGeOIjtd/QMbHVfDXYQ0HbJtOXmx6Or
 tXvif/uoshy4F9Yx7MYtsT9JFQ==
X-Google-Smtp-Source: AKy350ZaOEpGsD76sVqipOA701X0erG0ZxJziWr9nMGh2ZPvUJOVcUjK1kPt7t1Altst03jTKEEj0A==
X-Received: by 2002:aa7:d053:0:b0:4fa:e129:31cf with SMTP id
 n19-20020aa7d053000000b004fae12931cfmr7337624edo.23.1679776058827; 
 Sat, 25 Mar 2023 13:27:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18?
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a50d506000000b004fd2aab4953sm12738946edi.45.2023.03.25.13.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Mar 2023 13:27:38 -0700 (PDT)
Message-ID: <0bdc0734-157f-5465-47f4-d771385c6aa5@mind.be>
Date: Sat, 25 Mar 2023 21:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-3-vfazio@xes-inc.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221172205.2450111-3-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679776058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pFglTf8VJMcq6glrnugWh71z2fsgdTf75dOxoVfVhgQ=;
 b=SI4+63EPIa+LPVNMeiHtCzH8SZy/2DtUYdjjLxn8nUHRzWWr3IceRrfkx1AT+sjpcp
 sG6L0mkESbldXtV+JNNblq8FbZxt3hLX6JXXFJ8t3UNFH8V9HP1WaA+aevPlIbl7ty+o
 2yceApInvrq5JZAeF11eicdOD/3iAjEEpzXGjv1UZY1/iJjgfwcE8OH3SGY8CjApfEf4
 6O/MfZkFz20xMTjQ21pfNg6cPIn1Dx9TN5n1qpHisE/ZHpnsBJATKPb+zaPVXeVpJYJ0
 DDghqRchvUUjLO2WcemRcDnj/8XHgFnwdszpLJ3imF9X1mwPF+dvNmBak7hF83NN4CAY
 jkuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SI4+63EP
Subject: Re: [Buildroot] [PATCH 03/15] package/pkg-autotools: set AUTOPOINT
 via AUTOCONF_ENV
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2023 18:21, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Previously, AUTOPOINT was hardcoded to /bin/true in autoconf.mk.
> 
> Moving the definition of this variable into AUTOCONF_ENV as part of the
> autotools infrastructure will allow us to conditionally set the variable
> based on package flags to support migrating away from FOO_GETTEXTIZE.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>   package/autoconf/autoconf.mk | 2 +-
>   package/pkg-autotools.mk     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
> index 7e0850422b..3cac20cc34 100644
> --- a/package/autoconf/autoconf.mk
> +++ b/package/autoconf/autoconf.mk
> @@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
>   # variables used by other packages
>   AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
>   AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
> -AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
> +AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i

  I took the opportunity to also split this ridiculously long line.

  Regards,
  Arnout

> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 55d95d204e..418cd10945 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -241,6 +241,7 @@ ifeq ($$($(2)_GETTEXTIZE),YES)
>   $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
>   $(2)_DEPENDENCIES += host-gettext
>   endif
> +$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
>   $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>   # default values are not evaluated yet, so don't rely on this defaulting to YES
>   ifneq ($$($(2)_LIBTOOL_PATCH),NO)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
