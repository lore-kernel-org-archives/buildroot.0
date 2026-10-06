Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4833ECA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1796A80980;
	Tue,  6 Oct 2026 16:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-JSZ4Mi82Zs; Tue,  6 Oct 2026 16:37:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0AA8F80A91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304662;
	b=edQdj7CZD7rqbPhJvbHh/aq2kqoA0pWKIVdJrP5PkFrX/BvDFtHCHvw4RCzRKtcxG8X2
	 9eBvPe4FbuvkIBKKZANUC2RfhwWY8rtk+orBbfLOkuwy9YB+L2y/H9zleJ52U7kE93jdx
	 AvXu+zQTyPEUjdSXcGkADf3HzUw8LLKCYIz1JYkNow+Cz7hhCxBXgsCYFcnp8kdwvYR6H
	 WT0PHWzmf2qYBEyHs6N/r0Z6s/mUdvbVCHGXSz7HSVmrb3FxprIQwpst9P3w7V6rZgXjE
	 XYvluMFLXqWy60M0VeHOlzkC1rnbQLLuUq/yckPsvXndXeF1yRvhCImXiHa7uQaAzcw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304662;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E4yFloaz6vm8Zsi7h09dSONd0/ju3rUH1UgYKBSOBvI=;
	b=FmG24F8hLnI/dUlG7MUvWhRYc9FBmsKJrl+AhRZjhEwuc+AHw4ShGLDbzAFHZAFBArLy
	 2kpTLgLthdR1hT2L7gsyvAz+ZCQv+hhhZ2cxyjy3HIwGfJxwO3uUQX0MUXh5RYDy2gi+0
	 7vh9s6hPmNbSTNa8xZ5/ksDWM8rT8yGzmLCZqrB1/4AdQXGnPLXH4ngx+xkOKSgMP8veB
	 kPYYonY9ye83f3JLimu79a+NT38HRaEBE6rlbTgXa7z3SQeKSK9wgsbxS+HK0IKPw7pL4
	 mUNjqrs0fjv4evkpzfbBK58GE1ZC85SaLEB/GKmWfh3TSqnL7NKKepoFBUJ5tFHuqEA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304662;
	bh=E4yFloaz6vm8Zsi7h09dSONd0/ju3rUH1UgYKBSOBvI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rw1HS+H7LSUI7HAapgaqzesjSZ36X8/2jzGUkOh8dBuM1DeqPuf2Q4NofJ4MJQmA3
	 ANC2Arz36+bCaH8bWbusc6rWMg28PUtIicdsw6VhIO5hrQm8KZEIROQ7nxx+XP0bph
	 VIOFCaYbrcIdxKsLKLGTOPI2p54eqGDJjyBleJAOhXfj+vMgFGEg3oR27kGVutJXP1
	 FgkILtIXR0eqN6WgTGTiFvzdAoCyjof0mR58dWPsHVM3XO9CvJnkFuUEzozM/90ZQ/
	 AOOm8Ub5reaOoPPxLzZiWB8f2/+43mTCS7bH2/DQfObNArsMqPRvbX5X66qSAFO+MB
	 MZusBdmgSQHaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA8F80A91;
	Tue,  6 Oct 2026 16:37:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE02317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CBE56085B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LWKOFUucwa6 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:32:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3C162607E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304354;
 b=U6OHGemVxT3K2r7+8O0mK3mVobypKwa+G+jAn85Wui6b5NZHYqRSFUgUFuuzX3E7HXon
 b0ODI+NyXgUfC1mNwLOqOrIMSu6f/T+9tobDKwmyJ9M5rL8Z45aElem/jlfP61goDDl/a
 zyv8fZUpWPlmCV8we35uyuEh2aIPGc5qa6rpq3Ezo1DJI7xVjJo2NZIqF3FunDHuLuGCZ
 KTujp4rYmnXmz53QIhL8ZQ73pqcUQxXu0uvtpGqf5gl/EF4Syhj6ologtTtMRJvExrHDd
 +65PMGGeL4H57XmUgexdpYe61oG/4qLANZnhUsuChdwrg4mc8hdx+AwTHdsJ3XG+elQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304354;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTro1vZMcqAha40/9Vx10WfuF6XqYoLg2kXibpz/hww=;
 b=aLnE+s6UV0EEWXXe0nh3k2pT7I9bU4mPXJUZ/ssvpzuLipHEUTns372y/Hodi1spRvKr
 oBTwAaawrB8nJNFexmF8MyH9sh82wLrNRLoZ8l0mmqEWSpfKw7fVe4Z7XvP0Ynx4KFNaW
 /sYXOHiiK8W7KKYtoibsawgXiF/DIY3YXyP0QKf124dhqdPFwQyMnfLoVsiji9K6YXjLp
 ah61R7eWJiWcMsyk53yZ8iltEEWCbeTnlUuW41LlUFOSqU0iytTyPZaYC9HW3KPbcC7sB
 OGzuMvMu5D/xW9em6Bg9Oz+p0skpw7I1OdJv2mUSffbjMav0YR3ACbFJFpfzTdViyTQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jQPffDwU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jQPffDwU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C162607E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=qTro1vZMcqAha40/9Vx10WfuF6XqYoLg2kXibpz/hww=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jQPffDwU1/0mKmT4H5tJDV9qH0U9QVzk32WsLE6+F9mtqe3bKwsEmNlJhAPkEKS3F
 PNM+jYyXnH4TrL/OarwxfuPW9k89lKYfbqETPib4oMTr26HmRx3GaI4pwWXHWIJYkT
 g8BF2F03Do1fXMyNN2/eg4SiC+/0mY2Ih3qlBTg2QsqduMDxpnFl9Evc1i/J6I9Xaq
 PgycQ8gjTuRMwS6E/VqQfysOH5n+fCj+1KUKCGEgFEO84zJlHwYBd0Z6vzvHIRo+oT
 X3kWb12Ml1dEd8ateLLH4SejLjolaosKbOPx0Jh8yGh8MkkTlf0c9pKw6RpWASi/q7
 X0i7gqtRYTbEA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 IU9vVUtW6QNonNTIE1Ouuy92D9AF5FzDquF+57eTlrmDG7WSYFbL11nFF7OXxaWxROrEsCk47lu
 eSqnGVCT7eCr4YvxuA9VGil14sk9DRPYvQiZTw4az9h4nNKIYXy+TT/xAtb6OtSY6PoNPkzHhle
 z8NLpCQDIwtrJUZ8wJysXLr8kDFDMkiWgt5EnIOPV1JzjXdFDX+uvzIBEUmD4Pu7GLoXAUmaSaJ
 Tg3ocZq0AYtDJxDsqBUZf1LSCkALPtt/0sCps4DGKeQQsZEx49lomobf75AGQwJJkaJcC+TH6Nw
 NZC+8715PO0Si4jII/wNVZU6E+ibqMpBFoWyIzIoz1nzy26HB61n26LZyga5RBzOaO8px0FMHZn
 FwQo06xXEQJJf+tOwZaWCdhMoNHe2G3aYk4XtzMi57wk8V0SsRMRU6AaJL6vhEKDIUJEZPyX84W
 6YXlROD4HkPpc96+Pj0ltl8JWa1mrg3gHLpmWEiXJ2dmPGXB/pTEO7xQDZG+51k5o3n4uk9HyBJ
 y6iXCe3N5YtKVjdrWXVoH15yEZUhnNexVfTH+znrJGJitU54Y7NDz8Xf1MUPn9slkeJMa/8WWGb
 nQd1QvE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92F2FA4C54FB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-3xkr
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:12 +0200
Message-ID: <20261006162106.3439373-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 31/84] package/freeswitch: Add support for
 OpenSSL 4.0.0
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
 ...robe-TLS_method-to-detect-libssl-Ope.patch | 38 +++++++++++
 ...tem-Fix-build-against-OpenSSL-4-3185.patch | 67 +++++++++++++++++++
 package/freeswitch/freeswitch.mk              |  3 +
 3 files changed, 108 insertions(+)
 create mode 100644 package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
 create mode 100644 package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch

