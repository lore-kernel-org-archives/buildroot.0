Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED3FCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2898E60DEE;
	Sat,  3 Oct 2026 01:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu49N__VFc6q; Sat,  3 Oct 2026 01:33:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 37E5060DC6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991231;
	b=g55B5+xzpOBou4W17eTeOONrZHJ7Lf4a4N0670vP+4LTXRKUHoO+WLMySRgRAr7ViXh/
	 s7hFVzVuEoRKw087yFwh2lx8Z2CCb3uhQzn4tFBH74p1Ks7+zWDuZK5wqUxBMSs1BSCdb
	 n45MUfCkDc0VWqNUIbPv7Wk1dVdIk+BBxK4ErBW3njDZiOUuSm5y/xeTmjsp7dPvAZIlu
	 JSx4eu4Ciw6YArlk9rDzmsWEMa6LBd6V2f7oPRgXYUAj7CvJrdDI7Gm7/vK3FwNNPSAYH
	 gUV59DcmANNdKJpPZd5+SNnxdoqVJZgjM0fUqUUIXe86E0aArz97sG0zozcKEWwA5/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991231;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kv5u1pCwyWW4THVUq/w6LSZg7xpw8NHNaAhJ8/I9BpE=;
	b=rQ+7r19ydwCnOorbBwK9B1E++TlziBUFuF624mJlDuHTJVUpLSqTfFocFOWgGfxOGLRi
	 M5gBk8R0EztHUercHyDSVPdHa8+z+VD9qF6VVCz4Qfyd6g9/jTijAFX5ZEnHwRj/wxINU
	 zHJt5kvMygI92SNN8U1ebN25RnV4y/zYFE0zYduTwRZm3AOe3Ly72x9fthTNvvy8SDlqI
	 jRojXfOQHOCRl8vhUbiq5J4URcjIzhqGDhIhpvEMAvCjfPT7tVyOXf8InQHZt5artrbaj
	 XNGo6eqBrgSjyy9Gqj+pmqE60BQrm1OTzP2mkGYOslLiCNWxfbOGpgubRc6tsbKlSaw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Nhtt42IV;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991231;
	bh=kv5u1pCwyWW4THVUq/w6LSZg7xpw8NHNaAhJ8/I9BpE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TZoVZVEOGR8A29zPlsEF63shZLmNvyaebJr96IADTJbUOZPK9H8EdC3qfqaJ4jxxv
	 D+4TseNPOk1q4smr3MwBLJMYh+K3PLfwFyxCByeIpgLnA57Wzfa7nE0CwgZ4ZsMGlF
	 oL2JoDS21OChTrm4vYtXqIRmp0qXwxGaBF57vmAvCPQduR2b4NLWL64NrmJt8S7DnB
	 pVqJy1e6ElvqSDTzov+WVyf6SrmMrcI7YrZrqutnmI2xpxEWZYNFOdlGoN05NtAFGD
	 WDMypXCJhzRGNE9JnYATCU4mZv8QAm7XiIyKMlfPyZMRhW/CP1yhNGTqL2KvHGYRsE
	 jdT38Ti8rEONg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E5060DC6;
	Sat,  3 Oct 2026 01:33:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E157D1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71D260DE5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqSJZsmp7VVc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D81E160DE3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991228;
 b=rlNteoyco2l0TV2htq6Sc8d+imw58mLT/kpVO5w81mLYp7pm8AtLsS+iXC22CaL3vJGr
 KocZgEeTn9WihDjdX+FYcmGihgsIqgNdW8pLuGi4g4387E99ImQcyd9Vl/5zijlgegixd
 w5WaGfQnYqN8qAYXGBF2mV2GNbaCFP98bxejMiSu2V+ys3QeQUGrQqikX59fuSwZtY9yj
 kg5t7p9Sintf6nZGUdMSclTkT4T6Tch7qIrq8jmN37laXp7A/lodBqcCJy7gYRw8K21Gv
 gBujjxUaptpgyW9+fvyZ/NItjTMtHvEE96N+CsFyDVlHK8MyQ939snHUqkUkgbPEpcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991228;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BmzXhsURblUfXsfHT5ovhscwjfgz5UqYNCUtCJV/pwM=;
 b=YUV/VkexobL55m71JZd5qe7HNnYKuEXFKiWZYuBiIc/7xeR9aS/zn/Dp7YqdrABl0E3n
 YNo357CpUQNeymAhL1jERHVqPe1avYBjnTDWrMBFdkPAqL4Kdct+bHVfY8w3QsnQAzmUf
 BPtqFcUPYap+J44Rw9Gubb+6NsMQURJ5Y5EyT/e45OiS49ym5gGyk0v1bLDrcKUMJgjrh
 A3MaOe1fP4Z2uQcZBM8XznKX0h4lTBqJ/RZikjUWiSxgVeaY8M5T0su2xXIikdn3pZYhG
 vWLyWBmIUKdjLGAEY3R9H3qWJmdKH3ZV6Hkfk91MyKFr+FD8fva7MyXiiFAc0IN7gMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Nhtt42IV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Nhtt42IV
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D81E160DE3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:47 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-6dde81a6820so273055eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991226; x=1791596026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BmzXhsURblUfXsfHT5ovhscwjfgz5UqYNCUtCJV/pwM=;
 b=Nhtt42IVNs9jBqIgi1CBHlyQJ4R8iVw2ND0FuZG48/kmF2Mx4xJGWF1Y8mIWCeaR3T
 TXPF8q8fW6mynMLJBiHTZoQwfhsr8/AsRi8jdcgCWWuQ94I+U2LC7OG+JnBfRTfaBWyj
 PHctiRBHkxlcs7V9CratwREr+YSExAHKKDHzvdk9cTb8ctN7+pfREn1O+brKeu6u1pPG
 fZpnejcBmpD4xymQCTfvYhM2i/Psz8SavCFX/yEAkkzV93g3yYwpMFMJ/f+6/mHR8eRg
 zsXv0ge0sheyMm96NPU3JErnpPFqWjmu+Rt9kH5ZBbSBodrQNKUrEApFWDxZzF160wMx
 F5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991226; x=1791596026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BmzXhsURblUfXsfHT5ovhscwjfgz5UqYNCUtCJV/pwM=;
 b=aO22qJHh98es/VqaSYOzwLXEMIXMbP7Y6rImPW+h5IOoDkKdo/6c8wAvpLHWzXUy7I
 32NGSTZ1jfkhSJCywiZUOfoUYn1Z8D2wL20Hm9js1PUqK44ypfcylHZJROCDAFJm5W8I
 uMqj7R4wnuMgbwmIkhBNOarPWGgUu+JZIgM9IoISJWLSz4Rzwo0w3y5CJGYVLYa+Q+/E
 UE1LPo55dxi0sYMxE/+bFo4bH+5Ya83/m7TkNwII4T3Zv3/rdrayQ1qmy1Km88KpDVLh
 /l8t2zNB7ylvd7Qc9X38mp4zFw19aMBySsa2vs0nnFvPy6tJ7GCk3HT1+O5+juVV/kqu
 dovQ==
