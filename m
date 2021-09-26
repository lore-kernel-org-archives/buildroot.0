Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F73DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:46:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB22E60F6B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB22E60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABEA40300;
	Sun, 26 Sep 2021 19:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5aTxo6b9cGc; Sun, 26 Sep 2021 19:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9FFD402D4;
	Sun, 26 Sep 2021 19:46:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 650021BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60B7D4020E
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c80lH8ylcdLQ for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:46:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BA3540109
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:46:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g7so474167edv.1
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3iIpKG5tWSyPiVKjUK4RKrF88D4Wi2GH+C583Ic7Xmg=;
 b=Uk7QW0rvTu/8F3owBO1Y115LvksxBnf+SCCAFA8mQrYlj2kpWhlnjjpqtRxTotUaIH
 2kK4NO42yBOFxWuyRpvp7xtV9hu6Yw8Ey51iVLhDC2Z9wI3gLximgp9h/uvsYjOE+17S
 ASXO6rzcxE9AimNd/so4ppNq/oGj44hxM/jVQrBW82RXvkr4GKwF8ZyI9erq6CWkOU5m
 WwI4OZ2DE0i+JW8ONotKxfd4zcFO4y/v/xKYRsP7NUvq26Yk9W1xc2raeVXHBaWQg0OG
 Ap+hRnECE4RHHlxQ4kBWOMDXSBSaa/2Vco3d62kb2rVaSEXVAc3yaquXBt0fDx3g5nS4
 9ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=3iIpKG5tWSyPiVKjUK4RKrF88D4Wi2GH+C583Ic7Xmg=;
 b=efqOiZLrbgXtu8drBBGxnquDpCB0YRyU/OMaTK1+iO2XQ52XLp9iOezGJ3ymCL5Dje
 KV9DMC3u8edB36S+I+/7I9l0Qbz0khf2TcY3pRIVfpqLTu6F0ZHzfkoY+jgioWNweUO8
 LLnGjeb47AThzN6+2S09O6H6xSKnq+3/q6yBXP05Bm22R+2hRKikMdXpOIvj9zsnR7V8
 5DyPoTXkKzhGH5FgHLm+Anh/JLmUZ2AqRWwIsZxOF5+6R2M2OgDIPp9aaRONLUVL0iOt
 1eC1d5tVIaOdOjUuol1l3tNtMtn+Ae7PvhlNf8ObwMqJDSOCY1KEXzEwen6n3eLDzct4
 UcDw==
X-Gm-Message-State: AOAM533Y5ci6fT+Nvn6ojZlybVQ+AVdUQpNAfBXm9+FBTkCI+RARrpAe
 jh4zB9GP409Wvhktar9K8IkIyVX3zZza8A==
X-Google-Smtp-Source: ABdhPJyYIV8ikvyCTn/a9HezgbgaITBIbWld0cR5YhOmlp44XXvSX9s/q6AOqQj4sgJ9r8n+nXnIcA==
X-Received: by 2002:a17:907:7703:: with SMTP id
 kw3mr22788897ejc.34.1632685576195; 
 Sun, 26 Sep 2021 12:46:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m7sm185035ejc.83.2021.09.26.12.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:46:15 -0700 (PDT)
