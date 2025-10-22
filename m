Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3EDCCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6DEC40D15;
	Wed, 22 Oct 2025 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPPh4EdjnJxT; Wed, 22 Oct 2025 16:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDC2B40ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDC2B40ABF;
	Wed, 22 Oct 2025 16:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 808D943F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67468614E5
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aU3bGj1YKkv4 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D066614DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D066614DE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D066614DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B9D0B979192; Wed, 22 Oct 2025 18:43:21 +0200 (CEST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:19 +0200
Message-ID: <20251022164319.286436-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009191708.3411-1-thomas.perale@mind.be>
References: <20251009191708.3411-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151401; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=6zM4dE2roSBfMzz6exDkMpmoPJ7KW/jSbW5ZCPHe0Yo=;
 b=WSPt5eJST0nBFeXQPEhi/WZkV9vw/OAhqgoiDh+x7finZbVKDvr1N63nAb0uo1kTUeDl5e
 KUSueg8nAurW7wWCYh5O+pP//inzMkybz2eL4dWoEjx97fJ5733vPPRmBuo7yvZvOTFIhA
 U68igT9tXvZpcE7oJdWwXvBT1xOuzo/ioK6OalBqpDJLBPF5IJzwvN8KEid2zZ+8AEHfen
 zf8P7f04MrYumgNNYgmkXal0fpYcLidVr/RQ0azXuNXQiqhsOkoq+XkRgMVDd3QJXiGD6d
 SIjmQ/h122OxsqmDzszjlTt3nVnySjuTxAwAxfwGCtfJcg1d7bE9QA3LJH/HwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WSPt5eJS
Subject: Re: [Buildroot] [PATCH] package/squid: add patch for CVE-2025-59362
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-59362
> 
>     Squid through 7.1 mishandles ASN.1 encoding of long SNMP OIDs. This
>     occurs in asn_build_objid in lib/snmplib/asn1.c.
> 
> For more information, see:
> 
> - https://nvd.nist.gov/vuln/detail/CVE-2025-59362
> - https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  ...Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch | 52 +++++++++++++++++++
>  package/squid/squid.mk                        |  4 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> 
> diff --git a/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> new file mode 100644
> index 0000000000..695ba0255e
> --- /dev/null
> +++ b/package/squid/0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> @@ -0,0 +1,52 @@
> +From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
> +From: Alex Rousskov <rousskov@measurement-factory.com>
> +Date: Sat, 30 Aug 2025 06:49:36 +0000
> +Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
> +
> +Upstream: https://github.com/squid-cache/squid/commit/250a18e0a80694b919972a1836cdfe20f2e1baa0
> +CVE: CVE-2025-59362
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + lib/snmplib/asn1.c | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
> +index 81f2051fbe7..2852c26b220 100644
> +--- a/lib/snmplib/asn1.c
> ++++ b/lib/snmplib/asn1.c
> +@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
> +      * lastbyte ::= 0 7bitvalue
> +      */
> +     u_char buf[MAX_OID_LEN];
> ++    u_char *bufEnd = buf + sizeof(buf);
> +     u_char *bp = buf;
> +     oid *op = objid;
> +     int asnlength;
> +@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
> +     while (objidlength-- > 0) {
> +         subid = *op++;
> +         if (subid < 127) {  /* off by one? */
> ++            if (bp >= bufEnd) {
> ++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
> ++                return (NULL);
> ++            }
> +             *bp++ = subid;
> +         } else {
> +             mask = 0x7F;    /* handle subid == 0 case */
> +@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
> +                 /* fix a mask that got truncated above */
> +                 if (mask == 0x1E00000)
> +                     mask = 0xFE00000;
> ++                if (bp >= bufEnd) {
> ++                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
> ++                    return (NULL);
> ++                }
> +                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
> +             }
> ++            if (bp >= bufEnd) {
> ++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
> ++                return (NULL);
> ++            }
> +             *bp++ = (u_char) (subid & mask);
> +         }
> +     }
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index b021170d9b..d445f005b7 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -11,6 +11,10 @@ SQUID_LICENSE = GPL-2.0+
>  SQUID_LICENSE_FILES = COPYING
>  SQUID_CPE_ID_VENDOR = squid-cache
>  SQUID_SELINUX_MODULES = apache squid
> +
> +# 0001-Fix-ASN-1-encoding-of-long-SNMP-OIDs.patch
> +SQUID_IGNORE_CVES += CVE-2025-59362
> +
>  SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  SQUID_CONF_ENV = \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
