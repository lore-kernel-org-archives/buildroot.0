Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB42CD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4995842251;
	Fri, 29 May 2026 08:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK0A8tmxyQtr; Fri, 29 May 2026 08:29:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623E642263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043367;
	bh=5QtzFXiVIYvejETiME6PevbHWyWTUhOuQvbCN1H94tM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y1GYruE7j4lq8rqP8dTCZoCY9Rq3pkqMOCaDUZzTmXg7KE4wD/TbuNg2QtLMnUS1o
	 Eba5TtC5k3iOsroKxUBWGOQNOscGoxWrQP7eR9wbtlmsPp/uedC2lV6dZV1hvkBFvn
	 OBsH3OwN/gQMextTHoUlw4ERFdTd17QrwJyrDZ3NpUTf1D0iDo7WcHzO5meNsoCXXQ
	 yw0e8qL1YwzGySRsq5r+/CarAklJF2kujSEtUHE3TBro+78C1qWaXcW1rwaqv9+I6S
	 ycIcWTMf6RnqkDB+2AsKtX2QrN4nMqUzk+4XtkxhDuCatqvHPTNJYOu+MYO+qNdFkJ
	 fUnhlaH1ZAdnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623E642263;
	Fri, 29 May 2026 08:29:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0129428E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3C6E42237
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5rgXqjLrk2l for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85DEF4223A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DEF4223A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85DEF4223A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so79184115e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043360; x=1780648160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ahrND/0WeogQTzaiGAXFGqUAT5hFQMSWJMMAEKzniJU=;
 b=kG/sJ8e6gy2fgPnw/Ia5/YSWOnf8+g5wtwBiJIX1ygvrHEX9Ubw1g8XIQjRxE1a8JT
 MQO5ztdUQYbXMSwZRKwut01l3CsgikAWnsRCgSsUHvaLwwEuQjeIqvGwa/yAzgQdtbdT
 JAJnX9V0YOK1DrGSCMxLG10/KbiFLFV7RWKcJz6r/ql4bGZMnVNw65IfjT3HebOaAOc3
 L1AJjyDCLW+iPRbV+Crs0vPd4/6zGy19Cqqyxa6D7DYHCZtMwvRISbXlsBtB29kb8Ubx
 3ghJbctH41KM6hRpE2w16G4JlBIKmJOXsS8feUIQdNpQCpO+S4cFmSbZ83Dasqe7P+cp
 0rkg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/50l5hgA9Qw3doHg6cEjoeMsEQAmcqg1LgjGdfOdLkIT7crCeGOarRrNLFYF7TiChio+djSCKu+eg=@buildroot.org
X-Gm-Message-State: AOJu0YwlVekko3ol/A7Udd4xyXJgnjVAPRVn+pU7CPnLk2x+ecpOdIlc
 e2YE4lZNg9SDBCELsFzdoXVFop9RW3bLc0ErNDyBN2xrxg7Pv2cJwYDA2s7jhqF5TSQ=
X-Gm-Gg: Acq92OEs0GwOYMfeHXc9q/45fyJ3Xnn299WgGOUlWP7e8LDzl8Tn4b3jFEB2I+XiRXF
 T+eM3O7VdJvnn1FmdzpiEFZ9/p9TdsrEHi80VvDzWyPd3NfLFvTpuhXRHBkpwPBoYP3ONyjdKNH
 k4OtKCtQpUKfk853Acgz+pqds6slas8DQS+m8//eCIZtESb19vcH2RzEj6xUU67JQN73oMvirjn
 MR7/XIbvAGSl/y3tOpycirOfA13fibLxUqughwdTrx/1uCs5F8fdu9PLAhXpVTH6C/FfbVNVRBI
 OOULl1yWCoMNh9jLfM9ifKv/TNlHwUFfTMHiN9hpQqVZE2uAvsYcKddzloLxZncJU/i1uQUekd5
 pvER2aA/Tn7lSbQ3LzPHIcm0LdVj8nSCjBw8mE62fHxW0LfrQZkdldKYTPOtOawyj+sjI3lVuyi
 66a6SgPDaRvPm3vD/WchHdB6aMYeKLyeage6Rb4sDpK4KIK+omD7xq7XRwDQ==
