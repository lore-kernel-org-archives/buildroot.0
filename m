Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6425DEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FDA54216B;
	Fri, 13 Feb 2026 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eCM-IEJacvy; Fri, 13 Feb 2026 19:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9CB24215E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011547;
	bh=w6TeVmz/MMJf6tSWpYAIHUTHFnmjXajpm700HS+SLV0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J4j2K0Q3OyDG19u5Q8ahV9P7dZtfjBwfVBOwW+aatB2XiWbRtmHMb6elqRK5GP/a7
	 koZLTdkYeqxYEsSsa/rOWx+PdyyiRuGn1s3zpMzJHix0BtcQYFCarbBCmHZZMLTPow
	 56nalGELx2s+gGEY0le/ZZ4huAdf03Mi2wPv2oz4nhizHfq8eEnvXwTExfSq6/Wlbp
	 pY+l5g0E+8Vzihh90NCKOXeV5FKYEE+5wN/vpgyXiiI92zWQ/BGRFsxwzjW2dtZNS0
	 liZd2iChLkrzIh+D7DSieBqJRYOJczCo0AovrAJWbJmAB2jKfe4Oj01T31M0/vPL9n
	 sYlblZ3rbH8ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9CB24215E;
	Fri, 13 Feb 2026 19:39:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA6C269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA5CB613DF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6WTHYTdiToX for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 834D961608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834D961608
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 834D961608
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so972129f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011475; x=1771616275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WUzr+v703igxRSeHxsSqeZAGlryW/1grhPLtCnfM2Gg=;
 b=Lg2d/wi3qNtlYYDW/l5hlUfv+pRwIO1NXk+lx6fZjS1PCTzgDflYVnOB8D4aioIgZt
 gnVL1BZ2yJq1mBJSFT/cH5DnQp4tGTfPxtHAGUD6Lt9B+7XkABYpMHA4ugLnDuskBzHg
 23xE/Y4mRkPh78O2QQEMLEfXv0hGLKLHzbrgsGAqpPb2Kjtxqtkc6ehv3L0XLc4P07VG
 l3r0X+Llwi9JD5oD+bZCn4Qt1sKVgZCMCFuHEDLAHQXKFb3nPGrmgnj28cnzF/TO+ApQ
 cchWhFAPMB/qX00XVwlJqalSUC/gyeLUdXiWVURaTFydAgW2L2bvn6tjHa6coq0srcu6
 ZXhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxxGus7Bh0AtE7q9dfG1PPzxuffSj6/Ui8vKP8ds8AvdlUkyXi/pWRN3Z57dTw3YtFw9j9g2hENHQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw7OF2eOLpqCxGjzNecdoreMXvncMaWUsLFlw33SddgdMFvyw8Q
 kEEplHCQb1hFI+KORdd6e5h1Lsn33WVSII69PHisOEw+HRmth3P6YSRI8IeZJP87aJ0=
X-Gm-Gg: AZuq6aLA1lZ1AIzbidvH0VO/dAzE2XOcqORCpFkBHbSQLvl8dIXjUaQCcoeru5MHJtQ
 ytdT9xrwEpUQxixBADwfV4i8l5nMaHL8qBLC6fzGwOMB1UVTWuFXBhd/0XzfAVJVzbA2pFmHuA5
 zhUuEHmb1iql2y7dlaIX1TC35AWd2U9/gDwkwJl4g4HB3aitImrkmNt+JjDmHIwf3zdEJYsvtPL
 uSPpDua2+bYKmu6M/alkAr0VaBesnYNxh9cqfY5QHKT2ycNZdRp65RDY3N+8SHcsJLUjNNaLVs2
 NUv+a2SC+s24jf6kuPPtU/rztbXjqod+K5bM2QPFmomrnQZEWamYzIPLPm+74mRguKBDKcZjojm
 yoRQWeDoqrMQvJ6KHRSRwR6H6rkCWwr9SNtSH3em/zRygjS1cbrUhUFMQx8qjxSvhn9EFEtExbn
 HXFDMnR9NyCWE78h8=
