Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F018CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE65D6063E;
	Sat,  3 Oct 2026 23:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giW5eqO5cfTQ; Sat,  3 Oct 2026 23:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E655F605EC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070164;
	b=oO1OA/BT+PKnk3OyFzJ1IXXI16kRnzsrk0NJHaPy4Y/NubLAG6MeFjSRl66ZYu0isBrs
	 GQ1JSUI/Gvw1oi3wlxyfq26IS3ZIQjL19R2VJSarCeUf4lUCZ/28M+yfLBQGCkkoWQK3j
	 0s5yxDRzhW98Z2CUGiTJ5ojy6XuitziY7odD4XNxkOfs7u5OTpgMkr4NbXYOnpuZUh/cx
	 PqKsO54Tre4cTPoeC8x5umuWHDnQRiAoBYmJ/jptHYmMhX40wryhefmx6GBdJxorQsw5t
	 iL4sydpwQH6J4NUjEH2xSgR3CU1EFDwnRSimfG7QPlk/k1I3fIvWYCVDra6AvL+kQew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=U7OhTJPYjLV1Q4cDUXHAZko181LGIxj9flYM1sx6edk=;
	b=YMm+IeUAtSr8gb1jUBBR4RRFcDGibeAlvv1aARNbECuO5/vVzzFNrcna/PBsNbLy1ta+
	 /hdhcocDCUhm7W4vtftiIaMTLAz9kGjHptN6yUNPLvFyVSnwoASh9OO/k2PKLcoP9e+fD
	 yeCyYmc5obvZW11z/ClJw7L2GE+/DcGv3atCBzTepC3duYJb84HdCECixanPgQe5Pxa0o
	 X6a4BgXMJ2NIVZFP3H84UQZiu5xLCzyV6Xr1oXRVevX0e01j+mlFV+qm6EYPYdkd8S21b
	 oj35Hvc1KkP5tbd181DNU7EACEFtGU31qO4qcy9eZpEdJn3HPrkR3S4j6hg/wu+zODw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070164;
	bh=U7OhTJPYjLV1Q4cDUXHAZko181LGIxj9flYM1sx6edk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Jt7Gq/wMzfZw4OLNeo0DdqIDKdjDXMUWtsE6hmyJvUqilqjy5/4PaHqXqRF3RvCz4
	 cDrF4mj+WlR3r8bzwAY6i7Tk9eLpP2dUqfLnxBe/U5fox1HlJUXhX7l0dMx9gh5llK
	 RqAcmhqE24C8uTwY5fdwj1nmuh/aYyH5Y+tPWActwIliveWgYFfjM2yV8A6wDne8a1
	 m3g10BE+9FP4xNjFOxOB16UckysZUKdmmM+G72zB1XB7Lwt0fZ6sSDgI7RQgYkJge9
	 KOhLHJns8sHXK+Vs7Wlsh0kanTt2ylHtyNTIM6Zr5IZ17GRIxPqhZh8L3rtLKAWsyA
	 fowjCRO6IsbPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E655F605EC;
	Sat,  3 Oct 2026 23:29:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 135891D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E6180F23
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QN_OEUyvjM-s for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:29:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 382DE80F22
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070160;
 b=ldSQZUE9R8ulRiLdXkTpkZwpVgeewTW0dQs/wH8/zX0u2XFN83xEWqiQmyI+7zu4Km78
 BTOKE2GM6ousB2s1DZsRRKj9aqQG5Nb2pRtUdhKnQMyuSahyCpTXxl5hL6mDvXN+3hqHf
 b1jrWl2JRPYu3SilAh3gsKklGtjnvYIPN8DqOeIJUvuaq9C59fPs3sK22xFvev1U02XVn
 +DZMl0wSrZWRCvPbi7E+qxVFO0vMpwna1MmSPGvIv5u8CMGNySIxNCZsg39CCpMjTBUv9
 4jTNEkjL1LvPhlI1r5oe64Uyf4iFhWkfUL+ojn3JgIQyAGwFS8SsKdc6/d1Gmyn64Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070160;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CCaaJAypPgNE8AKErmEziLFjbQOMnzhpK6UNnRgGMjE=;
 b=K5NZX9omuUDLBOGr9uwGbJRDFB3IT7VQ2c6plE+HaoQ1vYJyHUNcBYUb3S9SgFeiFccZ
 p3MinJ7CF++9tE/OXSUBnLSdXFUwi2Kt5JQOL0vSehnkFj/wTAKJEYNNrKEKv/CVCzA1P
 a7Bjcq+cf/oD/LzCRZRES7ZzBBOyJWTQ9lPxDPDUpc51FXdEF3BzpAoYb3A4pAJHkalEg
 Tw2DDANBMVV95vLijv7LxJsDZS2fheSXqELxlFmSOfEIjPT/f6CyAAHxxIobF/cb0Xy7N
 1tzTJ7fApwAFubNjYF/R6N8ZmpSYmlukEFmx04vPbQiXKJqOyUB87/znybnPPt4DV5w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aevGk3tX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::10; helo=mail-oi2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=aevGk3tX
