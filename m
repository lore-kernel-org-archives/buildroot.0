Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF82E9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C5283BA4;
	Thu, 19 Feb 2026 17:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qm6phxY7Y7sc; Thu, 19 Feb 2026 17:26:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB4A83BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522016;
	bh=9K+kdfkamNoebvrnG3zrRsTIeKU1plLX1rFyDcRFKUo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eUlm3P2agFpH6C0v388XlYlzdQ43Tkt3ZQ3U1d+ZQDzIhmF5FhtL7Oy+5b866s9z+
	 DGJWXnmlpsmU5N/nTUCGUanAmq4Gs5nvxnXwcPQPzOfIjak5R2AeC+ghdE95GvqFw+
	 oN/uBp+4Ttvhz57cCzS+v1LUgxi8svcb9Z4FAuoDvAzdfWzwNVhc9jBqmUk0Pr8dty
	 x9BCMo1BSlFP6PJP1dY157nfAh9TkmtoEJvt1+kS59Vr/6e9X1FqtN0mBJAuNh2Fe8
	 e5ZHA589vOC8Y52+IGZDvB3yB+vO9afn9IGJhYL/NxfrLhOTlCKtLVXhNMnCNn0STA
	 +MjIfvYgLHAHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB4A83BA7;
	Thu, 19 Feb 2026 17:26:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1126A206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB45583B66
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pvzkNNn0mq7 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBCA883AE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBCA883AE6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBCA883AE6
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so1163457f8f.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771522003; x=1772126803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9JquIjHD8erZ656XvSyiJLwIcQrS10dMKNCFK4pEYo8=;
 b=Go0LdmPGhxO2wZ/+OhIawlj1LRtU3wP5yFpqb9hj47YHzNcMzHLo+bA1VoRDVc8Eyg
 WJBY4U7+d3nwNogfV0huc68/5vtIDTt6y/2LjQwlnG1qh8TI0mtGJt8Gkxfwrf8b7WbX
 IAQ0+5fkLBM33D7qJFGqQgnNj00yotMgOyAk+/9HdwfOgB9BTg8xzB0BksvrD+KJ4O20
 flM8RcjXHZgsBcEaRHIUF3lj78n10BQLRVYcwgf8z/FMJikfFFViGzJEfLkPZK/bggAo
 nPLiFniy7u3ngPOfhj4cliYGIPhtGeXUGcWiYNNgY5E+UVMW1NLzgl5fLUBFPTzOgrB4
 xVZg==
X-Gm-Message-State: AOJu0YyFOqFTOT6oVdW2pLIqxsLDGllI3usOxYYI2vO1SnjkR3Fiwyas
 4NXkIAK42d4DKE57YGF2CWyhN1LCS0ted3yNmoQy+iupDiMx9lq9ajKzsUvC2WnhbFgDDl3GqpR
 EVMnA
X-Gm-Gg: AZuq6aI0FHM2pG/xRTDFHO04Q/iCfl3dRhK0Bz29t3TaUD9zZZsYc53O+309BXAL9nq
 eGOmcFvzFXAiQY7MussNMrYtou1Hd/jtlEItC63k10MfD1MZFt9kCGUK3mYxPWk5HAosLJjl3wh
 Hwnmquw57YmW6JeWhw19NA7uvu1wdYPQLXNXX5KCigL2myZ4e3xwSpd3oVTHS2AXu/ixGaxT1/F
 yb2e8p+dbDAOIb8mnuyf4auCWRedsJTr8YTRcq9f2MQ82TR385XQqPIS+WrqTpmZzN5JT0idMbB
 x2nsa0d38J5tXqs0NH/wecGwwtV9+tsKRCwY38mjVRsXKM0v0JlU4ZuDpO3Hket4Yhpm+mPDYKw
 d82AhcWpJASSyt48l7MGLfC8BqQUM1YFLXQ4TIl/Y2sHs/NM0ok8AHnM0fWastolWkciMaBybZQ
 0nzWPPYM60FDRYafY=
X-Received: by 2002:a05:6000:2403:b0:435:9223:bfda with SMTP id
 ffacd0b85a97d-4379db617a7mr32956202f8f.21.1771522002606; 
 Thu, 19 Feb 2026 09:26:42 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5ac87sm53899815f8f.3.2026.02.19.09.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:42 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:41 +0100
Message-ID: <20260219172642.341372-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215144923.54095-1-thomas.perale@mind.be>
References: <20260215144923.54095-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771522003; x=1772126803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JquIjHD8erZ656XvSyiJLwIcQrS10dMKNCFK4pEYo8=;
 b=H6kUnPVhuzD2C8uXs1DMVdhcuPmwW2E9MUJ2t7WN1yMCIWz31bcTEfwfJmrcqMEG5y
 R4VEx02XFTiZmbubsKC8UzxEkZj2vUvqb7tabPT+Bh538z32Io80p/xM6el5IkCc9xqk
 I513ZZ7OEb7S8BlxBnGPSGie1hM58uRjekWLCeQoBGFpoBiNNm3a6hSqI3RoOaxX9pzc
 0zEf5yOma5Ey0zJUXMF/LrwqSdHujU2WjVhoFCX/5NPUBLu5z7aviJgwjE8HZfha6fmJ
 lemCgW20kXW5g2j0yo/eiLDRRcipswd2MCc2D5mi4tZvzVKtvDuvKtq2LBCHdUHd53Tb
 DHLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H6kUnPVh
Subject: Re: [Buildroot] [PATCH 1/2] package/haproxy: ignore CVE-2023-45539
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
> The CVE-2023-45539 has incomplete informations (see [1]) and will be
> reported as exploitable by pkg-stats for haproxy v2.6.22.
> 
> The vulnerability has been fixed upstream since version 2.6.15 [2][3].
> 
> This commit mark this vulnerability as ignored.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-45539
> [2] https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
> [3] https://security-tracker.debian.org/tracker/CVE-2023-45539
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/haproxy/haproxy.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 77195d966b..f60cb1e08a 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -11,6 +11,10 @@ HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
>  HAPROXY_CPE_ID_VENDOR = haproxy
>  
> +# Incomplete NVD annotations, fixed since v2.6.15
> +# https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
> +HAPROXY_IGNORE_CVES += CVE-2023-45539
> +
>  HAPROXY_MAKE_OPTS = \
>  	LD=$(TARGET_CC) \
>  	PREFIX=/usr \
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
