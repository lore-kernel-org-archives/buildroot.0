Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42DAC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B018560E20;
	Fri,  4 Sep 2026 12:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIG8ZjueD1LN; Fri,  4 Sep 2026 12:19:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 483B760E25
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524361;
	b=pzq8m09vaxoHCuuz2JBT9sn0IElqLTkiP838T6OeHOZ9HvyeQgSud+mE5j1EfUC62UZ6
	 K5Kq36V7EAqx7HgeTuF6RolGIToVgiYGP/T+re9qQnR4jEW+9R9tOcMDWICAjGlZ9BB8K
	 3tnPqduCODa+mhe75dShg8YhqA36brst9NFAZyApkTjqJLrSoczkj1HH829ARIIJnFSg2
	 sYj3Opm66OXHfy6+rDrS3FzYZ//yt5FdwE4ssd2olm2xpD+bW/kDdNLmauMGwgOOrhLRs
	 hBTgKYC3oNMEpDQTULLIwODAeG9cgKfY6k9WI4Mztkl+JzOA10MBaWaiP0jRi2mMVfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524361;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e/tBBKfGiOGJsoOeysayMvTo1s9pgcyz346yy1OqYYE=;
	b=caJcbu6K0M2yMAgLaCBrPdalGSe4bzr6C39wSvkM5iGiCsUthBrkJLvWYl/UIUt9OBZy
	 ujoBPhLi8n3365+3qfpYGzFrlFNYVxd9qQNMLLadaOQh4YBEwG1lsRpN3c9IwXktboVqo
	 W5wdZIOiI0s+nfCRFU5EilTqEZIlzhLxgA3nnX+HYSmlZfw/df9LYTqalvgQetpwSqWXM
	 U4zQYN4eNZhfhhTKKneZbW/Kcd7Tv7ahk8tZHZCb70fHGVuSrMC/he3JG+s/ke3u0G6gG
	 9gWxrV/OGPT8lKiCuocPd+ph5lLKOgwJGmzJ3CR3WeheNBKEBRsfoPjlgaGKo4GjD/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524361;
	bh=e/tBBKfGiOGJsoOeysayMvTo1s9pgcyz346yy1OqYYE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SulOCebYw3n3dQ/Kj3l+oyt+7QjJzuG1BSNnc/qKqUPEzvP28EfAccLIlZF+q3r/n
	 JspZpq3TAeNVdgxKxuHylcZTS+hRNWVUZerHt3OFfxfSb+zgbmohj7hGyzC55ogr8q
	 IwG6owRYn456+0usKYIqYa2PSYnojMqv7O2PQtAhp2VXazu/amqRsRMDkbT60D23g0
	 4Vijr0TLMg52g08UXw8jIgSQbF/0IQR+SCRmobQjsbxmy9/ABTmZrWQPlkW4eq78oz
	 l389SjGZ2AmAqAcMJ2J9X/MdZbS6KI65jJ+HZOU1GIqbr/JjPk9qJrN8irHQPb8iwF
	 3X8kyVdmPVmzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483B760E25;
	Fri,  4 Sep 2026 12:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B92BF14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ED7B60E16
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0NwDmwZbf8D for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9795C60C0A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524346;
 b=FyjICzMOg3EVnuMROYeiZXG6CVrc2fA70C2v5YYXGaA8xI4JDrxVwGpTeWwEefK9ImAG
 RHaF3Ww3oFrSI5TY5yHwDaMsj1U1ntzC4otfyC+6g4stgzpLDYQO93kRHxJ83Dg6v5Q7A
 6GK3D1nF7GtRWQAaTRc49uoMl6uAE82Qp1zKzpnl0KNbFzQ406C/4GmRFBpbUrgImuCG5
 NDgEycC8aHOIx/QWJwIQTa2ajQkEyB7ghyEylfMC7dkjMCdToJ0g5lKeAyGCk/MuLdMnL
 O5CDS3IyUfFD8VsCGKnU8CfYTUT1z3/7cfZ28vJ3GcLucJXDaM+7BpKIffl4fFE3B6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524346;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Ilf80LnUfzNNSSTvKR16+wgGDH/eUDQtOVsryFD8PTU=;
 b=giNL7TzjCDsTF7GbkP88Wr+RUJQrYuWgd/KE/edgVjgXD7ek86sHtEWrjUdDF77AixfT
 gfVWa35/62eTkCtLDturr6PHAIiil8uczlAPTz58EIK49P5lcJvCt4IGYaR/xDjgcfZNg
 aimwXqmDygE8jGHN8j27gjPYC2mSjMnKUslWuiJeKJzj65K2Bj9PZtQDa8Oy7J1Wd0mKK
 pe3OAIoZfdY9OlR0mfD8FG4B25eZ6snf0M/ssYeioce4/uzQCvFSLJY7TscCcEN4wAq9r
 pGXR89YinmKyScFhgNjs275zVvcrUcR9Z8mVdghZO9zwSvKdRw//Lr5D8ZPvtdy/Eyw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="aEnbao9/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9795C60C0A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso7646285e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524343; x=1789129143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ilf80LnUfzNNSSTvKR16+wgGDH/eUDQtOVsryFD8PTU=;
 b=badcVWci0h86meUTwmsn8RrLtZEMyeZAJYizbpokx7CI2bkT6VGA/N3fpKUiGlInKX
 cbQSZCDRheQtvrwpJ1m8cYkPqLc0cI0P+fpV0Tr7ooH0jmGgNa+ksF9jb7cpQHQJiLiQ
 0mHFKxX+3WiBM2QEc+71+qehhQq7cTq82Z02mX8OpfYx5nf/VV0c8vXVs91jvx5PIMAZ
 Tk0MsfiDz4SGkjdjSwduY89W/lBdGVhbycHmNbE241Qaq0RPjUuADrlHgW2gHX8U7Jvo
 WpmLyIHkOKkKKAaRu8KAtRf/G6a4VhOUQ11TEL4MvwjCgrsJrDjbvyAEhF43lIs8DW7G
 7GBQ==
