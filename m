Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112ABCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E2560880;
	Fri,  2 Oct 2026 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fU__I0tcnVZ8; Fri,  2 Oct 2026 10:34:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CD5A260B22
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937249;
	b=K+VWK37onPUL71kPovRlpg6/UcSjnXskRZdRTCROYwIV0AbXna1bsFlm8LUwMVSAB8Bj
	 3T6QDD+RuQ7GPnnDHjB2msBPkRNiiHG0NcYmqh+jXMc+wtcd0Q37ziDbv7Q8Qqjb5vIZZ
	 IvPWYCKBdJ6KFEYrjFxA9jzh0N5KgmRdpWL3xXPJin1YmPosUDkJld9wA+xz2DRjD46pL
	 YyDZLIdOsMTZVM069ynIqkptswG7xkuiU001vKUieuuo2qwpNtRiidQbM0/CkGk76c8G6
	 T6ps/tbx/EROC+MnmOW9CyJmplikuX/49tsOJau/GkfeDvDB9tzjjHDumIVjr3T7LyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cE/t1OOOx5T6HpO9LecdCO6TTSRRZMBC2Z8ToajCDYQ=;
	b=ByGnkVXYQHVAltW7FJ7n5GFdUTV6OKYlsaxvyQRlM9cbvqNjt4IIiCA/fsQ+9MSxD1pR
	 59has3NkF+uxgByftRft0Z4+A/l7SmmHZMGxCLo1rSgZKQHtOQhzp5BTfyUkthPDdmKl6
	 PN8iUn0N/6nzNaD1QBmGwI4ZzLJhXUPr+vmA0d/INSIl/Ww4xS/RFFyQC+u96ha25OOpU
	 cSABDB0ZWbTI+7NkKWL7Snn9+/6LU4I8aAHK6JR2oUxRZ8SHumW8V1Am5boU3BSc/Or1d
	 D3VM6Isv/cDeDHz4HgW8JNFMOgzggubCPjs1OxagbH1Dq19kZSK/sNO0MKgkLvAbDjA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937249;
	bh=cE/t1OOOx5T6HpO9LecdCO6TTSRRZMBC2Z8ToajCDYQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pT2S8XdBs1TpWJN8/b+8+oIK1InF9xNNhnorKw0vzK9NGTLlmeD8/tAI+gFYNv3A5
	 aNMFnZm5k18DUAuUDQKrybqn9416OW1GI7HeNs68z6lKqMZCxPMYHc10ZaKIZvX+ZF
	 0JdynVmQXJFS25D8F4AKxxJSBF2grAlkODpezNAAM4kwnR9DqA5gW8tCEpeOYfae85
	 UWVg8uz5ZwLj1lIXfUwNeF6pC5fXI1eiZDH39iY/EBI2x/QJbXEp3cK7FeBwE3YPdx
	 3cAaziq+k+OQYJS2amdHtcE8yGdJ6EDTpjHiGehz2Eys9xXSpWwu2KN09GMazdjvlU
	 yAykOIybgzDIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5A260B22;
	Fri,  2 Oct 2026 10:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B168D3AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A321F8122D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbbabYEriTau for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AFB781216
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937246;
 b=NbUjJ5P5muM0GhgpHcDKGHuB6TMZlRktMMH0kvc/nzrLXWyhgXRfgYtfB88CUZ5YPgr9
 DGKJHuW0OJ8rcTxtaGYx4qON2Qm43lCZQnuLF/Ouh27dgwnF5JVx9tBOe+tFun1GarmOH
 ed3e5vkYFa9/J/4QfiLOtBprTzuIQIGLMttXtzwcmjxHUxIifwUnZIOEj3hqUqTR1U9yB
 ietbgBBrw7MuU9triyfVHoSlNRmfS+IWQXpbXEOlxLb/PRckeexjG/ppxqKWEhGbNEvjq
 ++Ssp1sn602sEno9wp4Gcd4F5Alg/rqirQVjj3q/eG4G7E7bYjeHLf19gvNsSY9rCYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937246;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3PaEicra0f7ohbjPBcrg9lSGu9yEEZOOtwxYROJI/G0=;
 b=hDrOM5oiQIApa2IiO0pzTbIpprUlWENvdHi2sGxx8Rubzd7d+EVyyHxcZAIGd8//rvNr
 mUKvtiq1GCbKePggGY96fAnWw8sCGi/pKP6WobiuRpH1BZ1Qc9l3Eb0M2M7CZHvdu0tlm
 9xs7vu7i1a3mrALS+kroKdOVBgTNbpCQtU9VV8rwXK/7wBVD974wWwXjTc9SqXL4+davP
 sOnMAgyob546XUgXeABVgOU2v+ALuOoVvndrnrebXOqCh0h4eeXaamxsHQUTGPI+y32Bj
 GKI2e8c+VokX5M6Md5zrKsJsVvukyTf9ywCmJkl2avSVzkMJvZ6Ufn0wz/YuZMx3acQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=g+J2P9Kc; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AFB781216
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:34:05 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-4a11603310fso3587175e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937244; x=1791542044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3PaEicra0f7ohbjPBcrg9lSGu9yEEZOOtwxYROJI/G0=;
 b=GLYNzQhg2FUuFON5kf3HwEMStgLeqKSJX9VAkj4C32cGmSoDCrHufibKPbf0p3t7xq
 MFqKOfnczsE4EVkGUrD1s+yqxZJq9AMJzmQf+MQTaQXEFXHenBpfRDTXpHaaGEyWGbMa
 kzO042Gkw0xR55gv1uYqhG6dURD97L5GAWhIP8CHBNgdIQO8RyhtQ2dMHRbX363jepmO
 ZBG4py0AY/z/WnMJ+tUorujCe7kw2N7f4LSFmFHa3gmYgMQhGM5tQZPO/yqd8CCiRaj7
 z3ZKDIE1FRiQpzfSSiT9EE2G9H3Fir5Yg3RGychccF1/tXUP3zG+Gno4ul1hKbs57def
 0DlA==
