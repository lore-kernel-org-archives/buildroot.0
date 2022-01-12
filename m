Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE425C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BC86415D2;
	Wed, 12 Jan 2022 19:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrg9B_spK0D2; Wed, 12 Jan 2022 19:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D1B415D1;
	Wed, 12 Jan 2022 19:45:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE661BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A00384C29
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCdRsq48nSfr for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:45:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F348A84C27
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:45:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q25so14303577edb.2
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bZvfa8FnY/rn1prPsWIY4grWlM0W5BY/4LkDwHDOYmo=;
 b=Ir38TJo8h7wm2VMHfVHxH/37yBJGucyCIfqVtIlmFvSTI8gBrJ4iluiQnP0tpzFNa+
 NKGLxLywQAHVlDbEYNznKQKC9q2v5HrtuPW3Qk28Z2/WDFRqu+CzGCOKd1fuKsQaNxLo
 HObTtpytndSs7A3YwbBDSYixEl+kvjDKaQHPz9Cpwe0z28EJsL8VUoeRUZD9UpVxj5ND
 H6Bc+GNT4lTaCDcUMs+3//KllNwk3h3MCDJkOkUhLCRgGKcSjG70XlHHQCZzx/XCwEKm
 QXBG6KcBkwtrr7AGb26U2fkREzVOJSytjD7MSL135kTOrfbOMxBHw1L9clejl8QFiPun
 Mu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bZvfa8FnY/rn1prPsWIY4grWlM0W5BY/4LkDwHDOYmo=;
 b=fsV5cIyYU1uvDSJxwKgW7wVXec6LktmGrFR8E/11LHSM+LfSEQI5RO8VaZ/rdHEmNM
 UJR/KuD6j7dsqUaQj/JBmpsm0LUj0S7X4vP8zDTM+F3S1zjySYaQTRw7t1v9heipv+s5
 n63ReyFmVMEJf8i4mm5qc4VCF8sYl40ajkqBre82zC1rd1jRkexRUlvmdmJJx4dnZDNo
 3yLoMmZGLsDWWC8I8ZwIVqwzRvjHzM0fYInRb9EDyaJx9Du1Op0PctzHVyX9FxLmLcy0
 5LuC6XgHjpCo2SkG8UR5XmY6EBLIryjvQZH8kT8SwzEs/5/PfkG8LVxzARoTasdY9hxJ
 JLGw==
X-Gm-Message-State: AOAM531soOlCyXmx8tiS3C/zjGXcKZjfVuEB0pkFWtv1IRhAZCTDoZR6
 LdtWOltQGb3nIh3sx6BQso3e8fUpxI4SSQ==
X-Google-Smtp-Source: ABdhPJyDtiuvo9vqkglPlS8mPlTmR4pliE4D92oHNfOYA3QvGhsUi9lBEcEoDLDLGNG6roC8jlI/vQ==
X-Received: by 2002:a17:907:c29:: with SMTP id
 ga41mr1008719ejc.676.1642016748295; 
 Wed, 12 Jan 2022 11:45:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k8sm203458ejc.115.2022.01.12.11.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:45:48 -0800 (PST)
Message-ID: <f2ed64ba-f025-c0b9-6088-86942d80e0ce@mind.be>
Date: Wed, 12 Jan 2022 20:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220112172100.2991140-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112172100.2991140-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: needs host-dtc
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/01/2022 18:21, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:
> 
> configure: error: device-tree-compiler not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d35ff4a0ca0a8463121d717a9727e0d863ca83e8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
> index e10dd4c662..59f70fc432 100644
> --- a/package/riscv-isa-sim/riscv-isa-sim.mk
> +++ b/package/riscv-isa-sim/riscv-isa-sim.mk
> @@ -8,5 +8,6 @@ RISCV_ISA_SIM_VERSION = 1.1.0
>   RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
>   RISCV_ISA_SIM_LICENSE = BSD-3-Clause
>   RISCV_ISA_SIM_LICENSE_FILES = LICENSE
> +HOST_RISCV_ISA_SIM_DEPENDENCIES = host-dtc
>   
>   $(eval $(host-autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
