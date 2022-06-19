Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036E1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97740410A1;
	Sun, 19 Jun 2022 15:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97740410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAswV6fdIhQ3; Sun, 19 Jun 2022 15:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491C840933;
	Sun, 19 Jun 2022 15:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491C840933
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 721991BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59D43408E6
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59D43408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BporvodO3Bm for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98BC5404C9
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98BC5404C9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id es26so10314608edb.4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=N/T7ij1q+Yvho3pqjHIUiX7eovmG4vPkGFPLXkubmg0=;
 b=z1UxUC04NKVvOlk7Q/IHfQsRBxEBSkO8524H6dHG2+3gROMrbWt3PIpMrqSD4K9Fz1
 G89uYeGjXfsaNWR1vfAG+JlOfwLb4+qFsbqkSfcZSVvgrSWUPkveVkZj/MquTYTX0e7b
 qGo9m/iw4fakh99Zt1f5/MDfery9LZrSc6QcUEYBmp9UdnK/Iq6oJte5tsiB0ZVM/rOq
 iv4ZblO6uG7sGpwRlBgwMRNM19/I4BIX+oqBwNr0Jez8hCgiDjXbPvziDIiVgKnkOJYU
 IuQSvmEK4HLIa+dIg3Xcr4RkUwFRf0Zgah/VXk7uv46wKsNyT9UJ6bhLdz4eqpNP0MHH
 UvCw==
X-Gm-Message-State: AJIora/C9jbblc5Eg0aJRCgFQxoBlRK0dpJaJb9rjvZGEsw7ZXLnordt
 NHIE7RxZv/sXUV/A3xnMBl1kdA==
X-Google-Smtp-Source: AGRyM1vYvJkaS7RtwQHKvwhhg9VNu+09xJIl5KO0D/N/rkmxBX5BqmjwljbwKxXZkbE5VB2to8yEuA==
X-Received: by 2002:aa7:c750:0:b0:435:6113:efcd with SMTP id
 c16-20020aa7c750000000b004356113efcdmr15461755eds.327.1655654240887; 
 Sun, 19 Jun 2022 08:57:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ky4-20020a170907778400b006fe921fcb2dsm4724645ejc.49.2022.06.19.08.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:57:20 -0700 (PDT)
Message-ID: <30a5f007-d471-ca5f-0073-573c3962baf2@mind.be>
Date: Sun, 19 Jun 2022 17:57:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613203113.294535-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613203113.294535-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=N/T7ij1q+Yvho3pqjHIUiX7eovmG4vPkGFPLXkubmg0=;
 b=E8Mx9kZJxjqItVwuvFiPKbNGoDr4oRJY1oIjiQl8Bml6zz49PYItGYdH0UrzCm8aI2
 wuSln4xu7sPHv5+0Cvp1oJ/Sox9SdVpmQaStuCLMqGduAQvMybQ8gLQOTnIdlJD4Hk1z
 1mwlHuw7gHVocPH2e0SrLbSsHE6cy/Ljbz+D57Oa7oKqTBTJxpG7VsW5Om8JipEhbWtz
 P4KL29lH2r5CW5hdSlLrTA9HSkdIgSCHNGb3LnRfgmhIXHPz2IIwW86Ujbc/i4OgLMuh
 811NmYMsv7POxcRYoAiLsXbGqdNNcFEeL45PqR9PTtg6Iy9roA1rdycbxnJse41GPT9f
 r8pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E8Mx9kZJ
Subject: Re: [Buildroot] [PATCH 1/2] package/ecryptfs-utils: add
 pkcs11-helper optional dependency
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 22:31, Fabrice Fontaine wrote:
> pkcs11-helper is an optional dependency which needs openssl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/ecryptfs-utils/ecryptfs-utils.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
> index 737c5b0ebb..393ea4da78 100644
> --- a/package/ecryptfs-utils/ecryptfs-utils.mk
> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> @@ -26,6 +26,14 @@ endif
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
>   ECRYPTFS_UTILS_DEPENDENCIES += openssl
> +
> +ifeq ($(BR2_PACKAGE_PKCS11_HELPER),y)
> +ECRYPTFS_UTILS_CONF_OPTS += --enable-pkcs11-helper
> +ECRYPTFS_UTILS_DEPENDENCIES += pkcs11-helper
> +else
> +ECRYPTFS_UTILS_CONF_OPTS += --disable-pkcs11-helper
> +endif
> +
>   else
>   ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
