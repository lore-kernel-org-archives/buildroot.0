Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D91C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 01:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACAC34048C;
	Sun, 26 Nov 2023 01:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACAC34048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-jbl1Hcs6f8; Sun, 26 Nov 2023 01:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97BD9400F6;
	Sun, 26 Nov 2023 01:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97BD9400F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18C61BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB4FC81448
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4FC81448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SQLzfNAGgOj for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 01:19:40 +0000 (UTC)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5D2181386
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 01:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D2181386
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1f9e6a8b00aso1330236fac.3
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 17:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700961579; x=1701566379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ij2omiHskHLTWbe7z9SRmNJpmDyX9ZI8SWRzUcbal8w=;
 b=ToEHQrQgz1pUDJd/e28jdMfYC0p0adSLJ8kQUNpdHLYdhOLWWnK2AkFu7GpQB/Hi5w
 v6ZEq17P4xoxd6lfhPa52shUhTBOjx+X1CsZSGyPoArBHth7OTnK+sccIo9Q8u3mWGxg
 2zmag8AmTrLIdiJDEVO5osoDzhamEP4B8y9YlFFqFoHLMZs0/WGqQy6z+efvtKXFVnRQ
 baFv8KceKo9T9wkKMskNNzmOEeq8qQ6CEK3Yc7zNtbPRep8mYFpDC51XOnhVhBGjFe6m
 kqMVZSU6/5Uexhkpyw50PUpmw571JONdyMIzXUjoKvWWJRgDCDOzqMGtvqN53FZIv2ID
 WyVQ==
X-Gm-Message-State: AOJu0Yy+5lssHIiVNg5sW1v2ME/qN2zY7+3N5Wb7gfWukgtTsOIXV8Rd
 91x4XLN37XFigDIf3+c0cKi/nFa7zwU=
X-Google-Smtp-Source: AGHT+IGLEE1+o9hjqOZtAb1Ljs1txqMOPp9uNlkjp6hnTIrvYwunYciataPnpDFYZlBdNpI5SX1pBw==
X-Received: by 2002:a05:6870:aa8f:b0:1fa:345e:3cb2 with SMTP id
 gr15-20020a056870aa8f00b001fa345e3cb2mr1849379oab.28.1700961579273; 
 Sat, 25 Nov 2023 17:19:39 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1585075jal.17.2023.11.25.17.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 17:19:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 18:19:30 -0700
Message-Id: <20231126011932.1380631-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126011932.1380631-1-james.hilliard1@gmail.com>
References: <20231126011932.1380631-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700961579; x=1701566379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ij2omiHskHLTWbe7z9SRmNJpmDyX9ZI8SWRzUcbal8w=;
 b=aFO0VDQctlnJOAFqKmXn1sVU6jJPgoCNBJ/FrP52mY0GXr6k3MPiasLpiCxIWKx0JH
 Lmkk2f51+H/k8NI0O7XDZ7xpsUeHTvhIRXSAr7LcvhNQMOHtedLCCtVlULrWti6xksSc
 R+BctOPnWsVcYaJB2P91mBVXE+xM/CD+saRXgTIPzLKEYHf6A44+aK5wm+bg9x/7aA5O
 qJtx97YIF+WYeHOnIuwTXXq11nVnvo5VcJnqUneXnazCfn3dnLrSW1GosvBWwui1J0YQ
 pYXDmYq9NayBKaghNTw+GPx59YutBz8MOD8HFaWnCyg97NTFdLEtKIR/YD8Ds6nZJGff
 QKPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aFO0VDQc
Subject: [Buildroot] [PATCH v5 3/5] package/python-msgpack: add host cython
 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-python-cython for python-msgpack to build correctly.
This is a hard error when using a pep517 frontend.

Fixes:
* Getting build dependencies for wheel...
running egg_info
writing msgpack.egg-info/PKG-INFO
writing dependency_links to msgpack.egg-info/dependency_links.txt
writing top-level names to msgpack.egg-info/top_level.txt
reading manifest file 'msgpack.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching '*.c' under directory 'msgpack'
adding license file 'COPYING'
writing manifest file 'msgpack.egg-info/SOURCES.txt'

ERROR Missing dependencies:
	Cython~=0.29.30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 061ff5a761..c915b23bf4 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -10,5 +10,6 @@ PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/c2/d5/5662032db157
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
+PYTHON_MSGPACK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
