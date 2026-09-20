Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13702C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C8F60706;
	Sun, 20 Sep 2026 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbsUW8YdDjTG; Sun, 20 Sep 2026 14:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C6B7A60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913910;
	b=FpxOyTixTze8FVgnN5hne1XEv+fvTOLKODxiYBoIFYPO6H+oMUDwX5LZc10jwzHVpaS6
	 v7HBmq0FXSy/EeojJUtzIXf5U426EYABQqJrFgrpfUqzpBsJVHkleNqnsgXP4WyOm5D+Q
	 +6yFsKvjLVvAsgLJk0chjeRYEnSo5Yi6MoJhoGXfuGsc0qsxX8eTeWaf0AFicwCstL0Un
	 tv9qRdcwc0G7dj4tTL/glT3jhktcIkmSciLQSudfLCGM8+vMpQ/1UjdJEj01fzMCEGa+e
	 zTxZ0UnPzQugODHNVbbJ9meNqJAZr6oPv6+9GAsEKgP7csNBJnWLdpUgvKV3ivxSL3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=PwQOXD7nFJiSvSmVk//SRwAD0WB9XGDzWmR6e2Ymxc4FsULa3mNkg7zXRbfhh2eBvusy
	 XXC1tPpIicCEP+nwOro0iO5IsHfXN8Y8DTpYP8DksYZ3UL6gEs1sT6IxTQmYETipdD9x6
	 HZRAvdXSO8oalw4vfDjVBIlK6lub/UNxafFECs+IL8zmIaCS4H70fzWiZfi85vTsSqDQv
	 330pcjAhQFDDOtCx0Xnz//LZ4DtPQTskFj/pwpdYSw7TrvawQ0UQQcgkLgOWyb0VLjUDj
	 WK4wTPWUkSwhQPEJJDK4gFpGrUVHup/lUzDhujVT0uvq5EJjR5ywnDJVHUso8OiIBvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913910;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oXBzcAtL1P5xsiJtZbpejawbSQsDmzQ7ytUuALk+migTTK09Ly+esCAU3IYnanSWe
	 hghedZ1oyctkAYyMkiiH+C9z8daN1nHAQmZMz6tsDA5kKwL1quKgGmIcKI5L0QdZDw
	 +HzlPKpepvyQbnQZRrDhp737Q8CuGESWtUv1UKy7SoYEB40PWtUL3Gm7etUpZBWISo
	 f8dEZArdCm9ZCESxe5bjuGWZ7x+ks3y6hHVjCdNcifp3lLI1TjhiSJI6Kk+wnWTCjS
	 R13UfC+1M03zJg8P824DOWTvJrbatHdeat5imXOHma2A/TuJ6IgNwQFko9rhMiXxem
	 QDGjdxB4ddJpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B7A60711;
	Sun, 20 Sep 2026 14:18:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB76D224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD2A680C67
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jh_ydDDYcZJZ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C1ABE80C75
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913909;
 b=EF/nwGGfMHh0QcnVpOYCpPdqx3n48hILNMYTpWog8pIXc39VBG0hCcZuspLfM1ngocdn
 TF0XbmKsYgAJG3DAg78sVSMcNjR518WpRkSh83RBKX3MAo9523UUaOcan4yDWXE+FRqJD
 bgk/oTsO0kpxKuLdEKdFzXY4EV0jx/961hXS3MHFBkOKMHWhUZsmzeWV4fKzxAfU4GEJu
 a+HPvuig40iQnT7uvFj/y0r9UnI9+0f7o8cCpskH7cyq1u5t8NpZFYS7bSqjh+6e3Csve
 Z8OhAIUjmeGMsW232bKDLpt0g6Zyt8dyo/KhlY0ZV+51dgiq2yfrCakfsVuT8b6tL1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913909;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=pB6ogfFvHKSzcwOlZ66ciNhSzecoJUyb7cWtjXdJb0kR1eucfHLymllN/V7jUUbbZ+Ce
 6GRsq5uoey3G1u2V/cD3sAsBXc2ERz4bvr8i0D40DLEdyR1y547syM04AXEqm2KyaqMlM
 /Pbr54n0K5BOVaGanB2CS4g7NRtz6x4dgNSzrJBBV1qEWYPIX8qFypCu4XmWg+pzdjDK1
 4rkkK0n4ErqgqgbKhRRf+a+s4BRO+EQxmhQ9kfHTP0gGV+UjtMbQKGRm6m7H8oxP1HDt5
 uUdamjD53YmGbQceQykvrneBPTCYjgfsmYeZmh173J2niR5h0e9EckIR1RUXW97KIVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=deiOlQ5I; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=deiOlQ5I
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1ABE80C75
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913243;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=deiOlQ5I7SArnSSzk0C702F22fAew9WPutoKzikHiJvLJbbGNCiJZ/GTdBoAAb9q1
 vzTpRFYGeY5DHoSj569S2kxWe8VKY4zS0lGk/gfWhu3VXF4H3S/q6mrdRSgvUseYnI
 CLbWrdzV1vZK2qQjoUwFOUmGp+02RU8LABeD0xAQp+coMyy1QN9dzoinisOg5+9Dxq
 YCn1LJC8oqozyc/oottG41/P/UA21ZNSOyTXsy+AmzCN7ggN3NXqRruhNgLxQFhcuH
 2Ei6BwROVKvfw/cSA0rKcE+/AbtudC0y2Hw+0QSbunQK0zYQsJFtjcv5JEI96IFLcR
 Hh0YdU8H5oc+g==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:rv0qHSTF35rn2kdQWZlEFv8n4M3FvVkstCqPQff4dFwFTh0EujAeVn751afBytnHiYSRxB02lsp10x6A9QbqiYX2QhFSrWSQ2uA3TenpEOg6JWTVvg7rdLI04J9XymKfifLGPvJQimvtnOy72C/re0fs9+p/C+nTA9BYqfQPu6B317KWd5W38AFCxc84/vb4J0alApyeevcvEghP0S6RaTBskVE48SiOSkkkGQKCzs7dD/wROwPFP23nNwhb1r9dylUcA5mFcbVJqmjhY75HFAELELYeyMWlnPUyItr2BwQfV4hDYunGDMHVubKQ9Y0SWoWBeV+jamyA+n4zYuBIHr7S+srKdusvFYmreFbgtg8JQSPNahmfcCkZ3NFLn5q8qIG/s4XVb9C0QfUmLFNutl/siklKwPxUMpkbfdy28gKuFUZ2jV9DuqcLpwwvVoXS9nxEQ/y+x7by718QF4VqEiKCES4tyuJoS6WIo9DrwRjFe7f1y7ciJYA87triDQFkgptbUycOkBIfMHU3vg3EDst9ny4Z7IhY+Rg9RwIzMJWE5N9UR3Qsipl1UXrCRUt7hkgjMC7q5mK1S0fwQko4CenWydTC4/lJxTx12A5nGwGHBh
 QomrR4PE+oxJCdUU13FuPgUx81NGCVxOD9L2lbtT9YnUBIn8Ly6n9LfOW3YOGg3D5bG2ZMdFsn9HWRqpzQ2FsHltt3swcfkkqzlPfJjTjp7psqqnFbFw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 304D6A4C4889;
 Sun, 20 Sep 2026 16:07:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBM-000000002J9-3z3H;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:47 +0200
