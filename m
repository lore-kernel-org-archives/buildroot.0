Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3FDCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96A5081094;
	Sat,  3 Oct 2026 01:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH87l0TKAxiA; Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AF5508133E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991202;
	b=hIp5XC8/r/jt+mE8eMlEHbX8awHMcsgS27Sl1nFARLK0oppVVgxQUB80DLy4Z+xlpVEK
	 F93PUsqwNJh0hjPLy0yBqPtaJJ6x7YaU42wSo8hKCIy/Sila9QrFclUcn+gbvlw87F4fc
	 keQwtFrXnSI2+MIl4YiLuZ/k5BhTUbBB9US5+hUE1YNuyV+VQUQQJZd26kLH1PwJULdkB
	 LjFJpJSU1N7LSmY/00RnZ0iK13qzfZ84DxO2JND0ZQawCNHOO9lVd36ETpiPbQTx72QNd
	 P/oUkbx9k2VYLikpi8yViHG0+EKeWEuULrCrUmY85qdBQR2bMR/q+gPKPRRuJ8i8YDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ir+bxgF6tPCkav6dwielnz9U6Z5p2Xbb1+9GE5+5yog=;
	b=Z3lguPJMXIfMEpz8rNsK7flFWFeK7/jwZsLQN5lXCGNeVhZG0ltPvNy/hOy/uVA/TRAr
	 N25zyRq/Q8nUNEsMfbQDfLeRzJgbW6gRPNfqslDxtOWRp8nU1qjDUYFF15PWL4DtcBs13
	 Z37Cz2t/BLSoGm8YwEhCsQ1jtPaW/lHrKOjNQ2NJky2pwVLvTn2ptfvm3XluvDl3/9PgR
	 +2sxQwxvSnuooM1LDIozgAALgpsrr3TrWhYsZEp+2nrsshi2iedsLUMHFpg6wuvAQUjDB
	 CebQWlitbeKbRNxbWgEOD/qE4Yqsdb+v5JWdG8RS7pQvV2rb4tKO6b6hPTdNaGOEOLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991202;
	bh=ir+bxgF6tPCkav6dwielnz9U6Z5p2Xbb1+9GE5+5yog=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DWAToNJbvxzq0b+ZcezyioAdK0JCEOF7BKdORrxMFOpPbd6ECFD/a2yFEevdOrEO8
	 LivKjauSiNgZBTZr6MeIhnnknZtkMHxwl8avQ0jEmoHKr1E28sMHdXcWzzLHN3qsaO
	 Fx6BH6xisuE/sGn5CKQeob+VwQgu1FohkoUn/9jt/eCQKu+8ZZeN8GMu8qoWBUYPQc
	 o2q63P+5K/PBhC6kKegLtsZksW/8Lcji26sTd9tWPkPVh8nJEj/QpzM65Yo2rdpgZ/
	 G/EPciGkpQwhFx2Av6MfkK7gXM3fLpzbDgTuGh92YDBky5zQoKbIrkOQcSszCL2Hui
	 HED2ojyDLTk+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5508133E;
	Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 599B1179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B97360671
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qw2tm58ddZaa for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3AD0460DA5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991199;
 b=VO+90pYVOO6iluDhL7cHSHC7QghR6OchFcOOa7My0YwjYN1gSesk6zl5X6cFM2B0JkfO
 5n/JGvt/k58lYAyfSSWOsbtNG4BW9JIFWpbukkMxI2HdDCl7zToP82DVsfPw8cD3/WtO3
 b9ZrvJM3GdWGHwIhL4FlKQSa66QDpFgkmnf7dRd0J/vrZAV4+OjUDYHrgYkHKtxh8MHju
 EZtDoqYTfvY/4oUbLByw/rl4EQygWtbKSLth9Up1J0UuiMsEtpHTtcCHM+lLDhPcFEBg1
 dVnLQ0LJN+IdgqptwW8fYwvfrQwAoFv4r49JC6lo8FbM/S1A5GCJ8Xnc8AidoQH5jPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991199;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=n2d9eKtEMJ0E5UbgCRBpFUO2JMNFP8PfHmwN1mujfVI=;
 b=cgXDQEk87oFWy6JTGow7E4n0sP/qasEmdDd9rXHoHAncssW6XzJzYkwdfPJeqkn3ZQzt
 GW4Z7fgI7NvQI3+mtRL5Ju/yNaH2tfUiOWLHG31jg8cb2lK2bns7+5NfOwWDELsXZW3t+
 Lbzk7MR2FVLrJO3nGWioPDFPeIvJaJYgVIDcnoOJ/LEdd7n+apqgDTks1DrgTp/Z1viP2
 Mfdtzd7+Eoj+TEYXkF36w2mmH4rA/6bmXYJ0IBRLz5loxKUI7HODah24IfpDvpsIAUiZs
 V8V7Z9RrXEQCGwHbHbcAgMycEqmvOKmVXSe4aLeMwrF6epgwYnPsabDyw3C3NWksrVg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=e6lS7MeA; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e6lS7MeA
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD0460DA5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-82401febe1bso217908a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991198; x=1791595998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=n2d9eKtEMJ0E5UbgCRBpFUO2JMNFP8PfHmwN1mujfVI=;
 b=e6lS7MeA7rI/Rtm3jXODw0Hc+S/BXkR3/xzUZbkjoprR4pO7IbEs8RxIoYfCfOQALD
 gCsW6x55otF+jwtL/CNzLvo9ijkgU7Vq8QAntbMSZtYKiWJcV+d1fJTQ6nMTaito+ScX
 xTQO1ceCxpMMMSOXA9ZtclUfupd8J0CWOLhhubreLp0/uc6ST3lIXSiOIjdHMWjToA+v
 xbdDV0SvpaLGNcwLPY6S9VdlXAlAg/LLVzibbnXqfAwcvhO0jFnuPnBWb+3sm3Khg/yY
 Dlcj3PIaMFRz+2nH7G1eraVmV9xJoq0TluNtHAvkzgq+HE/fhiAkjuTlpzHAK83pubDw
 91vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991198; x=1791595998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n2d9eKtEMJ0E5UbgCRBpFUO2JMNFP8PfHmwN1mujfVI=;
 b=fa3PAmSt9J+RzcmF9r0vSwVTks/9yahmSg1KpvLS+m8aZEiHW9DeLLH2/FzS4XhhH+
 WEGH7X0ZvZUN/ro6DpU2P150Run/bXdw5Mx4qMt2aI5AmfMiRClGWrbkw4e8sj1nTa8V
 NAdNMLI4Yl4W4O4Hu34vC7562TeWBmj1zEn87TmvnMl9e5fAl/iLTnVHOI8LyaUPGpAu
 C9OGv7grTZREemhIigr46zmY+k3UWcqZJhCrAvOY1PD1Otj3CNUKrVQtjikLu0uvYH/n
 8h3NJi/7kcMxBWQYI7wNFEN1eX2RojuwczxqZf7+z8Tvbk9n/UYJLDX6ebRz7Lcl6UeH
 Ajow==