X-Gm-Message-State: AFuF++l658XH6FcFvchQ4WbgP15k1aWMIrueltwgDSSMfcGEUY3+UA6B
 VqwccqFZUr7l4TzWLzm2B4G1Jv7yPK5cSVlUA8VZcLlzuHbUDH7EB8ACxtisapRz9ZA=
X-Gm-Gg: AYBFou3W8jJWDTIerH93YA3fCuwXwYAaR0tvMUCpqsuIJ4bhACwz0w4eQ697LVbLodY
 8orJixM0aPmcRf5FasEaHTC4Hz/BagsYtnJKag0igySzjyKIFRG9H4edRYIkJtNBlc3CPzLvu7u
 41AnqQbz/3bZjS3wGz8GE7ydtliLt7lYFW4ILhyF806R71jObFixjYfVgQnL/pft4xa+EhUS6Gp
 a3x/xhmTbHuxLFd7Q93kI10D0rwtYYtVEctM25knKIUm5XsJBt8Pc+VQtKlcqX3NpzzCekb3Sr4
 p3NlDUioIf/Un1H9m9vxUPjgCridKpz9oyNnzMJNIfQOn61rujv//EvHF0FvVFvdr4NbqVp6Dee
 6CesNAhkllr8vA4bczYALDlYnMG1ZGE6sZyadAKPeX4jdP3EOl++TeiP5E6+aGmPYVvyH0HfztK
 pvgqTwXELgt8Di2zXDArygh1J3LgXOAHfwZhy7ZhGLAI60omvUeJxVVA==
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49cfc6ea7b4mr31641995e9.24.1788524343055; 
 Fri, 04 Sep 2026 05:19:03 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5d4938sm149902375e9.2.2026.09.04.05.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:02 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:01 +0200
