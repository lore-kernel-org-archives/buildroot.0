Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25586FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BE1405FB;
	Thu, 26 Feb 2026 20:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofAC44mfYuEp; Thu, 26 Feb 2026 20:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D1740791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138845;
	bh=2myenw7HosEX4/Mz11sgRc77oraYyhnS8wcehY/4mjw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dEre7A2wX3hlhJaijQg/fAJDTTD8PR5J6ElYTk0zZSJBWYeabSsbIMmbZxFAOTV93
	 cwEa657gQwNbkAZbFCnlBFFoYBBayh5RsbriJL3kyE/h3ChJwONMVA4DnpvzfEq+wJ
	 cXYvulG2KvLIsF3GBSV5r4RFZORm4XVmUXfXy+sxt0766FQg9d8oSZV80KhnXGWrtw
	 zjNC+r9RjHJ+r/9TxHXlFfHipBfp9Z9s4IneHjMLuejNx1girt7kHbhxIOWSexrNC0
	 T3mxZc7kOCNYO0GFog15WBl3HPhGJ0rHXyoayz4M0Ow0N7kODVeES4cHP7wmVrIQQS
	 9UWi6K/vNq8TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D1740791;
	Thu, 26 Feb 2026 20:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EBE623D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B1F4076A
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHRkDhz0dUnt for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FBB840600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FBB840600
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FBB840600
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4837634de51so5930075e9.1
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138832; x=1772743632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OA9414rURgynLr/Tc5TTnI4hMZwuDURb9MOyNeynp+g=;
 b=oJkaBNmoiAcE+zM3Pzgb/3joKc7qaiSsRxkypEhoqV53V+QFzumn+4FqBEnJvA9dp3
 Ct3T3w9Mosk0USi+CLK93u/NAL/Gw0A7i98UIdwEXkMgQUw/5zzvl4g5DwGT+egPFDt2
 sXRY0udgrwHf55PJoHJXQe2OMYDMDEGFwSnyhJd6IrZ367IO8ZfGY5xN2go7h9CbJ0OE
 mLT3FuauiQYr4A8A4OHPpjdRdaRb57w1ClH+1ZeILPbEZd3SblUjwU+H9Qt2GLjA38i0
 qGDq2LI9J7b1x0SE7qURrmWxeGU/cayuU+Rg1ID3BJQDXS7F/3hsXHrs8N/R9yDYFNmS
 CoFg==
X-Gm-Message-State: AOJu0YyJOuyCHG/QumkIv4O5/OcN2h+7UUgC69I3RUvIYbXYJ1n4HiBE
 UKwx5gXOD/mxhoc4li3+oGnV1BL2eH61mqD9tjFKJQ6k8nZ2tJKF7ENK4bDZjUdZTJ2vYe9undW
 R0GYW
X-Gm-Gg: ATEYQzxnucIUJ9EMLwpUeYmZahfNDgYFJtmtlKnLPOAnFMtbovyfAKhQMjrZ0czpj0i
 qdxEtrsrrks44nZDjjY7ooMFkqi/xE1h66eySVsXjAUjncfFHgRBx/a0TsIjMEnhsjn6kwz7mwI
 mqg4gBiqs2KzUkEzb5d44mKGlMWt2UueyszmgaTNstj/JP04vxYg4Duq7WzQUaB9whsHab7YLSl
 96Lbl1GB8biSu3nN/dNlhR4ttjPOqQPLPIjGLWFYZGfdXC0ZsSq5PY+oqQA2bcoWXIxlHZ6ZJXC
 XMXpdw7A+Ja7qOHcXB9IynWETkwz6ymuJmR8uWLTypN55e+AtO1Qg4m/xiYdbLSxVWqiFSDs75A
 8iwf9b6nUcOAfVBwkK3SrLx8WE3cn2XXxs3v6n3otc7782NciECIniM8UVXVhz4kjh66Gz5xt9y
 b0Eou5VYouvt+NCxs=
X-Received: by 2002:a05:600c:1d0e:b0:483:acd9:bd18 with SMTP id
 5b1f17b1804b1-483c9bc55ecmr3200145e9.1.1772138832437; 
 Thu, 26 Feb 2026 12:47:12 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b7713csm56063755e9.11.2026.02.26.12.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:12 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:11 +0100
