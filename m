Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5342FC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C53440DB5;
	Sun, 20 Sep 2026 14:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZFP12SXHAGrT; Sun, 20 Sep 2026 14:14:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 192F840DBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913649;
	b=CRVxVdWsFxLsQdJ1zsaDJo2GtArzFyS5/CVIHdjEqpm0SdyXU5MiBpz5CxSTbb98F7gZ
	 YgliHoYX6aVs3s8cXBMN1U1Hdq6C3X0dzkJgmF0UfX5pebdk8Lrl/z2c/J0U1yyzGPm6H
	 6oJwynCM8zbkx/4lP2GEkW5CVZTp0dNlFi3t4AnvTRBTKhsyROCOuuJq99uG6nElf1TaM
	 5B//CpzSFsw4Jwdr2DzsTx78HvnGwCjG7PluRWIjUxlZOcyxSO45v9yWzd4J2lVExfFcb
	 h7vQi15puBBE++0pTVxK11eJukmwj6dpMLRYSPQokMSHHwgTGtyl1vIGbSBpsVqQu6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=rFQuY8gylYk+LfcX5UtFVe08eLaaZd5VjSl/+0zO3BDTY4oCs9vLUYyNS3kMSWsKvzYU
	 UJNluiXoIYvQRpQ63VXMtc9XsV1oh5HY4XRLMUSrRkiHHFsU1HrcmhZdRhvTpIRdLvo7l
	 8/uSBAQVoCqJd4i8ucv3z3wt+blfiVrNnhvsRp8jb+Fz5jqZQzPbNhR8fe6539AQ4BYRp
	 y7ov2eB0ek+zdNmI21WuE0UgH02TT4ujxD0jNN2DEF0RfNaeeQCR5ImpATmBcuqpHtpEY
	 gIIu7Dchz7D9f4K4UBHD4N29RFb34Atms1XHYJ9KHuKVECUTTty9x6v4TBS40DPtpdQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=N1Eqd43H;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913649;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SfDFgS3Eks8VIbtjtuqj9rJ0HQzPB6yZRmgXXvxV1PcZIIHBLqQjhMAUJs67vTn0R
	 1xR29yiH8zBXCE8Gx0fcnQE1n33Cg0QgkzlxTcq2yp+fOfm21rtJJmVVX1GCZDDN6H
	 THxEbt+/BvxU5paTMM85cWIIyeevTmx7zw5X+fAqaKT6V0VecuDZn7BZXCfFiItxqs
	 YkFFW4IkW1j0THWYee2M+pv/SXTMoNViv7FmDhDSPL4Ek3vvYug2wTqvzJQek+QhO2
	 2dcFZyLM4/dn9iy3D+1oa36ekOGn5F4d4JNtrKumiybvqpZwHoQWJL2U99Y+tSR83C
	 02fUhR8Yp91RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192F840DBC;
	Sun, 20 Sep 2026 14:14:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D985A37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF53F40DB5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQmE_wb1sN5c for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A223140DBC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913646;
 b=XsDTDTfoAElDvmr9UHb4omhAy15LNTveoSGuL9pUauuMXTr8sWpQRVVN+/ELHSfLndc4
 1liNqV/Rw7vJEi6imFZEQzg8lyixUch/dULyDKkKSgimZ8dcJOKIkF6KpglPK4rMSan5j
 UqM1mTqnOq4/p2kthCM5M4fGXPpT/j0qNprBjMjrIZNNoAtny0B20h2AVfrIw0toJXNnA
 5OB56Oh2bQRNlHddzIhIIzrB9IonU2i3rxsUq8gj1PtUI86F+W9VUPTTeZq5sK2f2Epjk
 ThhHxiXDQBAQbYWnwsX2p6w2XLVEDBtLheu4UwPqalwLoEH+ndzo3jGQx9ePWoZAe5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913646;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=Shs0OEwqEhBq4uML/5xnKRDJ54AyHFKW4L1wtlKmYIK/RGO60BWAqYQM0Z3WzahRGrKk
 c9uyYDlIQB0g6vlCHfVKM9OqZNAILi26dI4nIURH9uiHVvm/eCifU9cq1u+uhzGMvnirV
 5sG3Ajc4lfYRfbqgCn/zJdcSx72l5R/vAOrD+ZGyVHD1KTEM7mSXKgPSGeQ4yNibMy725
 RrrYURnWRZ32CPOy2O0G9xQD9jlBRSmqUemWx5t9CZNTacYIXf7fEiqMntL9y9XRJ/0xM
 CTBNT/U/G0dhVer4LZiBtwpdKqgfHoVZeXiMe+/o9gDb8p2KyxC/tPh/UcLmofMdEwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N1Eqd43H; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N1Eqd43H
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A223140DBC
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913236;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N1Eqd43HCMmTK4/AoLDIR0NWAVa3SqGHyXTOnm+Y14K+zEsBWcSFwsHHPVp4Vfk6e
 7yNFVt2Mp56cBvFzUcddXWMIQVYLqKNThlymHW4gRFqsQjPJ5X46VbFmOpRtOkH0fN
 jcTynRZcXEtg9kLiQNVH0/J9wj6PtcRhdF6xOj5q1Xl1jfUVKy5lyVAlIbqBvQhTCG
 8cxj6bAr2OfTNiWV9pEAQ8oKd3Tufu4L/JJwD7Ox9chTVce2XLC/+8iWZh0eL5QAYz
 nPsBP9UgzaO9aAYBkiK3SRBF++oaKLCS8lwlWGCNA4IM+TvmUNNXIfsEWLfgbGA+z8
 pKcuFYvom8uPA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:Blu41CGnALbEyzhYrGv0SMJ4CWATowCv412DGbQWlLcBCiXsE+1XRGo+TtAXfalq7f/C7UmlKVzDaDrGOVTVuHJQvgGVRuwRhCPvpxs7gk1cRY9gFCcAzH8thRi6aqKPck9s782ob5Greu5nGpubdg9tbaC1rxDd7HWPMM7CY+yHhibyFpLfYk6de93uGsk9F6u4wn1G/Lr9y1wktqdrbtB/0IN9zR4RWNtDmLXLdr2DkMPhAMFvC91GvP6pxCS7VECjw6k71P97XnC+rKh58WUYMBBevxU9TVCJcPpKifGOxBP87zBwtQzvypU4OmJrO5ujAbZ7Z4SOI+ZH7XxuylAL16lAbJgYpngiqlZXKpWWSc3fk+yCl9Q3U4cpq3w+WAqhYGH3q1RHDPuo+6IvdVPCTs1vEyf9JXc6RZmGwg9NUe4sEm8fJmxz619nu3nx6z7+tl2pESCDeokjEocq/05nLjqbJ9AL79X6z+/CmF87oG1wWa0YiNB/RXFUnk/OjzDjMFq0sWbFePN/gSU85UZLZfSUMgxCkYwCLw5BGiHsKGQQq4dXppn27Htv64x9bE0mLOteZG027CwGl7rQm4Wk+d/lWggF83vM8d3EFzHOrE
 NqpIIia+KCX+BTLT7B3zJ3EFsxJcEu1TX7QRj3D7/7nfFcoczK5cxxhDRyh+8Yh/qFr0IaGeb3
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3CDEAA4C4873;
 Sun, 20 Sep 2026 16:07:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-1Mnj;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:25 +0200
Message-ID: <20260920140605.3005461-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 27/66] package/clamav: Fix build with OpenSSL
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
