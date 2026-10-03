Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91769CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4841D60DE5;
	Sat,  3 Oct 2026 21:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ptDHQDuhueb; Sat,  3 Oct 2026 21:08:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E3D7660E81
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791061735;
	b=fjoPwOE+3x+IFRrazSj/OC6lJbQv/d6hXCPlBScpnWrFSSe9xEmX63B8yvgYNZFBnu1i
	 DGOEKAHySy7rXsI0PajicgNMnGAWhQ5YtUD1mY3wJTsXog+nb7d2sHkuVORdhwFhoL/4O
	 QpDbHOwxHru5mp5sE5yKE39/1VBSGpVTU7wtEhLL/h1INBF9UYRXs0bIEvsEk6xGMuJfV
	 KlT8pPJptgpbHURJg2XAIC0t90XfS0MWNZzIC0e99lhFlVs8B55+YPgAVSs1JxlZSSk2A
	 sw/8WFr5nPe5X7oUg+Z2QeEgrGMSxQycgtYUM/Spy7hYmhO7wVSF2MYU4blG/lnhNyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791061735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=q7bveV+V+o4lelKToBxgn1GvlA+ircK5boq1T0p+2pA=;
	b=lmykoWG6N9Q44VdcYK5NjHi/OWprQsDGL9MrEnYuF/AK2Q4pPk7uegE9HYJWyVNLmj8+
	 CcwYFPeI8mJOQ+4XJCxMyJqkaT4B+CxAQJcC6q0hmpBYouVkna87BakzxYABjBDA/JL7e
	 LgYC/PIqOpDBcBgX7L0vn2zfd+UMf65ncEQ5qsOTrEC+e20C9KYKJnR5CJycvOpwlEe8s
	 zuyoXQ/fWW2c7cvC3IUgHZqFvvPkbg5YPYBkOn1VPuamlr54bBHvNfXkPQ3p1SwzjOtA7
	 wCVFOKDmGx1oIopofgQZikZBcUUBkyZK0UW1JRL4/1GFHVkze013FWdSeMauNJ4pcTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791061735;
	bh=q7bveV+V+o4lelKToBxgn1GvlA+ircK5boq1T0p+2pA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VuKp1KMmolFl6uyv+RtrWWrOe5t9KEAKLP/5W1dwY4dxsvTt5qEGNMAMd8bzZNahs
	 JhoWYs6KsJql/vVkAnuEw3A1WJ7SF1uMK4RTN1ifhbKo/UgSKGlQavWM5yf2YXGXhz
	 KtaKeaZw6jqXaJfI9r/qpsLsossdXCmP2tOEAlAIiweQ0WfN6OxNlONl1z/QBozHIt
	 peOahkE4EuMUpStCEksqZpazy0nurULQTzJLEg2lDETZPiZWGfyAnyDT4UVNFs8H2T
	 zoSpuvXJeNnii3S5HXj3CzxLt117E1bxcCQuEmbH6mVwScEU+g38UqRmaao9mz6JYt
	 qy8GkwdQ81boA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D7660E81;
	Sat,  3 Oct 2026 21:08:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1BA1A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BCD1400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feS7KJoacu6g for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4D3C24007E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791061731;
 b=q/xxfIVhYYdKDxo5NOIpZVokZQdNRBezrIeuL+iFD0z6c8Eq1w+KX70mU2+T+e54GLbm
 tAQMKC7OtRca1+420jcWHbp1ilS4ssHkyLAdcdeLa2kHHEuTUoai48on31pmtaS0o3bOC
 KddYHD/0ho0hpNHb+va1aE637HZY0sphDVCSLwSG7I9DGP3qq9cHA1uD7+ZE+j5uEqKSO
 uv7wBhE8C6F7rX4rqt/lFeqUfdgtW2ik2qrMuZ+4tN0O3d/ZGMC+8XyeOHZ0a0kGjSLPt
 pAVskS2iqSCau5QZ2hrCq7pYR5QDGCc5A3PGoQURXHgOlRIKrURejdpiaCIlhhhWmhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791061731;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=QABJ7mDJFp7rKkWDuhclReHgIJOGlp6nZlVYcuBWmLA=;
 b=gxghdR8Z1sXviRYAYgxccYRZCmjsWxpB8qr6mgCEiYPv3tFPSMNkGagjpxEgsZgszQVE
 +fofweZxLPl3rIEwoXSkF9fGGQji1ZmpD5nofTnm4FNbLSphz9IxBFxzdKEVEUUcuEnJQ
 ZcMg/HxQmSoxcJ19M6FvOrpKvrD+jDHZQHHoW5+lYs7mRDiMTf+okKkIDfig0NrEJ9VNs
 pNZ1RLNqmJkWJLB/LNL7REHXOTOR8va9ILU/Iw3vO7azJWXf3kBVBgBD6Uu3vw7tDN3gI
 epgdHEet8Xi20aIZq+/YJW7afjax+zhuyr+m+2hNtDmgNTjI4zROaJWm5b7XqgP9EAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=e8smt4Yq; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c32"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c32; helo=mail-oo1-xc32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e8smt4Yq
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D3C24007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:08:51 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-6c1983dfaffso750844eaf.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 14:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791061730; x=1791666530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QABJ7mDJFp7rKkWDuhclReHgIJOGlp6nZlVYcuBWmLA=;
 b=e8smt4Yqv3Xa96XTMOF5NRGS70wXphdQMUHjAzyrdXbTo9Oes1RDGditrQSC7pZ/0V
 TiYjsmW6dm/zZ90V64V9n3z48c3RRePiGVkkz9+rlVn7NLi8uvVJNwjif+vTP4ln2vUx
 VeKhnqnE/CujA0OuK3z2M604zoEe04xm81kPj0GqWm6MhPejFfHU/U7XNHCvLTaeYIeO
 znNW55JZQ5N+a4VsLgGFSUrDT1OMuxNJ3WUdRtaDDX4kAicv5QhxkQcTlbWJ3n2zDQNN
 3a/6IwFRMrqDYQHkLb4tBhtSVgxiS07MX6I3yQhKDwma5QW2jXO+3elPkVr5l2tw0tB6
 5vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791061730; x=1791666530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QABJ7mDJFp7rKkWDuhclReHgIJOGlp6nZlVYcuBWmLA=;
 b=TnE0oh+DfHtvUzuQXI1ti7eYJijCFlxm8FvIvjD5GeNl5bm2ZOmfuQxhm0xjZ+1+eL
 UUEohYMvtMAK9YhTDttHIthT3kuTyWtR/1XwDe/amZ7kakU6D5QpDSVtpEgevcvSRDaq
 jw7N6WjEckdimqAr/t99E5+sNYlcr3Kb4zvLHieleSwZ40tiKkyhptdrgSa9L2YzB1Rb
 C1p68Cdor8UKvxYcGRJtV/nUUj7Mc5f0MbQrpkDay4fU/wn2f95bBYxyE0Dsnu4OJQjo
 9ScA10HzIQTVmxpmQwuFOjDMk1GldmqrV5GPwx6uyG77QmG9qJhchblv+qLaLZOTmMXy
 93Tg==
