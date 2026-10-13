Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A9CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30F380D6E;
	Tue, 13 Oct 2026 16:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1_dR5mDO61W; Tue, 13 Oct 2026 16:43:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B7AA780E24
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909812;
	b=rte7974/eTyoF5YVIxj7s86aX+svUYGnsRi1fV81h2RK6G0RwDp0M3h00j/tw2kx1C83
	 C1tfKjutRN9hJJIsS3C33IJf1tYFskSFeCUaXiGEgbzxzGu74DyyWGdzHzFxE/SvMRdkq
	 AX0FC/0M3MO8ZyLJhpKsWRXFS2XbGq7xHPDqg/Pv5kQKycb5jGw+RflWXNFd6mIczujcD
	 tJNljF5ROHl3S2iChLZlbnmG4w8/izl4l1GBb4XPoqdZVok56sDoWwX3sVVNgbOiVfegs
	 PBEuxX0PaITGom6s2T1tWWPRQphNVNnp+iFpov2uTMZ6tlpuNQ3Lhd3Ch+T+A2PGupQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909812;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8V+TDOwGzRwbii8iBuoHW1Hrlx6m/i/oRRVr+N0Zzg0=;
	b=AFzJP4/LyoYqMic5f5Yp59wDKe01WSuzo7kGvGUNu+pM2OUkCvdrLSJY7CKsG6tznbUC
	 kEvLMFGTirsXAy/ajIg06nRfdUVLTzDjfAQOoWy/W/qPgDYG/VpXvHj/UQYWwVOFVg7sI
	 25+lgdy+ctQPMnGDc8fJ9emgUvz65+KD8Bs0Vf6+LLV/lxqVRMnqDsSKJQ3vlAWZdVBhc
	 R/Pvc4PWiOkmr/aVOickLTZ+XFbBC/whkhKxU868uJRAciWOGp8M/qzHuwOGSpSJfrxeZ
	 PMNlG/PBT7+9xCCNlmCoY2Hf/hLa85hTmPryrcuUiJ2Vps9RhAi9pomfX4hizn6F+tQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909812;
	bh=8V+TDOwGzRwbii8iBuoHW1Hrlx6m/i/oRRVr+N0Zzg0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BHtSfzlMc8Mc0YkhI07hNCbqSe+vPD1grY85SqMTQ52Pdu5U76EoPErwwWmolMNH/
	 zjkwdjVzbn/PECP4lDh0Y1ZC0VsEUGCgUOYAbbvXOQvLQGJfPg3NmSmnHkQ7RZgdGa
	 q7RHqnejA8ip7EGECi/dSskSg/lId6cAGlnNMTGnmAH6zCzd5xiyLU5Lixw1YaEijH
	 sSjIXNbvZvVWOXY1+NMrGk7P0GMUy35QBu44yhj146xtzu9YfkRs2xvQKdz7T7Np/v
	 fuar/5Hk8iHNYYJyLI6FNw5p0hk3xqtFLfkbZb3pD3gzy8oZxbN0ghjQ1kIqDc6+uG
	 agAgCYhBwWrxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7AA780E24;
	Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1029A129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAA6A400D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hA3BlT7PtYrg for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 073E24007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909807;
 b=egdn5Mk31zjnEdqfh8dvDUfA18Nq5h58JZZc8tXXDdDpTt64Auxqq18WsdNMgiZUQHi2
 +sI3ViGUOQ+7S8HlkrfgRJ/uzys6M68dQ+dd1Zk0qt6M4ok0LBH3wPmpVV/xBGNdbkW1j
 x5cohNmCjGGAmB7k9rsJD+i3WTh+q868FLkv9l5//Y9ncr74drkchYDjEJkxYsBcBoW43
 sy8usSB+gyE0B6tRCipm+oZOlf/PM63cuNlK2oYYNbmSLC0HQm/VsZ5WBkrvM3+ypMMxK
 97gi2DOxvuY+UJLA7InxPnbQdsIKOYj9O8eIcdE0nq2secqS87X95LwlQb/50OVblkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909807;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=OW9xJyEC4qrreEcMF8awo5AwgdPYofpkMDkSRqZGmd0=;
 b=AroScEU/kfeGLmcC6P0/MAciZGj31zAbE/IWAPVPQKeYKf8AvJWUOLRTpAUXTaH0noWr
 J+ctU5I/pIjt6t1Jfuv6UBhMryk7JgjP9HlkHv2n7BikhBGwxm0Fr1Kymj/KAzHLflHmi
 wcbNOKnhKlKG+d3B/wqsCLIvPssoFNaCHvuPjMntUyImZsUQQ6zJhE+8e8oh+8RfB1jWz
 yPLvKmJiQkZ0s6u83ke0FjSufSNnZrw19pI4QJnrTQdRIfgFdzuh08BTr+vd9H+AZVAxz
 PESDmP4dfQlUabG2pMOp9N2SWbuH+yqpRNnqdwqhWwrInfchRVFvPIkO0xhX//QxfyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="p/sLYnjV"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=p/sLYnjV
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 073E24007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6cfed5dd071so2256773eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909805; x=1792514605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OW9xJyEC4qrreEcMF8awo5AwgdPYofpkMDkSRqZGmd0=;
 b=p/sLYnjVyVmW+6hvexxN9EzMbOM4Y0fB7sZVBr1C93EI7GFB581A3f3C9cqoV70p7U
 kvDEZIicaS1C1sejyTZFzwHykexJro3FkAAKufN9XP4AVjhpqAp/cORs0f2DRllk44kH
 Au6NEUr/mcZkXRZjvodLh01QwNhUo3VReYcbpsoNROUnELgc6TuSHe2fGTZc1hhUJXAZ
 cedsUiWYS2khZIyigzQs3yw7AtHwQo+8oAk15X8RqTOQuYoB+4HxluEAYlgy4Wdabl5c
 +Eif3sJcxC0gvdULOBudRoY58vW6F/nYtnZrpfIi/LwE9d3ACSXuMjRkUM8uz9/oRXX5
 em6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909805; x=1792514605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OW9xJyEC4qrreEcMF8awo5AwgdPYofpkMDkSRqZGmd0=;
 b=2NIWYhtWczMZb8SkvYM90zQT+RYljFx7FMLkFBQ8oEIRQ8yePEm37qFkN6zmNuOyMW
 tStJ/ektiG52v2p3OqVlfTjFNaIWvMxJaOgF1nJAbj0uaQ8Jt3Ta0HJXX7c5riZ3UoDB
 YhhjJCWJWalGardNzsY0lQJxK1naYJ7U/kxmnVV3d+kwqEj0FVMIbELjodn99O0FCJri
 s7nF2aAv7j5WVpVSI3AcmOF0gmpAnVvyzjti+OlDDfTWLQNfBQ/T/wVicYIZ/zbJ23Su
 G5jxbePumrWTyyRue69ytdY9JgQszdFe91h+jypAD6BGMKoxmlE/X5ITtiMFikLBijhy
 XHVA==
