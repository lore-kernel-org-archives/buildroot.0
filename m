Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F95C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F55960C08;
	Fri,  4 Sep 2026 12:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y86Niywg3EQJ; Fri,  4 Sep 2026 12:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 043A660BE7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524235;
	b=kF+tEMXBuqKmZ88QR4q7Soxqwzi1oKRBa7mWJbxB0187QzpD8RF+uFn3BSm1tfjsDkNu
	 O9Cu0NjiIrEH1g8s7+TdRKo2/1IOogmxZO2C4mlm668Zy1zL3vwFNvyWxebNPzgzuh6qj
	 0+FD5XcDD3+t2s/VCJSY8YRsZ6757lYFQpLVL/SSHSg60OXN3JaTBiDJrM5F1ziXELpzT
	 iLW1CcpIe0ZpWrPm5ToVxw89EE0cALbRRfDC0rRu4lIvYHK5VWpu/2uZt5VSjSYiEwNjD
	 2LwrNRPcoJ/ujnjR/xEhnA1AmZTK3i6l49srE5uEW5Ua4D1KlO9Ixy1GhsTWPh3Ub9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wQ/8ZM4VRkDsQ25oCnNoVpRvfxbuoA2eqSDjwi3mpU4=;
	b=YEMrSsnl5jsgFtyD6Q3rCMjApmXOfyqPN4KrgjXauupkxhLlcDDKd5De/l842irT4jmJ
	 uu4ihQuctfCFW+R1mGQQP2H6nHP7ItKCh3RQePTftnUXASvcctO3Pd2+1cVaI/ZZUDAaV
	 RFEpmnFgQc7PIDtie7unY3OjRyfumPftxUm06oI6IaLPnuh2sqs3E8Jn9OsdNGSl1V7n3
	 LEWaAi+NQRKv3YRWmO89FCjfXlyWSyO3FasrARPxVtncO4Z4tmb04pOvRjtZ+mzB/Ulon
	 +mQxixUi17Hr+rL1jAUrSnN7m9leRfXSJvd+1vMxi7XQNM2h8ozGjGnj/rLRTu5O17g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524235;
	bh=wQ/8ZM4VRkDsQ25oCnNoVpRvfxbuoA2eqSDjwi3mpU4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k3wOxfy8EyPrXEUUw/DtYapJmfjMn6AbT2Ub613pFs0Du8spUlFklo8r9Joa+QVut
	 JA06GwM+YsGjfR9Pl60GglQffxj0LtG6fZuWJsNjiPnnICXZC1e622WfAA0cd06Bmm
	 xgVLixErzmvSPuGFSxl2eKDqmxS2EZzQLoMgJAF5jtXNhpZku5r8LFosW46cy0yiGn
	 XCKRZ/R8Tr5Y4NPCYfb9iCVkEL8xAOiKGh9rZtwKEK338Nb0tWP1J+VZzZgSjvzqdp
	 MJnmUeQMCY6PV5dMDwAlWFYGl9YCfkP7iPGZ6WCcXX5mxrvYLZwkiMS2Q5ywzBQzBz
	 mPKOo34q7w+aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043A660BE7;
	Fri,  4 Sep 2026 12:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 116A510E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC8781172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5ppr44fH_NF for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8972C81174
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524232;
 b=kD1zC/Dvk88zIRKDwgsOunz4cOWQLIye5igaRmVfoPbrbjX45yaSBcCHvCzQpQW/8SXF
 OqIeMUzHrhcmAyi9++lsUMbtR6W3t3ybF/cxOVCiqz6713pHQzyGoALJd7Hgken1CFWW7
 0W38jtjQOdNfaVEoVf61ZLxo+4J0qKol02EjS5XxqfZBVOr44njvEPRffol6jccJGrUAE
 mRqs1U4wjFYAq2J6B8/zoflhqoV4L4qHS6I5+qrUJQ6/VLHekhoZB2h0mxGRDYB4qu8Vq
 EjN6gwJicXYvLTBaKH4MQ3iLUEEp3aDUWa5AIq7PjZgpkoz+Ll9n0vlP+PYGV9IYJsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524232;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=/vEw99bOP62eNHYPX2tUFtRhOGw4M4Eukf8mgCplI7E=;
 b=EUO/3CPtbde+6XxtzeczqV/P+YY0Zsfc4xCKRqbnYJOtt4YQ/fe8mgStOvv3y5D7d8Mc
 vAcZHfuhcmW6NiISBJ/gEZDDWWLGBUc3ABWVxT3JbxX01EHrAoPH+4KfgDwLlGBDmx2er
 5vrB9CrGoLeZy8XPb4Dxei/kbd5sH6j7C7M05qV2KXQBEsRoQswbJ64V/LQUwIDLqPq15
 yCle2ail8neCulIhm+8z3kMFDcE+/Rxs/HICYtg1qokzcR8JJmDV5CjoYJBxEXFKFMnnB
 wKkfS5BAsTLqKZqH6MaI5qOyHE4ECY1XmkYT//TFZb0APmm+90B6xYR76FhtM8+toYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aXo02FO6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8972C81174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so8912045e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524229; x=1789129029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/vEw99bOP62eNHYPX2tUFtRhOGw4M4Eukf8mgCplI7E=;
 b=kW47bt83YTKNoGECnrYx+XUl13EVFr752ucNElvKmPRtSYLRK/I806VKC3n98K0baU
 +xCrVWwDry9dONUh/3Zzw6+FXBSrNfGGwOFU/CUgjnMDu4se8doRwJvN0szhrS047lPD
 k5MQFGp+Jv6H2HNoJzt5n4OH91+8mjbJzr4t1z14ZvSZsxLr9xDo8w0ZmFWNXPqAdEwV
 3/m1cOC0OZ5P0Jz3u94UqB40SarKporiKa9PCdBTV2zy83j+Akm3z2l6DteLUJZ2ntke
 g1svbOTalLRNwhvmshZa3B+7F4RzqgJAAWuiKwKWDZRNUs/nLX9rUqooyCneZOlr3c2e
 sd7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxR0IfW90jsN+7xGPoCc3BEE6GssTjy1fyltAgYl1ar1rJ1Q3tWhXckpvtJLWxOFnR2as7/0uo0Vyc=@buildroot.org