X-Received: by 2002:a05:6000:26cb:b0:436:307c:b756 with SMTP id
 ffacd0b85a97d-43796afa0d3mr6340098f8f.47.1771011475542; 
 Fri, 13 Feb 2026 11:37:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm6963855f8f.14.2026.02.13.11.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:55 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:54 +0100
Message-ID: <20260213193754.41003-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124150540.270915-1-peter@korsgaard.com>
References: <20260124150540.270915-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011475; x=1771616275; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WUzr+v703igxRSeHxsSqeZAGlryW/1grhPLtCnfM2Gg=;
 b=DGhy/pn7UEgxUZ4jIoiCeBOnyakPg5jVhldlmfNVSHt4lcbMv7PlfPhoWTk/aeyjHt
 BHP5PAqH6P9Q2Da7iKkd4bx/XCeCw0KMASYsgRH1mzEHS0gNhKZzxOojrBACG6XUsq/3
 OhV1L9WWdvxkDOUD9HI5BeJhUE5FNjafzwCsIaAmXnlZ9k2IVR5JBpRkZfGPrRKJKZqz
 ZQOgzNsKfDW1tH94/Tp2+6HqsKwWFUdgENdf8b+9/PkxkTPv5SOAKoQsSoDhIXjPprSg
 Ia66eL6/lD1BMZHnezBMhX1F7edVcPUEeXdjjuiMK+A/1WQBhKDTzibfYQJ+bxatS8sJ
 9L3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DGhy/pn7
Subject: Re: [Buildroot] [PATCH] package/swig: add host-swig wrapper script
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
> Swig has a compiled in absolute path to its data files, which can be
> overridden using the SWIG_LIB environment variable:
> 
> https://github.com/swig/swig/blob/v4.1.1/Source/Modules/main.cxx#L931-L945
> 
> This unfortunately means that host-swig misbehaves when used in the SDK, as
> this points to the ${HOST_DIR}/bin of the build, which may not be available
> when the SDK is used.
> 
> The issue was reported upstream but rejected in
> https://github.com/swig/swig/issues/253, so instead add a wrapper script
> which calculates a sensible SWIG_LIB relative to the wrapper location unless
> SWIG_LIB is set, similar to how we do it for E.G. gcc or pkgconf.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/swig/swig-wrapper.in |  8 ++++++++
>  package/swig/swig.mk         | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/swig/swig-wrapper.in
> 
> diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
> new file mode 100644
> index 0000000000..68be44231f
> --- /dev/null
> +++ b/package/swig/swig-wrapper.in
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +# wrapper to make swig relocatable
> +
> +if [ -z "${SWIG_LIB}" ]; then
> +    export SWIG_LIB=${0%/*}/../share/swig/@SWIG_VERSION@
> +fi
> +
> +exec "${0}.br_real" "$@"
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index ad585c3f97..71e5e05f96 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -15,6 +15,21 @@ HOST_SWIG_CONF_OPTS = \
>  SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
>  SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
>  
> +# Swig has a compiled in absolute path to its data files, so it does
> +# not work when copied somewhere else for the SDK. Issue was reported
> +# upstream but rejected in https://github.com/swig/swig/issues/253 so
> +# instead add a wrapper to work around this
> +
> +define HOST_SWIG_INSTALL_WRAPPER
> +	mv -f $(HOST_DIR)/bin/swig $(HOST_DIR)/bin/swig.br_real
> +	$(INSTALL) -m 0755 -D package/swig/swig-wrapper.in \
> +		$(HOST_DIR)/bin/swig
> +	$(SED) 's,@SWIG_VERSION@,$(SWIG_VERSION),g' \
> +		$(HOST_DIR)/bin/swig
> +endef
> +
> +HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
> +
>  # CMake looks first at swig3.0, then swig2.0 and then swig. However,
>  # when doing the search, it will look into the PATH for swig2.0 first,
>  # and then for swig.
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
