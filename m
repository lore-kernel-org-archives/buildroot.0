Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36594C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8298129F;
	Mon, 15 Jul 2024 14:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp135I0Y8m4z; Mon, 15 Jul 2024 14:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3500F81289
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3500F81289;
	Mon, 15 Jul 2024 14:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7EA21BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADBEF812BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pS4hKqpJTuGM for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E015F8128E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E015F8128E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E015F8128E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:02:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3679f806223so3197474f8f.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721052138; x=1721656938;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rAT4C5uRxFCFxGZ7yK5TBprelZFFu0xSfMXfiBLA5h4=;
 b=cNpStvTpMTw9UoYWN06ad3Ae/NEM+rkVWfaO1PqnpzUrnknenznAOPawGcF3x8DBRZ
 kT3CCCHIuNJ7+M3Qi+JS5cQ4M1KWsGDtltp57tzZYWfEn4KBrVS4E9PSMqq0/cMcjvKo
 i1RdlcbSr9jTi8yLozW9+P/8rAXidhv44zIn4LA92bmwalWhmtpsl8UdW634Wt7AhV6N
 Ltvp4ZGFopHlC4A7p3RuNEVyeblRYeGlXYY9a5OUiOpduUkMmeNU8gucRxAmDN7tXOOS
 Cy+ZwyBsQZJs9gr0HyubdalrHGBUgc9GBtiKgwqSpzz9xKHnWUafb5VbOSAMmy02dJ9r
 Qb4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7tJvdLfBjRcNqUlJWoQHvuQ3AM50AG9RVNu6VTB8Av3UmjVob2IYd2qFQjLuayoZfV9GCDWUYFzm0r4LYJT18yhulJ3Ck3A==
X-Gm-Message-State: AOJu0Yz+TwQhrG2eW+TiP11aD2jtSiHpiyhniyQh+ebDCKlWoCb7se6f
 IOwOegqrDvRrd2HY8yTKIWrEVm/rTcpLeyqDopLrWjxwOSIUFagVF1ZyixUipvA=
X-Google-Smtp-Source: AGHT+IEplaYeX+GcuzAKaYrIwliU2bnkjGWIwxbXNYyjyx1W+YFchOFue8rwOx3IrpzZQz42sXRjKg==
X-Received: by 2002:a5d:518d:0:b0:367:8e06:d5cf with SMTP id
 ffacd0b85a97d-367ff6ee125mr8003472f8f.13.1721052137523; 
 Mon, 15 Jul 2024 07:02:17 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm89727045e9.3.2024.07.15.07.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:02:17 -0700 (PDT)
Message-ID: <474105c1-f786-4f45-b783-fb9b74781714@mind.be>
Date: Mon, 15 Jul 2024 11:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, buildroot@buildroot.org
References: <20240712190016.1105688-1-aleksandr.o.makarov@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240712190016.1105688-1-aleksandr.o.makarov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721052138; x=1721656938; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rAT4C5uRxFCFxGZ7yK5TBprelZFFu0xSfMXfiBLA5h4=;
 b=iYMaP+snH+zEVIj6xncC70EoJDeyudH9SYHOAKgOkvNAu+3suoCrypnD+eo6GyFrxB
 Hl9EanOzj1cgQ7urwcdNCmaM3dgnlMeo2ud4gV0YRZiJKqI9OkEkmh4MDqWL8EpfpLKg
 MJVRNt0moqZUsr7u1N9qgsacD7MuSwOtCipIZB7ddzNU+8Zovr95eXB/nsIU1iuyXZVS
 VNqIpNyOfsht2GKHeJbsBq2pNqm0gGjZ+tVj+R06IkK7ZCm1V5ep4WFx0EQLaWTQbgwc
 I1XH5lZB6qvqT6o8jTmkvUQlFlmjVUH8DWiwXMkpSRuOkk+cvtHpP5nR4aVjU4XmUg0S
 bL2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iYMaP+sn
Subject: Re: [Buildroot] [PATCH 1/1] package/libest: Add support for openssl
 v3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Aleksandr,

  Thank you for your patch. I applied it to master, with a few changes.

On 12/07/2024 21:00, Aleksandr Makarov wrote:
> This patch introduces support for openssl v3 to libest project. The upstream repository has not yet integrated this change.

  There's no need to repeat what is already in the subject line. So instead, I 
reworded like this:

     libest uses functions that are no longer available in OpenSSL 3.0. Add a
     wrapper that calls the proper replacements depending on the version.

> 
> Relevant upstream pull request: https://github.com/cisco/libest/pull/132

  This information should be in the patches themselves, as the Upstream: tag. 
See below.

