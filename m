Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3CEE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275A483829;
	Thu, 19 Feb 2026 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW9BCg2VVLyQ; Thu, 19 Feb 2026 17:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4394E80EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521928;
	bh=FSlwbW8Avy9bQ1MSLILb+ywzaUC/RiwoXpniSUpVrzw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OMh1HGUB3Dhzt4HBMHOhvJ9oXIeRKr88dDlMBHYVwFR1Q3FOdlM18KMWRgBdOkIl7
	 oCcIrHVcX9RjGf2RhatjFlOUtR3IU5Jslc5jbyQa7L0nynLPUK6H5q3CqhLADj44nh
	 js8dmb/N/I1YKx6IL9szy0aR9p26zaDImAmZdFMdt48maqGlGfBo5GITrwtddcsmEM
	 yycY9f3Z2T/3h2veVlHwp6xPFfsBwWP5UswAEzI+FtjNgzbsdch8KG2P0MomHU467S
	 7yEFBDnIMbnmXokdd6Hr8wkr4lx3Y1R5DQDPVkF6btLAzJGkqHmRLEgfC5F/MQPt48
	 /DvX9jJuqV4pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4394E80EEE;
	Thu, 19 Feb 2026 17:25:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BF3206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 791D840848
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ozp0QSn2on37 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59C184083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59C184083B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59C184083B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10591195e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521922; x=1772126722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbARq6aKu0r1bug+CU8SaCz32UJDWLtBVwPAg0OaOWA=;
 b=PZDCVZ8IpsSe7C2r5C9PU7brv8KRp/9hXeXgcxCt8soj27jKws0ZSeeTd7wVRcsGEI
 +PIl26BafxlF9VZfEXlKF/30Q84mD5Sf9oqufCnSn7/ry0kekp6jdDH/A8CK7QfFr8+1
 4yTDsaprG3WSR+iDfeLvdm6kK4E8k5WOToDivGdmHl7y9z3dMIkraY+JaMzwljo/sMCG
 RPIUtObOzlGnhe81+OrClDvppFLbdTJLYGR2UWP1RjSk9utDeGH/LMbjo54ZbbEfEi3a
 RvJV041H3k8nZFSLWLEoXG1sUKmRqcnJ7xohJXITM2zTlHXnUPt3pDUN+0fzvatkn6RN
 subw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdoqrZKtljYw8kk8m2zo6tMTVO0vBGAvHQZHGOJ7fxbfKSND2chiC2SINPbr/GCWssa1aa+30kuoo=@buildroot.org
X-Gm-Message-State: AOJu0YyJgHosna1xy4IH/vCF69SE7Itr4wYSELMtkvlHGK8JTVlEqbnd
 q4hUUxnV4H3W9TGRiM19b+0dLWe9gRHTRIFs7EWSbthlo6dnV8f/daud6TPGRScsMvilpeWLr8l
 JXM0W
X-Gm-Gg: AZuq6aKMbfLxn/gPzf9Y+kDHSanbmU7gu0H9hiPu71HgwwXTXlkRguAk6jMMBgXeI8u
 cElp302wr9mv2iBMiytKWX99Re0+0sRdAVdjdHO4Xt0b056uj8Jlpujx4ZvDxtq7CBA/O7R/98r
 UIh3IqqH0YsN0JszvhUQgTMVWF07h+4BUsYmx5QvUcvMmpBz2afu1IwgkDWhJft2EQ2bVz5Gm3/
 kNP9Gr0oKdYYoilxwupCF9RflSbPpodcX7sM31PCR7oxqO4YQaSYqNUWB9V379XbUiB17VSaE8p
 pvZBnOfysZarT6fQrIRYpiy5FSox7TJfonu1P+3myJZzhuAZEmuak/43IaJxQHDZ8i1U71+Z0kF
 NjJN9VC6S4NaB4vylmUrvhgUmi4+IlPoko0R+hfxpgGt0yk+kb7YgO46Q14LWTelmVpkrV3fkp6
 OcpZgBJ/mAuhySlKg=
