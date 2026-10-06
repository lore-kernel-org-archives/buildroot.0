Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBACA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BE560B2C;
	Tue,  6 Oct 2026 16:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpEjnlipeGpr; Tue,  6 Oct 2026 16:40:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EC8A608B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304816;
	b=XRuPNw4RYCIykYK0WN5zH8CqZw3EePdVkJ2NQSFJ0pEpsLaq+Cg8Q1/kLLpRV9ZuPSAU
	 lB/W5DsWhWFmIQMTbpdtHmWjPGEWe9y0z248LxZH4B+BE3SQsrnlVZW/t9IJ9CI6X+3FN
	 H6gQoQrsxko59HDJcwpxfyKLxkOay6nRYQSM5kpRDX2nvvdkk9nRPaZJUOUrzvVPECkyG
	 T1MmKbBHKBRiOtPr9L8Sep38/Y1kPzk32bdvX3pF8IMwCW/YvxQGniZX+DQwOvqw1QpG5
	 24c9qQwiSogcZZuOL0Vky+umm+6AVjGHiOkLF+drrLQ1jvhIKsfNPeJ0Ln5DLLjXq1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304816;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=ZMlhib/WdYQ68ioR3KM6LXMqw+Wx8//9zh5/FoEE9/Bbk2o00g5DCPgZrjVpBpDqiGdz
	 WrCtPb6/R/de57H6lU1w1WQ15EqmAxG1UHgZ9AWVDPFFLFwwFzBf1jTQFTBi6Ol8u/fEW
	 ACkYLxaKNmOoheqQY2AM1lbXMTmK7hDgzdcarHh5g1+K79tgW6sk5YyZUe0kW3pB+HZYF
	 xQ4dBueMtSJj5ESGVEolyrUHdUNYffzW8yPpe4zKbwCFRNnvZarqsuwTyVYVqhxMBXcHU
	 ykctizl9PvrY2nzkE2+rNXT5cbcYFOsDQMLhwyj2dVY4AMiNP9mD6933V0a+fIvFhBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=PJebbXgJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304816;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=casz0rB3zZrhIJtDLtQOTfs7s+jQHtZUIYcFoVZElIWJsQ5pxq3XlAxpiuWXJcI/m
	 MkIGSQ0zyNGm+KncmwXFGIbRBJrUcKSuC4pksQRVfHC8MGD7xqWZbjP3Osdlh4riLH
	 L1icTorayJPMi3vkjwRPjZGAyNwuRTOq7TIIX4x/PN7o1wwu0T861rQyJVXSR2ndQF
	 MQJDuehj+BiBPriy+nVpbIUOa50p1m5gF781vxNKRjzCA+wZvQfIdQLhYq+lmqFEsN
	 aFH6cQ83IRimETE5n1YUokP2qLy1p6DsP/0DYya2OREYWMs2A04lQJ4gkfp1UfY0nY
	 jrDLcmaSmbbbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC8A608B3;
	Tue,  6 Oct 2026 16:40:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B07B434E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E5BA60A74
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3k-UKbG7PRi6 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:36:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C1193608AA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304588;
 b=ZG9TVRVmY7uoOR8DPb18ARVBjeqweLUUm4GHAUyX3cxn8y9NdFsT1RQ/Mi3IuzTD410Z
 +7d2h97RGlx6BH5Z+0d0QIhnoKMoZaty4ElOT6BDob1SYKR14CAy1BmWI3v2jCUJ7Ojkm
 LAYCYLt1NyEIMCaKnHWhWcLTENPg5otl5aCtdxHEr7XHm5gaknWbaSNLDGQroD7p/WQaK
 kO4050RzuoV7QSjBxSeB8eyBGwWGwFyLtCrEnG79OFvoYoUQQpYTzUJqdnfZ+2aEmPzWU
 j206cDV8KWh8g0wnLkdO1xHWAWY1uMU0k3fQCuQ7vxuKMdnKEP2NKpYBhsKLX3HUGGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304588;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=nNrGbE3gL45jfmZZTQxLG0RZWC6TzT9XXfayUMVjWS8vxgJ96UUCdLZliXyR0smqTDg9
 Ut/KXo+HS+oNu6qYQoPNb4FComohyNWATU4obTn4HQD3pbnF/a1FcLYn43Zkly8sKO62f
 H+QK8wvFWH5SI16hCFJaMzCFFBD6lXxxp0sfArFK0QhZZEWqz0nhraehZ9nnyjZhFWJ0C
 nhNn1qIrYY8ZvuCPFC5davhtgGHAkHQtMJRW9Fl6HZUU3u6RIGLiO/aH5+R32s6gwJH0c
 SGmhUX/Rcs16DGu8TPBrax36yf+Z41k7IR25jfdrUQQNgj1hXGvRWYT6yI6wm1HCjmw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PJebbXgJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PJebbXgJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1193608AA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PJebbXgJCVSpnTu505oz+2bkA646QfQOgBAgVLUJTPa3SKj88YPLIr/KaiQytEXlu
 OVPDxVdbp6YvvjJ/e4PB7lZu3FD2KWXuGgduo6wmnqDrNlthNEW3bZpa3Xv4WBUi7X
 qkkVAfLxSmImzarGiNu7BHylZgdqXBhjVFayRy+9HKJOCYioRw0R6x5tVfts0G4HEm
 waGTcuIiMvsE7dBBaFh2pg1yf6CCRw/u5a3O48DEXCw41M2o8qr7vJuRpY+1F4+KCz
 ks8WYx94V/HOxuQBpU3KBOxwKyRALXqDU0L/aeWmw2PXJTciriFgbVekRc+kf7YdoJ
 KHbgMoIyH6R0A==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 NuOZHnEXPN4G8HhxiozoV7AjJGxZ6BkqBHRmmTEKdR5hjVmndc+gybISiVGZmnwFcNVqrbN9DEC
 OUgcnuOAG0re9kblhp8hfw6xCXwgjbGm3sxp4YorZOZdNUx8ukhXrM+XvAnph9C8lJDdxlaBP87
 Igxufvw6158dnPjakvFu2683BajhLivk3TgG7IiKuD/UWdEvpV3D1gStN6qyVJABfwfK14co/yN
 v3ikenuE6N91Ot1CwAMsAgeZn4mcPrHV/0wGAoZLntNpXloxVpNwR9GuKBPlVBSdaAedVY/VlDX
 onYiRr7tzHxu/JGYVEwjpZ/++cqKclvMJbVeK7Abli4tCCataOU81HrdItJXur+eNkqKhYESBPG
 akjnbr/OyMCXePtS/sfktyyS+KIMDn6YrjrcHAQVuNCG6Jo2qJID0WVovxLzrrGaRj7un3Xa9k3
 6Yuq3y/AkrnvSkzfuvgPQsS9oFmofj53RFZonBvj15FAGXCvkCbpm/V4k8MBlxKHyoypcFJWIY9
 eWVA8wjIp8ovOYUUBor3Jy7Aub4lYIsEfbH+2iTd+Szc5t7kPwnCuW0XFDFSZqqQ91JhWTlpQBl
 QN7fufw=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C56B2A4C5556
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-1Kjp
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:31 +0200
Message-ID: <20261006162106.3439373-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 50/84] package/sudo: Add support for OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