X-Gm-Message-State: AFuF++ktxl0Yd2hwO5EnqUJYF28uZpv2R32BhYUdjm5qEqCNgbktZjYh
 ZjepOUmgrqZn1xb1BlroAwZdIWbcIB7hrDboJq4W953POPBOSCP+3ziLU/i4HmHaGgthuVyU6l9
 Mi7HH
X-Gm-Gg: AYBFou0vBU523M01UYNl3uwsuytAI4gyaqF0m0WMSUJR+6I+7Zb2+7hT4G0QNtt0uUt
 ggZWBKtca1sJoxm5MIZUtIMb6UuUrq7priVz/5xU+mGybvYLnv5Gf1O9vBm1xdqrxBxu46TvDNn
 GngpliubLHaKE0fQz+pHS67hkLzExeBV4NA5Z1h+CPbAU4ZBYC+ZyTvAeLT6CeZVH6Czi4wXSXl
 aco5hgqeqPk3c5fd4Tp4XQ9+kIo5t/ekuOM9E7r9ztyYbj5iZRu1gMbmLMEw9gK2/OCxYbB3RkX
 9GWcgapkfdBO5tWvcXDsClLkQyGzPFPNgGN+JfYLcfQk8Bl2/hy4G4u7q7kWAJ29L6VGD+Hzf/N
 3/5Cz8QN2VN3E0myS5+ITvvEysYZAdrIoG+9vUATBC+LUOjw27Wn7qtNeEQnIwzk4W5d3O7qmwp
 4/lCiC1uBSsYs9JVHM2ptLNpn65LvGX3CbPhYNiDZ50DKGZgR+4VwF6A==
X-Received: by 2002:a05:600c:870f:b0:49c:fc6c:bdfb with SMTP id
 5b1f17b1804b1-49cfc6cbfb2mr27224995e9.18.1788524228766; 
 Fri, 04 Sep 2026 05:17:08 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf75ce49esm115016775e9.1.2026.09.04.05.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:08 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:07 +0200
