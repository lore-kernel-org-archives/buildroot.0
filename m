Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D706150B;
	Fri, 29 May 2026 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v4X3WprNf_g; Fri, 29 May 2026 08:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AC296151A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043360;
	bh=YxCra4D1kW7KuekxI8VNIajG+rRNPuvMSIp8PBKEGIs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=akKxPnePAW+j6KwyM7iuBJ/geHrDDci5qkaK0O9DTO7uc2w9r7zlzzCSIVfxdQ0IY
	 r0wh9wwVt6qCHVGrOuiXXn9oDFGQlRjfG6c45QKfuB07TcwXqhAt7r1n13S8ZOcXFx
	 pDnoH80owm0sX69wzF5HkjtB6HQ67ILYD7um4l263CFp+zJLTi/51oTUFsTTCxkj/S
	 uPEL5s2TxDxNt1NrLPb3Ue0mwRNoYtoS7e62ipdk0bYi5Lafq1aof62fPdzQGNM+N7
	 Acn48JOhALZIrVwa+i+2MNcr9HOgB0mpJUljjTwNUNQCWSVfwEYo3A5bfvBzIwXPhj
	 dxIesRJoJ3Fbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AC296151A;
	Fri, 29 May 2026 08:29:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1EF828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 865714070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gea-hENO3s8t for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 665ED406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 665ED406F3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 665ED406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef42dfb26so58026f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043352; x=1780648152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4csp2gLAWRE1YsxFZ8OiPKiDEJrsVrSPZlgRYOBtgWY=;
 b=hpAzVPfoOx/7aFZqqSysMFUfEP+G2JJfsXqrUa5lEuqm9yjVz2dfRnxBM4xps/+HDa
 d4vc/jRDdiC/7K5cgWBHfPbw9ILYakHMB4KpB4J77qGGwvDPjYKe4qknHIh70UMeV4Sv
 XveVyl2mhf6egZdL5HovdgpwjH/Dyw9cu+0PPEoWfFHAcsqSokO++5ru2bHdwguSXIan
 atdDVUHvK/mDhPtI5m9xKP+hxzXFz/PEhSjd7rjI9n6cUKjv26L9l92clIVb52KYCrMM
 NR6+O4PplQ3YRqTkD0aHoFht3PCyQ9JjSv6X2zpXpJp/lYk8SUHuhvfTN0UmwHwpZAmi
 vO+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+R7l8x70/TyYrNZLshXgmm5/K8RHrT+3xwFYZ21Jv3NGfbstKMlpV3/KAhNiks+SKsuwnezF+5GHk=@buildroot.org
X-Gm-Message-State: AOJu0YxX6+P0iszYfSp9pQ4xQ+nfwluCI5v8+sG1/uBQuuFGpW7ITX+2
 KbABSnp8LcGGTcx9udN7m2dwRofkxN/wJw3DLjBS7I160sf/XINjcTCoSdY+nS2hRhY=
X-Gm-Gg: Acq92OFLyxxgTszRao/2IvOYOfb5wKkrwnBVar3LezQ1KoxoniippLGUozh58HNvxEV
 Q//lEPCF1wZy5nNZUQW3f/4qkgisJn9YQ/qndJQfkQmsjcI1JA+EZAsxtBoU9IYJW1MQq8bD2bY
 LY20PFl9onjR2PLPQU76ImMulIAHT0aDG78nWGX6t2L/w6BLS4xJC2QQjCxdVMqEyEI7Zmgn7Iy
 egG5GQSjQB1KfTTKcjKwHss19vPOw06pLz1vT7PGDbR8Rws5QNr+jhYwHGUH940AUZf+7r/YLHg
 Voy0L16yZPZCkVyKOgSVFl4scnp91Zr/p2k/ne7QvBLQkLLq4mUy5LfG8cYSYw+uXL+Wr4a7SqI
 nIuczhu13cjR+ZOuTp3gpBqITH8Y+/B6tCjMYKY+Pma+65bRQtyTfjUpM2Aeaafw+KfSw8A5lka
 TC9N+EZXqWc1UkGh2Th/CxrJqyEWopw2bDw4QXDrdGTZu/qAHjLPzBR7hGLw==
X-Received: by 2002:a05:6000:21c6:b0:45e:7418:a3f2 with SMTP id
 ffacd0b85a97d-45ef14481a4mr2087013f8f.26.1780043352147; 
 Fri, 29 May 2026 01:29:12 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354b5bdsm1780317f8f.21.2026.05.29.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:11 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:11 +0200
