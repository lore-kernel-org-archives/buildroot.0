Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5849CCD4851
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 19:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63606168B;
	Fri, 22 Sep 2023 19:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63606168B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezFso-DbUF2b; Fri, 22 Sep 2023 19:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F06C86167B;
	Fri, 22 Sep 2023 19:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F06C86167B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97351BF33C
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0E2D423FC
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 19:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E2D423FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1w--IVngCgF for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 19:07:44 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BC42423FA
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 19:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC42423FA
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso33465366b.0
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 12:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695409662; x=1696014462;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uVKe/6Th/p0rcX/30YSBefomngKteAIwr+2nq9oMC10=;
 b=sOBpUoRhfpvlqI+pwrs2ITOsX7lXcIxYpmiB5/XyRyrSWUoY5dsCwZAZ0udJhY6Bdy
 ebijdor0Gwu97Qu6lwRrSN7jxbHvXTIhO1QXybO9pGqNJAHKyp/rd7xRGCzV7eSlkvU4
 O7LDQwlrX+hEB3p84tWkXas6U7eid7CPkwUnaFe/y/8uvF8mRvuB2NpT9945CgtDx3QV
 6C+GEUEGH5AWPMe7nKFws9HU++R0TEuix/Q6l3H+t99eRwq1GGfXI0xH3iMXTWaPxhed
 UNDS4Bu1a00Z3kpszIzl1JcD1xlrYbpuHqRzW5YtphHzDcrZmTJLpCwl+IZvssnU8EOo
 1Mrg==
X-Gm-Message-State: AOJu0YwhlGMK7D+DoZBwwFyjccops4iNtWb5u2cjxO/XDyAY48DCmw7g
 ocuci044AOWrTw2w7S5dGnoOTpCgzktRW+j0Bw4=
X-Google-Smtp-Source: AGHT+IGwbm70TY2e8GYucT5yUJ8l12yshR5tWFyMOyzaQkizvnjUAqusSIUfHcb/fSRbTrOjZG67aQ==
X-Received: by 2002:a17:907:3da8:b0:9ae:420e:73a0 with SMTP id
 he40-20020a1709073da800b009ae420e73a0mr287987ejc.69.1695409662241; 
 Fri, 22 Sep 2023 12:07:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 lt12-20020a170906fa8c00b009a219ecbaf1sm3094987ejb.85.2023.09.22.12.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 12:07:41 -0700 (PDT)
Message-ID: <264582c4-b415-7684-b7bf-502af5a57e92@mind.be>
Date: Fri, 22 Sep 2023 21:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230906194420.279926-2-dalang@gmx.at>
In-Reply-To: <20230906194420.279926-2-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695409662; x=1696014462; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uVKe/6Th/p0rcX/30YSBefomngKteAIwr+2nq9oMC10=;
 b=MzBvoreSv77/G3ty7jvlCajOsxBf45xXnR8qnXq7Uz24HCzuXCE0Z1b3i50YAScNkC
 8if+B4jiXZn3MdqvqV+Oz/Yvm+JLz6IAodkcn4xkpPS/K1vkhUGCfh0bdPxWL0H3KI0w
 jSuyJOKu726lxBBM6ukcN14DN66ohh5XqvZvvfMbimQ3gsvkj4xIy1uWA0QwaDywkCsl
 yWOn5hXWljR0N08nMNiNeMJ6Y6p4W74PU1hapfuPsB+cVlbMBX00iD2cRvdtCAasC+Ut
 st2JBzGNjwA9IXMUT8cTrAoqdJZskeA3E7JzlhKXjCWqAbyMZuwVO5KEUzDtkeK9Mk6Z
 N7tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MzBvoreS
Subject: Re: [Buildroot] [PATCH 1/2] package/libcoap: fix CVE-2023-30362
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/09/2023 21:44, Daniel Lang wrote:
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>   ...0001-Backport-fix-for-CVE-2023-30362.patch | 59 +++++++++++++++++++
>   package/libcoap/libcoap.mk                    |  2 +
>   2 files changed, 61 insertions(+)
>   create mode 100644 package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
> 
> diff --git a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
> new file mode 100644
> index 0000000000..c4e53d19a7
> --- /dev/null
> +++ b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
> @@ -0,0 +1,59 @@
> +From c63ecbdc6b38cc7e571a72964fe9ca63834dcc89 Mon Sep 17 00:00:00 2001
> +From: Daniel Lang <ldaniell14260@gmail.com>

  I've set this to the actual author, Jon Shallow. BSD-2c doesn't require much, 
but it _does_ require to mention the author.

  With that, applied to master, thanks.

  Regards,
  Arnout

> +Date: Wed, 6 Sep 2023 21:38:13 +0200
> +Subject: [PATCH] Backport fix for CVE-2023-30362
> +
> +Upstream: https://github.com/obgm/libcoap/issues/1063#issuecomment-1626962307
> +Signed-off-by: Daniel Lang <dalang@gmx.at>
> +---
> + src/net.c | 34 +++++++++++++++++++++-------------
> + 1 file changed, 21 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/net.c b/src/net.c
> +index 98859443..e259ab00 100644
> +--- a/src/net.c
> ++++ b/src/net.c
> +@@ -1305,19 +1305,27 @@ coap_send_internal(coap_session_t *session, coap_pdu_t *pdu) {
> +
> +       /* Need to check that we are not seeing this proxy in the return loop */
> +       if (pdu->data && opt == NULL) {
> +-        if (pdu->used_size + 1 <= pdu->max_size) {
> +-          char *a_match;
> +-          size_t data_len = pdu->used_size - (pdu->data - pdu->token);
> +-          pdu->data[data_len] = '\000';
> +-          a_match = strstr((char*)pdu->data, cp);
> +-          if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
> +-              ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
> +-               a_match[len] == ' ')) {
> +-            coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
> +-                     (char*)pdu->data);
> +-            coap_delete_pdu(pdu);
> +-            return (coap_mid_t)COAP_DROPPED_RESPONSE;
> +-          }
> ++        char *a_match;
> ++        size_t data_len;
> ++
> ++        if (pdu->used_size + 1 > pdu->max_size) {
> ++          /* No space */
> ++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
> ++        }
> ++        if (!coap_pdu_resize(pdu, pdu->used_size + 1)) {
> ++          /* Internal error */
> ++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
> ++        }
> ++        data_len = pdu->used_size - (pdu->data - pdu->token);
> ++        pdu->data[data_len] = '\000';
> ++        a_match = strstr((char*)pdu->data, cp);
> ++        if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
> ++            ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
> ++             a_match[len] == ' ')) {
> ++          coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
> ++                   (char*)pdu->data);
> ++          coap_delete_pdu(pdu);
> ++          return (coap_mid_t)COAP_DROPPED_RESPONSE;
> +         }
> +       }
> +       if (pdu->used_size + len + 1 <= pdu->max_size) {
> +--
> +2.42.0
> +
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index 4b536d8117..3773ad293c 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -14,6 +14,8 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
>   LIBCOAP_CONF_OPTS = \
>   	--disable-examples --disable-examples-source --without-tinydtls
>   LIBCOAP_AUTORECONF = YES
> +# 0001-Backport-fix-for-CVE-2023-30362.patch
> +LIBCOAP_IGNORE_CVES += CVE-2023-30362
>   
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)
>   LIBCOAP_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