Message-ID: <20260904121707.403347-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901171502.606159-1-titouan.christophe@mind.be>
References: <20260901171502.606159-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/libldns: add patch
 for CVE-2026-10846
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
> This fixes the following vulnerability:
> - CVE-2026-10846:
>     NLnet Labs ldns 1.2.0 up to and including versions 1.9.0, when used in
>     applications as (stub) resolver over UDP, lacks matching the query
>     destination address and port with the response source address and
>     port. Furthermore not the query ID, neither the question of the query
>     is matched with that of the response. This makes applications, that
>     use ldns for (stub) resolver functionality over UDP, vulnerable for
>     off-path poisoning attacks. The drill tool, which is shipped with
>     ldns, suffers from this vulnerability.
>     https://www.cve.org/CVERecord?id=CVE-2026-10846
>     https://www.nlnetlabs.nl/downloads/ldns/CVE-2026-10846.txt
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/libldns/0001-fix-cve-2026-10846.patch | 225 ++++++++++++++++++
>  package/libldns/libldns.mk                    |   3 +
>  2 files changed, 228 insertions(+)
>  create mode 100644 package/libldns/0001-fix-cve-2026-10846.patch
> 
> diff --git a/package/libldns/0001-fix-cve-2026-10846.patch b/package/libldns/0001-fix-cve-2026-10846.patch
> new file mode 100644
> index 0000000000..989cd7c958
> --- /dev/null
> +++ b/package/libldns/0001-fix-cve-2026-10846.patch
> @@ -0,0 +1,225 @@
> +From f179ebe97b0c7309edb87a14d6f73119dbecb708 Mon Sep 17 00:00:00 2001
> +From: Titouan Christophe <titouan.christophe@mind.be>
> +Date: Tue, 1 Sep 2026 19:09:47 +0200
> +Subject: [PATCH] Fix CVE-2026-10846
> +
> +== Summary
> +When ldns is used by applications for (stub) resolving, it does not
> +sufficiently verify that received responses belong to a sent query.
> +
> +== Affected products
> +ldns 1.2.0 up to and including 1.9.0
> +
> +== Description
> +NLnet Labs ldns 1.2.0 up to and including versions 1.9.0, when used in
> +applications as (stub) resolver over UDP, lacks matching the query destination
> +address and port with the response source address and port. Furthermore not the
> +query ID, neither the question of the query is matched with that of the
> +response. This makes applications, that use ldns for (stub) resolver
> +functionality, vulnerable for off-path poisoning attacks.
> +
> +The drill tool, which is shipped with ldns and uses ldns for stub resolving,
> +inherently suffers from this vulnerability too.
> +
> +== Solution
> +Download a patched version of ldns, or apply the patch manually
> +
> +CVE: CVE-2026-10846
> +Upstream: https://nlnetlabs.nl/downloads/ldns/patch_cve_2026-10846.diff
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + error.c      |  8 +++++
> + ldns/error.h |  6 +++-
> + net.c        | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> + 3 files changed, 103 insertions(+), 3 deletions(-)
> +
> +diff --git a/error.c b/error.c
> +index 50cdc630..4fc05d6d 100644
> +--- a/error.c
> ++++ b/error.c
> +@@ -189,6 +189,14 @@ ldns_lookup_table ldns_error_str[] = {
> + 	{ LDNS_STATUS_EDE_OPTION_MALFORMED,
> + 		"The extended error code option is malformed, expected "
> + 		"at least 2 bytes of option data" },
> ++	{ LDNS_STATUS_EQUAL_RR,
> ++		"An identical RR already existed in the zone" },
> ++	{ LDNS_STATUS_ID_DID_NOT_MATCH,
> ++		"Response ID did not match the query ID" },
> ++	{ LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
> ++		"The query section MUST contain exactly one question" },
> ++	{ LDNS_STATUS_QUERY_DID_NOT_MATCH,
> ++		"The question in the response did not match the query" },
> + 	{ 0, NULL }
> + };
> + 
> +diff --git a/ldns/error.h b/ldns/error.h
> +index 011df284..41d64cc0 100644
> +--- a/ldns/error.h
> ++++ b/ldns/error.h
> +@@ -143,7 +143,11 @@ enum ldns_enum_status {
> + 	LDNS_STATUS_SVCPARAM_KEY_MORE_THAN_ONCE,
> + 	LDNS_STATUS_INVALID_SVCPARAM_VALUE,
> + 	LDNS_STATUS_NOT_EDE,
> +-	LDNS_STATUS_EDE_OPTION_MALFORMED
> ++	LDNS_STATUS_EDE_OPTION_MALFORMED,
> ++	LDNS_STATUS_EQUAL_RR,
> ++	LDNS_STATUS_ID_DID_NOT_MATCH,
> ++	LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
> ++	LDNS_STATUS_QUERY_DID_NOT_MATCH
> + };
> + typedef enum ldns_enum_status ldns_status;
> + 
> +diff --git a/net.c b/net.c
> +index 8fc9c8c4..100226d4 100644
> +--- a/net.c
> ++++ b/net.c
> +@@ -441,6 +441,50 @@ ldns_udp_bgsend2(ldns_buffer *qbin,
> + 	return ldns_udp_bgsend_from(qbin, to, tolen, NULL, 0, timeout);
> + }
> + 
> ++/** helper sockaddr compare function. returns -1, 0 or 1. */
> ++static int
> ++ldns_sockaddr_cmp(const struct sockaddr_storage* addr1, socklen_t len1,
> ++	const struct sockaddr_storage* addr2, socklen_t len2)
> ++{
> ++	struct sockaddr_in* p1_in = (struct sockaddr_in*)addr1;
> ++	struct sockaddr_in* p2_in = (struct sockaddr_in*)addr2;
> ++	struct sockaddr_in6* p1_in6 = (struct sockaddr_in6*)addr1;
> ++	struct sockaddr_in6* p2_in6 = (struct sockaddr_in6*)addr2;
> ++	if(len1 < len2)
> ++		return -1;
> ++	if(len1 > len2)
> ++		return 1;
> ++	assert(len1 == len2);
> ++	if( p1_in->sin_family < p2_in->sin_family)
> ++		return -1;
> ++	if( p1_in->sin_family > p2_in->sin_family)
> ++		return 1;
> ++	assert( p1_in->sin_family == p2_in->sin_family );
> ++	/* compare ip4 */
> ++	if( p1_in->sin_family == AF_INET ) {
> ++		/* just order it, ntohs not required */
> ++		if(p1_in->sin_port < p2_in->sin_port)
> ++			return -1;
> ++		if(p1_in->sin_port > p2_in->sin_port)
> ++			return 1;
> ++		assert(p1_in->sin_port == p2_in->sin_port);
> ++		return memcmp(&p1_in->sin_addr, &p2_in->sin_addr,
> ++			sizeof(p1_in->sin_addr));
> ++	} else if (p1_in6->sin6_family == AF_INET6) {
> ++		/* just order it, ntohs not required */
> ++		if(p1_in6->sin6_port < p2_in6->sin6_port)
> ++			return -1;
> ++		if(p1_in6->sin6_port > p2_in6->sin6_port)
> ++			return 1;
> ++		assert(p1_in6->sin6_port == p2_in6->sin6_port);
> ++		return memcmp(&p1_in6->sin6_addr, &p2_in6->sin6_addr,
> ++			sizeof(p1_in6->sin6_addr));
> ++	} else {
> ++		/* eek unknown type, perform this comparison for sanity. */
> ++		return memcmp(addr1, addr2, len1);
> ++	}
> ++}
> ++
> + static ldns_status
> + ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
> + 		const struct sockaddr_storage *to  , socklen_t tolen,
> +@@ -449,6 +493,8 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
> + {
> + 	int sockfd;
> + 	uint8_t *answer;
> ++	struct sockaddr_storage reply_addr;
> ++	socklen_t reply_addr_len;
> + 
> + 	sockfd = ldns_udp_bgsend_from(qbin, to, tolen, from, fromlen, timeout);
> + 
> +@@ -467,13 +513,21 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
> +          * but returns a 'NETWORK_ERROR' much like a timeout. */
> +         ldns_sock_nonblock(sockfd);
> + 
> +-	answer = ldns_udp_read_wire(sockfd, answer_size, NULL, NULL);
> ++	reply_addr_len = sizeof(reply_addr);
> ++	memset(&reply_addr, 0, reply_addr_len);
> ++	answer = ldns_udp_read_wire(sockfd, answer_size, &reply_addr,
> ++		&reply_addr_len);
> + 	close_socket(sockfd);
> + 
> + 	if (!answer) {
> + 		/* oops */
> + 		return LDNS_STATUS_NETWORK_ERR;
> + 	}
> ++	/* Check that the reply came from the to addr. */
> ++	if(ldns_sockaddr_cmp(to, tolen, &reply_addr, reply_addr_len) != 0) {
> ++		free(answer);
> ++		return LDNS_STATUS_NETWORK_ERR;
> ++	}
> + 
> + 	*result = answer;
> + 	return LDNS_STATUS_OK;
> +@@ -512,6 +566,10 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
> + 
> + 	assert(r != NULL);
> + 
> ++	/* The query should at least have one question */
> ++	if(ldns_buffer_limit(qb) < 6 || ldns_buffer_read_u16_at(qb, 4) != 1)
> ++		return LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
> ++
> + 	status = LDNS_STATUS_OK;
> + 	rtt = ldns_resolver_rtt(r);
> + 	ns_array = ldns_resolver_nameservers(r);
> +@@ -599,6 +657,16 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
> + 			ldns_resolver_set_nameserver_rtt(r, i, LDNS_RESOLV_RTT_INF);
> + 			status = send_status;
> + 		}
> ++		if(reply_bytes && ldns_buffer_limit(qb) >= 2) {
> ++			uint16_t txid = ldns_buffer_read_u16_at(qb, 0);
> ++			if(reply_size < 2 ||
> ++				ldns_read_uint16(reply_bytes) != txid) {
> ++				status = LDNS_STATUS_ID_DID_NOT_MATCH;
> ++				LDNS_FREE(reply_bytes);
> ++				reply_bytes = NULL;
> ++				reply_size = 0;
> ++			}
> ++		}
> + 		
> + 		/* obey the fail directive */
> + 		if (!reply_bytes) {
> +@@ -608,7 +676,7 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
> + 					LDNS_FREE(src);
> + 				}
> + 				LDNS_FREE(ns);
> +-				return LDNS_STATUS_ERR;
> ++				return status ? status : LDNS_STATUS_ERR;
> + 			} else {
> + 				LDNS_FREE(ns);
> + 				continue;
> +@@ -670,6 +738,26 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
> + #endif /* HAVE_SSL */
> + 
> + 	LDNS_FREE(reply_bytes);
> ++	if (reply) {
> ++		ldns_pkt *query = NULL;
> ++
> ++		if(ldns_pkt_qdcount(reply) != 1) {
> ++			status = LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
> ++			ldns_pkt_free(reply);
> ++			reply = NULL;
> ++
> ++		} else if(ldns_wire2pkt(&query
> ++		                , ldns_buffer_begin(qb)
> ++		                , ldns_buffer_position(qb)) != LDNS_STATUS_OK
> ++		|| ldns_pkt_qdcount(query) != 1
> ++		|| ldns_rr_compare(ldns_rr_list_rr(ldns_pkt_question(query),0)
> ++		                  ,ldns_rr_list_rr(ldns_pkt_question(reply),0))){
> ++			status = LDNS_STATUS_QUERY_DID_NOT_MATCH;
> ++			ldns_pkt_free(reply);
> ++			reply = NULL;
> ++		}
> ++		ldns_pkt_free(query);
> ++	}
> + 	if (result) {
> + 		*result = reply;
> + 	}
> +-- 
> +2.55.0
> +
> diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
> index 0740d09fab..81ac03b173 100644
> --- a/package/libldns/libldns.mk
> +++ b/package/libldns/libldns.mk
> @@ -23,6 +23,9 @@ LIBLDNS_CONF_OPTS = \
>  	--without-pyldns \
>  	--without-pyldnsx
>  
> +# 0001-fix-cve-2026-10846.patch
> +LIBLDNS_IGNORE_CVES += CVE-2026-10846
> +
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  LIBLDNS_CONF_OPTS += --enable-dane-verify
>  else
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
