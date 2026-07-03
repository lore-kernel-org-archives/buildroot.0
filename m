Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE01C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A05412BA;
	Fri,  3 Jul 2026 14:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkMwDKm12a1Y; Fri,  3 Jul 2026 14:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1A9412B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089153;
	bh=avePcxNHVvvoyeCA1ODptpZzG//QMtTPzUW90HRmwc0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KbeSGMHCIMYg5u+qkkyPbBg1iSWw1tulCXdddN9Pwn5E6gsXhClx+a2ICdBUcyfxr
	 ztHOfnYkvDqStOn9Xq/07K1Qyd/g1LWG5iljCw2sRmxrocrDi7MXMXPLv5+/kpJ+Xy
	 vtJos2TS7oSiiPkYuO4aD6enj+CIPiWNm8HQXsUwQcDVNCMLUFsqaxi7uJ+9tbPqJb
	 UbrjySie2FyIukvsRQbV6jErvFfXp7ZSFrWUyhmgEsPjvcMzaAtjE9NwTsQN/Bntd9
	 cLv7QKDv6U1zJmbu38AUPbumuS3CYunvmQU2RGTaC1Is1L7suscvZxHaT8Fe8lQEzW
	 AajBKkZVgYQvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1A9412B3;
	Fri,  3 Jul 2026 14:32:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36EC6363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5C94008F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65PqDfgWCQ9I for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04B5540420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B5540420
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04B5540420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-479b7aada85so659170f8f.1
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089149; x=1783693949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OR6rZz3jWR1DPfpwt425ii738V6AanyPJcSFrcjiEHE=;
 b=piOgOrmiFBDhGj9tGisIXT+7l6BGOu8oiNP56p8ocMyarOUx0fvNE2990fYgm1c/uJ
 WoY1bvTTwhCnXLU5rLGgh+jrG2y7Kn6koSg58oMGZtwOuYX1DK9Mlt/XD6qg19YHvPOU
 MNDhtApmIBbOrqk74P2xUzZpwLO8+bWWmQkRkCl/X7DQDoSeA0TJIbuQx3g+xs5CEx4G
 h2CaKOD3/4nLD4kZARGdKYgT44U/uT/Az+wEpCf4h2N4pdYYlXooGi7ve4rgf7AXeE2N
 Ko2aYgotTiVCLBoCOsWA0JawngPn7gXGYrOiQbS1dVI7+iEpRbW0QIEIRoF96jVaK+JM
 hvBw==
X-Gm-Message-State: AOJu0YwJZcyRhLQtXFSiC8xyCL8ngeHtonIRhsyn+wQqNWcbHZ7L3OhF
 E9hRWKZmIMoqOnytY+UPbxMvZfG8XAzxMob/NdED84BVox0oahZJWcQtoTY/3bUbCU0=
X-Gm-Gg: AfdE7cmj9qLRZQPH8zmFBmBQh1Hdcx73NXv2hRW7T1rGrQ9IDL5QFdW9GzxpAjBiHXa
 Xj0MPkpEEWVAGvVNQt3IK+ytky9v08K8cwxBNhre4e1xaJbGT5PIbUaJ0kDEqmQgmCzCYmBH3yp
 zILtaPk04niU9O0KJ1cMlMviurQlUIRBuTTvB3RY2r+/yDR86kBIODfENLZevAjsIDc3WpFPVnS
 qcqloVpBgB8NCKa2L10M1+6iT/ECAyHB11iUAZ6tqsEWZY/pLb0HZxbPEckAbc3SohMXUO3z5kU
 I9+KgbBEGakHK9ERtWWj88cD1w4y9ZeZ9vWjlvt2j1edaqckoh0l9PEL8OCYjTrU82mt5NXSOlN
 FSv7C6MKLH7u5TpRg5mNK5J79frtmHx3f2agA8oLpqspxUUOZ0GiFmkxEkBo2p7TEPPuo2nptOX
 I5jWlo
X-Received: by 2002:a05:6000:1788:b0:474:6a5b:85f8 with SMTP id
 ffacd0b85a97d-477b34b05d3mr14520486f8f.6.1783089148834; 
 Fri, 03 Jul 2026 07:32:28 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dd0b1sm18632631f8f.35.2026.07.03.07.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:27 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:26 +0200