Received: from mail-oi2-x10.google.com (mail-oi2-x10.google.com
 [IPv6:2607:f8b0:4864:32::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 382DE80F22
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:29:19 +0000 (UTC)
Received: by mail-oi2-x10.google.com with SMTP id
 5614622812f47-4c66ba0b762so162440b6e.1
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070159; x=1791674959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CCaaJAypPgNE8AKErmEziLFjbQOMnzhpK6UNnRgGMjE=;
 b=aevGk3tXHNNaYnvd6+LlAN6B92kkCBuu3w1iZ1e7qx0/COlYJOFrR6QL6DiWZ5g1TP
 LHkIdQvJdfTYtlOVMqIsxAnA9jLTpm2IVl6plFaBUm1+rXV8yXxqABP6uoobsgwq488C
 0zVsgfAQPZFftq4yjoN3pl8PifgkoZkwiBm8K3WHvSmGKECr61mbKz/w3biCHzS7SjfZ
 vNHdH6I2LnQkQWby4XJPCHYrm0i07kvw0pb/gHLm60tH6zUhA41zTBPADGpPe7matNzi
 vUV2OUvzf78LjG8RIqqcVqMvnDp5jgZjdXQ3vBPLnZY/lcpQvaNuAOkOeXpAKikGTd0I
 t++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070159; x=1791674959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CCaaJAypPgNE8AKErmEziLFjbQOMnzhpK6UNnRgGMjE=;
 b=12rwjMrCWgLTpk7WcychF3ip/EBdHD1l1ye24rNV1Qjkrzybxl8Po5gPN5WDkNOYB4
 kLpL4oVGqBrWDS51bQ2tI3zFyJaO7Rrl+4fr5wFUmIul9uC8Mwk7SqjiQDZCHbOlybDW
 QC0gajEz1d64f8H1cgJijh/cnRNz1wDTJKCYpoEUWShCE524653Ym80iNqtN0zJy9ulR
 5VqsmOqhi5ThoSqCrGvEaQbyFIQG7DpqBhdFZ7hwcT3WwE02nyhBrLJV+iA4Kox7cnV8
 NZlLkgba+btPt/HrMiPDIt9mG9bSg187WqtojX6IaD9nCn0cZCrUguf4YpDugxMioNdB
 96Ug==
X-Gm-Message-State: AFuF++mXYBSidEJb8neZHbN1Rr5R44rAmi1FOPrbmCcOu8lb1WVL3TCU
 2adfKyo+cZr1ldx9vZYOV9mRgTrU75Gfgz5t6BPWC+51D8lUHwcWCerPsZfnsA==
X-Gm-Gg: AYBFou2b3tIBGImxJRcUK8/h3gAdE2XPNtKntnjcaWcfohE6mw/w9bBvmPkREuBFQCd
 PL1SxUWv5H+OKL/L06qezjRdNWyrIEMsjrD8ZOKHySYjitOoIDJR6UPHqfYYuUHw96SHZEq1Q9+
 Wl+bPDv178PcVBFHLq9yzkqK3rCqwGhQEkNkAz7UFr36AytBt3e63fbBIropvctPVQiRQ4NqiXG
 f6VN7k6UC3yALulYZ8ZOkqzHn80szjSMpMtwQRJjT92L4L8Ks29F63kzUIyL4EqgzHjk+ejwb3H
 Xo5lAs18eBvEGndJpiOuD9hjIhRifTPdE+3ha8nIGkK/UfNuSOOzyZx8yEe3/0FN05um3yzJPBf
 D+o4HIXiS85hUU+DGLgmtDr2zpCTugWgNHSrJIR77fX9mdISMR8+59t8HcZl1AKC31ovavUVZTl
 84FKHzUymVvsYZG8w/VrgXlx2fOU9ZiYeRXoKSRQqWjA0vhe5r6WS+ZFK7qmMZBnvOX2zShIvGC
 qEQWPIw6hKnN7ORrUn/51KdRgAEd0QqAuCY4ERXGJ+Ta0U50+GRcXsAt3IhDX3LzECwmsRGl746
 sGGwQxkuXCDnuWEWNxk0iZEO2SofSo9VPwp1x1hlxNvyWOVptmg5JZpDXqTvBKxQXyAGznuvXJj
 XRb8Q6c8dkxYKmlXVBC/f2oVAmCW+NWajwzR0WL/D0UMBfN4lKuUykA==
X-Received: by 2002:a05:6820:7089:10b0:6b4:117e:545 with SMTP id
 006d021491bc7-6df32aa8240mr3050452eaf.13.1791070158758; 
 Sat, 03 Oct 2026 16:29:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df37fe3061sm7053172eaf.1.2026.10.03.16.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:29:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:29:11 -0600
Message-ID: <20261003232911.749403-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003232911.749403-1-james.hilliard1@gmail.com>
References: <20261003232911.749403-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-boto3: bump to version
 1.43.108
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index b35394b8c4..13a242c8da 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  e756f77886a1aa59d916de35340da68a  boto3-1.43.103.tar.gz
-sha256  524821052527f6446d249bf710847b032d9b12135e346c9751777a0a2811cf04  boto3-1.43.103.tar.gz
+md5  f1eec360124da94c8bb9b36f66bdfde1  boto3-1.43.108.tar.gz
+sha256  03341f089158368acf83e921aca98b706095322ca52bc4c039a616940aa5ad41  boto3-1.43.108.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 8390e8d310..97b263d8d5 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.103
+PYTHON_BOTO3_VERSION = 1.43.108
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/46/59/012898d78087105e9c20fe31605d3f1999921745e1890ee0f0d993846e2e
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/48/59/fb93b6ebd9ad43eb9a58c7a6da51a0fe24ab0c04bc4d534a0bfc5eba7f59
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
