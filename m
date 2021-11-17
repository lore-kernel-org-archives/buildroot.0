Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE49AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C5A61AED
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3C5A61AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C19E60A7F;
	Wed, 17 Nov 2021 20:47:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBAKfkSOpjxz; Wed, 17 Nov 2021 20:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15AD60A81;
	Wed, 17 Nov 2021 20:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF0E61BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA561400EB
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pmmW9r0T2RM for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6FE8400D0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g14so16762580edb.8
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FuqmXq20er7qRXDp72o1hiKRpUM9rdrypajeZAztP/8=;
 b=InpFVYWRClSe3H+4+apbi56Ye4fMnR2/aV7Vcm2J59NpcNi/HACKWviHyk0bH92+Y2
 XYv5i+5qnLWani9VsXIM392FU1S2gwX6nxda7JuY8ol8Ua9UWAOY2vSAL1G1GvJkKeK7
 Ucyl2klzXbz/RU1bd4tAWUMlJd0bik7+zAOXdxAeaPSUPGz37qC7N6nM7/zKPk2OveeQ
 dCZsHzmmKs5AJ/tnhlw7ePIfhsj1V3bZtT7xVL8/GGb9g9MItBPh3zxASWLA75Kd7NvN
 jrA0gHbI8r1rJKHUOiA7kAu2C9hd0OPn1W0S86l27eLaEXsIZENH5Q21jxcAzvj9fa1Y
 XrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FuqmXq20er7qRXDp72o1hiKRpUM9rdrypajeZAztP/8=;
 b=m73f6ByWH8ql8icT+dw+6Ni7ow83hDMvUI1qhKMDu/xOeVUmLtjKghfPaoafHEgBp5
 iyWqkWQF/vFCLYfJQCuz5jPTHQf+K2162eUhs5JvYBLf30ncaGm6wGa6xfW+QwJNyyqj
 tSMTHwxM+RzpHpnjUn/2pZoQTHm3nsuZtaYyqjvDoCNJUYGe40bJtOompsBPsXzq0X+M
 HjTXssqnHXErrLZadiZPTERbu0zk/lMThta2gCHSIcJUqUB3aqKlu/2W8d8ea7EoSmaZ
 s1dcV3mWajmR5KJpHCtLTPbMtM1p+2SDKW2+k36RXIXnzfGzTUI0kouHTfkx/SEtfOyL
 PdtQ==
X-Gm-Message-State: AOAM532N8m1CKKO6AQO3RpLtdXsZWOJfDue3aIZ7/Guy50Ou8v60Khjk
 UoVi7nfXnSnikAsso+fEVO5J0w==
X-Google-Smtp-Source: ABdhPJyNE2jhScB+yAM/7+C1Br39Gmg2VSPQqNwKY5ZhS6AbyVROqF8LmUUf8EwAkHJgZzs8ZFfUtg==
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr2526907ede.354.1637182038766; 
 Wed, 17 Nov 2021 12:47:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dp16sm510944ejc.34.2021.11.17.12.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:47:18 -0800 (PST)
Message-ID: <a8caa7e3-f449-ebd0-e94b-cff8163759f2@mind.be>
Date: Wed, 17 Nov 2021 21:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211117173152.994041-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211117173152.994041-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/11/2021 18:31, Fabrice Fontaine wrote:
> Fix the following per-package build failure with apache:
> 
> /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=link /home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/aarch64-linux-gcc    -o mod_apparmor.la  -rpath /usr/modules -module -avoid-version    mod_apparmor.lo -L/home/buildroot/autobuild/instance-3/output-1/per-package/apparmor/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -lapparmor
> /home/buildroot/autobuild/instance-3/output-1/per-package/apache/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: cannot find /lib64/libc.so.6
> 
> This build failure is raised because the fix added by commit
> 3c836e54203b16015c9c52cbe007adc92d293a0d was incomplete as the apr
> special libtool script was not patched (see commit
> b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d for a detailled explanation)
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/apparmor/apparmor.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
> index 400ea349ae..6f0e59224d 100644
> --- a/package/apparmor/apparmor.mk
> +++ b/package/apparmor/apparmor.mk
> @@ -59,7 +59,8 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>   define APPARMOR_FIXUP_APXS
>   	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apparmor/@g" \
>   		$(STAGING_DIR)/usr/bin/apxs \
> -		$(STAGING_DIR)/usr/build/config_vars.mk
> +		$(STAGING_DIR)/usr/build/config_vars.mk \
> +		$(STAGING_DIR)/usr/build-1/libtool

  I was surprised by the build-1, but it seems to be correct. Apache is weird...

  Now I said that: shouldn't all of this move to apache.mk, by adding them to 
APACHE_CONFIG_SCRIPTS? Of course, those are assumed to be in 
$(STAGING_DIR)/usr/bin, so you'd have to put ../build/config_vars.mk and I'm not 
sure if that won't break the realpath stuff...

  So anyway, applied to master, but it would be nice to do this in a cleaner way.

  Regards,
  Arnout

>   endef
>   APPARMOR_POST_CONFIGURE_HOOKS += APPARMOR_FIXUP_APXS
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