X-Gm-Message-State: AFuF++n6tDmHzr9Kf6uSdxMtPrshkWY6obWJrfIvl7dJ+vcjw8GXtt97
 dpbOTxDa5vqjVsySkBBWATn9RwTBTolUwS1NDC8gM/LFzNosmdJXzgt8f1xiUQ==
X-Gm-Gg: AYBFou2zwSEF+rqDBPYlpDhn5wO5Kt2NtfMi5T5lxBJ+Xibb5GQPmly/W984CwDNrYE
 bL2kT8IVjcEk3ndftbETT2+goSX63afYH45yFp7V8kvdtFeT7s5Xs9B9KqDsYUvyhMmvU48LbL0
 h4Fa0X2Y+vDG/kvlsSo94cj+q5NOFS6rIt+RqvsEB2iibbHbmC6quQOqSLBZI3v7O776kSnWoQr
 TnP3jHaqz5WwlFiKexzLGGx6tETBXyn5NOYQDMJAhC60j7TLjmUWrzx8V3jMSHcYaG9XGl0v3bi
 dhQ/Ii9ItP9PeJfVDwFakYHm6fPICGOaeu20ukKtCRydAemI+r/ucjqBuw+Gj/9XpvUkPqtJW/v
 jt/4buD8GpsvhlWf0tXx9wU/S0jpMVzaivpL9YHMoQx8JzjIFEbQCWzq9CNIcstGSq4kLuHV69R
 rQNvUd0KhKnzdmrZywnlaVDmKKt4RDJpLQp4yJ0t/Z1RladqYiJMQJqEM/I6pOuo0WSe/JoNDN9
 4RvW9KXf/od3WUv15aRToq9roq2wcIMja8DcsLhCZfGrQgpHlJDAy9mHsflItyT9Apc31ra82dF
 v5F/YS+X+aBodjwpvMcySBKYiM6D+5XEYlq/dEAUTWhJf/6HNaiHB9rSE3gqVTSrMzFvVZIgzrl
 xAT9zGMX1pIkUlGKJE/SNF/Lv9XZXMdJjESKk8OUlA7w=
X-Received: by 2002:a05:6830:3498:b0:80c:d30f:97a with SMTP id
 46e09a7af769-8228367c691mr4261582a34.27.1790991197746; 
 Fri, 02 Oct 2026 18:33:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:08 -0600
Message-ID: <20261003013304.400979-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-distlib: bump to version
 0.4.3
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
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index d31ab90f09..8504366a0c 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  555fd6076016da3a89ff9b959677eaa6  distlib-0.4.0.tar.gz
-sha256  feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d  distlib-0.4.0.tar.gz
+md5  6a6a1389a42f24634f06ab6978d5d96d  distlib-0.4.3.tar.gz
+sha256  f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed  distlib-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index d71896237d..581c4ee4f8 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.4.0
+PYTHON_DISTLIB_VERSION = 0.4.3
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/96/8e/709914eb2b5749865801041647dc7f4e6d00b549cfe88b65ca192995f07c
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c9/02/bd72be9134d25ed783ecbbc38a539ffaefbf90c78418c7fb7229600dbac7
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
