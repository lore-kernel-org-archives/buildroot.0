Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0199BCD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F8161522;
	Fri, 29 May 2026 08:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSdwkPxwzPHi; Fri, 29 May 2026 08:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE685614FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043362;
	bh=C/bN/KNhCO+kjHiw2tzZHp9iy+/31JZ7K2kJPDLBLUk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ArPEA9lkyfDVa0CaDwPef+fd9Vw36SLrdTM7JlSRudFrkoEynzR3gBCt8N9l8Yb16
	 BlzrhNu6F/Qco8Byv5L97tqhnv0V3wADjNxMgx6LMaIzDm1nfysMP0EhoOSIagq6h/
	 EPXZ7Bx+XZnpQxK0fyNwaBRuv4cELLopDH6yLl4SovJnR4efpEMWexP0WnsGy3utqx
	 eU6RCZ3Quc4jF1ED7twsMqhXLRpCwxRvvcRjRC3dOsjg13hYHL59IELS+YHI8Xa6XO
	 n7jgDqMIHER8i+0ZNundLQArADfZsdxZGN7DyBpA7JdtJnHzN3VNGwFFe8qVWUASgA
	 lqDCDKXLrBz2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE685614FB;
	Fri, 29 May 2026 08:29:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C18728E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E995614FB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIZkXiMpICI2 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B773614FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B773614FC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B773614FC
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso59442065e9.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043354; x=1780648154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gdJS5iVHpcNFkS/CLjwtrL6/3GHnJheTz/J4ntcS6xo=;
 b=OALE/9KtEaoBOofPBzcXFZ3CIZ6BtO4En+5Eez5dX+TYknVI73urdDmv7T5txZ719k
 fk6/YsVgLy20za+oQLg40vy8HTBOrty9vSbyzxVk4AYrTl+TO72m1zLeJobJ/7exIPA5
 EbtTaFnTlEiQoq8sfMUsEVdFqjyu0og3e/UTu1DFOD9VxvLQ5nNIJctzdVw1qqBfLZsn
 vSof3tk0wkNOlxsABYkrzTeMkSkbj29ME6vxbay3efcBniCzIjSsKrbqvhDHnTTtXak6
 +oYAzoyumWRqMRYzmvHnkGqXwyQ3MX2QCCHojoo+cPbu5EOIr3F3NhQgL0elPnNbjgnE
 MX3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dmyfZ53Biq274alzqztGpsnv2OGG4urvQTPa35u5eiY4fiNgNqvy7x1WCESK2Za1iWPgW+XLfIK8=@buildroot.org
X-Gm-Message-State: AOJu0YxkU2MPeL18EjzYl2Dun55yTkWIZfelX5NspUTdZ+Hw8F3Oi3lT
 YbYaE+Xzj73hbCMKGsaJkR3t170eU/1zTR/L+MRauDKkx1xS5Tb19Vo2O7uRc3uG+ZA=
X-Gm-Gg: Acq92OEm+lvfqpfHNk8G2IZo46fZyKIUJGMG0DAv0jKRSaix6jfoiVZAX4Ffxfc0z0A
 x8XkfNFvB56+hSHghCwC4YxURV8kwge2bWD5iedfwbbn13TJ5sBsJxq7Ye/OkpuQZ7OhqS4biwv
 1ElU8i22i6Ck4B8wuNU38m6z4Mksh4ZE3ag2GM2XFAxlIfdsNruFs51puL5v7AEo/lRFPVxpUgG
 Y0FxmKzBx/zvQ0tlhjwDRDcsTSLSsGUz0wJ+7iiTjbDGGxyvRJniSDGISQj4KvCNsv7dNmWqhU+
 cO/eCfVxOyC+iLzHKvkzEk0LvTWPF1ZzoKlkWms9KImnpV+XSYQfK+JZl+SFnfHOGzhV60ohtkC
 q7LOwzos3Ypt0SXHDwodqJGm5dOGy04PNktRi8iw30k90kKqVv6Rc/qcpbI0QrkPbjdvdIG+xTs
 4dkHjbuUn1hDsz7kRWEu5GVoTdu4j2GPn3JOfb9b8MIbGSuGMVSlVC6fxXhA==
X-Received: by 2002:a05:600c:3542:b0:48a:5c23:cab with SMTP id
 5b1f17b1804b1-4909c0a7df8mr31885635e9.19.1780043354294; 
 Fri, 29 May 2026 01:29:14 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356b129sm2383676f8f.32.2026.05.29.01.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:13 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:13 +0200
Message-ID: <20260529082913.57077-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260210074955.612849-1-peter@korsgaard.com>
References: <20260210074955.612849-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043354; x=1780648154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdJS5iVHpcNFkS/CLjwtrL6/3GHnJheTz/J4ntcS6xo=;
 b=GVDUI5yop/LLg7QGGvQ0oktnzGGTuB+NBcTg+bJSlyjAtkX97g+eWKtzaC1sK3oqTn
 5R0YiWYfDUSqV9eOjE9e9jWHTq4yIAXbErgcaTKsjffrTOayJl4uiSo+C7fmq2yRohEo
 usdpNz00UHTcG+PQPvf6NKwa54XhZxbetdgXTZOHOIqsDFq1EST71sNgBdZmfp7Be1IB
 Nc9FNBhzC9OX396XBrAQzvB3wbBV7JG7MpOQTH1/eCP3n9QLFd8I+fumB2DEoHgIEqpj
 KzwemwwpLUE8bBGijDZtF62UR1bm9KJVu7U8nIugmDZoyFb7RZlekmalljcV8CnIDYvr
 KeTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GVDUI5yo
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

Applied to 2025.02.x. Thanks

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