Message-ID: <20260920140605.3005461-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 49/66] package/qpid-proton: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch

diff --git a/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
new file mode 100644
index 0000000000..96ae892716
--- /dev/null
+++ b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
@@ -0,0 +1,80 @@
+From 7be093d8d96104caab3fa858ab9886f23d62ee04 Mon Sep 17 00:00:00 2001
+From: Thomas Goirand <zigo@debian.org>
+Date: Wed, 17 Jun 2026 15:31:31 +0200
+Subject: [PATCH] PROTON-2937: Add OpenSSL 4.x compat
+
+Fixes this Debian bug: https://bugs.debian.org/1138394
+
+It retains compatibility with OpenSSL 3
+
+Closes #447
+
+Upstream: https://github.com/apache/qpid-proton/commit/7be093d8d96104caab3fa858ab9886f23d62ee04
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/src/ssl/openssl.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/c/src/ssl/openssl.c b/c/src/ssl/openssl.c
+index 62d4b40a..4c3a76c5 100644
+--- a/c/src/ssl/openssl.c
++++ b/c/src/ssl/openssl.c
+@@ -339,7 +339,7 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+       GENERAL_NAME *name = sk_GENERAL_NAME_value( sans, i );
+       if (name->type == GEN_DNS) {
+         ASN1_STRING *asn1 = name->d.dNSName;
+-        if (asn1 && asn1->data && asn1->length) {
++        if (asn1 && ASN1_STRING_get0_data(asn1) && ASN1_STRING_length(asn1) > 0){
+           unsigned char *str;
+           int len = ASN1_STRING_to_UTF8( &str, asn1 );
+           if (len >= 0) {
+@@ -354,11 +354,11 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+   }
+ 
+   /* if no general names match, try the CommonName from the subject */
+-  X509_NAME *name = X509_get_subject_name(cert);
++  const X509_NAME *name = X509_get_subject_name(cert);
+   int i = -1;
+   while (!matched && (i = X509_NAME_get_index_by_NID(name, NID_commonName, i)) >= 0) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
+-    ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
++    const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+     if (name_asn1) {
+       unsigned char *str;
+       int len = ASN1_STRING_to_UTF8( &str, name_asn1);
+@@ -1558,7 +1558,7 @@ const char* pn_ssl_get_remote_subject(pn_ssl_t *ssl0)
+   if (!ssl->subject) {
+     X509 *cert = get_peer_certificate(ssl);
+     if (!cert) return NULL;
+-    X509_NAME *subject = X509_get_subject_name(cert);
++    const X509_NAME *subject = X509_get_subject_name(cert);
+     if (!subject) return NULL;
+ 
+     BIO *out = BIO_new(BIO_s_mem());
+@@ -1677,17 +1677,17 @@ const char* pn_ssl_get_remote_subject_subfield(pn_ssl_t *ssl0, pn_ssl_cert_subje
+   X509 *cert = get_peer_certificate(ssl);
+   if (!cert) return NULL;
+ 
+-  X509_NAME *subject_name = X509_get_subject_name(cert);
++  const X509_NAME *subject_name = X509_get_subject_name(cert);
+ 
+   // TODO (gmurthy) - A server side cert subject field can have more than one common name like this - Subject: CN=www.domain1.com, CN=www.domain2.com, see https://bugzilla.mozilla.org/show_bug.cgi?id=380656
+   // For now, we will only return the first common name if there is more than one common name in the cert
+   int index = X509_NAME_get_index_by_NID(subject_name, openssl_field, -1);
+ 
+   if (index > -1) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
+     if(ne) {
+-      ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+-      return (char *) name_asn1->data;
++      const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++      return (const char *)ASN1_STRING_get0_data(name_asn1);
+     }
+   }
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
