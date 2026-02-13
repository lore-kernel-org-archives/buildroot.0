Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92344EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64419422BE;
	Fri, 13 Feb 2026 19:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gy1A4oVvbsdf; Fri, 13 Feb 2026 19:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72938422BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011626;
	bh=niHxuM9Avi+9VP+kAhubqCnRdqmXayhWbSss8OVvhIs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q7tw9vdbLxCyjCzsH0ls5Rm1NEs4+OergD74XGSiMqeqGpjvTYpYackDc02KpCO6F
	 Z3eiRKuCuiCBFpSpcVDbGnSqY8S7gNiDAJvmX8acU6b3pnnm+xlWHYsBeZb+H8miK1
	 9YvGFw4A1wq2YM+JjISz0kQ/CtgfN15eGSVDCw35kpck3Yzml2B+AAuTGNV0RAySBC
	 5c55rapVbnn6NeprYLeTn0E7CEKWsF9VJjD8voSJ0QFmqlMhFHUepOV0dL/WvoKKG5
	 UKJN6VFpBAorJPzKAARPBKIyBkPjJULsG/3daLOloOSpkmh4algfOYKdKmlqOr1gOT
	 ujr92MxPRVtog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72938422BF;
	Fri, 13 Feb 2026 19:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B3E269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BAD412F9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_dM-lILF9Qr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A3FD412D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3FD412D0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A3FD412D0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1436323f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011474; x=1771616274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NCGfkrno/N5iFeWokC17ABIXSmAtBsoqb7EUqS092JE=;
 b=U+ODD2evQL9O6BGq+gK8WILWRN7mmqnH9aqxdWTKOjvz7oNq5SO2vhHxBz4h/TM1eK
 q9ICNkhEz88lKFGyavSG5IFgIfvPuJHUKLv4KDQ4OZt72hArkc9Zo3oEYcIvZFk7Pxu8
 Cgf6hOBE1ByEFjrhyPd8gMTIAnAOFp36kokOywzelJmyOXvddMifKKX4NBeuysbHNg7O
 QahEWiDZxyJTj8pZytB2nJUOiV0DD2JjAH+AW7MiMIVRJRxKptqabYamn3hkaAlOTEFO
 N6JisUJYIJiddi2BdymtS4+sPDKYLntmXnrL/OSSXtZ45dfqcbZK1HbGFjrtQrdcWOm9
 fqWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHcjExvNRA764oSWVLWSKXM4ae7FRP4Uks6+R4HXr1e6mcThvOlP+QX7JjPmTNpdzp///UCbDWtI=@buildroot.org
X-Gm-Message-State: AOJu0YxDh1bxPQpDCFHD3rOf24iYrNCDm2ghPnFa6aBN0Au9Zv/gIZen
 L1V47DwwYL+v5AoBAOiFOLc+1QK6KlZbpvHW2xQY2Q+HpBLq6MJFh+by6HGMe6LPW18=
X-Gm-Gg: AZuq6aIIrQfDEAkkg8EuNQnaQ+USJ6YMdK9XijNbgtl0Bj3iihLaiq8pGS/GTlR0B6y
 llLyT/guQ8+uVbkVWY9XroTTZ9FGN7wnHnAjR3pX50NprtQJ20zTKAzbtUNzd1Rwo4JldlolEoT
 jSv10CHaVOKUCco/s4bOQeejMsuM3+XZNVDp+fq0S7WzkZBYJY1mjCg5JSIVNMiCYGRHgrH1wVj
 PiK+1W+PjipHmukptGM6t5zYtH4y8afs8STeCi+uIKeiHV+fDPGEssV1+smwnFgcJW9W1Du5UaT
 aqScxwK3qwlsNZISIVCNWIMpXss6zlxOUu1JSPrhi3xRbqZ+95EiFC+Y68IFXhxYPxePu+Obu4Z
 OhaPss0rziFweyylFu1K/6zDAmfe/LcZ18NgMxg6XbgRFcp4ESgMVUlMqeegN3uJexgaMxGm3cy
 8fYgsSUJ+z+r7ydF3rBoAbF5If7A==