Message-ID: <20260703143226.274772-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260626082852.96329-2-thomas.perale@mind.be>
References: <20260626082852.96329-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089149; x=1783693949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OR6rZz3jWR1DPfpwt425ii738V6AanyPJcSFrcjiEHE=;
 b=eTrUpV+dMGWQZloFSguyGhLSxnjBbGcrm8mvhWMhyO8W7Rtrt98jgLbipDYa9R0QAy
 PimTCsavidVAiQQJ8tcr+JdLxnXCIz8zK8OvcT5plH+5b9tMJRhG46YqEBZdkz9IkWlp
 tkB/6rQpFr2iJ3RRMWlCqFslM4deeH9lz+SwKcNiL0eIqJ06NrH2AzWs1my3/lyIrRO8
 D0G0FVbQZKvGuN+vn+Wj06u89AEK+0Jpm98KhNdeMnwlAYB0EP6PouNL/nfUSnXjP9e2
 KPZfbXeWBATHZSYcQQe8EQnsMYJS2WQjm9jpS2JvwnWDrt+5wpDr3b+jvFTonEX2ItUz
 8C8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eTrUpV+d
Subject: Re: [Buildroot] [PATCH 2025.02.x 2/4] package/squid: backport patch
 for CVE-2026-33526
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
> - CVE-2026-33526:
>     Squid is a caching proxy for the Web. Prior to version 7.5, due to
>     heap Use-After-Free, Squid is vulnerable to Denial of Service when
>     handling ICP traffic. This problem allows a remote attacker to perform
>     a reliable and repeatable Denial of Service attack against the Squid
>     service using ICP protocol. This attack is limited to Squid
>     deployments that explicitly enable ICP support (i.e. configure non-
>     zero `icp_port`). This problem _cannot_ be mitigated by denying ICP
>     queries using `icp_access` rules. Version 7.5 contains a patch.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-33526
>   - https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/squid/0004-CVE-2026-33526.patch | 34 +++++++++++++++++++++++++
>  package/squid/squid.mk                  |  3 +++
>  2 files changed, 37 insertions(+)
>  create mode 100644 package/squid/0004-CVE-2026-33526.patch
> 
> diff --git a/package/squid/0004-CVE-2026-33526.patch b/package/squid/0004-CVE-2026-33526.patch
> new file mode 100644
> index 0000000000..572a0197cb
> --- /dev/null
> +++ b/package/squid/0004-CVE-2026-33526.patch
> @@ -0,0 +1,34 @@
> +From 8a7d42f9d44befb8fcbbb619505587c8de6a1e91 Mon Sep 17 00:00:00 2001
> +From: Joshua Rogers <megamansec@gmail.com>
> +Date: Tue, 10 Feb 2026 19:58:49 +0000
> +Subject: [PATCH] Do not escape malformed URI twice when sending ICP errors
> + (#2374)
> +
> +In this context, escaping escaped URI always produces incorrect URI
> +because `%` character in the escaped URI gets escaped again. Feeding the
> +result of the first rfc1738_escape() call to the second call is also
> +dangerously wrong because the result of the first call gets invalidated
> +during the second call.
> +
> +No other cases of such "chained" rfc1738_escape() calls were found.
> +
> +Broken since 2002 commit e6ccf245.
> +Upstream: https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
> +CVE: CVE-2026-33526
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/icp_v2.cc | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/src/icp_v2.cc b/src/icp_v2.cc
> +index 2a4ced3bfab..25f7b71d25e 100644
> +--- a/src/icp_v2.cc
> ++++ b/src/icp_v2.cc
> +@@ -490,7 +490,6 @@ HttpRequest *
> + icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
> + {
> +     if (strpbrk(url, w_space)) {
> +-        url = rfc1738_escape(url);
> +         icpCreateAndSend(ICP_ERR, 0, rfc1738_escape(url), reqnum, 0, fd, from, nullptr);
> +         return nullptr;
> +     }
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 4a56e32e59..e072ec6137 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -21,6 +21,9 @@ SQUID_IGNORE_CVES += CVE-2025-62168
>  # 0003-CVE-2026-33515.patch
>  SQUID_IGNORE_CVES += CVE-2026-33515
>  
> +# 0004-CVE-2026-33526.patch
> +SQUID_IGNORE_CVES += CVE-2026-33526
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