X-Gm-Message-State: AFuF++nfZ7h+Y53RQ4qndxB7k5QHfJnYsq92oOMf1V8dHhW9LLUzsxcn
 gZdm7hLBeNh+Z057T7S8uiqgDYbXihZVXkhnSXTb4aMW1dhzPQJgdXEPe9qdDZX7rCzMldzfA0V
 /o0iG7T0=
X-Gm-Gg: AYBFou1ns1m8s6wyjZL0vS9//OloHjZp2wXQnwPcOaOTW9ahzIQ/uExm9wnxDXRICsj
 mkKBZUGCEiPpw/7f48laqMDELs+N/M+KWW2pDgA8iqbQQdxLFIlJ+yq7WXeTQ4LKHypSMEhKk1O
 Q2uRYkD2pRCg5568peWPGqPL0nhRuouf2vvWFBxW5VegCaSpCIcpM0p1e/SOftQgV/mqbqtwysl
 BRGZLaWfZnAcRaQPpC0Fjjjy1Q8AGckh1J1XIQPwtWqtDDOhxYNSVBQQETcTSPl5AjGSwVN55wX
 2amzqqHrvh6WIqOswtZOOmNA3u4VUDHEyZKQCT04L5fa6I3UB+spX3bynb9ByV0PDk7CS23Y2p0
 8GtLxqE+eCxdxuYkrTfoRrPMdM+NR0LRhOQWDdvBWSTF31o6iAtTFyLlGdf0Y/m5K17Fdaazbjd
 CfeXfTgTv5YfKILdlcSbe/NvLQMlcu9phVmA3TE9LfSGatHHyXe0jzWRHoZz6B2Mho3h3MOSJt8
 nENKOFnDHiShUkHMsdc7/4q6N+r1fPta8SaPpR8Xw==
X-Received: by 2002:a05:600c:4191:b0:4a0:1d3a:4fe8 with SMTP id
 5b1f17b1804b1-4a02757956dmr25578055e9.13.1790937244024; 
 Fri, 02 Oct 2026 03:34:04 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03fef174bsm38744625e9.2.2026.10.02.03.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:34:03 -0700 (PDT)
To: buildroot@buildroot.org,
	Waldemar Brodkorb <wbx@openadk.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:34:01 +0200
Message-ID: <20261002103403.77522-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ar32Z0ggduEeP23t@waldemar-brodkorb.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump
 to 3.5.9
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> OpenSSL 3.5.9 is a security patch release. The most severe CVE fixed
> in this release is High.
> 
> This release incorporates the following bug fixes and mitigations:
> 
>     Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
>     (CVE-2026-84782)
> 
>     Fixed excessive memory allocation in relative CRLDP processing.
>     (CVE-2026-35189)
> 
>     Fixed QUIC unvalidated amplification credit may be over-accounted.
>     (CVE-2026-35191)
> 
>     Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
>     (CVE-2026-42772)
> 
>     Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
>     (CVE-2026-54872)
> 
>     Fixed QUIC STREAM fragment metadata DoS.
>     (CVE-2026-54873)
> 
>     Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
>     (CVE-2026-54875)
> 
>     Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
>     (CVE-2026-72897)
> 
>     Fixed QUIC connection-level flow control was not enforced for streams.
>     (CVE-2026-75804)
> 
>     Fixed a NULL pointer dereference in CMP client revocation response handling.
>     (CVE-2026-75805)
> 
>     Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
>     (CVE-2026-75806)
> 
>     Fixed a timing side-channel in SM2 signature generation.
>     (CVE-2026-77696)
> 
>     Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
>     implementation.
>     (CVE-2026-84784)
> 
>     Fixed a bug where EVP_DecryptFinal() incorrectly reported a stale success
>     on AES-SIV authentication failure.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 814b4eb0dc..3938a81e5e 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.8/openssl-3.5.8.tar.gz.sha256
> -sha256  a8f84a39918ec6415ce765d9b429d313ba97b8143169c172e734b9514464f5b2  openssl-3.5.8.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz.sha256
> +sha256  603f5602e2eef00d77fbd429d34dcd5822bb301757a1bc9cdb24c670f1eb859a  openssl-3.5.9.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 6620eee274..d16d024d89 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.8
> +LIBOPENSSL_VERSION = 3.5.9
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
