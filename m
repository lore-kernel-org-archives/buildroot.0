Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A983DCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD4840869;
	Sat,  3 Oct 2026 02:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdLDtDteNcVw; Sat,  3 Oct 2026 02:31:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9686740A6C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994665;
	b=dNfhD5K2LHnhcci0rKhs9+7Y5TSGHdJDzJLpE0FX+IGDSRYeA4VNjmEhdYk9X5Y1mNan
	 XxX+JkpmGRLKD+cEyluNVeVI2lISxyasuGx/VgtZd7v9x6tkmnheP3r/jEn2fswwX43Ox
	 J/usnAhSiau8/VZooxnSx3ufUm6TlYEXFJoKtiisUtEI7Gp0mJKfIx7/HXrRyvuqOKKDR
	 HCMeUV16rOT20G6JOyJkeJrIMVlDqqTYWOkWZm7Mvv3ks+iXv5erVs48n8fA4HDzRl4hM
	 RqIOhYZ9BiLmgz/mjouT4P432wdsdXbsl8zHRICP/jxH9CdWur7EdavMoQzlDvIRVqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EiBP7B5CB7/ZbHqrB7VIw2tYr/OcTmqyj5SNpRncnPE=;
	b=B9URyxJ+Bsqy2uuXGvep38NPZX9SePj589NBtOHmyZvXCqcKMOgZK20iRh5VhctjD7D8
	 imriWwSUKfEPfzmTiSiKFermdIPqtkul0LQJdiew/5wxLbTSxW1UzXtF5DrcL3YQ5QOD0
	 oSZd9VD0RXl1k5Spjr3XMDQzZ1yI2maM3xubXdTTTuC8pGpaPQNcr3uGQPJib+3uI/Jr7
	 XoifEEEMMdJ+41bDb8hUmQ28yh//uVTQZDXcwzMupN6gtM7gtCkSP+6mVp/Bq3wPiLm9s
	 7aBlbjXHHxbNOXt6WgeIvBAOhJAJGNjn2ir0IGxPnwXKmdHQBWDa6yjGkTNYeLKUYCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994665;
	bh=EiBP7B5CB7/ZbHqrB7VIw2tYr/OcTmqyj5SNpRncnPE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jntuQ1cwJnnA4XAaqu30p4qn85rdNz23D15f92/KhvwO5Z/kEdMXXKkiJ8GMJ+8uu
	 RweOKweDMCesguzCwJWpkr/FctO8CTfiWO4eaZOzpdyEoUbwx5qvUVSws0Ril31npN
	 0/INHJBJSCXo7YI/tW61U39HM7ReUpWGnrbkSMrKFXLe2hNvyazRQKMGXT1t9fu/tC
	 jMBQOmZZNYdXSxdrXy6iAxnjFdxmwrOIZgMzPdJ48V0aykQxzbRF+R6kwN97Bsq6ol
	 qxzMZbN6F8H//3CX/Wz0+u3kApL4vXxcpQwrsbOifv1WkKID3zSW6ydEBFb6NGe8md
	 LNZ49Mn5Tqxcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9686740A6C;
	Sat,  3 Oct 2026 02:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D083179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E8FF812BB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G2VSAmeJj0s for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:31:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 196D7810C3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994663;
 b=MoatQ+uzZfXU3Z/OaS/z6ZoJ+ChR+LLfeF3QfgNgsy8Hw9IVbOVosiQfGDkhFAIKnYqr
 QWwvJJQt1DCFndoRpPeGxQ050KeQb03wIWGsRz7E3WlTbK8d60+kFcK3mmTdDn4Vdw7q1
 /+MnfI10nOO2bHXXExyNI2/sMhlxs0UrUalXg5o+ugL+NyOF4tLyUT+7TRw1ixMC459XG
 LQyH6EZ5RM2pMJFgxexdM3LG22L6XR1uix8ZzYeKHKRfacAsBkj2r2okm4FwH41gP8ngL
 Qed8u7ZxpMyQMX9TmZixVXVfb+7NGTGGGRBqS98aa8+MAHWBHCr+eyCvATPPWy6Rdag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994663;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=RS0Cu3nJAjJRmn4iF27BVxH1JKdnI9SKSuz8L/o9JorFxOcUZkOnrL4PRcQoIf07s93l
 YQl5jnMFv4qx1nPI1VwwI/gBKZz7xrfjKvyGaerP17Dmm0lpI/ATiRakpOW2XVht6oVjH
 pHr/NGfolVwbsvb+GJGomXkzYoYqTHLOOLeSDJgXAxVKAyRxL5YeeCwX4VfgMCrYZXjhj
 /sgcpG87lyllWMp0kEnfcdsoz6Pyi9Xdz2R6vI3PVbRAycdt80O44rIDabzn3Ln1bysPK
 wDsCRK35zS7KsZyfo3QTaZnPopIi2zkRxZbgwtXihPQNPMIsCw9EZ2msEgc8Ugb8TrQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PQ8+fxMv; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PQ8+fxMv
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 196D7810C3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:02 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8247421d2ebso22294a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994661; x=1791599461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=PQ8+fxMvT0yzKXOBi/zWAfyT6DlCMT36UUCkv3apB6bCQ3Kkl4SjFr8pvBLsXvTMFC
 Ifdq0FT/pbl7Lu0d3a1jfb6ziRvlgFvw5MMx1J7qYrp4CoBJWHZeNtrpW0iqbFAgh1zn
 6OAbr/JsyktwZow36qa8iicAVNcI285+tn9lfwKCT96DiIcfeCcfE019wh2TBv6M7Rhc
 Gkvp1+iBWljUCYLU1z8lFqEYKzZUiVY5Cgw+AdkAcGU5mM0IIb65RLDBRSXzwnFBJBkF
 xtIApMK+lZqjRtD4/xJdcLUJ0yjANL2LRwJuY6h1e9S317vld/8VH8WvxhdeYnclvMMV
 3byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994661; x=1791599461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t4fwWSQ4rlZyJDvnrdQYpxtC8D2T0k81EkfL3a9/qUg=;
 b=DMbx+HBvBIwha3+Ux2/S0hoDLua4Tma/A6AcjGcKAsAqdv9qzXWlq9BFMVhrZRz6Q+
 uUu6qkLkFzwdBPVlLFs9S+laiIISty7z5LxX4OGFWgWxEJUbMVJklq67910j1xovoIVn
 jMDqBT/UX0qybFBHEGoEw54b2b8/Hxxp+PFLabq0kIVl/spTTSlmVork4iiWmQyescDA
 TMPtqPMlWmRTFSIDa7dHLNdblM+hEV/4Ysz+TrKYYw83tyjYf0M6iddWqJQBFaQHEtZt
 UuxVXPjGP8o5b0syf3+e+QkgisL5AsSplYySlfgHHuASFHzYdTvEKLMFsqJJEGfgPoT9
 ZAKQ==
