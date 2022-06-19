Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5966C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB5E82437;
	Sun, 19 Jun 2022 15:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DB5E82437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U28QDX6Fc7E8; Sun, 19 Jun 2022 15:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7220C81C6E;
	Sun, 19 Jun 2022 15:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7220C81C6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEDFA1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A26E81C6E
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A26E81C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjzFidXRQTd9 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:43:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA6F81BCB
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBA6F81BCB
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:43:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p8so1733895edc.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QPQUcz3n2QvRlq/WDqfRh3G1VdEpJZ2XyMbTx65eAIs=;
 b=m4UXNAoYv4Me35PpkjrSZnxOC6ArDUmhoiP2jLVMN7SD1fiZJBOxjVT3qK5U1ASyrl
 uqEd8GbqxYZY6GyH4QDVRUpf4/WkkIb3vMAtfkyUWm7GfZWgAQwxsUFQKr3cyf89O41Y
 gwQCWCgZeQnPHVOAEEl40T8GrUtrslnMlv3wdjjBcapo0eqjyh+e6AuN46t7A4en/OZn
 XP4JuomoBkyMYGp3iY0aCgFfyIGebWrd1FfmKxV+D1cKGDzysW/Z8hpOhZ/PiBEsdx9A
 EY+Mfmb0kXej0D0PW26nwYdZAu7DOXSG1m4gek/qFSa9xn79Iz+Yq0apXTGQ2cXC0pFS
 TB+A==
X-Gm-Message-State: AJIora+vrK3ZCGLssa9lHZb5Y2IoAYpxdnYNWRJTODwufRr+/eYwJ/3W
 P6+cJF1ATFSrFlh+aVb/wE0S/Z+fNubXCg==
X-Google-Smtp-Source: AGRyM1t6mFrVNsqGaK8sVpnG25z6IXDvhfxzPkw+JslQjUN5im58tby2pN1BBScuXway5PrqNxIlgw==
X-Received: by 2002:a05:6402:2806:b0:431:87c8:b45e with SMTP id
 h6-20020a056402280600b0043187c8b45emr24671738ede.130.1655653423060; 
 Sun, 19 Jun 2022 08:43:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a1709065e1600b0070b1ecdc12bsm4652106eju.112.2022.06.19.08.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:43:42 -0700 (PDT)
Message-ID: <9a538e50-78a7-0569-9b45-4306dd8e81db@mind.be>
Date: Sun, 19 Jun 2022 17:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QPQUcz3n2QvRlq/WDqfRh3G1VdEpJZ2XyMbTx65eAIs=;
 b=Dk57Pby09mOI6i/zz2gRJ1HS2lpBP+PeMWGxGZF82fkSkPV8sQ9rNTsKwDubJdeivg
 UCqfCCxBMkdRAbPJ2nO78SDjzJFPkDs87KMLDalKU+UfQQuFbZrXQhp13mangXWUSo8s
 5+exg/5Pd+iMPhNZRL2w5spT64cVQ6lYMMviwlxt9qGrNS5x6ItfIHxELLcIIHY7+hnj
 dIx5SLC5GSTrbPPzO4phb8HCGy2tDUmiH29ukXAYPcd+QBdKpdNWZhe7YEQK1wF8Nr3u
 2rSQIKUTxrey3UUai1Tkga7UTO065bnK4pWkeI/hs9CyfgylcpG6M+J63bDVqZgCBNx6
 c23Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dk57Pby0
Subject: Re: [Buildroot] [PATCH 1/3] package/sofia-sip: add
 SOFIA_SIP_CPE_ID_VENDOR
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 21:53, Fabrice Fontaine wrote:
> cpe:2.3:a:signalwire:sofia-sip is a valid CPE identifier for this
> package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asignalwire%3Asofia-sip
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied all 3 to master, thanks.

  Regards,
  Arnout

> ---
>   package/sofia-sip/sofia-sip.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index 2bac480542..c7698c9a11 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -10,6 +10,7 @@ SOFIA_SIP_INSTALL_STAGING = YES
>   SOFIA_SIP_DEPENDENCIES = host-pkgconf
>   SOFIA_SIP_LICENSE = LGPL-2.1+
>   SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
> +SOFIA_SIP_CPE_ID_VENDOR = signalwire
>   SOFIA_SIP_CONF_OPTS = --with-doxygen=no
>   
>   ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
