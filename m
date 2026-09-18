Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF026C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C086860E36;
	Fri, 18 Sep 2026 18:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcGMwBmKjjaq; Fri, 18 Sep 2026 18:51:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C49CC60E43
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757495;
	b=AFN15L2IlWPA9VVIoHlSKmb3x3IyEeskPRWBf4G10xy2qTon5kPu2Nd7KWcIwjbc3DZm
	 YqVAUJTcrHoBO6MMq4jKhOy0fH7q9Q4RIo8aqVH1T0OsLNUGcvhOaUqcX42UpkEYK7xe1
	 17zgMXkrLZAOXsYF8h5RqyeDxVbUNS8JfcmKqgd7BouJdSowBS5du/yhms/EjjYMWIQIr
	 pqQSHWhoL7r8+z4YGYHdkXG03csHH7tz8Z7fBOM1mJBqqpbc130HOokTGmlOaG/wRr56H
	 X5e746AdM3tWhHHzdd8xVxgIZWh18tsoI1chWj6VQOfDhMZYFLKWKXeJ6Y2rI9xrWYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=kkr5yb9f3nySZPcl8Lqqbuf4376Zb3doVSRWj7rH74t+H2/JwAx1+Y+aBFUh/ja2MRrj
	 7WljIZlqXuuIKqND0YRU+jnGcgixqYzCdCA3MS3OU+hOBizxL1RdR1cyXhVAZcSf9HulP
	 bPequIVsIvDdXqUFE3V+kUA4zo7yo2ZluFTMHqOTEaGZvubvI5i5B0mK50YPLBzs9jg2I
	 O8fb0HmeGlMLNILOGNmxnD25lh6IJhXTGRK0Sa0j6Tx2PpQ1E66ItZFd4Kog9vMgr1ix2
	 IdmVCkc3b5F/uO7Km5taK7vb2Nrc5Ce2GRHP7jAFQSJpJKpKpJNkibLXzIyA7jiEUPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757495;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PMIXbTGIsKLUHFFklD/HvR9/nrMdx4KmqIatmZQpcaRzr9P2Np3Xpv34yQuOZgUR6
	 3OfAmKUrVDLs8iJMJZui+V6hAauhGb4p2CrY2S6B1/LHfMRRGKEPlJ4bKoeJmE7KtK
	 LekbJi3eYRDzoKwAfa+Dfdxkd2WuD+2AHm3faVCw+dS39pKDUg7NVYRTe/zdOkHIBh
	 OsIQOSOhOHI64KvTlrOxIzpmb9p/A14qxER/TohgyzZTf4cHYArqFOM/dQIhbUGCpJ
	 jqiEkrkxCt8sF9Nr7zQ1OolTsZY50pEqUp/Tctf/uIppFETpDZrSZP3LM+1BHCTR6D
	 kORCG+mgIyjdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C49CC60E43;
	Fri, 18 Sep 2026 18:51:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A8383B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17A1400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atuAdY9E5chG for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:51:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D91B44006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757494;
 b=quZRmHtwpMpe4gbt2qt0eRGDQFwq5j8MntS2Y5H/SkPIP7nIFpWww8gCyo2L4XUmUHiy
 uL1RjBiyHR7iSJfm4l32Lj+VMkM6lKZ28EPwIy2JmVbbALUHdREs9VgIg13S9bwUgpi+A
 GqcylzkpldwnXN+j0SD//16WFL1a/gIn12IznUOvKNrMsvH6Sm8dxttd3rnm+cPB5GqZh
 X2PQtA5fcItzx8FEhjOgljGFshC1wTtCp3jJ2/aIl6z0qD2Pu4V6KpXBLAV2KidkWTE7T
 P3lXpoisy+N61a8ZkgeQEoSVtGr5e0PsKNTsCboAVoqYzP8Q5+a2GcvE1IFDUiAHEPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757494;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=TMa4A56IuZ+Mwl0QyEuJq1oGA9ALtqIqy/Adq9oS4iMpBOnkt0dI7+k1r7QEjAOdKsmo
 WuD3dxaQJj1MWZZk9lbXCiZLrjlbgoUnVaU63o0o8yb8F/jrF7HgK3WpkgL6hBpdTktqp
 HnBjdA7eEMqCNPmDVVLf+IghOyD1UFleAVKDs8pBlQx/xpgJ31mA64PZEmH9Op0x6nFs8
 IGbs/Bcc+nglf1JCYQ8EaDHJzssEki8cZfYoyX3BVM4NT5BuTk6nEevYh0/nXrrFWbzyA
 kcCzD+GzIf1ZjfhIW/ERIJ75OjUmqkJ2BC/7ZafTGmfG5+av3+OxsTfa5E++12oCmnA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tQu7hCNS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tQu7hCNS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D91B44006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756936;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tQu7hCNSBS6RWAS3Dp7wb9tHNvRzznPnYaVRWSe3tkDbrNYxqgQKQOuaX18DXLb+F
 BIhFnR12yo+eL7ys0epg4w4vnisBX0ghmXbOF4zx+CeNrqml+uJ0QiSNDKDuC62qiz
 5q8otl4i/85Wskxy/90wnny9BE/kR6JPSnyzObVDwXhWf17vTPkVdN5nrIcPEXjFPZ
 sC7PaQfkGFVrJ6rSS+CDTkYWEZ2VFJypariMbJZZBo7u1Z1RBxBYRUihCwQwMDQyQr
 SnMykAsHCsafCQUnKBXlsmdsYCJFIsEBPvUgfq2R8xT1YQ42leDPzNGXUXYufiyIML
 tvigjYiSkKF+g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:/ERiPEKl4HFm81CAAuMTM81AxCq6n+oeeAdY4MGrCrn8INiBP9H/1PXpdMgAPFU3XnduuQvpi8nxCvTH/N0f3c4S/raaGjMT8RJjz0jM+jJybdup2xH3bZIpS+jUiHuCkoJRBFbO4toH+VHU7RiPFSepYb3NPQiGNTiAPEAoif0RDYsheGfYleg7tUez/a5N69yGvr4uISxP+1EvJgXlTCcEquBJJEIYyfGcAm/1LqOIN8UJjoWKUch56dhfSThlHlOosQaveSry7h/Ct+m7ddr+8UYCG/Pxn4GGMqv3CeyjYy8ryjvnNyrvhG/dhAXQLDWB5lHloqzgucglorTEgVdEjbYxns7CeKJdk4f4tUEPbYEhavJzIBnreZHTybURnxUgYnDJj0WGMa5fie4d4NBQVqflmNVYz6bdvE0aufarZEO0WE2gdBv/91BMEVLzr1pgp8g6m98Ln4UM8isxkpP3OU7yxZ15gtpoVGgJHJJokos9HWcQBmbIn3q87pPl6q6NOzKDZXygjhjioNOlx8Q60NCDHxNI5lo1k1utpX2pp66MF+2mrbcuutaCKTuwa3Q0Xwyez5G0PiTvH+kURTN2czoQAbX5TGqLmAboOkzczR
 8Fu6F6EkszWtPnolRNK/BwRyyX67AsUedbtomkElah1z/XqlfsyooOy+xQ9tZRWeS6UgmgJy4M
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E360BA4C4733;
 Fri, 18 Sep 2026 20:42:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-14Mg;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:57 +0200
Message-ID: <20260918184140.3631274-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 35/77] package/clamav: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