X-Gm-Message-State: AFq9FYKoOBTGVw8LZ+W5H1SOJRSUXmEkaiSmJXbUYAak+KA4eVAeuOVy
 StM1OdE5teeXykKYScRkx3eZY0ZmIVyPx+iQU6qhVeu1LmeMD65EtyKrYBpmLw==
X-Gm-Gg: AYBFou1p3JuKqCntmv9pqSSDo0GZeMEYOu9fUmZCGFLQwhdL93RtE8AjFS5iHTVYtoB
 pjS+yyI62MQGMl0SEUd9h3Mm/qf1gHRWSN+RI90ADphE4gb7haCNFAp0yp4ZMoLEGsQE0yhwtaK
 itGaB3icBB0anZwER/cdlToD7Xf78/TNqTtPGr/0HxOdeotSea9yulJNAsb8OFb4B/BmmMTP+6I
 71Os4o6OPG9PKz//+34rP+YLeHPPyI7lAiwQR2ip363+mFCg2XlHAROaIniX96jc8rg8OCufY5c
 Rkw7ap8Ayox5m5md0+z7r08KVqu2NFQRKclCyWqtqQh/IdLZzDZDMWv7Ngizd0LrXRlqDayuAE7
 xoiIWVfjuKs49wZ4ZPSIsH+9asVVJRTJsS2AvNEx8noEJ6Dv4fU1lGTHRPv1iUb8jxodlRdeWWo
 J1lZ6nv7WrAZhEexZzMbE25dg7VzGJOHVMYzafEdniVI/z6xBXw+sSVAx3Ds6w8tsGKm7WCvgae
 TJWEewA860b/PmAu4QUO7w7kPGSZb3fZSNwb6Svpo0ffDT1zI8FigsUuw6NZ7EHG/JuFm1wvtae
 J03+Ngw8HRuV3ft1jBDif4JFcFfBlQlbxAluIRaNEbM0NB6BHR/9JKos9jlBDtxrNH+RTXAo1yE
 9Lr35cIkcKlaO0sQEZjVUNtTBYgBAHmFgtnNhS+9Nz6U=
X-Received: by 2002:a05:6820:1609:b0:6f8:6290:a8bd with SMTP id
 006d021491bc7-6f86290aaffmr3774198eaf.53.1791909805651; 
 Tue, 13 Oct 2026 09:43:25 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:05 -0600
Message-ID: <20261013164254.1476592-19-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-orjson: bump to version 3.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 14e6c2800a..d80a64aaf1 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  5cae5a2c983f959e634ddd719faa35ea10b692bced61b4df74d81e281e514fb1  python-orjson-3.12.0-cargo6.tar.gz
+sha256  c8c68b942934f263e2b2d47ede16c775062797f9a7106b939eb6ba0eb0af0429  python-orjson-3.13.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 15a2cb7873..a96afe8741 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.12.0
+PYTHON_ORJSON_VERSION = 3.13.0
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/0f/f3/742fb1f62b825f2c010697eaf4e828004bc2a81e7e806666989c132c7c42
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/f2/72/380b97dc45bd162d23afe5194721ef678d9eac7cfaa549fe2873f7f0a518
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT, MPL-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