X-Gm-Message-State: AFuF++lTCqsTbopRBSBsb7PaBcKAMuNHiX+yruysWRU8m6Pfza9vttrG
 eymdE5fkhzgaAPp6sVdUB0nFU1mAQDS3+ZVDpHRHaSswOXwUX4Ll8cOZ894/Zw==
X-Gm-Gg: AYBFou3mlw8mgMUunRBJ43fR7wridfeqxcl81CN/v2g14MmAE88b71GRww6yOBb0BR/
 3QAnPwPUsP4A3SvH0DcJG3VuIyDwIw0h9pXr6hmDIn4Dj3LDtxpRRn9yBOSMVVc0dZzwla2iJdY
 YkhWe4y4IvPO48xqVIyAn8LG5OkREr8xR11P9cu1i8YIBHy4JNI9D5bczXeFak4+Jb0m7RYloBm
 5imWLgcYJlZLtdAIXeHriuQgbc3SxcY4yvnRDowbxKiJiTH7IbKw4LmlLpBoHyBOYya4Q+rbf7A
 si8Z9QyjGzGPoB3tDzLF6UkK+AK2JsEp2+dTwUh9FkeCbMh98KCHnpzvjnX7PpIlzh30ZGrrOvX
 wcb6QUeqOwr4IEeqWrt9g5ZZKbnxEcucSPhdQ70r9vwkzHbCbvXfE8XdIPAkImrGXHd94x0uUAg
 8ZRLeVjp5y9LME2SnNOgy94c2jHRo171OMDO6oq91bwvaVWXh+wNvIYPvT35G0gMkagTBv7IZMY
 t0hFRK6jKSyuvwCl1YrqDc2u1STP+IJnZHt5lj5ksmSRsZHyzZvHi2yz1MANB4XZZB+0vkHw6EU
 cQPMOjmTG2ltiUchQ17FaOs7L1CzBPANOFstB52hoQLYlX1731GY2+kNtUe4TCVRYZf6FZs7jsL
 PB4bT55TeDljULIY0Bwq+XCghcD9pmQXv1og+OLuo4Q==
X-Received: by 2002:a05:6820:1501:b0:6d8:92b9:4399 with SMTP id
 006d021491bc7-6e09d7ae684mr2772951eaf.27.1791061730123; 
 Sat, 03 Oct 2026 14:08:50 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82409c586d3sm3119917a34.11.2026.10.03.14.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 14:08:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 15:07:58 -0600
Message-ID: <20261003210833.735937-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 4.6.0
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

Update license hash due to the copyright year inserted by
coherent.licensed:
https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jaraco-functools/python-jaraco-functools.hash    | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index f43efcfd84..d2a69410d1 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  501918900674199182b1bfa39db200b6  jaraco_functools-4.4.0.tar.gz
-sha256  da21933b0417b89515562656547a77b4931f98176eb173644c0d35032a33d6bb  jaraco_functools-4.4.0.tar.gz
+md5  24f0dae58bf6fadad9340a29e2353b56  jaraco_functools-4.6.0.tar.gz
+sha256  880c577ec9720b3a052d5bc611fb9f2269b3d87902ef42440df443b88e443280  jaraco_functools-4.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 397d5122bf..2e144f0191 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.4.0
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.6.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/6c/1f/c23395957d41ccf27c4e535c3d334c4051e5395b3752057ba4cbaec35c56
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
