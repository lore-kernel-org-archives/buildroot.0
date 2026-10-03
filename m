Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DF1CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 312D260683;
	Sat,  3 Oct 2026 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBolXdlUU-hB; Sat,  3 Oct 2026 08:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5A1F460666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017109;
	b=ABKBUNzrDxmwAcXKFLJiaW90PWQ0t1H75HLu5mqAwfZyly5soIRubjaLB9zB1fIfQmcq
	 kvbhpnTRog5IIgiG9l4elHwkoKwKnrYXL0n7+7DXlf22qhCfi7C4S1bUQamGW877Usep8
	 vmAiRU+GwS3yCBLrKvoE81v6mCFsk2k5OsGjvhiVS85E3Kn8CERYL9HS2u+bCs8sQzemo
	 XUev7nzbgktBv9/C+1gzJfhdlYV4BFGQvZa3BjCfjwlIYq82GlPiKBvuwMfJDs+OUYJPT
	 KNioM8IOYXbwYT7u/1vHKDPzsIwb/ny9JRKKOX4Eb6u/1jqzIPc0EhM7dzrxNC1SzmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iv0xBgt5CAk7SfbPuysTC11Xt1p/+n5grZ8fpape8Uw=;
	b=iAJNJoFIKTLHclWDPAcP9RU9BrA9IH9KVvKDzpCQDyPF0DTysChN3+bRpkYVW9C/sZmV
	 XxSIZabnOuk9fKXaHxMpBGM7N488RKuqf8bMhpv4RefsGdeJx54snfPBazw7/U1u4RwAO
	 Wq+sxfA3SLsc1dJvarItp/vlAMcPCbLnG36VCwuCKWQh/lCWiXp4AwI5c5BN526u39VkC
	 qxN1E6Q3z4T5sR1iLVWU48K7mafbjxdnzh3gC8qtlprHFWBJvr7v1jarMYOeH3P0XNG6n
	 qvvDXeUHJCXldJhR8pycscTeLxerAhSYRQNP0Z/meZ5oBEPWzhpc3VyIGByDQZn7fOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017109;
	bh=iv0xBgt5CAk7SfbPuysTC11Xt1p/+n5grZ8fpape8Uw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=dch8hpRAvezUK/UDIdNCllDMJoL4ClUH9JwGVyUkw8MtdHszSe+ZBCjc5lhYUdqWK
	 2j6TaIagrOGFcyI31YQDI4ImwloPggK4SbkmtcVQ8Z2cGbPsRZSdX7r9rulVwFafyi
	 aQ8TiTRWQO77zbXfKH1XpmmjXy0PwyDoHFJqjNMMs8Dbd3hpi54zq0QvNBuNjJHpFc
	 OX2HpYj1xrVrTHtGRMUGqJnasmg3kUhJnETlZP9tzcKBHxiTn3mM8tGnoUbrvGUy2G
	 WhvHnBV96rvhgiZPYpxLPbYQByA07vB5pm3LqHlzGaOpc3KxTthbPI4xxM6xhzHXfp
	 TlZIpWRDQJWQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1F460666;
	Sat,  3 Oct 2026 08:45:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F46132F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 513C040070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMoqqwyiwYBn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7185D40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017106;
 b=S+8h5FacEom5n8XdIM+WjDvmsVSkkoOcwmSxrwRKDVeUfm70udEJ8KrfYFsTc1IJDFNV
 KjKEc6EwzjvWsQwCcI37PgQsgV1GxrUSSJPEPSrn490W6RmoQzPjUoJ8rY7vudGHlDGY7
 MoOq6+Ma+a8VdV4JNJ3kFZO+jj9VouSBbIopEBQznvIZmf3/0pvCqXYYj/dmMoBZ/g4bn
 Bvu9QzaeygSsPF3F5IiJG9EPxnU17I5sRb8WPQAzCdjT7AmTLFk6CbxRhqP0pIIZC7ZUY
 3ultJAfnWt2ApFu3D0cCrWeck+HveUHfdSvpL+G9AUkPGsc2blV2toDU0hjSAnlTVeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017106;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=p1KpQyrLB2Rh3dVNb7ubc8dabtWMpRDEgucKm3jSTTo=;
 b=lfq70QJh1kAeOKR38cKGzmVP389Br4hllIMMTEoWIfq5IolExGk3uyNQ2Q/9uIYlp8Dh
 TBixl1pIyH9SNm/TLTk65tLNr3dYFqSxb2sSaVYAiRViIahRzDmP7lIBvsCpcRjmXUSAx
 w7s6ZkzG1aREVq5ucbY0fiosyAYxtWCVqrMukTCUeI3RKQqADVmjqmpphnhtKmFiW2HEl
 o7bkz8+U8iNDcXrnuF715GXSNZSZEDUpDgMqSAHIFMGEccjjMx6BXQcTZb08L7zyNH1pe
 G6JBuL3qwtqTBZ4JpMhoERukPhFUfLsQD29go6+1cmAFuAwivzBeGSxd1d2kRtF5lIQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WEUoKIX9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WEUoKIX9
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7185D40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:06 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-81950ec4f10so424143a34.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017105; x=1791621905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=p1KpQyrLB2Rh3dVNb7ubc8dabtWMpRDEgucKm3jSTTo=;
 b=WEUoKIX90lNuOjy98foALHN/8/q6ocZjpes6QIjjcxOhmZm3HFGMCBnimtGKUXv8Cj
 hfowqXIqxBIpGg42Z0BMnmkdHDRsuItlGKQbFfpTtlUwDe5nxSDQxIIPeRnSW2k0cclz
 RjZB7AE+K7JjZDoga2hRqB6QQZiPRGn5sN1kobgpZXhXtsIpnLHYJ0jW7/uw27jS6EQE
 3hBQAGd5w5aBEN1pFRQYU2ZTBjdr1sEuI83n10yrWpgRfefFmX66qelK5Q4HAVO0q9jR
 TCO1O3XJQ1J0V8d8rTL/eg/q/CvgS61Teo/yLDiNAMG/laU7NI94GLw6FT0Oz/cpo8hF
 ijWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017105; x=1791621905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p1KpQyrLB2Rh3dVNb7ubc8dabtWMpRDEgucKm3jSTTo=;
 b=glDc6cINhO3kam3HsgMqb6kA/HKbhNLKVBJvzkh7cv2fMh4EUbmaC6qT7JTPKzhFdR
 0pnGE/vgkaSP9dpNnNwLUUxNnCJVX0kM5ZGPmsqKPN8kUhN+sa/RWgU/KaWb2lmuVJZn
 XT/eOg9bOA653zkj0E2RlzmQg71umuxBr2hG2+d+9XM71CUn31DqtOF1gdaTDRlUjibb
 PBoAnunDl2FCQy0vyJKI5kcJGEk+d9rnxDHZs8pAy9v6KKvf57KRSUrx+6xvwCNWRZq2
 RBbASH46MZcFeV7S6rVrjBB8mN3d4CNXLwVeSPGNsHfbI2+776y8peSw7NogZlDQ3ix6
 V8Ow==
