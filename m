Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E8EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD2E60FE6;
	Sun, 24 Jul 2022 09:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD2E60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sc2IoKJDKVms; Sun, 24 Jul 2022 09:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFD660F5D;
	Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DFD660F5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3637E1BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0204031E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0204031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFiJVBste2O7 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B023640025
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B023640025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:19:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g2so3946707wru.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G/1UmyXJ16ISSRNQtUDZLxq3GvrbBz8Q/tyXVXNXs/0=;
 b=Qq+JjCh3duiPFy+nDYzIMULwORPq3N1kgWJO5ycJY/YEbiv8pU76oH0YLO2XbD7lZE
 lRjMHF5l3IKu8U+aCtzAEINDhZ036bIZnwFgrmcywDVb00uqCYlysfl4mEoIrnxmqR2P
 zjqYmDeB4YDqV7c20W54sm9Gz8sYV7vVn6tCEp5Dyfjk5tZjm3td7CqCtZEZRaNLFzIg
 0pc/+kdjWRDk9KL05l5bfufYJapgXj60R+sQ4766K8ahYkUlx0uTiOq+BPHWV4omyMvo
 30grfcg3pHFe265FozOB+8rYkpUdjG6yeiR/52rlcWJBbbZ1MgEOFpVzHiRVmDN1qG8e
 RNVQ==
X-Gm-Message-State: AJIora9uqueEd9cXxwWlSqZTGYBDm5xqFWzIky/4l4IK2UaaCw4RHfKr
 BBbS3hXMB8GUFo58WwDgrW/g0w==
X-Google-Smtp-Source: AGRyM1sto2qtoE5rlKqAakgPbxz12Et9yF1/MLpJqPtN3rQBsD+xcmnHythRatkno/V9bPuaWz7E+Q==
X-Received: by 2002:a05:6000:1a8d:b0:21d:9055:96a6 with SMTP id
 f13-20020a0560001a8d00b0021d905596a6mr4639312wry.245.1658654344688; 
 Sun, 24 Jul 2022 02:19:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bce06000000b003a35516ccc3sm1337886wmc.26.2022.07.24.02.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:19:04 -0700 (PDT)
Message-ID: <5452727a-4405-443c-02da-dfdfc0559609@mind.be>
Date: Sun, 24 Jul 2022 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220723205954.458058-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723205954.458058-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=G/1UmyXJ16ISSRNQtUDZLxq3GvrbBz8Q/tyXVXNXs/0=;
 b=GJbscidoz9mgItdz2foql7Ane4vUxDcxqkh21hehZN+bfO6JxZaOLScPl51460PhZp
 V3nLTE9g/+2/UrV74j+VMH8mvC2YB16oS+9HSrabvfpkvwam7NSHt9fMK3fyCyXV2j52
 mulU6dCZkzxfmxazDPDJO5qHLdEsvpsOld0RTbVlZWJupCUM9kZ4SToD01OODyTo+bNf
 Iw47C5iQzmMi7PE9Va5WiGm5yKeSWkKcHncAkxv1thBCmrlg49OXWuxsR7OTUwzUeYLx
 ksab79yzCDclEvz/BLxP8AaVZOCbtSIuyDVXuGhH3+XJbpW5AMfg50lD8EoQaU2ghE4I
 1jfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GJbscido
Subject: Re: [Buildroot] [PATCH 1/2] package/bind: add libidn2 optional
 dependency
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



On 23/07/2022 22:59, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/bind/bind.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 1646fc6237..86049d3648 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -54,6 +54,13 @@ else
>   BIND_CONF_OPTS += --disable-linux-caps
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> +BIND_CONF_OPTS += --with-libidn2
> +BIND_DEPENDENCIES += libidn2
> +else
> +BIND_CONF_OPTS += --without-libidn2
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBKRB5),y)
>   BIND_CONF_OPTS += --with-gssapi=$(STAGING_DIR)/usr/bin/krb5-config
>   BIND_DEPENDENCIES += libkrb5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