X-Gm-Message-State: AFuF++kapdM8WWUHVOWO2AD/WxOlWf7SbyGzFerItjG4pw2H5vYpLOoS
 ywOhvKjW9V41HSZGYRhwxbzxr2Y565nHwsZ8c7nmu4SccGfuAvwgyTaPwSQzXw==
X-Gm-Gg: AYBFou3j2Wn/4QbCSaHF3XPVPfa46nFO1SLqJpuzcu9hc7tQ0Ro7+YP8/i+AX6EvuMg
 SS6l/71VxRh5W37xciGWULExPWdjdhh3iI4Imi8IWuRrIiA5uD4+CoCLK8bMXfuOQiZIAQp585R
 F1opG7oo+a8o+/51uR8Zaz2ABNoi5pGznvfDAZHd6vPLPFTKHQaRXyLtzgcyC0Fv+Xn6HVIinom
 PP7pgHCB6wxp/SCi8+yQIsPN02NHD9sJ96m3TmWkoHWqoyFB8FiPCgX3JSBrlRqg/oq3vaNT32L
 NYRpPK2CJI2ED8nm/cVDh5W8Xxxn05icL9lefGsxkYgInPo+xkm6jkLkLNCf6hPqqGUL6qW3Dsp
 xjUdacR6bBl+An7T4yJF+2hb316sdAEIfgzvqvjeUs0y8VT5votUdTX4IjwgR6MT2psEBSi7im1
 tj1CtIZRo3ZOSk/mldjbGYaGKk0foAXtqDVutoh5iqehGEkxnqYQx01+lVZjeqTffMe8sBa2zL9
 0ceANJFUCSy8BHPL2RlCNZPlj2lRtf/Dq7F55Nrk3hs7UCSTa7ApCTSLToZrb55xfL0jfLbU1zC
 Rr8Q+6TCxQFuSWx5GtBhtkpFCXyD9pFew3sxCE3ZgI6hh33/r4wAXq0SwDYKXZnEB0vgE7HN5hv
 5QEbmABsocdmDdERI0lN3hSEa83TCW9yQqiUBRHrZFQ==
X-Received: by 2002:a05:6820:4b0f:b0:6dd:25a3:94cd with SMTP id
 006d021491bc7-6e09e27eea7mr828092eaf.52.1790991226490; 
 Fri, 02 Oct 2026 18:33:46 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:24 -0600
Message-ID: <20261003013304.400979-24-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-semver: bump to version 3.1.0
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
 package/python-semver/python-semver.hash | 4 ++--
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 50d30dd2fb..1cdd520bf5 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  a0d76b528e489bf7ce1255a0a1486123  semver-3.0.4.tar.gz
-sha256  afc7d8c584a5ed0a11033af086e8af226a9c0b206f313e0301f8dd7b6b589602  semver-3.0.4.tar.gz
+md5  ff4f4706f69eb233be39e08454bdf9b5  semver-3.1.0.tar.gz
+sha256  14bc073439513d7773662a338f4db9829cf16c12b74b9568e2d2689975fbd7fc  semver-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cc10179de9ced8655d7765bd3a8ac46438a61e663de7cf1c48d502d2baf9f3d5  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 3e4b167848..35e97178b7 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 3.0.4
+PYTHON_SEMVER_VERSION = 3.1.0
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/72/d1/d3159231aec234a59dd7d601e9dd9fe96f3afff15efd33c1070019b26132
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/92/f5/e1dfe8e1d91c54ce212fd93916eb01fd1c590f413be0a0978c39a97aa1bb
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
