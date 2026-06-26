Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AECC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 19:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6BC561076;
	Fri, 26 Jun 2026 19:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22GbAqjxPUWA; Fri, 26 Jun 2026 19:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 902A8610C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782503985;
	bh=C+FSIZMElya+WkYo7ZWsN7LLrjhEuRUpc3gnpbc2uu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNG40kthGlXTzOLQ7QH+DDv19LB1DooJ+JUc8UEYu4DGH16x00o1uiuLMYX04EVIB
	 Vb58SEuy7NS/DU83N4G/DFYgvDnY8y0lxFwXWdO0RTI0h1PULsMYXzpgo89E0otebL
	 9hVTwDEgmJro+rOA+BZXcd9hhnlZpzRZnJ9XnTmL8kHNWPdGe9ul148rroetOU939u
	 C2BhyI06mioJzJSZ5tI1/c6YGm4heqtIQCzQuBabh0cqJNtDVd87laX2pBcJHGy5S2
	 KmyZbPCunGAPx32W2clDbWjDRFpP9EneIklIvIL7Mosf1httOBIEJCdYwZcCnPPlz3
	 ty1LKuGFfCx9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902A8610C5;
	Fri, 26 Jun 2026 19:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D2FC28A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B7540DD6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59SsEWEuWBvW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 19:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B1CB400BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1CB400BE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B1CB400BE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 19:59:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-492329c5514so6089225e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 12:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782503979; x=1783108779;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mmhWhi8VHSdFwDK5OiO1HBYCkvp6QyCAcTaG0jONQ3E=;
 b=YdGNu19OZKgWqNfaGkROVnRxEP5CPrPQP/Z/hC9PyE5WXixzEMOUVuC3eBEwjcBoM/
 bN3rVLmilLrhOX7ul7NrM+XW0LW3ZetqC+v6xbfmY29IfkkM9aybfC1sZt7CALp+DspJ
 Xa+GL/Nkui0ojcb6gOcho0JgPjj9cOhU7irZ51ARlr7bLBVMubIlipQ5D4leM3jQSEmQ
 aqSi3Lqc9TJJPQHgzm7zzP8ZR/oOYLXLJ//zHMLE8LYeg2p7SS+gwMdKPxi9uDBEtcS0
 8ra8YBzGXaJ75FjzDRaWPZkCTBSm6cpJo8AVULgrYWtu29Yo+fzDFEf5q0eFIOYSik6M
 GorA==
X-Gm-Message-State: AOJu0YxTxCIb/k7EFpQkqf/fU+LwoD7dWXGGC8NmFSNSJRoOW6sf/VfF
 CNJifLCTyqa9fedRyP04/9/Z9leZis1u0Uevz6eXH10zklbqe5i3z3IINZeclgWEsoj7wJBz/cu
 VdgFe
X-Gm-Gg: AfdE7ckcGAtT/UkySg0QtYuswJ8ID3+L6KSAsCfEoxh37h9ugFIlzx2S5aa5/7/ucUR
 /INNUsa/nMSw+GdcOpPusuMtYFWxFWamapXgysQM87ASU4NRcT2ygkdOpFZ4zY9hMuehtqJN2CK
 uKxf7UJNeAwK1RSwVqo31tqnDqvh46ev1moprQAnF14i3aFNllVotrsAa+BzeKxRbduJ+fpbD1G
 EkG2ixqLta0xNbEu4i27ewdXj+c4GhUnJI7A0lV8SQaL0IS8/2J44vvxUix6ZBRv7K+A1iiTyrS
 Is0k90banDzmvZiiE0CU1MoLtbiZ92qk8HngXDQTkGf7XdmrzV/Pfbud3QOC8JgB0bcQjJ1r/sU
 ViCX4DbZoxPDy4RAImLSJ6J5gz9ASzhNkUz+GP3SYocuAjTVzNJdtef9kciVODbcmKlDlugNWTm
 VRTx/V
X-Received: by 2002:a05:600c:638e:b0:490:7df7:9190 with SMTP id
 5b1f17b1804b1-492663ea3d3mr97209825e9.8.1782503978622; 
 Fri, 26 Jun 2026 12:59:38 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49269071c9esm98118255e9.9.2026.06.26.12.59.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 12:59:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 21:59:37 +0200
Message-ID: <20260626195937.49027-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782503979; x=1783108779; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=mmhWhi8VHSdFwDK5OiO1HBYCkvp6QyCAcTaG0jONQ3E=;
 b=eDieWBDbQROOGD9IB+s4ZfH8mRdFhwUkeUb0e9TyRcqFaHthobWh9TubRp8R9WuPoO
 qAWVtmYoRrJ6TtkKPSoZtTEysnK0/p+nsfhRQ9oqr2XEZH51mpFHWXeoW+ahXRa9yEVY
 fFSzKc2GkZ8+yFHgyUrYAyYmrosyQ5WMUB/0GdIyQpNYeo1ZNxvcrspwQ3Fb3tJ7tEe+
 hyWaWIhGLrZdf8zjmbkzQeeonKD8QGGAqF6JY6IwVCfRToEyhC7QNOV2rsk+aI7pvhBI
 X9RxZ4mIXtnCknbdio36SPWuD3gT4jxclcRt5MPPJX5Dg6ZoBcL1vt0dOwKcO8DjioGH
 yLVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eDieWBDb