Message-ID: <20260904121901.406419-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826202207.976260-1-thomas.perale@mind.be>
References: <20260826202207.976260-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/unbound: security bump to v1.25.2
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
> See the changelog:
> 
> - https://nlnetlabs.nl/projects/unbound/download/#unbound-1-25-2
> 
> It fixes the following vulnerabilities:
> 
> - CVE-2026-14586: Assertion in libngtcp2 when under pressure in high
>   concurrency DNS-over-QUIC environments.
> - CVE-2026-32665: Remote DNS-over-QUIC denial of service due to
>   `quic-size` budget bypass.
> - CVE-2026-40691: Packet of death for DNSCrypt over TCP.
> - CVE-2026-41637 Degradation of resolution service from improperly
>   accounted client-terminated DNS-over-QUIC queries.
> - CVE-2026-42955: Extra fix for CVE-2026-40622 to also clamp the TTL of
>   A/AAAA records disallowing a one-time 'ghost domain' delegation
>   renewal via glue records.
> - CVE-2026-44621: Libunbound applications configured with
>   'unwanted-reply-threshold' could eventually be abruptly terminated.
> - CVE-2026-44687: Off-by-one error in 'harden-below-nxdomain' logic can
>   shadow a stub/forward zone by a legitimate parent's NXDOMAIN.
> - CVE-2026-44690: Cross-zone wildcard cache poisoning via RRSIG.labels
>   manipulation.
> - CVE-2026-46582: A wildcard replay, as another piece of data, triggers
>   poisoning in the serve expired reply path.
> - CVE-2026-50045: 'max-global-quota' reset by DNSSEC validation
>   restarts.
> - CVE-2026-50046: Possible heap use-after-free in an error path when a
>   DoT forwarded query is jostled out.
> - CVE-2026-50243: 'response-ip'/'rpz' can rewrite BOGUS answers instead
>   of returning SERVFAIL.
> - CVE-2026-50248: BOGUS configured primary hostname accepted for XFR in
>   auth/rpz zones.
> - CVE-2026-50251: Attacker supplied `0.0.0.0`/`::` glue triggers
>   defensive full-cache flush.
> - CVE-2026-50252: Possible cache poisoning attack by mapping source port
>   population per thread.
> - CVE-2026-52863: Memory corruption could lead to crash and denial of
>   service.
> - CVE-2026-54478: DNS Cookie bypass when combined with proxy-protocol
>   use.
> - CVE-2026-55708: Privacy/configuration issue when adding local data in
>   views through 'unbound-control'.
> - CVE-2026-55717: 'serve-expired-client-timeout' and 'response-ip' CNAME
>   redirect could lead to a crash.
> - CVE-2026-55973: 'dns-error-reporting: yes' leads to stack buffer
>   overflow.
> - CVE-2026-55990: Packet of death for a DNSCrypt misconfigured Unbound.
> - CVE-2026-55991: Remote DNS-over-QUIC (DoQ) flow-control assertion
>   failure in libngtcp2.
> - CVE-2026-56416: Possible heap buffer overflow when validator
>   canonicalizes RDATA that contains domain name.
> - CVE-2026-56444: Degradation of resolution service when
>   'discard-timeout' and 'serve-expired-client-timeout' are combined in
>   unusual configuration.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/unbound/unbound.hash | 6 +++---
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index 46b88900e6..85724ca243 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,8 +1,8 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.sha256
>  # After checking pgp signature from:
> -# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
> +# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.2.tar.gz.asc
>  # with key: 231018690C4D903EF419146AA144323DEAACDF45
> -sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
> +sha256  0d92275c703d5f5f8baba3dab22117dd8c29b495588a5c229768ed6581566600  unbound-1.25.2.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index fab6e67455..46fca5e2d2 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.25.1
> +UNBOUND_VERSION = 1.25.2
>  UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
