Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6323BCA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1356160680;
	Sat,  3 Oct 2026 08:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJtWkUvCBgcF; Sat,  3 Oct 2026 08:45:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 388D560666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017103;
	b=jB3GZqUQ1bdECNE64etxuLtjaJRPT+Oq+3eD1niLMHS8Axse1dq1aPKIFA/+cvRQbQ7V
	 An/3xVf/RP6dEqXTZbPbsJEFURPqgUtO7O7P+QsYgdwX30gHzbyXCHubWLN+OKmPBkW0J
	 35tNbSeuEcPzMSyNY5nnNzkD/2hsnN0tAHye+yve9u+fLaBG2DQHiGLEDcGDy9R0qOdTz
	 Hq6e8xkmRFVqoxJG0s7bWOjFqnh9yzHpdxm+gZpf+JdA2daSI1ntiM2UTu1oHdl5kcn2J
	 j1WssKUgf1+JnOcft7BwwVJQ6011qbOHA6vCZIpBC1zEtuG8htNTXURIQ07M16+Zm0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ig/76PGi4UxoPkFWXzAKDCcSuY2IGMW5EYMsqB16tZ0=;
	b=ov6kqp2rHy5uo5UrhF9BUNnyQUgTwBdnC/CGCT63M3F0EbBLqCA464Nz5vETF1P3MbXN
	 YilJFr2yMlKZr+vQqZwHhVY9+Iq048LHmZu+hM96vtdqifwLv7/8nileXBuXYlxo6lduM
	 nTNObfwZi9kIWg6O1lyzw2o9QIlbNenq9SKFA6+MbVwYSAD5L0Nf4zYfHi9cLpkodgv2U
	 CIjlOQbWI1j23PQ13S+n1CfuhdZU3JOyZ//IG4dcMTO4zqRVXRAnBc8gpYmfhcvUxq4Rz
	 HbZZaWTT4afxfE6rjLhHH2Q01LTVXuul9IQ0rVj5AebI3fHHiazJyx3A+iIR1oGq0lQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QEPbXvgr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017103;
	bh=ig/76PGi4UxoPkFWXzAKDCcSuY2IGMW5EYMsqB16tZ0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AseWOMKoG1Cflb5PCgFtuYGtLof31IXZoX8NxxUz4jjzbUHvFadksyBVlQRx6A4zw
	 6dThYMYsaz0KtaXd1WdL83iJD6tFlUbpy1KddyyDvVSpbSJx19nYq3mEZpo4n5QMmf
	 ggDaNN6I07KYNizMm+SNgXQp0urOIo4TyX07Q2l0asR0iAcnuBBHItUhSTCxg5GRWX
	 NmUgbVC7F7dQdK0apmWT/F7p0WL4aLiatqd9g9fRAiErurNIMnJQ91D8T9WWBHAGRT
	 Mvj1OLn3owFKtoLAUjMzWYG4qla+g8Ob1g9ju2WltD/Oi44WjPpkQPrrz0zksxIcPD
	 lp7LcHgiEDfWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388D560666;
	Sat,  3 Oct 2026 08:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DED6432F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D029E60666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmsnpLGl9WsM for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C95AE6065A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017101;
 b=b/nnSzDtKTzJKfOICEgTw8fTH6Q0pE6T2JOBYa6KAnjd1kZrh9OgExwnX8+K2VGN0N36
 76YqSnAqc+9Mrt0nNmkA0tXizEFVW877ws5sEUJfUVS5JNAF7N6M/qvxYMaB5ADMJJGwj
 TX87jy21Wnl94cKI9fZETmyr1EiJu1/VAB6a1tgURAyaoF1f2hCYD0dQ+CABn0ADI4xZA
 AhNnRe2m/bAcBNl3V6D9A9A/d83Teg7BlTulkbMAt9eZuEVZ7pp1yCBi4yxkztXbjS2Qy
 c+NoObN/4q56crnw+rGXZdQCTFap7oWBODpE12uN3bicXMfLrabCcQq14OcYRUXGxAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017101;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=5x+HybLgtTqWUFBYYK37iyLqLGBI2JP2LRPn7+0r9/o=;
 b=NowyalItj8sB+mVeF1EE/J6Ye3ip2NdoT3OQtvmRIJiVtCKwaJw2htr1eIwn/7HGygw9
 tqEztEAJp1wiLkAY4dB/D1PgpOnCZ0Hj0qi725Vny/O9qon/OFTiuyXAR9oG0dpS0MZxn
 Dv7nqoa1JTr1WCGGtAqZNb+ZgAfU76xIUhO3Z7V+cllaY8i7JFKi6UjiE4i8nwRkub7yO
 KPcLvRIvtjUorOzCViKxK6Ssqeql6F0ovp2labUvSm2IrVcn4uU5W2UUi/8RdQShdRjIY
 WRSXxoj9T4HbkhHPSK6a1RbBqrW0SVHxRJillyl19nJl0wlH5JjoWW3cNzxusdk+txA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QEPbXvgr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QEPbXvgr
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C95AE6065A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:00 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-82374c2d7aeso485981a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017099; x=1791621899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5x+HybLgtTqWUFBYYK37iyLqLGBI2JP2LRPn7+0r9/o=;
 b=QEPbXvgrrWl09du2O2KrFSl6Ij0fF7EtdQAl4jYz8+UGRjjL3wYr+5hi/ioZ8uu8Rd
 n20bZdwgZvpgUm+pzT0KnfEbhxZP2p9WKaYJoFadhCzNgJnxwYu9EeGCfevPF5kuWyRU
 7x8aFOFmvBaB4Cbo3y3SZD85+fXLJGnOApsU6Z5geRmpVmre/4nqIfWZsDq8XO0hO7QF
 W+vA2m4V1BAys7fPC0uMMIvHW9Xjud9ibHd4D/GMpVFGFaWqV9eDtN/2LrA8b2C2Pv4o
 rfeCqr/Qc9vuTpbi/FA1z/TKs739gmeHvYjQejClIgyiF0zr1WnLy15yC6GiJPEcqgsx
 cooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017099; x=1791621899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5x+HybLgtTqWUFBYYK37iyLqLGBI2JP2LRPn7+0r9/o=;
 b=mNeHUTNOqR6tPIrY/WXFsrNdSq7Uk+eHkcWwOSCwaQeq02mVqNSBYOPWfgULUZibSZ
 rSsipW1Utfy/TJjlcrhBhA/NTJrTDORmBLpoUOwliMrsSmMsbBunk1SNrnYYNqeOBIg7
 XzekkGCoqmvNQML8OkAfHSo4x3nmV6jU2uJ5nX3v0Uu6YaG1/D8kUJkOAE61Nlv2qTKw
 n/unVYeJZ3rQ9Yfl9qLcY/17IVBmcagoQSTEX1JaJQ3NOb9Y+nxl0hEHb88hOQQANn6y
 G76B2Nrgb8sYbq2QGWmLXfCGLiUylGEmNFrBG90r6wEontxFscJA9cVxN/9CBzf35Quj
 1utg==
