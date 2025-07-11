Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35AC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C585683C00;
	Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWFBpbLWwLT6; Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E85D78236E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85D78236E;
	Fri, 11 Jul 2025 10:44:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA76F199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CD58217F
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msBJowtAUE7D for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D94138236E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94138236E
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94138236E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so1584339f8f.1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230683; x=1752835483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJmgPXYySTNnI2y5xbqMlkzVh21hP9W4bowb+ww9tk8=;
 b=qcrV3aN+4AxaS7MFWs6tUB2g9upIafOS5C8yjQq1BEw3iqT9blQzOd+hnDtm2NlIpo
 gXPX/mS02hJHO7Z/aQME9EbPKlAlG09UKV5vbg3Xj6gbOl0+Dcm71dQ7DUd2Wz0YRPt1
 MESR5pvMbN4qC7GD8VT/9/SRJiPuOndRMMuqCOFoeiTP80HJoEkHQHGvsyIJKXszJlOB
 iLU9YY92iaThDMyM050r73ZpmsSNhEaaqCtpyRWa2oE9ucGOblamznKia6uM3A+P8zfc
 dmfNWVGB+xpauTtzTz2Q0v8AsvWr0aX2Sw39fwKgizYS0p0FUt01e3XFWbSsPkhaeJeA
 Rwqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSbzR7GnAerA5YjkNzBHwu6dfPVOclDm0F7MLsn5M7g7yqPI2ev8PKXFuGMpH/F8hgR17t8d2zhhs=@buildroot.org
X-Gm-Message-State: AOJu0Yx2UYXO48DJHexP0CD55droouwBOtpX6tPLFF59Y2JzNzvEj8qg
 3OtLCvSecmRLapZxJvScTatoZJbnMlxXu8QaG4VYzq7mqcm85Vnmc/Fl8r2F7P8iZIX8TQ0i6b4
 PhUkW
X-Gm-Gg: ASbGncsTYyb7rAHCv848WQhM1E7UlVAMtexCBUbCBwa89gdYCoh64NYsnBBBQ7HCira
 URBi2iktiDSeknHi+Clf9JNvBUvQ9Z7Lkgg3mS7s6bDpyaUeTSmYZqN7/qu/leas3dBrpLiqRLH
 a8JYrmOxZq5XZbJSvwESiVc3huCPvegAKJGPKYUg6UfJK/XqDxbO31kJm/18SdTcNgM3mwCPV+g
 8UnRsOhVwxADK4q1nn9R32JcbSkVbiceHL2lqpXsQOojGatFsChxwh5AsaS2zzz+fU5xfElXskL
 u11g6LO/VPa0BgjWXoRbuILDpQw5SF9uh1izf0+f96cX7h0Sp/LxWE07N5qVWrsGegI8/lolyC2
 ItfmdrDX/DgTYUg==
X-Google-Smtp-Source: AGHT+IHHtBmR7dmcs+DrBJRJjL5e4aufQzrhIN4dZmjHhqJ+hFh0B3zuiNfjFxAJsuWw5UY8BBMDrA==
X-Received: by 2002:adf:9d8b:0:b0:3a3:7115:5e7a with SMTP id
 ffacd0b85a97d-3b5f189ad80mr2367737f8f.42.1752230682900; 
 Fri, 11 Jul 2025 03:44:42 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26f22sm4179022f8f.94.2025.07.11.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:42 -0700 (PDT)
To: James Knight <git@jdknight.me>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:41 +0200
Message-ID: <20250711104441.823663-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701190645.2205-1-git@jdknight.me>
References: <20250701190645.2205-1-git@jdknight.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230683; x=1752835483; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJmgPXYySTNnI2y5xbqMlkzVh21hP9W4bowb+ww9tk8=;
 b=F/3oVidj1v1A3AKKAjKyOZzY7itArt5L5Bu/VNkaKEumBsZektT2xhiLZcPcrut8wC
 C8141nV4qZ+mLep0Dg5JyyrKUYfvIs4xXqhWct3vA2Gi3t0D+Eyh4qdJBOHYgS5sLXr2
 zX+aiSQ2ZQVoVoB/RqD8Siq9rVc6NmHD4GZuGMB+aaJvHxRvPa8KyrP44qdUpVx3k32+
 OvMWmACXwSaJqgLrH0e/UHdhWpnjCSU7IhzrxKfBpcM0Nsy5018RB/y5j4P2VO8GxcXr
 HkFTGuyn9e51dgBvCheRB1PahfwbiT/CuuYg2cGJ07mLRiKtKG8N7LD3sk29sAg+P/nE
 vYdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F/3oVidj
Subject: Re: [Buildroot] [PATCH 1/1] utils/test-pkg: stop on sigint
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
> When SIGINT is issued for a package test run, it will abort the active
> toolchain run then proceed to the next. If a user is running the entire
> default toolchain set (`-a`), they can be required to invoke SIGINT
> multiple times to stop a run.
> 
> This commit uses a SIGINT hook to flag a shutdown state and stop further
> attempts to run anymore toolchain tests.
> 
> Signed-off-by: James Knight <git@jdknight.me>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  utils/test-pkg | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 19d8713d6a..cd77964252 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -3,6 +3,11 @@ set -e
>  
>  TOOLCHAINS_CSV='support/config-fragments/autobuild/toolchain-configs.csv'
>  TEMP_CONF=""
> +abort=0
> +
> +do_abort() {
> +    abort=1
> +}
>  
>  do_clean() {
>      if [ -n "${TEMP_CONF}" ]; then
> @@ -67,7 +72,8 @@ main() {
>          esac
>      done
>  
> -    trap do_clean INT TERM HUP EXIT
> +    trap do_abort INT
> +    trap do_clean TERM HUP EXIT
>  
>      if [ -z "${cfg}" ]; then
>          pkg_br_name="${pkg//-/_}"
> @@ -139,6 +145,10 @@ main() {
>          (3) : $((nb_legal++)); printf "FAILED\n";;
>          (4) : $((nb_show++)); printf "FAILED\n";;
>          esac
> +
> +        if [ "${abort}" -eq 1 ]; then
> +            return 1
> +        fi
>      done
>  
>      printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
> -- 
> 2.49.0.windows.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
