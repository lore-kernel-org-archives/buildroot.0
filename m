Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A075CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2752961313;
	Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uI_PoezOTNz1; Fri, 12 Jun 2026 11:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F4361379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264300;
	bh=uYttgy77qQ07IXqI4WJ5LvqwBDrzGIIJzr6J4GAP1ao=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SRMS6R4IKQfJL+EjU55UePRH/Dslx5Ymv5hcYJ4tn6UxbYlLy2WS/MRRHif65bNGz
	 GXfDdThHgEIPiVTb8hqshnw/SunpjbXO6z3TWMv9nTEZERy5owNLKoGPyH983IVSeL
	 JwhsmUVvlyhkEL3dWvFmMEv3xzjfFjGxJ+SZqCIAOgQmyh5+9zB98kBG8OCDJr3aGA
	 75hGSR5Z5KECaf3F2IGEIRmGy+O0zckIMDonvvJzlI19LRVeZSmQLetb5TZTEKxlLU
	 t1Jpu7UJMxDR4pq01/Zj9cXPjE9pi56wZ4tE+xCBE6Scc5RdU84zxrDq9AF51nKiML
	 84PTxQRxuaMwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F4361379;
	Fri, 12 Jun 2026 11:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFEC12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA27D8333F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXhutsiNJPbd for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B83358330B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B83358330B
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B83358330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5916885e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264288; x=1781869088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QJe02dlO76Lg3/DMSuYw8wyxraYx2Xtwaf2zaigUojc=;
 b=NVpTJnp2RPkF9iZYQOpRxbjkWqqxCPuyLIPl3iREh/3ZshESHnHyRC+w28D/UQ5h51
 8nDAu9eVvzWoBDSWnKCvVwS9owy5wimfllErrP3cfaRB7t19A4g0+PGZcC4cbT5dRza7
 Aofpp+x2hTy0FKnoXzYgxnDTcAhmnvuC4SIuI7M9kPH8f0NybpY7UjX+Sr1C5olOHkHx
 P5u4DanK+vCsSIA90Xh8GGFie+EmaPO+w+ESYkJozyND4cesLAUfMNCFi56G2FcFl3D/
 bgktLxjdcAHJsn0p+YW2/aLL3I6APYEMhUgd5M3Rrwz9VMunuySsk6jUvhGLwR3oPXb6
 LCaQ==
X-Gm-Message-State: AOJu0YwExRQn3R1L0LOtSoFPax5PwUDUKnXJWe+lSt0wctAnPQCjt+ke
 QKMrJ2vAb78cJiyn29pLozYIiGDzcZ0XOLTdO7s56tS15BN3RIP2EnyWK83uhHU++1uYc13UV0y
 RpPZ/
X-Gm-Gg: Acq92OHeBwa2V3VNB/YZXEJ0WsicRhsgT1hfGjR83ZgiQnLo/J1FBtrJOthAUlzB5Mc
 JC5l7RuLwFDctzeiHf8+lJK+h8b9p618Hn7W+DlrGv+Z328O2wGGeQbJGX6BQ6wcjC6zYR3G5ZX
 dHepXrWU2fGyYyHhErt/OM38mXHOgczCri8iPhtTfdWrFi9OfaSoMFiCDuqFByKmweMJV6aSfnL
 N3iYWKZ9yxHZ93IUoLjTCqZpGIy8sNKiuQ7qJJJ7XUNHAzKh9ILVmMQOVeIk/2mc84QGIg/OVQC
 QMSwMkJMOqfKopUuFzOPEtwsDpQpadfSclbx4AA7zd6RSiojV8rmNl7mnoBQa4wy3iM0kfmE/cV
 tiHoMytAJio8U9alsFrcfIcO3oJRgYgvpREvl+j5R3w9HEspA0a+nkHSqhBX3qtKSPrw5ohqEg4
 ryCaVoHk3ExIHGUNI=
X-Received: by 2002:a05:600c:4e55:b0:492:10e8:3f92 with SMTP id
 5b1f17b1804b1-49210e83fabmr1662575e9.17.1781264287663; 
 Fri, 12 Jun 2026 04:38:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f23fsm5094138f8f.9.2026.06.12.04.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:07 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:06 +0200