Subject: [Buildroot] [PATCH 1/1] package/avahi: upstream patch for
 CVE-2026-34933
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

This fixes the following vulnerability:

- CVE-2026-34933:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. Prior to version 0.9-rc4,
    any unprivileged local user can crash avahi-daemon by sending a single
    D-Bus method call with conflicting publish flags. This issue has been
    patched in version 0.9-rc4.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-34933
  - https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...both-wide-area-and-multicast-are-set.patch | 106 ++++++++++++++++++
 package/avahi/avahi.mk                        |   3 +
 2 files changed, 109 insertions(+)
 create mode 100644 package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch

diff --git a/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch b/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
new file mode 100644
index 0000000000..de359b7d22
--- /dev/null
+++ b/package/avahi/0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
@@ -0,0 +1,106 @@
+From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 1 Apr 2026 05:31:58 +0000
+Subject: [PATCH] core: refuse to accept publish flags where both wide_area and
+ multicast are set
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
+flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
+AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
+invoked like that avahi-daemon crashed with
+```
+dbus-entry-group.c: interface=org.freedesktop.Avahi.EntryGroup, path=/Client0/EntryGroup1, member=AddRecord
+avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*flags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags & AVAHI_PUBLISH_USE_WIDE_AREA))' failed.
+==84944==
+==84944== Process terminating with default action of signal 6 (SIGABRT)
+==84944==    at 0x4B353BC: __pthread_kill_implementation (pthread_kill.c:44)
+==84944==    by 0x4ADE941: raise (raise.c:26)
+==84944==    by 0x4AC64AB: abort (abort.c:77)
+==84944==    by 0x4AC641F: __assert_fail_base.cold (assert.c:118)
+==84944==    by 0x48A9404: transport_flags_from_domain (entry.c:57)
+==84944==    by 0x48A9F8F: server_add_internal (entry.c:224)
+==84944==    by 0x48AA49F: avahi_server_add (entry.c:324)
+==84944==    by 0x401A670: avahi_dbus_msg_entry_group_impl (dbus-entry-group.c:348)
+==84944==    by 0x4A70741: ??? (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x4A5FB22: dbus_connection_dispatch (in /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
+==84944==    by 0x401D01D: dispatch_timeout_callback (dbus-watch-glue.c:105)
+==84944==    by 0x488E3AE: timeout_callback (simple-watch.c:447)
+==84944==
+```
+It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
+those flags were introduced and consistent with the other places
+where wide_area/multicast flags are used.
+
+It was discovered by
+Guillaume Meunier - Head of Vulnerability Operations Center France - Orange Cyberdefense
+
+https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
+
+CVE: CVE-2026-34933
+Upstream: https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ecf7675
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/entry.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/avahi-core/entry.c b/avahi-core/entry.c
+index 0d862133d..06eb12076 100644
+--- a/avahi-core/entry.c
++++ b/avahi-core/entry.c
+@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
+                                          AVAHI_PUBLISH_UPDATE|
+                                          AVAHI_PUBLISH_USE_WIDE_AREA|
+                                          AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_domain_name(r->key->name), AVAHI_ERR_INVALID_HOST_NAME);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl != 0, AVAHI_ERR_INVALID_TTL);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key), AVAHI_ERR_IS_PATTERN);
+@@ -454,6 +455,7 @@ int avahi_server_add_address(
+                                               AVAHI_PUBLISH_UPDATE|
+                                               AVAHI_PUBLISH_USE_WIDE_AREA|
+                                               AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     /* Prepare the host naem */
+@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_UPDATE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
+                                                                 AVAHI_PUBLISH_NO_COOKIE|
+                                                                 AVAHI_PUBLISH_USE_WIDE_AREA|
+                                                                 AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);
+     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
+@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
+     assert(name);
+ 
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
+     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVAHI_ERR_INVALID_INTERFACE);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) && AVAHI_PROTO_VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
+     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAGS);
++    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, type == AVAHI_DNS_SERVER_UPDATE || type == AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY(s, port != 0, AVAHI_ERR_INVALID_PORT);
+     AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index bcba0a0a4f..0a674182bc 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -60,6 +60,9 @@ AVAHI_IGNORE_CVES += CVE-2025-68471
 # 0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch
 AVAHI_IGNORE_CVES += CVE-2026-24401
 
+# 0017-core-refuse-to-accept-publish-flags-where-both-wide-area-and-multicast-are-set.patch
+AVAHI_IGNORE_CVES += CVE-2026-34933
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