Message-ID: <20260529082911.56968-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260127164715.309118-1-peter@korsgaard.com>
References: <20260127164715.309118-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043352; x=1780648152; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4csp2gLAWRE1YsxFZ8OiPKiDEJrsVrSPZlgRYOBtgWY=;
 b=hm0WNk3MIKA3+LmNAFNWVD9xc/j3YBJSQ3uZwwD03gdufxlym65a2yM1bfnAuer0ro
 kRccOwSq6E5EytSENXwdveVprb78PupE54252dqgBDVyv37UD/x4mN0Difk9R/Yu+rMK
 mlTMq16dMjxXzyK4NjrQBel5r+/+6npo3D6EddnR5wxJD9lX2cDbrFutaGMuNgiv3BSQ
 jjcXDopPrnv6eFq0dui2/X8qyr23PgE8SbU2gnJ34vD1MClaD2iuEqrKnVBBq7yoMTxm
 zW3pzWCg6BRX7XwRhzgjmrZkcLtvAADpmzc1s0Aa4/K6QAbAcL7QD0unOfJT+CPD9o0S
 RbMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hm0WNk3M
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.6
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
> - CVE-2025-61728: archive/zip: denial of service when parsing arbitrary ZIP
>   archives
> 
>   archive/zip used a super-linear file name indexing algorithm that is
>   invoked the first time a file in an archive is opened.  This can lead to a
>   denial of service when consuming a maliciously constructed ZIP archive.
> 
> - CVE-2025-61726: net/http: memory exhaustion in Request.ParseForm
> 
>   When parsing a URL-encoded form net/http may allocate an unexpected amount
>   of memory when provided a large number of key-value pairs.  This can
>   result in a denial of service due to memory exhaustion.
> 
> - CVE-2025-68121: crypto/tls: Config.Clone copies automatically generated
>   session ticket keys, session resumption does not account for the
>   expiration of full certificate chain
> 
>   The Config.Clone methods allows cloning a Config which has already been
>   passed to a TLS function, allowing it to be mutated and reused.
> 
>   If Config.SessionTicketKey has not been set, and
>   Config.SetSessionTicketKeys has not been called, crypto/tls will generate
>   random session ticket keys and automatically rotate them.  Config.Clone
>   would copy these automatically generated keys into the returned Config,
>   meaning that the two Configs would share session ticket keys, allowing
>   sessions created using one Config could be used to resume sessions with
>   the other Config.  This can allow clients to resume sessions even though
>   the Config may be configured such that they should not be able to do so.
> 
> - CVE-2025-61731: cmd/go: unexpected code execution when invoking toolchain
> 
>   The Go toolchain supports multiple VCS which are used retrieving modules
>   and embedding build information into binaries.
> 
>   On systems with Mercurial installed (hg) downloading modules (e.g.  via go
>   get or go mod download) from non-standard sources (e.g.  custom domains)
>   can cause unexpected code execution due to how external VCS commands are
>   constructed.
> 
>   On systems with Git installed, downloading and building modules with
>   malicious version strings could allow an attacker to write to arbitrary
>   files on the system the user has access to.  This can only be triggered by
>   explicitly providing the malicious version strings to the toolchain, and
>   does not affect usage of @latest or bare module paths.
> 
>   The toolchain now uses safer VCS options to prevent misinterpretation of
>   untrusted inputs.  In addition, the toolchain now disallows module version
>   strings prefixed with a "-" or "/" character.
> 
> - CVE-2025-61730: crypto/tls: handshake messages may be processed at the
>   incorrect encryption level
> 
>   During the TLS 1.3 handshake if multiple messages are sent in records that
>   span encryption level boundaries (for instance the Client Hello and
>   Encrypted Extensions messages), the subsequent messages may be processed
>   before the encryption level changes.  This can cause some minor
>   information disclosure if a network-local attacker can inject messages
>   during the handshake.
> 
> For details, see the announcement:
> https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/go/go.hash | 14 +++++++-------
>  package/go/go.mk   |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/go/go.hash b/package/go/go.hash
> index 7c689f9144..6134ec5f75 100644
> --- a/package/go/go.hash
> +++ b/package/go/go.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f  go1.25.5.src.tar.gz
> -sha256  db908a86e888574ed3432355ba5372ad3ef2c0821ba9b91ceaa0f6634620c40c  go1.25.5.linux-386.tar.gz
> -sha256  9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b  go1.25.5.linux-amd64.tar.gz
> -sha256  b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9  go1.25.5.linux-arm64.tar.gz
> -sha256  0b27e3dec8d04899d6941586d2aa2721c3dee67c739c1fc1b528188f3f6e8ab5  go1.25.5.linux-armv6l.tar.gz
> -sha256  f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4  go1.25.5.linux-ppc64le.tar.gz
> -sha256  a5d0a72b0dfd57f9c2c0cdd8b7e0f401e0afb9e8c304d3410f9b0982ce0953da  go1.25.5.linux-s390x.tar.gz
> +sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
> +sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
> +sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
> +sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
> +sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
> +sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
> +sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
>  sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c932baf018..91e5fbf347 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GO_VERSION = 1.25.5
> +GO_VERSION = 1.25.6
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
