Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD77DCA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66EEF60776;
	Mon,  5 Oct 2026 22:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGRu9liioKbN; Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5CA9D60779
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791240049;
	b=ZygLk9KRSpVBKp7gf0zbvaVO2T6m0/qIWJI9KOzcbnXOtQcAmDAS2p8hkdxG3EJ7eT/y
	 ivtaabcmd68mNtniYXszEugagaXJm9lgoDyEPlLk4wP35jMQfOH4W8alv8GuXnHLP9WR1
	 VbfE79p8UMiB7DKnqYm4uW2A7pa/l4M7o9HvqEr7ttV5j3YCahUiR6knjPjZ9Y+LnV+04
	 pKX4jPm/qKY9rDKJVBEVkVhHu83/Kjr4qIj9oDvifddCWe0jlRfKYEF1Hs4HFqghooNHv
	 AnnLOSjSpyZvJxkByWmHitz2dMFNNsXEJdU2CrnV7AmFNSLtyteUyc3tbQ+8F49hfxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791240049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VHVz9huBANLlvU9cYrrD+J7L0gZZNnlQV03xj52BmJM=;
	b=jmD4S0W4Sj13fK3obnOOapYUDcdt8f0Ek03ETHX30/ZGjwmZi4DqUUjJHVp7YZKIcv0E
	 ta+Lwodn9PGCUhFUIjI3MhAjSiAVc0HAfJ89uNcKky9JOrY4O+MehWaNsbDC/hb1tcqHC
	 eiPrf3H4BG50hpG3VSq446Dxc/XvMC0i67qcOtc4SrbiP4zaJ6LFfYXb+6pi4vhKzuxPZ
	 tqoI00E2LtYCcgzF6uQCe5stcFymMHHM1NMueGF+O5ymQtuO9Cs+LRMSmExNCQqhf1mol
	 Ov0gPFp0ecBA4ZXewQsAKBtLU/l+THNwiXWCaFN6HQCxgl3FIf0L4kowYqPl/fxZq8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791240049;
	bh=VHVz9huBANLlvU9cYrrD+J7L0gZZNnlQV03xj52BmJM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aIEbNw5KcH3AgFppgllZEZkjWJB3YR0SZ9B5M4vIjka4+OjMShEUoknchQLKXSRS0
	 UQatdfVmmhsyrMqMcbKsJVIP9RT4+CSsQrovqEezMw01g0xxc/1JQKGbPirDGldPKT
	 gy9F/9jJysQgT8kayHQ2BBPVBuWp9inmT/zLc80L2CnHO100TktPFPoJaDcUjd2nXx
	 JoyS3FWSdOFrT6plIsqMqFaxIX9zKk/9HbxdEumvbDG4FwuuI7D+C2g2SviK3bu1sN
	 5vICNXV+JpZoeYFe7Tx81UUnc+ev5HubCVj6Hrv9yajhM3B/0eFZbU/2kPuROGUu0L
	 vud9FgZcTsmgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA9D60779;
	Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A7C134E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FD298085D
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rnpy7If202s2 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 70F9D80859
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239911;
 b=ax+8Mxi6OAv07fuVtcTgv32iu5w7QdBHwoHuWQzObyO8/Cq1OyzkpGG+MsAP/v0fDnwe
 qk9oMZ6V5ctq+4vMUI8TlnqNHmKzzBqGK6PFtjK87U5aLjBWd+HHmstoVxd+NBLuZSmhB
 tXUxmG3WRGS6XHe5ptH1XQtxTLHWiBodOLntbDhWih4OBxezamiE6hKhiJBaErHitVDaQ
 L1w4nlZAEt4h8icUv2Hn+G0+oUVz2y1z92FnbtP76DvP+OspwfluLK91BDaEEUdXb5oAi
 Knw5497XO0tDeVWdixWdDX109cd/4XFa5YvdrvtAfpRDIVIuDTvThK/Src3gaHUY3bA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239911;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Q5rzMM6nGNrvNokfSNK99rzUu/T/miZzyg/vl+ow/nc=;
 b=d2hkIKSibwOHpJ7Ts3p8zBUW4KDXmyiwpSsXCsSwl8yGbzXWtu3tucM8/RQ/sTQXwVeH
 FoOtqGCWno4x8wEbLb12VEdtI3cg5PgdD//H+gbnwv1wfwjt/xBPOs1XYKD9ZIMlFdGGO
 xqiLYVoclO82VBhsz5OfuJX0VSYDmgS99x1vJWzIP5wsp/zx1IH2/Vak7rnF/GfnBYHGN
 j9ZT6M5vxIV+XsECWH8s3ORCuluWRNEkYMhsYAxhM9+rKoTSJQ9zcaQAcTGsLsp5Ad779
 qPDRshbGngmzQPhEDZ10DcwDbxlfg2wmoiDnuvmDSGp8HxfKxqp75lpDZiE87PyW9pg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=L3uorwfJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2a; helo=mail-oo2-x2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=L3uorwfJ
