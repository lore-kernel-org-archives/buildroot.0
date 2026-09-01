Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6DC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 17:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C974073C;
	Tue,  1 Sep 2026 17:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEE9LwZSJ0XB; Tue,  1 Sep 2026 17:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788282923;
	bh=/zH3yzB3KNKdFKkz1rrFrEbMverBGoTdNIvPtp5Ul4Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pRS85t8gYJ22P45JOKKDTo7byPiLLBJFyyApznO6gRRwtXU7uKUUv/tWs+ohlEG87
	 4NGdILhdxz1EdR1Ni06YCTcmyX/8VvSY6tMPWUjZavSmfEYn5OKcEbEDt6+pzMHwLI
	 KGqzHzhzJ9QxK7tZzWgqk5TqFllbquT3uv9VWXhEvPp6buiiUS7LidXw1qnulXSkjN
	 CzAKkVP2vfuAXk4AkSNdOIh56VJ1D98qsM+qCna5pG5jqt431YS8Q7jE5Yw2d5P5WZ
	 21GERCGWdavsekoFeziMSWVNp32b5KpFUXhoNGXh6u3UmA/mdgBIj6NGYQO+aZEn07
	 awC5dSRJA4cvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4AC40743;
	Tue,  1 Sep 2026 17:15:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A8A0279
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 17:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C3DB40743
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 17:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbVzUxdHRd1W for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 17:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD84D4073C
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 17:15:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49cca4ffdcfso237335e9.0
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 10:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788282917; x=1788887717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IaXwlTcBmfDxCFWGD9IhQbbKleuBqejjyka/qkvnqgE=;
 b=ekn2HMCr1j0BDbW+RDFla5fR+aIZCrvUPDiTWeReTzO41RaJBE3UVphQAXKONBKSbT
 Ct4rllOBJ2VIh+XrTWVpqHQN80p+v2DvUwCURDWU2vm7gapYRVlSBW/Up3/vmr+0akXW
 RpkQpcXe+l8K00vGypIX4l+N9/PLzYvGhlV5WrbTCXKA89TP60ckUqW1CJLYURe6zxei
 o78N4MMdMoIa5svdlse9StiDlV4OC/9Apj3ppMSh31na/JsmjzAFzsHwTk1LSCX7mv9W
 hDPhr5k/YYGPaMsAEwG8jr/HxoFmCjBJJlWNhUHyWdBnISjcuIFWS95jv/gCNlsBMhEU
 JN9A==
X-Gm-Message-State: AFuF++miMas9ep20Z2I/fREX0LmNGYJ3LJitJKio7qls5AY9kAWKZR5G
 p0RLRIlmBaflcn7TPbGyXXEmJfKFYq0gb8MNnCWThaqnKnECyhraduY2TbYmn9IWzVgla8FcSki
 vyGuD3Uk=
X-Gm-Gg: AR+sD100LhVc+mzKqxrWJIdkUw1724UMCbzF+NsHi6huOWtUUSvDCvY5AzBQ6RzjZcV
 lOTsokqkESELM2FrapsmXKS4pL1RzvkP32XnRkXSvwAceWoijRs+H6wzlSJr/qUnJiCyuxlstIC
 bVo2doGJfNb+zlgDuzyUkJYqkXsy/rGFdK9wDwEhCDzAegTTJCishJ/yWyby9RYCfwWYECDF334
 gQ9l5lyThH1HRuqihL6pQqajiNWIMdeSwAA9njFd3XM5EXuKuUpCgRtMy4E2ibL23hYpSyTaeqI
 IczydP0IZe3Gw+eYsc/5i3idoJT+z93S+tyW6z8FmsxDfysW0VYUS9NzkNgimrsiVuDWgnpFUzs
 Ivad6v09ICrKefF22srf+BK/rQZaq+VpH+Hp773IswZUDYkdzli+81XuJi1+lZLZCsA/NrHB36/
 Jx612Oyc/l9n/fURYf1PIYh6Ak3O5qqJyjHFEarpQJRVRidSYgmZVNGlvCdSYespnX+NWrKz7qm
 JCB
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id
 5b1f17b1804b1-49b91c4bab5mr415340435e9.12.1788282916936; 
 Tue, 01 Sep 2026 10:15:16 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7f8f9sm390396f8f.9.2026.09.01.10.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 10:15:16 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be,
	Titouan Christophe <titouan.christophe@mind.be>
