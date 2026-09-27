Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7014C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 835944057A;
	Sun, 27 Sep 2026 10:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIi9-Y0Q_ZEl; Sun, 27 Sep 2026 10:57:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6C97540533
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506642;
	b=lUoKvyFPMCHko86prJBWj8CksIRBe4ES8LJK+CqIRm+HM8VcE7EG7uC9xS0vzOnsELcT
	 QV3zJUGjLFLwVKPSGK3sEAksD7CjmI5SHrlQ+UHcQj3nM7ILumKPFNXRcSAlXbGY+QJLd
	 fzOW0s3tcXFFuUWfmCVV7a7rrx5dUGIvnTFhIXMvfJzuUWHbcd+o0TVmZxP3CmxIQTRfo
	 jdIoNKVJNlCmCRfvJBsWgaLl/n40L8ioRI0Rql2hDd52qdl2tVz8pBl7V/ewBVgfHlyl5
	 I6wFnchRlbPg4RQhmZY6qyHRrLsAcZ47uqoR3hvlHGAM77eDToGWEwuunEvsag/Vhbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=tYebADG5CzlQph7jF7tUhXYAOLvI9b96S06pwcdrw7FkWZXaj2pHmahb7XdZKU7xqGoU
	 NoNVGWcLwxrEhd9KS5A2SobHByzLe/z2YjLHCNYNNPAyBXADD7R5SZp0DLPo8niXbNzpK
	 Zr1D31LNN/rmBLOiKg+rt98J0sJmf16Q2ek5SGWTucN0nc1XpnAdjOlBPjQzl5wkaaJ9K
	 NS5QpfAC7tTWHNowtS1m28NlZ+AkyjlfE5vQa011itOB80mWYbWdJ4kF/ug+EeIQZnkbU
	 q7nNHCcO8Q6xIo0ssAiPOP8Zf9QXgbb7KRcj1LAEX82O7xzBCGDzKUIlEDciJ1xxNVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506642;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NqcurBRm6nKHzWvxdCSMWUz+/9uIowZWm+vtzfEkV9knhGKyJI22O8/2+MuBEIAVi
	 A5VzAhRsvpiZ7VcXbO+YQBkLjYgesnxMONN3gkG2bSLzwwrQ5eDzr5wCmgOGP6h6sk
	 iwjX3ATWuKT5PndcGD0WzlJVmSz9a+u5aLQp9JQI4jPRODqvMx9V9uJ7zB5cTAsv0v
	 nNOoLZ/hPB40ORWfLj9CVdLYjeDKL+i0VIVashRAyfLojSTgBXvWEAtCxQ5UNIaX7P
	 8QG8v8WPcfyWJ/uQHb69KYU8cR7Hae+CZvAt6tI3hnplPRbSc65hsVdEpJSDt/oVwG
	 5TGYq9rGW0shg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C97540533;
	Sun, 27 Sep 2026 10:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C440BD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A775180A47
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwa0AZ7LjO2s for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:57:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6404F8096D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506639;
 b=tBvfBRsKRfAD2lO4/tH3kbUWlwqJ6GdEp1P9f9LRngD2MY2eqmrnLn9B4Fx6KtoZdEGi
 SfXxWdmr8drH8uGnCtcs6kKFQ4Lz5fK3u7/EW4gybNhm6MUBPEcqUbNq+acLGlIYGXS6m
 mTu1oWtnu6PPzb8Xn5DSQ9OWUCojRiVFs32zDf/F0xHUVkgJfHNfX7JmkjtN61TSD93Kv
 R7d67xem3tcGd2iL5ha9O7KGFz9nRFfWDeDFTA+qxubTCVXQupucprV4j0nCvcSgEq6YK
 yr7VIFaba44bk+doJzQewJtvIvv6CsIb3KaFEnBbWFNZ3eiJSyNW+h8N0YlCsbexa1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506639;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=iPyDH9jJ+ycZn+N29K7wGByHrqivwSBgxn/dALXGU2LFsoXaiaLfAjUIx7/Hjx8zxEgn
 6PVhXUsBsYCR9uJURzjqp7DotKA+Q4LfsllEAPpYYstpvY7DMrtbXesHORjR+BcuKfElv
 ULzOX9Bl4EIzVa5dLWSG4Gn9h4+nC3h/rE0H8pcwRc58TTHSqe69fb5QcVxd5wrP59d7Z
 1KrB4koP8JNrBfcSQn6RR5qN/90wrGlAZYGkqM4N51R7TKgLy41v09fkB8D0xtxGpenR/
 RW31M1OjqCabpQZ9kD0Qw2RdH2HIEP90f/tStXOYcMNJEpeDEUSoNk9ezI5mz+3Ousg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D4RD7GwY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=D4RD7GwY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6404F8096D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505864;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=D4RD7GwYJuUq8paedNpeSf6M90TIAY/3EaGCwCAt4T2dMGHqr3ZVw2y9iaC1CuM4a
 TYyHKeFW+kqlz5lZtColTHaD+gA4hE2FfaQMekLnb3aZ5cNtAl/N2ITq14YWrdbe6R
 R9cqPpB+vMbvUqJiEFAv4w0s8L6wH/nJeTqlS444W3zRCH94fXLPqrcmknQiDZ26kI
 aGw8r54uILMRSQ0yg67yyuZK9nTMTZOaWfng7g2GWh+xxzAKN+6FcHvVenwvjcVlqO
 jUJhe5GA4ED/epkNKp2UhnBrnQZsI8tTRBzeHC/z9sva+NfIkQazhuiPGoRuZgLvh5
 dKe8K9UO4LPGQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 B38XJYuIcr2FWG+yKphUBoRnwBoERYjdPnqRlR/yxQnov5arVCizOMDtrmNRaL+oUh44QuMMWM/
 56Ln43AFRpLRMZ+7DV7veYvq5nh+B6Tbj0LAWE6UVH9q6aMOlQvcFPWqxcpAATpHEElt3OApG63
 aIdJd3jIAN5W9QneGmd4Q8R9BhSdp3rs3/VwjPh+BsC4InN1WHmhH6hs62IEZMGL/b3Zk/FSpg3
 5eL1/wS4pZ4pF2cE6uRAQEAMl8UzXQWJyc1HkHJbx5Oo+vtYq1w9ntehoE7o+nmzXY7Q1AxRmqJ
 PLBCD37onimgKLgB5pnGqnTdbHQE7pyLpx89b8XQ8QqvqfrktTJlGTlZbk4v3A9l4oez9v+5VvI
 mfk07EdWUe06F8Jgp6oIAN6zK5/B0V/0hNJVIuOTmBQV7rwWqkX99Rky+QHmkDjnudJ37Rw/El5
 q7yl42lqrj6pxahidzgYOIbxGxgCDrnyyIooLELqMwnWd99D7LrZp3hIbf0AHXX8sbXBKLc4omM
 qXfYuf8kE9Osf89rHgPv4BQlFKDiXxMNijpxqYeZqcAc1wIK//7vsDF7cAqZqYNpK0EFXIEA9cw
 gWqLY2MDM+R6JghL9P9S24Sp5SAKFqszXgmSoa1k5Fn9S/9gtQ1D/iwj9JJ/Hc+HBA39tC+NjWd
 TXQt8CL2uMEUUBoTcZn06
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F172A4C5077;
 Sun, 27 Sep 2026 12:44:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-3jZF;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:19 +0200