X-Gm-Message-State: AFuF++m0YCwxLwXjG3BHDAoTiD88Tnr0ANhO+CG7bJEnIans3NAGGNVb
 SxXtk37Wi8XgKlp47cOI/H+Yef+cNjRuzJWhW09AsjsKR2iL9iKLICM7gMjmWg==
X-Gm-Gg: AYBFou1/dSrkpe3EjRtFhKNqIdQ5iMm3mOW+2uSnakHJ3hr4yNF1aS6SNTTJxeJj6B7
 DcV498FLVqJhO8w2bE0bNbH3cwPrGmlnYmTiaMD4KNZFXeckdbLInhz2D9GCtDXuMV+eV/5/4+C
 MT17M7mwijrglcqWsqVO4X29Moi5SXbkr57ge0odtemEZ3PRzWQJN6eXmTVNvO8vL8E84g35jJ1
 fQPm0akzwU2CkTYDYEISZwHVXe6vKWI80g/OXaXdssWaAREaRdSkUMd7EUSI0HibyaZqEISu1Sj
 RdmU0bHE0MhgLr2ZBKSJ2tZeF2W2joEtSvhAAzaosZ9JPSrFYjA6KRIvuroQmivAzGY3INRF+Ug
 et3f1vQG9zwh5+PN5V4o5U3ODayVSoSMqv/Alvser9WDlUqvBOJXorKsKWtq0XkQUuCU01JA+gf
 X7bFxqsfFNbAqdILJ1awd4NQXtyt/80qNPEvHtXX8sElPf1Bk+yvExo//3/st1zALQ5Y04mcREY
 JCWmlBA1uztgeiZQGnNub1fk2sVF7x3dp88QKGwQnYCJFkT108baPErjguOArsnJjnCabKg9IfB
 kwHAbZ+ELInLMfNcNn4dyB28Zcyqeqx+D6VHxhsEuw44I2c4D6Tik/VTojWUcYz9BZW89IS/amN
 RxEcq1uET/1BnMHmk8q5LkRMnGLkjihbwLas4aYSpGQ==
X-Received: by 2002:a05:6830:2584:b0:81e:b1d2:95f with SMTP id
 46e09a7af769-82283486c71mr4611446a34.28.1790994661674; 
 Fri, 02 Oct 2026 19:31:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279395f6csm4913620a34.7.2026.10.02.19.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:31:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:30:55 -0600
Message-ID: <20261003023057.452151-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python-maturin: bump to version
 1.15.0
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 117a2b9463..45e8492bf0 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  703e4542966258bc728916f99fc78e38b670a538339cbf7f0e1b3bc9f9ab166f  python-maturin-1.11.2-cargo6.tar.gz
+sha256  df0b5d46b6a70ec13b5610de795e055c34b8cc898640c918b14e22fdbc92c9d0  python-maturin-1.15.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index dba5e8bbce..5cab6697bf 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.11.2
+PYTHON_MATURIN_VERSION = 1.15.0
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/2f/1c/00b48c6b93a5b3795ec96165a60dbafd3c5094aae281ba56812a8cad4fc7
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