Received: from mail-oo2-x2a.google.com (mail-oo2-x2a.google.com
 [IPv6:2607:f8b0:4864:31::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F9D80859
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:31 +0000 (UTC)
Received: by mail-oo2-x2a.google.com with SMTP id
 46e09a7af769-7f4f0c89e34so2556201a34.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791239910; x=1791844710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q5rzMM6nGNrvNokfSNK99rzUu/T/miZzyg/vl+ow/nc=;
 b=L3uorwfJOkLQU6b/JoXQXqHeSODTdNPwO1fJkJradw4Tk0HW9LwLyQV/zAe3AioWTY
 ReuFmvS1D7UaRQD5Bu1LdYKiOJF1is2FVlrHp85OE1NrsWdMHNu4MZTJCF5gJOPg2vrO
 QuEThMLmNxRf+rN29O5luNLMgXgw0Qe7t6588xNfuI8GkY5P5N01XrCBaf4m7XEZ3CSo
 ZsKcsAWz9NednRRxMJw7s8RUGzGuZwOmz2cuEYL8UIxXK+SCZp4Pryu/EF6mPs0UdPYF
 gWbVlT5xcBOyDzF4Z/ATM5j4N3sCHC5A9KIlHBqk4XotR+oL0jSKlQIksV571wP8ias1
 u2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791239910; x=1791844710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q5rzMM6nGNrvNokfSNK99rzUu/T/miZzyg/vl+ow/nc=;
 b=zvwkJ9snRaxZ5XXlOk1cY/yTKBbFEknuXCBV5CV2dv/S49MRqk3twIx+J0DSDOwAbW
 hGinVDxxDyEmlDFyfqJBrMzEYDTM0cj/jz6yza2i8PYYy8ITTBKHziozlvWctIFJ4dQl
 Ii7CrtmeFx5lZWq9Zx5tghW3ECJ44oEU/+OeuBnkW42BelLI9uiQoyD2HmsEPg6Jy3J4
 0ORMONkZmIJsItMEvIUSmbCgcm4yeBAbzd1pwZxYKaUuuqYNiRpbDoPIIxLbAnTPPJBY
 VGkwnE+BFLsFP3hfSTKSAVyRM5zEob057iFnhlhxxO/MZU8oIWJaFrd9VRyDth8W83Qm
 wrYg==
X-Gm-Message-State: AFuF++mB0wHjS67P4OjCIkb4PsBAH6kP8qe0LNoWuDi0BA1sXf/tOqJy
 m0ybfO++tqRTQC/G0bxACSnfHWIt+/58R5SIjvIrIW0bIdbt+kTIsFY5tDk6Dg==
X-Gm-Gg: AYBFou0vZFeh/YUjCI/IWkBj8QAZI2AuS9/8NnpceD5mQb0kTV6PqYxf1gPr/cuY7lT
 JbXmeZhVHmC1SWg0d2qnSnAM26+gUoe4KIYOug7U/WE4WFyELn00mvL2y3ulRkJm4v23eZbu0KY
 hd/xNEUGYMZBbwCaUPhiGcII6ro5ncj+I1rlQWGm4HWX8nv9DMWChIIzAiu1QPLvmP+Xq10Pdi/
 EamQVJ5Vdp9jcKvik4cGnGgdM4Ryg3OmmoqddC6LDZx/L4cx2pRM8Z5i0zoUvZGv90+Ch3RRFb0
 vt0Qs3g0ytOM/V9nbmx0lp8ebyp8/S+YVs0hMtvTB9d3nIuvJylSiyIoTdDjDngJdJv0Uo45ZbF
 CDBCQYiUw1Qk1OywTZF2rOaoaZ0lOUFgQIdzsEfXBJBBMUXA/Y4FZ8TuvYIbAjFnWDhsPDMBlUB
 Ydq/Cpt3xUjksMQxPU+tmPU2SeSkvVNBTO97VKeGwTr2sLzVFnkJESAJiqqmffUxd79IlE8ouZI
 9S+HKQQfruwdr/0PYESSuXktqr21UyxAjckGwgSg6IP0dktkOsbfFuFH7gC2AhbO9TrMluuKSQb
 ME1+PfcCwrDEKW5aBjn+L19LivQOn2rqHF9wIANVD5FHO5jBHF8G+YP6iue3MIg3iXlGkl8PC6S
 2LmNWW50WkfIOgX3aE2LkDsU5AKgfnnq3JLil72tUMw==
X-Received: by 2002:a05:6830:82bf:b0:7f4:bae7:b00d with SMTP id
 46e09a7af769-8227cd1ddfemr13029267a34.0.1791239910102; 
 Mon, 05 Oct 2026 15:38:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-828201c6f0dsm720704a34.12.2026.10.05.15.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 15:38:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:38:11 -0600
Message-ID: <20261005223811.2094796-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005223811.2094796-1-james.hilliard1@gmail.com>
References: <20261005223811.2094796-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/python-scipy: bump to version 1.18.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Xukai Wang <kingxukai@zohomail.com>, Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the meson setup type, retaining the target NumPy include
path in the shared cross-file generation. Skip dependency checks to
allow the newer Cython and meson-python versions in Buildroot.

Update the ARPACK license files after the replacement with Arnaud:
https://github.com/scipy/scipy/commit/8670c1479d77b9634dd790f044a9025259441812

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash |  7 ++++---
 package/python-scipy/python-scipy.mk   | 16 +++++++---------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 27a72904d2..07c40f2d72 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,10 +1,11 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  d36aba61d4b01c50551efd38ca03752f  scipy-1.17.1.tar.gz
-sha256  95d8e012d8cb8816c226aef832200b1d45109ed4464303e997c5b13122b297c0  scipy-1.17.1.tar.gz
+md5  e71b80d5afd37a5abf6e413f287315d3  scipy-1.18.1.tar.gz
+sha256  52c4b7422442aba924d03ad4019852b08a92e64ea187b933135687bfe2747307  scipy-1.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
-sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING
+sha256  f49da99252dee2c12dbd5c71762b0724063f4531de193fbcece550ad9a3b6354  scipy/sparse/linalg/_eigen/arpack/arnaud/LICENSE
+sha256  53c82c54b92d94ef8c2ffee82e12135c6c3fdf23c3949d7bf6315282b14d6b8b  scipy/sparse/linalg/_eigen/arpack/arnaud/ARPACK_LICENSE.txt
 sha256  106d55c931fd6a84822e5345d900273d059f1c27310d02567ccb313c5d18c55d  scipy/spatial/COPYING_QHULL.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 8c536df130..1b7496a2d1 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.17.1
+PYTHON_SCIPY_VERSION = 1.18.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7e/74/66de6258867beb2ef08f35f9f2ac017a52cacd5081714d239ff1a442d458
+PYTHON_SCIPY_SETUP_TYPE = meson
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
@@ -19,7 +20,8 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/ndimage/LICENSE.txt \
 	scipy/optimize/tnc/LICENSE \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
-	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
+	scipy/sparse/linalg/_eigen/arpack/arnaud/LICENSE \
+	scipy/sparse/linalg/_eigen/arpack/arnaud/ARPACK_LICENSE.txt \
 	scipy/spatial/COPYING_QHULL.txt
 PYTHON_SCIPY_CPE_ID_VENDOR = scipy
 PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
@@ -30,18 +32,14 @@ PYTHON_SCIPY_DEPENDENCIES += \
 	zlib \
 	lapack \
 	openblas \
-	python3 \
 	python-numpy \
 	python-pybind
 PYTHON_SCIPY_INSTALL_STAGING = YES
-
-PYTHON_SCIPY_CONF_ENV += \
-	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
-	PYTHONPATH=$(PYTHON3_PATH)
+PYTHON_SCIPY_BUILD_OPTS = --skip-dependency-check
 
 PYTHON_SCIPY_CONF_OPTS = -Dblas=openblas -Dlapack=lapack
 
 PYTHON_SCIPY_MESON_EXTRA_PROPERTIES = \
 	numpy-include-dir='$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core/include'
 
-$(eval $(meson-package))
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