Message-ID: <20260226204711.254056-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260222203423.272780-1-thomas.perale@mind.be>
References: <20260222203423.272780-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138832; x=1772743632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OA9414rURgynLr/Tc5TTnI4hMZwuDURb9MOyNeynp+g=;
 b=Tz07HQc5jdL8/K5k6P5AdeaJ6L/t5u2jsFJdUl5fXIsCWHE1f0NruOnlmyntf7YLog
 OG4vk6Hd7mLiD7Ggx8/HSLfXnGOVAYV5w3jV8K9DG9GaAfaZeerUWWYf2UJQ1L4nEhci
 1+UTpgtUEAXwI+jgygPCL5VAlMNkYPHrTvK2HibLVjH5nQjvZ3V+o632aqBEok2S+kk1
 KDEnW5N6bY5mdMrG+zyr2glVOZhW3XM4+HDoHr66tz0GyDM+GgD6WkVnSREB3rbVQPz6
 nAM5xAdhgELO739Iq4c6OPBdY/hYOHXnzdUfekn9D0jTZGEH5hmf0GsBcdZGVPMbsX8u
 JRnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tz07HQc5
Subject: Re: [Buildroot] [PATCH 1/1] package/netsnmp: add patch for
 CVE-2025-68615
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
> Fixes the following security vulnerability:
> 
> - CVE-2025-68615:
>     net-snmp is a SNMP application library, tools and daemon. Prior to
>     versions 5.9.5 and 5.10.pre2, a specially crafted packet to an net-
>     snmp snmptrapd daemon can cause a buffer overflow and the daemon to
>     crash. This issue has been patched in versions 5.9.5 and 5.10.pre2.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-68615
>   - https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...d-Fix-out-of-bounds-trapOid-accesses.patch | 32 +++++++++++++++++++
>  package/netsnmp/netsnmp.mk                    |  2 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
> 
> diff --git a/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
> new file mode 100644
> index 0000000000..a937b53644
> --- /dev/null
> +++ b/package/netsnmp/0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
> @@ -0,0 +1,32 @@
> +From b4e6f826d9ddcc2d72eac432746807e1234266db Mon Sep 17 00:00:00 2001
> +From: Bart Van Assche <bvanassche@acm.org>
> +Date: Sun, 2 Nov 2025 14:48:55 -0800
> +Subject: [PATCH] snmptrapd: Fix out-of-bounds trapOid[] accesses
> +
> +Fixes: https://issues.oss-fuzz.com/issues/457106694
> +Fixes: https://issues.oss-fuzz.com/issues/458668421
> +Fixes: https://issues.oss-fuzz.com/issues/458876071
> +CVE: CVE-2025-68615
> +Upstream: https://github.com/net-snmp/net-snmp/commit/b4e6f826d9ddcc2d72eac432746807e1234266db
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + apps/snmptrapd_handlers.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/apps/snmptrapd_handlers.c b/apps/snmptrapd_handlers.c
> +index 6cd126f266..afd93ed0fb 100644
> +--- a/apps/snmptrapd_handlers.c
> ++++ b/apps/snmptrapd_handlers.c
> +@@ -1112,6 +1112,12 @@ snmp_input(int op, netsnmp_session *session,
> + 	     */
> +             if (pdu->trap_type == SNMP_TRAP_ENTERPRISESPECIFIC) {
> +                 trapOidLen = pdu->enterprise_length;
> ++                /*
> ++                 * Drop packets that would trigger an out-of-bounds trapOid[]
> ++                 * access.
> ++                 */
> ++                if (trapOidLen < 1 || trapOidLen > OID_LENGTH(trapOid) - 2)
> ++                    return 1;
> +                 memcpy(trapOid, pdu->enterprise, sizeof(oid) * trapOidLen);
> +                 if (trapOid[trapOidLen - 1] != 0) {
> +                     trapOid[trapOidLen++] = 0;
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index a79c13c611..1c7e406a4e 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -11,6 +11,8 @@ NETSNMP_LICENSE = Various BSD-like
>  NETSNMP_LICENSE_FILES = COPYING
>  NETSNMP_CPE_ID_VENDOR = net-snmp
>  NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
> +# 0004-snmptrapd-Fix-out-of-bounds-trapOid-accesses.patch
> +NETSNMP_IGNORE_CVES += CVE-2025-68615
>  NETSNMP_SELINUX_MODULES = snmp
>  NETSNMP_INSTALL_STAGING = YES
>  NETSNMP_CONF_ENV = \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