X-Received: by 2002:a05:600c:1f0f:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-48398a42873mr109014365e9.7.1771521922196; 
 Thu, 19 Feb 2026 09:25:22 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc0e3sm13905015e9.5.2026.02.19.09.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:21 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:21 +0100
Message-ID: <20260219172521.339988-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210074955.612849-1-peter@korsgaard.com>
References: <20260210074955.612849-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521922; x=1772126722; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbARq6aKu0r1bug+CU8SaCz32UJDWLtBVwPAg0OaOWA=;
 b=RMPE1l6h04BeMwRUJO1GblGhm+LztnLigda3+gtH/ivC3jzywaRt5XEZ3KNPSQmyQo
 5LVAaIOq1h9ysOKxMDFU6yCRP6A6dEORjGma2qg8RRdhL+JJtRgYRaNBzs1Bgmo9KEWr
 H9BJyHkZgzsg2j27ppfTeCGvi1ABRZT68ubSGjA5EiOZb6sqcZwrNvdEQcqxnDB+jZMh
 RqjrWayoi8JJIlm5ad8JFaaS81HGRlCcBwXaExgAkhpRZyKSzl/MAT8XoU0nSeuLXdrf
 uGhDAoy14Dc9M+0wn5sK+pwGMUQZAWxmXRASE9M3DfOd0cLdtYjXlvJsfIrf9sGF7iWR
 wyzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RMPE1l6h
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.7
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
> Fixes the following vulnerabilities:
> 
> CVE-2025-61732: cmd/cgo: remove user-content from doc strings in cgo ASTs
> 
> A discrepancy between how Go and C/C++ comments were parsed allowed for code
> smuggling into the resulting cgo binary.
> 
> To prevent this behavior, the cgo compiler will no longer parse
> user-provided doc comments.
> 
> CVE-2025-68121: crypto/tls: unexpected session resumption when using
> Config.GetConfigForClient
> 
> Config.GetConfigForClient is documented to use the original Config's session
> ticket keys unless explicitly overridden.  This can cause unexpected
> behavior if the returned Config modifies authentication parameters, like
> ClientCAs: a connection initially established with the parent (or a sibling)
> Config can be resumed, bypassing the modified authentication requirements.
> 
> If ClientAuth is VerifyClientCertIfGiven or RequireAndVerifyClientCert (on
> the server) or InsecureSkipVerify is false (on the client), crypto/tls now
> checks that the root of the previously-verified chain is still in
> ClientCAs/RootCAs when resuming a connection.
> 
> Go 1.26 Release Candidate 2, Go 1.25.6, and Go 1.24.12 had fixed a similar
> issue related to session ticket keys being implicitly shared by
> Config.Clone.  Since this fix is broader, the Config.Clone behavior change
> has been reverted.
> 
> Note that VerifyPeerCertificate still behaves as documented: it does not
> apply to resumed connections.  Applications that use
> Config.GetConfigForClient or Config.Clone and do not wish to blindly resume
> connections established with the original Config must use VerifyConnection
> instead (or SetSessionTicketKeys or SessionTicketsDisabled).
> 
> For more details, see the announcement:
> https://groups.google.com/g/golang-announce/c/K09ubi9FQFk
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.11.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 6134ec5f75..9a9a5a571a 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
> -sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
> -sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
> -sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
> -sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
> -sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
> -sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
> +sha256  178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a  go1.25.7.src.tar.gz
> +sha256  2866517e9ca81e6a2e85a930e9b11bc8a05cfeb2fc6dc6cb2765e7fb3c14b715  go1.25.7.linux-386.tar.gz
> +sha256  12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005  go1.25.7.linux-amd64.tar.gz
> +sha256  ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129  go1.25.7.linux-arm64.tar.gz
> +sha256  1ba07e0eb86b839e72467f4b5c7a5597d07f30bcf5563c951410454f7cda5266  go1.25.7.linux-armv6l.tar.gz
> +sha256  42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f  go1.25.7.linux-ppc64le.tar.gz
> +sha256  c6b77facf666dc68195ecab05dbf0ebb4e755b2a8b7734c759880557f1c29b0c  go1.25.7.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 91e5fbf347..a9c7d1ddc6 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.6
> +GO_VERSION = 1.25.7
>  
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
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