> 
> Fixes:
> 
> 	http://autobuild.buildroot.net/results/89024d6c1f10959282470b120d332fb32922b3b6
> 
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> ---
>   ...ix-error-implicit-declaration-of-fun.patch |  63 +++++
>   ...libest-Add-OpenSSL-3.0-compatibility.patch | 224 ++++++++++++++++++
>   2 files changed, 287 insertions(+)
>   create mode 100644 package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
>   create mode 100644 package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
> 
> diff --git a/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch b/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
> new file mode 100644
> index 0000000000..5025c942f6
> --- /dev/null
> +++ b/package/libest/0001-package-libest-fix-error-implicit-declaration-of-fun.patch
> @@ -0,0 +1,63 @@
> +From 28c65fd9dff2f30438b98f0b71f387468259a2c3 Mon Sep 17 00:00:00 2001
> +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +Date: Fri, 12 Jul 2024 21:07:10 +0300
> +Subject: [PATCH 1/2] =?UTF-8?q?package/libest:=20fix=20error:=20implicit?=

  The 1/2 part should not be there. This is reported by the check-package tool. 
Please always use that tool before submitting.

> + =?UTF-8?q?=20declaration=20of=20function=20=E2=80=98ERR=5Ferror=5Fstring?=
> + =?UTF-8?q?=E2=80=99?=
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Added necessary header includes to fix 'implicit declaration' errors which occur when
> +using -Wimplicit-function-declaration flag.
> + > +Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>

  There should be an Upstream: tag here:

Upstream: https://github.com/cisco/libest/pull/132


  Regards,
  Arnout