diff --git a/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch b/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
new file mode 100644
index 0000000000..5805818213
--- /dev/null
+++ b/package/freeswitch/0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
@@ -0,0 +1,38 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Bradley Reid <130598986+bereizy@users.noreply.github.com>
+Date: Fri, 2 Oct 2026 09:43:47 -0400
+Subject: [PATCH] sac-openssl.m4: probe TLS_method to detect libssl (OpenSSL 4)
+
+SAC_OPENSSL decides whether libssl is usable with
+AC_CHECK_LIB(ssl, TLSv1_method). OpenSSL 4.0 removed the fixed-version
+method functions, so the probe fails there, HAVE_TLS is cleared and -lssl
+is not added to LIBS. With #3185 applied configure then succeeds but the
+build stops when linking mod_sofia's test program:
+
+  undefined reference to symbol 'SSL_CTX_check_private_key@@OPENSSL_4.0.0'
+
+TLS_method is available from OpenSSL 1.1.0 on.
+
+Upstream: https://github.com/signalwire/freeswitch/pull/3211
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ build/config/sac-openssl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/config/sac-openssl.m4 b/build/config/sac-openssl.m4
+index 289d3e132e..76ba9f2f22 100644
+--- a/build/config/sac-openssl.m4
++++ b/build/config/sac-openssl.m4
+@@ -30,7 +30,7 @@ else
+       	HAVE_OPENSSL=0
+       	AC_MSG_WARN(OpenSSL crypto library was not found))
+ 
+-      AC_CHECK_LIB(ssl, TLSv1_method,,
++      AC_CHECK_LIB(ssl, TLS_method,,
+       	HAVE_TLS=0
+       	AC_MSG_WARN(OpenSSL protocol library was not found))
+      ],[AC_MSG_WARN(OpenSSL include files were not found)],[#include <openssl/safestack.h>])
+-- 
+2.47.3
+
diff --git a/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch b/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
new file mode 100644
index 0000000000..63e15ff3c0
--- /dev/null
+++ b/package/freeswitch/0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
@@ -0,0 +1,67 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Andrey Volk <andywolk@gmail.com>
+Date: Thu, 24 Sep 2026 00:31:38 +0300
+Subject: [PATCH] [Build-System] Fix build against OpenSSL 4 (#3185)
+
+Upstream: https://github.com/signalwire/freeswitch/commit/fd1cab5117cd4c711293439354885a559ef783bb
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac           |  6 +++++-
+ src/switch_core_cert.c | 13 ++++++++++---
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ae42b22f6f..16af18ce2d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1726,7 +1726,11 @@ if test x$HAVE_OPENSSL = x1; then
+ 	openssl_CFLAGS="$openssl_CFLAGS -DHAVE_OPENSSL";
+ 	APR_ADDTO(SWITCH_AM_CFLAGS, -DHAVE_OPENSSL)
+ 	AC_CHECK_LIB(ssl, SSL_CTX_set_tlsext_use_srtp, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS_SRTP, 1, HAVE_OPENSSL_DTLS_SRTP), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required]))
+-	AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS), AC_MSG_ERROR([OpenSSL >= 1.0.1e and associaed developement headers required]))
++	dnl DTLS_method is what the code calls from OpenSSL 1.1.0 on; DTLSv1_method is
++	dnl the pre 1.1.0 spelling, deprecated since and gone from OpenSSL 4.
++	AC_CHECK_LIB(ssl, DTLS_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
++		[AC_CHECK_LIB(ssl, DTLSv1_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLS, 1, HAVE_OPENSSL_DTLS),
++			AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated development headers required]))])
+ 	AC_CHECK_LIB(ssl, DTLSv1_2_method, AC_DEFINE_UNQUOTED(HAVE_OPENSSL_DTLSv1_2_method, 1, [DTLS version 1.2 is available]))
+ else
+ 	AC_MSG_ERROR([OpenSSL >= 1.0.1e and associated developement headers required])
+diff --git a/src/switch_core_cert.c b/src/switch_core_cert.c
+index 218016e63b..174a2b1809 100644
+--- a/src/switch_core_cert.c
++++ b/src/switch_core_cert.c
+@@ -496,7 +496,12 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
+ 	X509_gmtime_adj(X509_get_notAfter(x), (long)60*60*24*days);
+ 	X509_set_pubkey(x, pk);
+ 
+-	name = X509_get_subject_name(x);
++	/* OpenSSL 4 hands out the certificate's own name as const, so build one
++	 * here and set it instead of filling in the one inside the certificate.
++	 */
++	if ((name = X509_NAME_new()) == NULL) {
++		goto err;
++	}
+ 
+ 	/* This function creates and adds the entry, working out the
+ 	 * correct string type and performing checks on its length.
+@@ -505,11 +510,13 @@ static int mkcert(X509 **x509p, EVP_PKEY **pkeyp, int bits, int serial, int days
+ 	X509_NAME_add_entry_by_txt(name, "C", MBSTRING_ASC, (unsigned char *)"US", -1, -1, 0);
+ 	X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, (unsigned char *)"FreeSWITCH", -1, -1, 0);
+ 
+-
+ 	/* Its self signed so set the issuer name to be the same as the
+- 	 * subject.
++	 * subject. Both calls copy the name, so ours is ours to free.
+ 	 */
++	X509_set_subject_name(x, name);
+ 	X509_set_issuer_name(x, name);
++	X509_NAME_free(name);
++	name = NULL;
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000
+ 	if (!X509_sign(x, pk, EVP_sha256())) {
+-- 
+2.47.3
+
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..6d46cbed23 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -7,6 +7,9 @@
 FREESWITCH_VERSION = 1.11.3
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
+# 0004-sac-openssl.m4-probe-TLS_method-to-detect-libssl-Ope.patch
+# 0005-Build-System-Fix-build-against-OpenSSL-4-3185.patch
+FREESWITCH_AUTORECONF = YES
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