Message-ID: <9ca07349-2b4c-7efe-f5d9-7d262a677835@mind.be>
Date: Sun, 26 Sep 2021 21:46:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210925082403.3231261-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925082403.3231261-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: fix build of examples
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 10:24, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit 130a0163af4eca54fd917529edb44ad9bfe8eb5c:
> 
> ../lib/libuhd.so.3.15.0: undefined reference to `int boost::math::sign<double>(double const&)'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a38856930b20a0d6fda28fe52f8a4c90c9df4e3a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ove-boost-math-in-favor-of-std-cmath.patch | 105 ++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
> 
> diff --git a/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch b/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
> new file mode 100644
> index 0000000000..9530b0213f
> --- /dev/null
> +++ b/package/uhd/0005-core-remove-boost-math-in-favor-of-std-cmath.patch
> @@ -0,0 +1,105 @@
> +From dc187b5597779b14d0de4087db4aa54752a15d07 Mon Sep 17 00:00:00 2001
> +From: Michael Dickens <michael.dickens@ettus.com>
> +Date: Fri, 2 Jul 2021 16:43:41 -0400
> +Subject: [PATCH] core: remove boost::math in favor of std cmath
> +
> +YA Boost removal!!!
> +
> +Justification
> +---
> +const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
> +_dsp_freq_offset = if_freq * (-if_freq_sign);
> +// boost::math::sign : 1 if x > 0, -1 if x < 0, and 0 if x is zero.
> +// ==> if if_freq_sign > 0 then * by -1 else +1 (effectively)
> +
> +// std::signbit : true if arg is negative, false otherwise
> +// ==> need 'not' of input argument to invert for same result as prior algorithm
> +double fe_if_freq = fe_conn.get_if_freq();
> +if (!std::signbit(fe_if_freq)) {
> +  if_freq *= -1.0;
> +}
> +---
> +The above should result in the same algorithm except possibly
> +if fe_if_freq is exactly 0.0 in which case the results might be
> +off by the sign (+0.0 versus -0.0).
> +
> +[Retrieved from:
> +https://github.com/EttusResearch/uhd/commit/dc187b5597779b14d0de4087db4aa54752a15d07]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + host/lib/usrp/cores/rx_dsp_core_3000.cpp      | 15 ++++++++-------
> + host/lib/usrp/cores/rx_frontend_core_3000.cpp | 14 ++++++++------
> + 2 files changed, 16 insertions(+), 13 deletions(-)
> +
> +diff --git a/host/lib/usrp/cores/rx_dsp_core_3000.cpp b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
> +index 879748fa2..1c15180ae 100644
> +--- a/host/lib/usrp/cores/rx_dsp_core_3000.cpp
> ++++ b/host/lib/usrp/cores/rx_dsp_core_3000.cpp
> +@@ -8,7 +8,6 @@
> + #include <uhd/exception.hpp>
> + #include <uhd/types/dict.hpp>
> + #include <uhd/utils/log.hpp>
> +-#include <uhd/utils/math.hpp>
> + #include <uhd/utils/safe_call.hpp>
> + #include <uhdlib/usrp/cores/dsp_core_utils.hpp>
> + #include <uhdlib/usrp/cores/rx_dsp_core_3000.hpp>
> +@@ -81,19 +80,21 @@ class rx_dsp_core_3000_impl : public rx_dsp_core_3000
> +         _iface->poke32(REG_DSP_RX_MUX, reg_val);
> +
> +         if (fe_conn.get_sampling_mode() == uhd::usrp::fe_connection_t::HETERODYNE) {
> +-            // 1. Remember the sign of the IF frequency.
> +-            //   It will be discarded in the next step
> +-            int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
> ++            // 1. Remember the IF frequency
> ++            const double fe_if_freq = fe_conn.get_if_freq();
> +             // 2. Map IF frequency to the range [0, _tick_rate)
> +-            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _tick_rate));
> +-            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2)
> ++            double if_freq = std::abs(std::fmod(fe_if_freq, _tick_rate));
> ++            // 3. Map IF frequency to the range [-_tick_rate/2, _tick_rate/2]
> +             //   This is the aliased frequency
> +             if (if_freq > (_tick_rate / 2.0)) {
> +                 if_freq -= _tick_rate;
> +             }
> +             // 4. Set DSP offset to spin the signal in the opposite
> +             //   direction as the aliased frequency
> +-            _dsp_freq_offset = if_freq * (-if_freq_sign);
> ++            if (!std::signbit(fe_if_freq)) {
> ++                if_freq *= -1.0;
> ++            }
> ++            _dsp_freq_offset = if_freq;
> +         } else {
> +             _dsp_freq_offset = 0.0;
> +         }
> +diff --git a/host/lib/usrp/cores/rx_frontend_core_3000.cpp b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
> +index eef25f27d..b9d908534 100644
> +--- a/host/lib/usrp/cores/rx_frontend_core_3000.cpp
> ++++ b/host/lib/usrp/cores/rx_frontend_core_3000.cpp
> +@@ -119,19 +119,21 @@ class rx_frontend_core_3000_impl : public rx_frontend_core_3000
> +
> +         UHD_ASSERT_THROW(_adc_rate != 0.0)
> +         if (fe_conn.get_sampling_mode() == fe_connection_t::HETERODYNE) {
> +-            // 1. Remember the sign of the IF frequency.
> +-            //   It will be discarded in the next step
> +-            const int if_freq_sign = boost::math::sign(fe_conn.get_if_freq());
> ++            // 1. Remember the IF frequency
> ++            const double fe_if_freq = fe_conn.get_if_freq();
> +             // 2. Map IF frequency to the range [0, _adc_rate)
> +-            double if_freq = std::abs(std::fmod(fe_conn.get_if_freq(), _adc_rate));
> +-            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2)
> ++            double if_freq = std::abs(std::fmod(fe_if_freq, _adc_rate));
> ++            // 3. Map IF frequency to the range [-_adc_rate/2, _adc_rate/2]
> +             //   This is the aliased frequency
> +             if (if_freq > (_adc_rate / 2.0)) {
> +                 if_freq -= _adc_rate;
> +             }
> +             // 4. Set DSP offset to spin the signal in the opposite
> +             //   direction as the aliased frequency
> +-            const double cordic_freq = if_freq * (-if_freq_sign);
> ++            if (!std::signbit(fe_if_freq)) {
> ++                if_freq *= -1.0;
> ++            }
> ++            const double cordic_freq = if_freq;
> +             UHD_ASSERT_THROW(uhd::math::fp_compare::fp_compare_epsilon<double>(4.0)
> +                              == std::abs(_adc_rate / cordic_freq));
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