X-Received: by 2002:a05:600c:e489:20b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-4909c0b8540mr24181165e9.14.1780043359537; 
 Fri, 29 May 2026 01:29:19 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d696f25sm31934955e9.5.2026.05.29.01.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:19 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:18 +0200
Message-ID: <20260529082918.57354-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507195049.1002469-2-peter@korsgaard.com>
References: <20260507195049.1002469-2-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043360; x=1780648160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ahrND/0WeogQTzaiGAXFGqUAT5hFQMSWJMMAEKzniJU=;
 b=Er+75u2VuKeKSEn4CSsoOSBiBmgBGDQyLa23/pgxkJ33PNhYUmPpGngKzYaIN9f+1R
 yA5kNFeFElwrY/mZwZRTrIVc2G84a7jzKJSfvFeGDy/NSULDrFHbR6g+zXbv5QvbsNse
 /y71jvFUhWZRB3c1Hto3O9qpLFtTIKQjmXrGygiyfN7HIi4391sAYql0k5KWfh/sVwQ9
 4pAwi3jUsBuCMu41+GoTrMCjimboe5Vc4q5/Ru00b83Qd/jmwtMByGgzqPuwlFt009cD
 TKKSNNUCxofvFw5WP2woy17lNHgvUxvcUtZQCR1nlgF7sMV34IjoPnJQm9aal8+0dqTf
 Fdag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Er+75u2V
Subject: Re: [Buildroot] [PATCH 2/2] package/go-bootstrap-stage5: security
 bump to version 1.25.10
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
> Fixes the following security issues:
> 
> CVE-2026-33811: net: crash when handling long CNAME response
> CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given bad
>                 SETTINGS_MAX_FRAME_SIZE
> CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
> CVE-2026-39819: md/go: "go bug" follows symlinks in predictable temporary
>                 filenames
> CVE-2026-39820: net/mail: quadratic string concatenation in consumeComment
> CVE-2026-39823: html/template: bypass of meta content URL escaping causes
>                 XSS
> CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with more
>                 than urlmaxqueryparams parameters
> CVE-2026-39826: html/template: escaper bypass leads to XSS
> CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL byte on
>                 Windows
> CVE-2026-42499: net/mail: quadratic string concatenation in consumePhrase
> CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum database
> 
> go1.25.10 (released 2026-05-07) includes security fixes to the go command,
> the pack tool, and the html/template, net, net/http, net/http/httputil,
> net/mail, and syscall packages, as well as bug fixes to the go command, the
> compiler, the linker, the runtime, and the crypto/fips140, go/types, and os
> packages.
> 
> https://go.dev/doc/devel/release#go1.25.10
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash | 2 +-
>  package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> index 5e40ba7e6e..58391471d9 100644
> --- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  go1.25.8.src.tar.gz
> +sha256  20cf04a92e5af99748e341bc8996fa28090c9ac98765fa115ec5ddf41d7af41d  go1.25.10.src.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> index 9006e5bf44..85468414a2 100644
> --- a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.mk
> @@ -6,7 +6,7 @@
>  
>  # Use last Go version that go-bootstrap-stage4 can build: v1.25.x
>  # See https://go.dev/doc/go1.26#bootstrap
> -GO_BOOTSTRAP_STAGE5_VERSION = 1.25.8
> +GO_BOOTSTRAP_STAGE5_VERSION = 1.25.10
>  GO_BOOTSTRAP_STAGE5_SITE = https://go.dev/dl
>  GO_BOOTSTRAP_STAGE5_SOURCE = go$(GO_BOOTSTRAP_STAGE5_VERSION).src.tar.gz
>  
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
