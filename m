Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670B8EE645E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 18:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8ADA608B0;
	Wed, 31 Dec 2025 18:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYPN1V_lgdaH; Wed, 31 Dec 2025 18:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 130B660891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767205711;
	bh=JGOeYPxPCES7pD+9f56Ge59uMx0yl8pDRSY5PWcpbMk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nIfdwV68OMJh7msmOn0JJKqaq8vot2kjmcvNAFOwgVo2ABGEMR3baQl5hoIdpKOka
	 pMBc/bG/XhMxpc94On8QbY4PT+P2pNcEQF6pQSFI/So+lSvcu6+SVe41bJl+z2/fAN
	 3+POGRdF4euzsVFvpJXLbf6/1pn+IxLIMxgQmp5ZNjBTorF/pjj48Y2y3BgImggQRc
	 GjPIW+Dsky0Uf2TSPTFtd/ZpFCrsPkAFz7XD18pTzmJX//N8T/reM/3YxwgG5qHohu
	 YmKExzp+/wZBMDUqc1eq1XOgA8tQzN2Zdh9GG/hQgmuma2T6OlgUatlMEiMsFlI8W5
	 UCToJfjmNFH2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 130B660891;
	Wed, 31 Dec 2025 18:28:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DFC51177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC47380F74
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxikGQSADstl for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 18:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0145981242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0145981242
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0145981242
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 18:28:25 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-45391956bfcso8750730b6e.3
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 10:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767205705; x=1767810505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEy+fmhpzIelJrELgdh9RwAW9tqI2Ahmh4whRhl1ekQ=;
 b=Zr6Ovspj9xnj1LF0oTH+aLaSOAHk7oPxj3JXNnyrOZoOV7S1XsI8QvlZmd7aNriRdN
 tpswbYzYe/EqWzfznL23GJakpeUNLX8eoPzwPJCqSUT/1IReL8TeBrbjzaRm5DlQVVBa
 1QL0kUXd+VONBzEActoTOhmr11zBMPczNgxszewriVvgfCWt1H8ByK9erTWkxYrKDtN2
 A5hBDLL4KOtdZvSA17szwy462XqrGUWpHzvBxXN/PcACDM3s+dmntZxAzq6chAwodZCx
 rRtgvwT8F6flpONkpClsCwn/7pPYCF8OIKrsIU5v3XsCAGbIOBrDKyB6qNEGnCusv+Yx
 +yFQ==
X-Gm-Message-State: AOJu0Ywyip0MUYtAudCCTyO7vxvcDGKM1yvg6Ip1DdKw+qSaSGaLZgon
 CRsd5kOVqOkw4n5vzWQCUxvh6C3fzwIb7fU+ogztsKAdDOd+tlXUwG6q1FNw1azENyY=
X-Gm-Gg: AY/fxX4p/JDriOES+zdsfo9si2+2Mz++HeFAgizokgzjwxFD4fkMsu221Dj+rWup3l5
 aTguGfFgyo/KKEAqqrl8rIQaYt+Z806M24TQaGYjGlid+nt3XRsHdP52uPsea0/olU85rQ/89Tk
 gZzTWTssPJ7BAcv056Cg/ZXRe/TPJnX9j17Ck6t2A4CB22cwDjJbpIuuSYUTyLcMB4mY85kI1Dv
 TtiLttk+PFaxB+ZEeKnua6X0yFe8pLdLfSfR3ebTFHfk2aLrn8ITp8ljPqKPgA4WWQq7GC0diPt
 eIcrbbTadRSzQqEf6EKsScljVcJ2jOZi+s/cQcfBihi5g0mNiLnJG4uQglUZ7wiKmx95eYMiuvP
 ZJVfNiZnIQxxRV+1th9VCVabi7h72C8HSqIHnhpTLicHUZORPFAhU/H3VVYC/m0FBc0fLG1oM/X
 ipVAR026BS/6roV9n1Eq7USmcpOOclU9KMrXX/nLxuF3ObyDq64bKeDLGWfKu7MRWjnQPZH+AX6
 phVI7Yp8w874OsOQhwH79iJX9dM0zkERyiltOb8f76I/zmZoEGwuKkhiROINpKu1w==