X-Gm-Message-State: AFuF++lMAmhe2+mttfhfRwOAbsLDsEkr5p1PHp6frKsbmM6DqaHjYAIi
 dSC/NrxfPdbXeTo/0+nrpvsto8Xl6FujPR/BNehM4zRmyADZEujb5jHaIA3pUw==
X-Gm-Gg: AYBFou0JrsvC2UDObFCxghoj2+dF3m6Urj9QmIeoUsXz1wuyqskZ4SiSxjwK9CH6fve
 aPHy4SWodbGFnVM+HV/qutZlMl7VvrV1NmXE4+IBCx3wo11GaWjcJcRC62LXIG39g3C2wqS/SMd
 GA+wSQc4TtP4T6iNN4cDuXQXD1T27rPUWolLr9EWv5exP17bAY3MsyvhyObHceY8PLUyOJuG/Lp
 1jYTsXoee5QSm6oyXhHQPC7vC2v0rGBsSA+7UtxTpq/pruU0Y5H6R28uIoizcEnSL1Hgs3QAZYL
 krfzsu+0dwXMqtXME8wjiXlDy4sgmMXy/iXxMZ7ylsrBRst73rzulkLSrBeCje5185cZp0r2sQO
 fxPG2d582zpiHv9x3dgLpum1M0K+wM9Jz8Ji8nf9QJd6O+t1TLbUpFVtEhVVU9oKI+z8cZbW/YJ
 8QPBb66NVX0dvUJJKh1Ajk74dYYJysAQ/Y5imeovgGSA7y11AZqQtxwVkfX63Iu+UKyl9Hw+ODy
 QT/G9+TRInOjtPCzZxjwIcYKyfV5UCQdJhXULChE2Qf3N+oxdZPhGQDx56jl2uHzNCkyGP4MGqR
 +dSRZEwsvjjkQtuGPIlO3IVC2tDYKntuwv7nmvm0mZvBAwtMnD+/z2IPqZpGJmDLd3lj2xP60/b
 /M8Ed/1w5UarWJzWkhRWVyewYlKlPlRM7Sas/zKJTvQ==
X-Received: by 2002:a05:6830:2546:b0:7fa:ac4f:79c with SMTP id
 46e09a7af769-823fdf0b535mr1929366a34.24.1791017105083; 
 Sat, 03 Oct 2026 01:45:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:51 -0600
Message-ID: <20261003084453.545653-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cssselect2: bump to version
 0.10.1
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
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 65319e4ac8..5e5ae17f1b 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  2aa3610000b7aeabe8da9cad3c390078  cssselect2-0.9.0.tar.gz
-sha256  759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb  cssselect2-0.9.0.tar.gz
+md5  f805527f3913f649c4a8933251d29d75  cssselect2-0.10.1.tar.gz
+sha256  83b0d820ef589dabaf693289b647c2f5b410f76d285f56deba911ffa75a7b9d1  cssselect2-0.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 3644bdca18..194cb802a1 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.9.0
+PYTHON_CSSSELECT2_VERSION = 0.10.1
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/06/00/2456b6b664c7a770989cbe3c352aac4eb962c938486f03a2e1255ae963c6
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