X-Gm-Message-State: AFuF++kR1jli8JmuAgNhSf2faPpaOZB8rK8pOh95+7Ig+Kby3MPdluZ0
 RAOYEaGwHbEIGhqBRTArtPm5UdHmCdEwepHYsqxjoLUzFOe3HYrEQ8HY/Nqpjw==
X-Gm-Gg: AYBFou0w2AbwrQN+N+wj7iV4ZibQkEMzrv+3Jr6pjWMIHPCmVZUbA+2ZrioZNXJaGDJ
 7Wx+cQ+5DLKyrDriceyCDkqjA9jnyCPDhIejyqllxhEdD1iZFZEefneK7NIUsCsZRLPMLTVwifs
 +O70/4r7biHYdNJtzRY87aL1FD1qzXha6dSEy0uG3cItrrfvhwdX5YePKr1WwmoEyn4kLclsgxZ
 cENrxI8/DFXv7SyDgAp5kcTUd9G1vOmEJ9vlH3XmtTkYJ2RaTfS/gg34wEGFPPFv0VrT7U7Vl9e
 gQGVhN+g+BJDkN/p3xxQON5lw5h1BQcLO6vByWrFi8n3RfqxGJP/QXb//u2s3qf6P7TahwK+huu
 w3fDgFfPzADiTV7DcxK9QhjxaxsIOzHOqwXl06wrGk22RjwJcLHdzCvukyuXqypjKCBJOwnBHAm
 Rw6WeO//aUarYXrr5woo73z0Azwt/cVht4JNRPrHp/9hSx/OZjdyZ7iZpxjt54XaLbj8jWiNMfa
 GH0QGfcASnTaWifm6mM/Efj/6eSnorbOwWsRjhSoeivetZXtNjyAMEaemYSTMgwIxoG887KQDxZ
 CvgPexVTe6TDCTzPAiltgtW+zi08DAeJbGaOOAQXV7pXUY2wj8Q4RUf77b2SYMs1Oa1mKznIxYi
 wvraBDF/vc47t/+kEYg1EkF+Wuw105LuN65dIjSpdiA==
X-Received: by 2002:a05:6830:670b:b0:820:91b1:5ad4 with SMTP id
 46e09a7af769-8211f92a48amr5107609a34.23.1791017099299; 
 Sat, 03 Oct 2026 01:44:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:44:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:48 -0600
Message-ID: <20261003084453.545653-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-bitarray: bump to version
 3.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 990dda1348..8661d21936 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  7199aad3582d77d568cd673a3477a6f6  bitarray-3.8.1.tar.gz
-sha256  f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5  bitarray-3.8.1.tar.gz
+md5  07b44aa7a18fa6f800bf30cbe4a6e978  bitarray-3.11.0.tar.gz
+sha256  bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8  bitarray-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index bdfe0494ee..c803b4793b 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.8.1
+PYTHON_BITARRAY_VERSION = 3.11.0
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/fc/47/b5da717e7bbe97a6dc4c986f053ca55fd3276078d78f68f9e8b417d1425a
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/04/f7/6765577df59e2345036e435f7e983e1c291d67b7d76a51918eff04ad1494
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