Date: Tue,  1 Sep 2026 19:15:02 +0200
Message-ID: <20260901171502.606159-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/libldns: add patch for
 CVE-2026-10846
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2026-10846:
    NLnet Labs ldns 1.2.0 up to and including versions 1.9.0, when used in
    applications as (stub) resolver over UDP, lacks matching the query
    destination address and port with the response source address and
    port. Furthermore not the query ID, neither the question of the query
    is matched with that of the response. This makes applications, that
    use ldns for (stub) resolver functionality over UDP, vulnerable for
    off-path poisoning attacks. The drill tool, which is shipped with
    ldns, suffers from this vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2026-10846
    https://www.nlnetlabs.nl/downloads/ldns/CVE-2026-10846.txt

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libldns/0001-fix-cve-2026-10846.patch | 225 ++++++++++++++++++
 package/libldns/libldns.mk                    |   3 +
 2 files changed, 228 insertions(+)
 create mode 100644 package/libldns/0001-fix-cve-2026-10846.patch

diff --git a/package/libldns/0001-fix-cve-2026-10846.patch b/package/libldns/0001-fix-cve-2026-10846.patch
new file mode 100644
index 0000000000..989cd7c958
--- /dev/null
+++ b/package/libldns/0001-fix-cve-2026-10846.patch
@@ -0,0 +1,225 @@
+From f179ebe97b0c7309edb87a14d6f73119dbecb708 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Tue, 1 Sep 2026 19:09:47 +0200
+Subject: [PATCH] Fix CVE-2026-10846
+
+== Summary
+When ldns is used by applications for (stub) resolving, it does not
+sufficiently verify that received responses belong to a sent query.
+
+== Affected products
+ldns 1.2.0 up to and including 1.9.0
+
+== Description
+NLnet Labs ldns 1.2.0 up to and including versions 1.9.0, when used in
+applications as (stub) resolver over UDP, lacks matching the query destination
+address and port with the response source address and port. Furthermore not the
+query ID, neither the question of the query is matched with that of the
+response. This makes applications, that use ldns for (stub) resolver
+functionality, vulnerable for off-path poisoning attacks.
+
+The drill tool, which is shipped with ldns and uses ldns for stub resolving,
+inherently suffers from this vulnerability too.
+
+== Solution
+Download a patched version of ldns, or apply the patch manually
+
+CVE: CVE-2026-10846
+Upstream: https://nlnetlabs.nl/downloads/ldns/patch_cve_2026-10846.diff
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ error.c      |  8 +++++
+ ldns/error.h |  6 +++-
+ net.c        | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++--
+ 3 files changed, 103 insertions(+), 3 deletions(-)
+
+diff --git a/error.c b/error.c
+index 50cdc630..4fc05d6d 100644
+--- a/error.c
++++ b/error.c
+@@ -189,6 +189,14 @@ ldns_lookup_table ldns_error_str[] = {
+ 	{ LDNS_STATUS_EDE_OPTION_MALFORMED,
+ 		"The extended error code option is malformed, expected "
+ 		"at least 2 bytes of option data" },
++	{ LDNS_STATUS_EQUAL_RR,
++		"An identical RR already existed in the zone" },
++	{ LDNS_STATUS_ID_DID_NOT_MATCH,
++		"Response ID did not match the query ID" },
++	{ LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
++		"The query section MUST contain exactly one question" },
++	{ LDNS_STATUS_QUERY_DID_NOT_MATCH,
++		"The question in the response did not match the query" },
+ 	{ 0, NULL }
+ };
+ 
+diff --git a/ldns/error.h b/ldns/error.h
+index 011df284..41d64cc0 100644
+--- a/ldns/error.h
++++ b/ldns/error.h
+@@ -143,7 +143,11 @@ enum ldns_enum_status {
+ 	LDNS_STATUS_SVCPARAM_KEY_MORE_THAN_ONCE,
+ 	LDNS_STATUS_INVALID_SVCPARAM_VALUE,
+ 	LDNS_STATUS_NOT_EDE,
+-	LDNS_STATUS_EDE_OPTION_MALFORMED
++	LDNS_STATUS_EDE_OPTION_MALFORMED,
++	LDNS_STATUS_EQUAL_RR,
++	LDNS_STATUS_ID_DID_NOT_MATCH,
++	LDNS_STATUS_QDCOUNT_MUST_BE_ONE,
++	LDNS_STATUS_QUERY_DID_NOT_MATCH
+ };
+ typedef enum ldns_enum_status ldns_status;
+ 
+diff --git a/net.c b/net.c
+index 8fc9c8c4..100226d4 100644
+--- a/net.c
++++ b/net.c
+@@ -441,6 +441,50 @@ ldns_udp_bgsend2(ldns_buffer *qbin,
+ 	return ldns_udp_bgsend_from(qbin, to, tolen, NULL, 0, timeout);
+ }
+ 
++/** helper sockaddr compare function. returns -1, 0 or 1. */
++static int
++ldns_sockaddr_cmp(const struct sockaddr_storage* addr1, socklen_t len1,
++	const struct sockaddr_storage* addr2, socklen_t len2)
++{
++	struct sockaddr_in* p1_in = (struct sockaddr_in*)addr1;
++	struct sockaddr_in* p2_in = (struct sockaddr_in*)addr2;
++	struct sockaddr_in6* p1_in6 = (struct sockaddr_in6*)addr1;
++	struct sockaddr_in6* p2_in6 = (struct sockaddr_in6*)addr2;
++	if(len1 < len2)
++		return -1;
++	if(len1 > len2)
++		return 1;
++	assert(len1 == len2);
++	if( p1_in->sin_family < p2_in->sin_family)
++		return -1;
++	if( p1_in->sin_family > p2_in->sin_family)
++		return 1;
++	assert( p1_in->sin_family == p2_in->sin_family );
++	/* compare ip4 */
++	if( p1_in->sin_family == AF_INET ) {
++		/* just order it, ntohs not required */
++		if(p1_in->sin_port < p2_in->sin_port)
++			return -1;
++		if(p1_in->sin_port > p2_in->sin_port)
++			return 1;
++		assert(p1_in->sin_port == p2_in->sin_port);
++		return memcmp(&p1_in->sin_addr, &p2_in->sin_addr,
++			sizeof(p1_in->sin_addr));
++	} else if (p1_in6->sin6_family == AF_INET6) {
++		/* just order it, ntohs not required */
++		if(p1_in6->sin6_port < p2_in6->sin6_port)
++			return -1;
++		if(p1_in6->sin6_port > p2_in6->sin6_port)
++			return 1;
++		assert(p1_in6->sin6_port == p2_in6->sin6_port);
++		return memcmp(&p1_in6->sin6_addr, &p2_in6->sin6_addr,
++			sizeof(p1_in6->sin6_addr));
++	} else {
++		/* eek unknown type, perform this comparison for sanity. */
++		return memcmp(addr1, addr2, len1);
++	}
++}
++
+ static ldns_status
+ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+ 		const struct sockaddr_storage *to  , socklen_t tolen,
+@@ -449,6 +493,8 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+ {
+ 	int sockfd;
+ 	uint8_t *answer;
++	struct sockaddr_storage reply_addr;
++	socklen_t reply_addr_len;
+ 
+ 	sockfd = ldns_udp_bgsend_from(qbin, to, tolen, from, fromlen, timeout);
+ 
+@@ -467,13 +513,21 @@ ldns_udp_send_from(uint8_t **result, ldns_buffer *qbin,
+          * but returns a 'NETWORK_ERROR' much like a timeout. */
+         ldns_sock_nonblock(sockfd);
+ 
+-	answer = ldns_udp_read_wire(sockfd, answer_size, NULL, NULL);
++	reply_addr_len = sizeof(reply_addr);
++	memset(&reply_addr, 0, reply_addr_len);
++	answer = ldns_udp_read_wire(sockfd, answer_size, &reply_addr,
++		&reply_addr_len);
+ 	close_socket(sockfd);
+ 
+ 	if (!answer) {
+ 		/* oops */
+ 		return LDNS_STATUS_NETWORK_ERR;
+ 	}
++	/* Check that the reply came from the to addr. */
++	if(ldns_sockaddr_cmp(to, tolen, &reply_addr, reply_addr_len) != 0) {
++		free(answer);
++		return LDNS_STATUS_NETWORK_ERR;
++	}
+ 
+ 	*result = answer;
+ 	return LDNS_STATUS_OK;
+@@ -512,6 +566,10 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 
+ 	assert(r != NULL);
+ 
++	/* The query should at least have one question */
++	if(ldns_buffer_limit(qb) < 6 || ldns_buffer_read_u16_at(qb, 4) != 1)
++		return LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
++
+ 	status = LDNS_STATUS_OK;
+ 	rtt = ldns_resolver_rtt(r);
+ 	ns_array = ldns_resolver_nameservers(r);
+@@ -599,6 +657,16 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 			ldns_resolver_set_nameserver_rtt(r, i, LDNS_RESOLV_RTT_INF);
+ 			status = send_status;
+ 		}
++		if(reply_bytes && ldns_buffer_limit(qb) >= 2) {
++			uint16_t txid = ldns_buffer_read_u16_at(qb, 0);
++			if(reply_size < 2 ||
++				ldns_read_uint16(reply_bytes) != txid) {
++				status = LDNS_STATUS_ID_DID_NOT_MATCH;
++				LDNS_FREE(reply_bytes);
++				reply_bytes = NULL;
++				reply_size = 0;
++			}
++		}
+ 		
+ 		/* obey the fail directive */
+ 		if (!reply_bytes) {
+@@ -608,7 +676,7 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ 					LDNS_FREE(src);
+ 				}
+ 				LDNS_FREE(ns);
+-				return LDNS_STATUS_ERR;
++				return status ? status : LDNS_STATUS_ERR;
+ 			} else {
+ 				LDNS_FREE(ns);
+ 				continue;
+@@ -670,6 +738,26 @@ ldns_send_buffer(ldns_pkt **result, ldns_resolver *r, ldns_buffer *qb, ldns_rdf
+ #endif /* HAVE_SSL */
+ 
+ 	LDNS_FREE(reply_bytes);
++	if (reply) {
++		ldns_pkt *query = NULL;
++
++		if(ldns_pkt_qdcount(reply) != 1) {
++			status = LDNS_STATUS_QDCOUNT_MUST_BE_ONE;
++			ldns_pkt_free(reply);
++			reply = NULL;
++
++		} else if(ldns_wire2pkt(&query
++		                , ldns_buffer_begin(qb)
++		                , ldns_buffer_position(qb)) != LDNS_STATUS_OK
++		|| ldns_pkt_qdcount(query) != 1
++		|| ldns_rr_compare(ldns_rr_list_rr(ldns_pkt_question(query),0)
++		                  ,ldns_rr_list_rr(ldns_pkt_question(reply),0))){
++			status = LDNS_STATUS_QUERY_DID_NOT_MATCH;
++			ldns_pkt_free(reply);
++			reply = NULL;
++		}
++		ldns_pkt_free(query);
++	}
+ 	if (result) {
+ 		*result = reply;
+ 	}
+-- 
+2.55.0
+
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 0740d09fab..81ac03b173 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -23,6 +23,9 @@ LIBLDNS_CONF_OPTS = \
 	--without-pyldns \
 	--without-pyldnsx
 
+# 0001-fix-cve-2026-10846.patch
+LIBLDNS_IGNORE_CVES += CVE-2026-10846
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 LIBLDNS_CONF_OPTS += --enable-dane-verify
 else
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