Message-ID: <20260612113806.252948-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602202245.51928-1-thomas.perale@mind.be>
References: <20260602202245.51928-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264288; x=1781869088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJe02dlO76Lg3/DMSuYw8wyxraYx2Xtwaf2zaigUojc=;
 b=TgKmIC09iMPcCnKSqHOsTJdScc5d7rpiAHwxIfVDRMPiwBFgewxHhKF5HXCbO54hcT
 gOyKqF9ubui9Sldp59RY468HGpSTZRxJTjVqrSWf/jBI/cCjhRwxmzrewlE6d11YCpMi
 jI9/Pp3FfSrANDqAYZW1211wUAz70WmnaBgY/iserz5eTdW4DNmOF9OWdfzFzN1VKWN5
 oPo5F9GZ92h0isMwPbHqkShqZ1On+mh3obJgZBV0CVK4gjC9j/VD1QAyRNB3OPAk50ly
 dAU96wn3/Js/NC410ZTWUuI8FCAvx+L6uN1trI04mJGVgxQiA9Zck2pEPFMRsTbUI0rY
 T34w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TgKmIC09
Subject: Re: [Buildroot] [PATCH] package/libssh2: patch CVE-2026-7598
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This commit fixes the following vulnerability:
> 
> - CVE-2026-7598:
>     A security vulnerability has been detected in libssh2 up to 1.11.1.
>     The impacted element is the function userauth_password of the file
>     src/userauth.c. Such manipulation of the argument
>     username_len/password_len leads to integer overflow. The attack may be
>     launched remotely. The name of the patch is
>     256d04b60d80bf1190e96b0ad1e91b2174d744b1. A patch should be applied to
>     remediate this issue.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-7598
>   - https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../0001-username-len-bound-checking.patch    | 57 +++++++++++++++++++
>  package/libssh2/libssh2.mk                    |  3 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 package/libssh2/0001-username-len-bound-checking.patch
> 
> diff --git a/package/libssh2/0001-username-len-bound-checking.patch b/package/libssh2/0001-username-len-bound-checking.patch
> new file mode 100644
> index 0000000000..f398260309
> --- /dev/null
> +++ b/package/libssh2/0001-username-len-bound-checking.patch
> @@ -0,0 +1,57 @@
> +From 256d04b60d80bf1190e96b0ad1e91b2174d744b1 Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Mon, 13 Apr 2026 11:18:25 -0700
> +Subject: [PATCH] userauth.c: username_len bounds checking (#1858)
> +
> +Return errors when username_len will exceed bounds, fix existing bounds
> +check.
> +
> +Credit:
> +[dapickle](https://github.com/dapickle)
> +
> +CVE: CVE-2026-7598
> +Upstream: https://github.com/libssh2/libssh2/commit/256d04b60d80bf1190e96b0ad1e91b2174d744b1
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/userauth.c | 13 ++++++++++++-
> + 1 file changed, 12 insertions(+), 1 deletion(-)
> + 
> +diff --git a/src/userauth.c b/src/userauth.c
> +index f8e02651..43d9ab9b 100644
> +--- a/src/userauth.c
> ++++ b/src/userauth.c
> +@@ -80,6 +80,12 @@ static char *userauth_list(LIBSSH2_SESSION *session, const char *username,
> +         memset(&session->userauth_list_packet_requirev_state, 0,
> +                sizeof(session->userauth_list_packet_requirev_state));
> + 
> ++        if(username_len > UINT32_MAX - 27) {
> ++            _libssh2_error(session, LIBSSH2_ERROR_PROTO,
> ++                           "username_len out of bounds");
> ++            return NULL;
> ++        }
> ++
> +         session->userauth_list_data_len = username_len + 27;
> + 
> +         s = session->userauth_list_data =
> +@@ -307,6 +313,11 @@ userauth_password(LIBSSH2_SESSION *session,
> +          * 40 = packet_type(1) + username_len(4) + service_len(4) +
> +          * service(14)"ssh-connection" + method_len(4) + method(8)"password" +
> +          * chgpwdbool(1) + password_len(4) */
> ++        if(username_len > UINT32_MAX - 40) {
> ++            return _libssh2_error(session, LIBSSH2_ERROR_PROTO,
> ++                                  "username_len out of bounds");
> ++        }
> ++
> +         session->userauth_pswd_data_len = username_len + 40;
> + 
> +         session->userauth_pswd_data0 =
> +@@ -447,7 +458,7 @@ password_response:
> +                         }
> + 
> +                         /* basic data_len + newpw_len(4) */
> +-                        if(username_len + password_len + 44 <= UINT_MAX) {
> ++                        if(username_len <= UINT32_MAX - password_len - 44) {
> +                             session->userauth_pswd_data_len =
> +                                 username_len + password_len + 44;
> +                             s = session->userauth_pswd_data =
> + 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 1702d94c79..1843d25051 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -13,6 +13,9 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
>  LIBSSH2_INSTALL_STAGING = YES
>  LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
>  
> +# 0001-username-len-bound-checking.patch
> +LIBSSH2_IGNORE_CVES += CVE-2026-7598
> +
>  ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
>  LIBSSH2_DEPENDENCIES += mbedtls
>  LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