X-Received: by 2002:a05:600c:34c6:b0:483:6ff1:18b with SMTP id
 5b1f17b1804b1-483737bde90mr44962795e9.0.1771011474465; 
 Fri, 13 Feb 2026 11:37:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d994670sm174975745e9.4.2026.02.13.11.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:53 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:53 +0100
Message-ID: <20260213193753.40949-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aXOBc0KVRl7qTTrK@waldemar-brodkorb.de>
References: <aXOBc0KVRl7qTTrK@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011474; x=1771616274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCGfkrno/N5iFeWokC17ABIXSmAtBsoqb7EUqS092JE=;
 b=DSd4Qd6KJDN3wfZEl8uI9GL27tlpXQ75QnzmAUgd98D3+DTfP5oA29uD4eFq1gmD4e
 r/7uWkPBZk4DzxtWtUvwlxE3E6HsSjpllpq2Hv3uzRd1tTpdP87pYegSDnjaKGbsBjYs
 X2ShhssTOpmv6KTUz1djPEqAZB+YY7gCQmjtg6HnbOzRd3awm37DUaGPp2gnzr/tWQlJ
 0nPfBxEqD0nkJUXa+6GPJBxm6X+acjga2IqnIrJL39UvwJ3mnMUeIpRMrsCojAjqh352
 TFepz1j79Qne1mS1gc9HB/uh6yRefisscZPQ3EQ985zgQjPmsmDS0WLdnMe3qohLLc/h
 C9Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DSd4Qd6K
Subject: Re: [Buildroot] [PATCH 1/2 v2] package/strongswan: fix security
 related bug
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
> Add patch for CVE-2025-62291.
> https://nvd.nist.gov/vuln/detail/CVE-2025-62291
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...001-eap_mschapv2_failure_request_len.patch | 46 +++++++++++++++++++
>  package/strongswan/strongswan.mk              |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> 
> diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> new file mode 100644
> index 0000000000..8442cc7816
> --- /dev/null
> +++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> @@ -0,0 +1,46 @@
> +From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Thu, 9 Oct 2025 11:33:45 +0200
> +Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
> + the client
> +
> +For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
> +`message_len` to become negative, which is then used in calls to malloc()
> +and memcpy() that both take size_t arguments, causing an integer
> +underflow.
> +
> +For 6 and 7, the huge size requested from malloc() will fail (it exceeds
> +PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
> +fault in memcpy().
> +
> +However, for 8, the allocation is 0, which succeeds.  But then the -1
> +passed to memcpy() causes a heap-based buffer overflow (and possibly a
> +segmentation fault when attempting to read/write that much data).
> +Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
> +Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
> +overflow and causes the daemon to get aborted immediately instead.
> +
> +Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
> +Fixes: CVE-2025-62291
> +Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> +index 21cc95a6a360..35faad2e0bb5 100644
> +--- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> ++++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
> +@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
> + 	data = in->get_data(in);
> + 	eap = (eap_mschapv2_header_t*)data.ptr;
> + 
> +-	if (data.len < 3) /* we want at least an error code: E=e */
> ++	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
> + 	{
> + 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
> + 		return FAILED;
> +-- 
> +2.43.0
> +
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 9719242327..c0147c00df 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -12,6 +12,7 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
>  STRONGSWAN_CPE_ID_VENDOR = strongswan
>  STRONGSWAN_DEPENDENCIES = host-pkgconf
>  STRONGSWAN_INSTALL_STAGING = YES
> +STRONGSWAN_IGNORE_CVES += CVE-2025-62291
>  STRONGSWAN_CONF_OPTS += \
>  	--without-lib-prefix \
>  	--enable-led \
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
