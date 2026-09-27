Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843C3C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CE404050A;
	Sun, 27 Sep 2026 10:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvWlnhNm4afY; Sun, 27 Sep 2026 10:50:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B9D44055D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506204;
	b=QZIX3eFcREuLR3xSj+WItH24i5EFBtz/WB6YDLaElelX6JAmWgZXI0QoE0d3oE2Ztp9V
	 UQaq4zbk+MRU7MuKHtkpgfSmFwVdUPLMx4gPj4dHhTwx2eWtcEcGZrrY48/FxJtZc30/i
	 tHnw6scXyRg9MGEQKCV/lppLDOeaD0vbc1BRJkzRh4LKRXqn398+RNbXMSSZcBPGBxXHn
	 vU14sfF+rXp4dvj8+GcxZSaXvlKwaLVKbyqLNIjQhXp1cJOsl713t6oHxmxm/Ndv3VUkx
	 JpjB8/BE7ilc6QMKsFQREryhocY9b3asg75CD+RhW0JNCr1vAplv0WOeik9RmZDyFOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=fqAEzD2/hZDqyRlIgM6OpysKH4QuzT7Ca/su3aO7puX+zm2yi8p+6TTkchuEWY/3Z00D
	 UNY+YyvkhArx+z5FQDdTQ3/wRGMaFoQqh49Qe7eCrRctq6yO+BBvzejlRsvid/e5QerT/
	 XXdSyIWgf76hHvnZKbX7vlDG1/dbLgIPBsry6qupINAgTbIogEJ0TvZKVjvLug4XcO1gN
	 Kt4jq83CU1wzA0EWm6e8Ji6MXFngehJtFbm5Qbob4KlHkKzWhXVJxi/xd17IJ3hpi4zOC
	 eUesPeVQPeVRum6Ek+m+Yi+ptkTD/H5ZZfpGvLIPdAI9iOJV5740pwFVWV04tft7X1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hm3ilNK6;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506204;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GbX8FddtIlqhIf+87MG2h+jzRgx/TLGnqXGxUhe/GRbxG2HAkqRrMyPi/uD51Yx7k
	 w9wDnYxenVIz0NFmi5qJ7jNdCo9QlkpFy6DvcshhvPR3hpFtya18ldfG4UH8w23kwx
	 9b7oyymjkj+PYRPTMW12Iz3Rk0RM/9/jkajOywfB3eyapIVTjtKckpewjUK2qp6SiJ
	 2ZzfZNGH1jbBdf7KjzjU7bxdkRphAY3hQMWAt8VM7jAMhFU2aBbazsENqAcmDdqb1G
	 kZSWyGiRw8v6IQop4jspcc6ftsE97xgsRIIVSByGhVz+/JVo/Er+zwnWZFYpuoiamr
	 1J8+KQgScocvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9D44055D;
	Sun, 27 Sep 2026 10:50:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B46C5335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9A14055D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMbgoRXI7L9F for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:50:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A07A74050A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506201;
 b=jI1BYVuGgxtJVet90m1AbfS3YTGJ99T8mvgqZTRvfVBeIaRnPwi9r1fnsmw1mslCyHf2
 qWNspCyIQI3os7GLKawZhCq+qbRlq0XAUP21kdoH9C2hCw5lVAJn1P7+iXi7UPlAT/Rtu
 lD6ZAQ08eFy6eyppX3H3eOkppTC6p6Z+STs+VbQ6D3P+C1y24Oi4kgn27rgrnt+hY9VRW
 eEj0EmdyW1Xi9Itav9/x3tnOYVl0pHQc8ybWf7/asP5BrkitXRnWfnLXIR3dG7kF7n5m1
 4qvrL5NdtOVYpUJUph5d7LSuEEwxq5YqnAWM11Rh0jnx7Pk7ph2mrgQRZa5PsTuoPmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506201;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=SXzS8+yIlKFoe6bhJnmmax8AO6TFBo+zuzvAIuT2TUV2lXupUX7507T/7wRzUbuPP3pE
 G40ShWueIVMTykBBzVcMKpWVVQ2D8cjXwK7PuD3NuPXnJYvFzyStCP9ibKFbpf/WYNrm5
 LXCl6CYIodrVwcdZFPatC1Xfb+BEaZxa0Zuq+lymPNh2CRaiASlSziwfLwz0cIDlDuCUc
 m4ybMy1qj5TsBDEFw1kciS4XAlBcrrI6xqcFOjypRcQIETNrHbv2briFNZf6NeFf5VqYI
 /u4VW3MutBY2w7Ae//AxJydlnZKgce8CVQJDTZHCeqsNIykq+ktTpvGInUebiwiZEQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hm3ilNK6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hm3ilNK6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A07A74050A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505844;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hm3ilNK6kP0QeZb3B2wwDpBACJQjQY52bBAY6bv1O/ftHGiUaz1resfIGVjgTNUcQ
 IYuh+HMaSfA7eehJo8oWyuVvoXsmliyNCWXBY8xLp4ZmbZ7S0AVuUZDl+QtOI//Q9X
 3b3zMeEqFnnRLqGH9tsqs9HP+esJkeVu+yGTqlSiEVfp87mpoIJaFuCnTZF3c0nLss
 CAn9B6jeMYOt+nkvMh21Pfa31/EIycfjcnQrVL+hY7YJkDGB8eS9AqL9PxVeTakgvP
 280R6M9qBluGX1lgNdG1oi3oaQHsOLHhqOIF4UdPIua5xWeNZHAycoiMgH/Tr8/+NY
 caQyCAsE98HWQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 UKxjfAV4BfpWhSKXa6+/b6wGRtwfXwhEh4wOzVGT6cLA3QV1McAVMYjVyKYkYUgHCmbm8sdzqb8
 QGysu0BSTrIVasHym2iZ+evdCMfvlIAhh7luUYr3KxvLJ33HtfyP4C1SG1ORW5T8NQsxUgZFSvi
 4JfAJrpEN8LeGGgkNakoT50odwWoQZkTD78MEMaPsMgPTwO6GnNkC33x+X1Qgb/91IuTDLOeG8F
 jjVNlWNIkzHjYqckNp89EUx8/3gfuLKXHlryVLpzKRuW1jtQpUAdJcGv3scecxJ4oSezPv0e9Xy
 R172TsJekuZh4GuJmpi0HbbV5osXhMbwHCDxHbQRDHTqVAdjyXG5aP53BlwO1JEeWw4HvS25gwa
 gXFFNuh5QSRrHRSkd76aa1Py8oZVHY40N6RCgcbp6CBnxbCq3ntwjNYi95r/whMYnaV+zDJHab7
 Ii5sNhGdYpZBRrdtgYdQ5nQKBrEauGr4KLtjjFG98t+uXwXDZRJ/d++3Uqitnzr2QsZx3E01npi
 iAhyzDTHMJn2wD0OnjCdgHYAb1gPnQY3ATqANCp5Ma9fFOSQAidkyJ7p9NNNBDEB/O76T0TJVG2
 9llY1GgtlA5EmAnZvNAO5ng49m1kzz6PuN+Jm3WHczC2EOP4oEQqmQk9jzND+7STOywT7dmBXq5
 gxFFEEEsab1AEGa+bkYOC
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6A8DA4C4F96;
 Sun, 27 Sep 2026 12:44:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLk-0000000007a-0YV2;
 Sun, 27 Sep 2026 10:43:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:58 +0200
Message-ID: <20260927104301.1801638-81-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 80/82] package/xmrig: Add support for OpenSSL
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