Message-ID: <20260927104301.1801638-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 41/82] package/clamav: Fix build with OpenSSL
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
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch

diff --git a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
new file mode 100644
index 0000000000..60e29a1fdb
--- /dev/null
+++ b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
@@ -0,0 +1,136 @@
+From 0097a6f99d9f6b78381e12b677a38fb62242c41a Mon Sep 17 00:00:00 2001
+From: sebastianas <sebastianas@users.noreply.github.com>
+Date: Sat, 1 Aug 2026 00:13:13 +0200
+Subject: [PATCH] libclamav/crypto: Remove cl_ASN1_GetTimeT() (#1731)
+
+The last user has been removed in commit fa15aa98c7d5e ("bb11594 - allow
+for compilation against openssl 1.1.0"). This function is only exported
+under CLAMAV_PRIVATE to be used within clamav, not by external users.
+
+Removing the function will not cause an ABI break since it was not part
+of the officially exported ABI. As a side effect it will compile against
+OpenSSL 4.0 where the ASN1_TIME type has been made opaque.
+
+Remove cl_ASN1_GetTimeT().
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/Cisco-Talos/clamav/commit/0097a6f99d9f6b78381e12b677a38fb62242c41a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/clamav.h      |  8 -----
+ libclamav/crypto.c      | 65 -----------------------------------------
+ libclamav/libclamav.map |  1 -
+ 3 files changed, 74 deletions(-)
+
+diff --git a/libclamav/clamav.h b/libclamav/clamav.h
+index 8a3767f78..fa75677ad 100644
+--- a/libclamav/clamav.h
++++ b/libclamav/clamav.h
+@@ -2413,14 +2413,6 @@ extern int cl_validate_certificate_chain(char **authorities, char *crlpath, char
+  */
+ extern X509 *cl_load_cert(const char *certpath);
+ 
+-/**
+- * @brief Parse an ASN1_TIME object.
+- *
+- * @param timeobj   The ASN1_TIME object.
+- * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
+- */
+-extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
+-
+ /**
+  * @brief Load a CRL file into an X509_CRL object.
+  *
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 8b398e402..968264811 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -1746,71 +1746,6 @@ X509 *cl_load_cert(const char *certpath)
+     return cert;
+ }
+ 
+-struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+-{
+-    struct tm *t;
+-    char *str;
+-    const char *fmt = NULL;
+-    time_t localt;
+-#ifdef _WIN32
+-    struct tm localtm, *ltm;
+-#else
+-    struct tm localtm;
+-#endif
+-
+-    if (!(timeobj) || !(timeobj->data))
+-        return NULL;
+-
+-    str = (char *)(timeobj->data);
+-    if (strlen(str) < 12)
+-        return NULL;
+-
+-    t = (struct tm *)calloc(1, sizeof(struct tm));
+-    if (!(t))
+-        return NULL;
+-
+-    if (timeobj->type == V_ASN1_UTCTIME) {
+-        /* two digit year */
+-        fmt = "%y%m%d%H%M%S";
+-        if (str[3] == '0') {
+-            str[2] = '0';
+-            str[3] = '9';
+-        } else {
+-            str[3]--;
+-        }
+-    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
+-        /* four digit year */
+-        fmt = "%Y%m%d%H%M%S";
+-        if (str[5] == '0') {
+-            str[4] = '0';
+-            str[5] = '9';
+-        } else {
+-            str[5]--;
+-        }
+-    }
+-
+-    if (!(fmt)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    if (!strptime(str, fmt, t)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    /* Convert to local time */
+-    localt = time(NULL);
+-#ifdef _WIN32
+-    ltm = localtime(&localt);
+-    memcpy((void *)(&localtm), (void *)ltm, sizeof(struct tm));
+-#else
+-    localtime_r(&localt, &localtm);
+-#endif
+-    t->tm_isdst = localtm.tm_isdst;
+-    return t;
+-}
+-
+ X509_CRL *cl_load_crl(const char *file)
+ {
+     X509_CRL *x = NULL;
+diff --git a/libclamav/libclamav.map b/libclamav/libclamav.map
+index 809341f42..f3efe1a33 100644
+--- a/libclamav/libclamav.map
++++ b/libclamav/libclamav.map
+@@ -271,7 +271,6 @@ CLAMAV_PRIVATE {
+     cl_verify_signature_hash_x509;
+     cl_verify_signature_hash_x509_keyfile;
+     cl_load_cert;
+-    cl_ASN1_GetTimeT;
+     cl_load_crl;
+     cl_sign_data_keyfile;
+     cl_sign_data;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