X-Google-Smtp-Source: AGHT+IGNjfkwd3TDsShdf3ZVsCZ41W4bnC5JFmL9fSTbjNNU5yfWRBaKO5O9sNIWSO5Mq4P/JI3aXA==
X-Received: by 2002:a05:6808:4449:b0:450:b7a0:41d3 with SMTP id
 5614622812f47-457b2281a36mr17607342b6e.67.1767205704541; 
 Wed, 31 Dec 2025 10:28:24 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3be2223sm17494324b6e.8.2025.12.31.10.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 10:28:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 11:28:21 -0700
Message-ID: <20251231182821.3921349-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767205705; x=1767810505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rEy+fmhpzIelJrELgdh9RwAW9tqI2Ahmh4whRhl1ekQ=;
 b=C0Q7OYkwQooEp8z7HezKjincYqQCYiuObsbcXmNMhOnM/xAcpQG9vdvbuJltrTIgEl
 Jh5KD9SQoH+rYAY8/RM+gJbyb8pKv+MJwMeGukleSTuthoUf/yvzAaUKTUHrdFj7lkRv
 AV0mt1v87hxFZCTFy7Pr51vnT4zsgG6BrXaOHlkskWUSK2ry2Ov/d068+WBtzvj9fxsJ
 BxMKl9Qmz7whQ0vax/TDY8V0N5QM9WG8QO1FuJXEmXWuE30nB0hfEcaNivQ1CyH8l7Yy
 gBAfdAMJ2+nWDZtL7BZCrTtWcaNJCGQscJamrJB68ip3ez9wifxZkMNGJA81r8lx/uhJ
 TV8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C0Q7OYkw
Subject: [Buildroot] [PATCH 1/1] package/python-zc-lockfile: bump to version
 4.0
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

Skip dependency check due to unnecessarily strict setuptools version
restriction.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zc-lockfile/python-zc-lockfile.hash | 4 ++--
 package/python-zc-lockfile/python-zc-lockfile.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zc-lockfile/python-zc-lockfile.hash b/package/python-zc-lockfile/python-zc-lockfile.hash
index 97f05ddd3f..4a7433cc62 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.hash
+++ b/package/python-zc-lockfile/python-zc-lockfile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zc.lockfile/json
-md5  5e902492de505a0f98e49b1e31cf2bc2  zc.lockfile-3.0.post1.tar.gz
-sha256  adb2ee6d9e6a2333c91178dcb2c9b96a5744c78edb7712dc784a7d75648e81ec  zc.lockfile-3.0.post1.tar.gz
+md5  fb4e4d2cc652aac97805e516ea287bf5  zc_lockfile-4.0.tar.gz
+sha256  d3ab0f53974296a806db3219b9191ba0e6d5cbbd1daa2e0d17208cb9b29d2102  zc_lockfile-4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zc-lockfile/python-zc-lockfile.mk b/package/python-zc-lockfile/python-zc-lockfile.mk
index 60648afc29..b060e537f4 100644
--- a/package/python-zc-lockfile/python-zc-lockfile.mk
+++ b/package/python-zc-lockfile/python-zc-lockfile.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ZC_LOCKFILE_VERSION = 3.0.post1
-PYTHON_ZC_LOCKFILE_SOURCE = zc.lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
-PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/5b/83/a5432aa08312fc834ea594473385c005525e6a80d768a2ad246e78877afd
+PYTHON_ZC_LOCKFILE_VERSION = 4.0
+PYTHON_ZC_LOCKFILE_SOURCE = zc_lockfile-$(PYTHON_ZC_LOCKFILE_VERSION).tar.gz
+PYTHON_ZC_LOCKFILE_SITE = https://files.pythonhosted.org/packages/10/9a/2fef89272d98b799e4daa50201c5582ec76bdd4e92a1a7e3deb74c52b7fa
 PYTHON_ZC_LOCKFILE_SETUP_TYPE = setuptools
 PYTHON_ZC_LOCKFILE_LICENSE = ZPL-2.1
 PYTHON_ZC_LOCKFILE_LICENSE_FILES = LICENSE.txt
+PYTHON_ZC_LOCKFILE_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