> +---
> + src/est/est.c             | 4 +++-
> + src/est/est_client.c      | 1 +
> + src/est/est_server_http.c | 2 ++
> + 3 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/est/est.c b/src/est/est.c
> +index 8a65f87..24474c0 100644
> +--- a/src/est/est.c
> ++++ b/src/est/est.c
> +@@ -42,7 +42,9 @@
> + #include <DbgHelp.h>
> + #endif  /* DISABLE_BACKTRACE*/
> + #endif /* WIN32*/
> +-
> ++#include <openssl/err.h>
> ++#include <openssl/ssl.h>
> ++#include <openssl/rand.h>
> + #ifndef ENABLE_CLIENT_ONLY
> + static char hex_chpw[] = {0x06, 0x09, 0x2A, 0x86, 0x48, 0x86,
> + 			  0xF7, 0x0D, 0x01, 0x09, 0x07};
> +diff --git a/src/est/est_client.c b/src/est/est_client.c
> +index 8dff9d9..5c25d4f 100644
> +--- a/src/est/est_client.c
> ++++ b/src/est/est_client.c
> +@@ -40,6 +40,7 @@
> + #include <openssl/ssl.h>
> + #include <openssl/cms.h>
> + #include <openssl/rand.h>
> ++#include <openssl/crypto.h>
> + #include "est.h"
> + #include "est_locl.h"
> + #include "est_ossl_util.h"
> +diff --git a/src/est/est_server_http.c b/src/est/est_server_http.c
> +index 2bd08d5..ce1cece 100644
> +--- a/src/est/est_server_http.c
> ++++ b/src/est/est_server_http.c
> +@@ -42,6 +42,8 @@
> + #include <openssl/err.h>
> + #include <openssl/ssl.h>
> + #include <openssl/x509v3.h>
> ++#include <openssl/crypto.h>
> ++#include <openssl/rand.h>
> + #if defined(_WIN32)
> + #define _CRT_SECURE_NO_WARNINGS // Disable deprecation warning in VS2005
> + #else
> +--
> +2.40.1
> +
> diff --git a/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch b/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
> new file mode 100644
> index 0000000000..4085487468
> --- /dev/null
> +++ b/package/libest/0002-package-libest-Add-OpenSSL-3.0-compatibility.patch
> @@ -0,0 +1,224 @@
> +From ad5ce7ff1cae92c151dc6f350ef943106ddd852f Mon Sep 17 00:00:00 2001
> +From: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +Date: Fri, 12 Jul 2024 21:07:36 +0300
> +Subject: [PATCH 2/2] package/libest: Add OpenSSL 3.0 compatibility
> +
> +The functions `FIPS_mode` and `FIPS_mode_set` are deprecated in OpenSSL 3.0, replaced by
> +`EVP_default_properties_is_fips_enabled` and `EVP_default_properties_enable_fips` respectively.
> +
> +This commit introduces wrappers for these new EVP APIs to maintain compatibility with OpenSSL 3.0,
> +while ensuring continued support for older versions of OpenSSL.
> +
> +- Implemented `is_fips_enabled` wrapper around `EVP_default_properties_is_fips_enabled`
> +- Implemented `enable_fips` wrapper around `EVP_default_properties_enable_fips`
> +- Added conditional compilation to support both new and legacy OpenSSL versions
> +
> +Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> +---
> + example/client-brski/estclient-brski.c |  2 +-
> + example/client/estclient.c             |  2 +-
> + example/proxy/estproxy.c               |  2 +-
> + example/server/estserver.c             |  2 +-
> + java/jni/client.c                      |  2 +-
> + src/est/est_client.c                   | 12 ++++++------
> + src/est/est_ossl_util.c                | 18 ++++++++++++++++++
> + src/est/est_ossl_util.h                |  2 ++
> + src/est/est_server.c                   |  2 +-
> + test/UT/US1864/us1864.c                |  4 ++--
> + 10 files changed, 34 insertions(+), 14 deletions(-)
> +
> +diff --git a/example/client-brski/estclient-brski.c b/example/client-brski/estclient-brski.c
> +index 9e63af5..6e03052 100644
> +--- a/example/client-brski/estclient-brski.c
> ++++ b/example/client-brski/estclient-brski.c
> +@@ -388,7 +388,7 @@ int main (int argc, char **argv)
> +                 break;
> +             case 'f':
> +                 /* Turn FIPS on if requested and exit if failure */
> +-                set_fips_return = FIPS_mode_set(1);
> ++                set_fips_return = est_enable_fips(1);
> +                 if (!set_fips_return) {
> +                     printf("\nERROR setting FIPS MODE ON ...\n");
> +                     ERR_load_crypto_strings();
> +diff --git a/example/client/estclient.c b/example/client/estclient.c
> +index a8a2d6f..75b1272 100644
> +--- a/example/client/estclient.c
> ++++ b/example/client/estclient.c
> +@@ -1280,7 +1280,7 @@ int main (int argc, char **argv)
> +                 break;
> +             case 'f':
> +                 /* Turn FIPS on if requested and exit if failure */
> +-                set_fips_return = FIPS_mode_set(1);
> ++                set_fips_return = est_enable_fips(1);
> +                 if (!set_fips_return) {
> +                     printf("\nERROR setting FIPS MODE ON ...\n");
> +                     ERR_load_crypto_strings();
> +diff --git a/example/proxy/estproxy.c b/example/proxy/estproxy.c
> +index 114bd65..6dbdbda 100644
> +--- a/example/proxy/estproxy.c
> ++++ b/example/proxy/estproxy.c
> +@@ -593,7 +593,7 @@ int main (int argc, char **argv)
> +             /*
> +              * Turn FIPS on if user requested it and exit if failure
> +              */
> +-            set_fips_return = FIPS_mode_set(1);
> ++            set_fips_return = est_enable_fips(1);
> +             if (set_fips_return != 1) {
> +                 set_fips_error = ERR_get_error();
> +                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
> +diff --git a/example/server/estserver.c b/example/server/estserver.c
> +index 3539dc4..90886cf 100644
> +--- a/example/server/estserver.c
> ++++ b/example/server/estserver.c
> +@@ -2285,7 +2285,7 @@ int main (int argc, char **argv)
> +             /* turn FIPS on if user requested it
> +              * and exit if failure.
> +              */
> +-            set_fips_return = FIPS_mode_set(1);
> ++            set_fips_return = est_enable_fips(1);
> +             if (set_fips_return != 1) {
> +                 set_fips_error = ERR_get_error();
> +                 printf("\nERROR WHILE SETTING FIPS MODE ON exiting ....\n");
> +diff --git a/java/jni/client.c b/java/jni/client.c
> +index c5bc28e..f58d5c0 100644
> +--- a/java/jni/client.c
> ++++ b/java/jni/client.c
> +@@ -179,7 +179,7 @@ static int jni_est_client_X509_REQ_sign (X509_REQ *x, EVP_PKEY *pkey, const EVP_
> +  */
> + JNIEXPORT jint JNICALL Java_com_cisco_c3m_est_ESTClient_enable_1fips(
> + 		JNIEnv *env, jclass obj) {
> +-	if (!FIPS_mode() && !FIPS_mode_set(1)) {
> ++	if (!est_is_fips_enabled() && !est_enable_fips(1)) {
> + 		ERR_print_errors_fp(stderr);
> + 		return -1;
> + 	} else {
> +diff --git a/src/est/est_client.c b/src/est/est_client.c
> +index 5c25d4f..63069af 100644
> +--- a/src/est/est_client.c
> ++++ b/src/est/est_client.c
> +@@ -3183,7 +3183,7 @@ EST_ERROR est_client_enroll_internal (EST_CTX *ctx, char *cn, int *pkcs7_len, in
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> +             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> +             rv = EST_ERR_BAD_MODE;
> +             goto err;
> +@@ -3594,7 +3594,7 @@ EST_ERROR est_client_reenroll (EST_CTX *ctx, X509 *cert, int *pkcs7_len, EVP_PKE
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> + 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> + 	    rv = EST_ERR_BAD_MODE;
> +             goto err;
> +@@ -3680,7 +3680,7 @@ static EST_ERROR est_client_enroll_csr_internal (EST_CTX *ctx, X509_REQ *csr, in
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> +             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> +             rv = EST_ERR_BAD_MODE;
> +             goto err;
> +@@ -5872,7 +5872,7 @@ static EST_ERROR est_client_brski_send_get_voucher (EST_CTX *ctx, int *cacert_le
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> +             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> +             rv = EST_ERR_BAD_MODE;
> +             goto err;
> +@@ -6366,7 +6366,7 @@ EST_ERROR est_client_brski_send_voucher_status (EST_CTX *ctx, EST_BRSKI_STATUS_V
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> +             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> +             rv = EST_ERR_BAD_MODE;
> +             goto err;
> +@@ -6535,7 +6535,7 @@ EST_ERROR est_client_brski_send_enroll_status (EST_CTX *ctx, EST_BRSKI_STATUS_VA
> +          * HTTPS digest mode requires the use of MD5.  Make sure we're not
> +          * in FIPS mode and can use MD5
> +          */
> +-        if (ctx->auth_mode == AUTH_DIGEST && (FIPS_mode())){
> ++        if (ctx->auth_mode == AUTH_DIGEST && (est_is_fips_enabled())){
> +             EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> +             rv = EST_ERR_BAD_MODE;
> +             goto err;
> +diff --git a/src/est/est_ossl_util.c b/src/est/est_ossl_util.c
> +index daa54f2..0887daa 100644
> +--- a/src/est/est_ossl_util.c
> ++++ b/src/est/est_ossl_util.c
> +@@ -500,3 +500,21 @@ char *est_find_ser_num_in_subj(X509 *cert)
> +     return(ser_num_str);
> + }
> + #endif
> ++
> ++int est_is_fips_enabled()
> ++{
> ++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
> ++    return EVP_default_properties_is_fips_enabled(NULL);
> ++#else
> ++    return FIPS_mode();
> ++#endif
> ++}
> ++
> ++int est_enable_fips(int enable)
> ++{
> ++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
> ++	return EVP_default_properties_enable_fips(NULL, enable);
> ++#else
> ++	return FIPS_mode_set(enable);
> ++#endif
> ++}
> +diff --git a/src/est/est_ossl_util.h b/src/est/est_ossl_util.h
> +index 68ad290..2389e45 100644
> +--- a/src/est/est_ossl_util.h
> ++++ b/src/est/est_ossl_util.h
> +@@ -44,4 +44,6 @@ LIBEST_TEST_API void ossl_dump_ssl_errors(void);
> + EST_ERROR ossl_init_cert_store(X509_STORE *store,
> +                                unsigned char *raw1, int size1);
> +
> ++int est_is_fips_enabled();
> ++int est_enable_fips(int);
> + #endif
> +diff --git a/src/est/est_server.c b/src/est/est_server.c
> +index d047b48..979ae53 100644
> +--- a/src/est/est_server.c
> ++++ b/src/est/est_server.c
> +@@ -3355,7 +3355,7 @@ EST_ERROR est_server_set_auth_mode (EST_CTX *ctx, EST_HTTP_AUTH_MODE amode)
> +         /*
> +          * Since HTTP digest auth uses MD5, make sure we're not in FIPS mode.
> +          */
> +-	if (FIPS_mode()) {
> ++	if (est_is_fips_enabled()) {
> + 	    EST_LOG_ERR("HTTP digest auth not allowed while in FIPS mode");
> + 	    return (EST_ERR_BAD_MODE);
> + 	}
> +diff --git a/test/UT/US1864/us1864.c b/test/UT/US1864/us1864.c
> +index 3e41cd7..1f57494 100644
> +--- a/test/UT/US1864/us1864.c
> ++++ b/test/UT/US1864/us1864.c
> +@@ -218,12 +218,12 @@ static void us1864_test1 (void)
> +     /*
> +      * Make sure we don't allow DIGEST mode when in FIPS mode
> +      */
> +-    if (!FIPS_mode_set(1)) {
> ++    if (!est_enable_fips(1)) {
> +         printf("FIPS mode not supported, skipping test to prevent digest auth when in FIPS mode");
> +     } else {
> +         est_rv = est_server_set_auth_mode(ctx, AUTH_DIGEST);
> +         CU_ASSERT(est_rv == EST_ERR_BAD_MODE);
> +-        FIPS_mode_set(0);
> ++        est_enable_fips(0);
> +     }
> +
> +     X509_free(x);
> +--
> +2.40.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
