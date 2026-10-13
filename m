Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0845ECC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A5EF405B4;
	Tue, 13 Oct 2026 20:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7cQbCxhKcvH; Tue, 13 Oct 2026 20:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B5A17405C2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924165;
	b=V4BdRPZEzMdq4Oxsp1giMNFbHkeCntRK2poX/N7Z2QgKL14vfC2a8+f2sSDuiowJgY9E
	 fyXkyLdOmFdH/zkw928XtvHK780C7rrOcfK7rDtEv8uFqW7FrdUFIHDyXanmht3JoR14w
	 3HtqwI3MrDxqcwpZ5AjFcBCg7Gai506ohKnwxhytnscozgZ2BnG4dHtOqgmoathQvNsGF
	 bDjH7f9B87H1upppgl2LGZ9YcjeKH5WD6bcl4lDNVxGkClzgs1vhPDg0XU9Trg2lcgWYb
	 h1wwiqznbzOjWrD1FLxvctAl98tpquBoKxxRd13+ny+9LZl+l4p0fBMLMUdyMuyxbYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SXhhu8FsgktKPYn8B+uYcvyVVMQM87mCO89HyxEkdog=;
	b=sS9/fAWBOG961Ec9Sxhg3diTz2SfPq/v+XzEYUn0ccULTEpxaUGmRVpx9XQibBj2/Ivi
	 HZ7qQxd7iDIL+wqjl4qkb1gNJETCuEQeoMd8ywx7kvGUt6ZnxT6efNL8iWqCqI7f/MDUV
	 QIwvmuV2jAqgVMb7O4gRA4RCR+otxGMU/tIeVxJeNnDz64XtI6Uie7d4S9b93AbItWJpa
	 cF8RFYeDqMqIG0pZvWhueP3+LR3Y59mUbnCQ0Sr5EweZC9QMAq1ElKcHBJwqj2JG1+SlW
	 Kezsa93porAqtxIYONVWA/eVZoQapoSxay71Dlk4HeOqMEzPIqg1QpmHAjcv1kG5L2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924165;
	bh=SXhhu8FsgktKPYn8B+uYcvyVVMQM87mCO89HyxEkdog=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IULgDVNFI5LxsR+78e1N9SZgBqveaFJl0xrQOcPgqnRKaHeMdres0mamyPaZkLazp
	 3SUc0h0jiAi2IgDg3C/3SUkWpyO8r5SL2m0HaDEJIQwnvq5otwpGR3CteoQC4Jxaoh
	 63q/OzvjHIzhOp5IwtoHTiIM1VUKfDlJU6+5z1jQ8a18S6rhY4p+8J7OV+hA5jkh67
	 +uOTKL/icx5pVrv2HwhT9kTop8Mp8hrhr7ZvjlIfnGfVCmpqk12dIMdEAmxn44Aiw9
	 oEYeB98DZv+Lr0XY3RH1hwZXmvHp5DENa0IUiaLwhWDITyz0CR+GMTel8ZYX37Tci7
	 BpP0B2fuxcKsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A17405C2;
	Tue, 13 Oct 2026 20:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2D7C1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B45C880A84
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kzJ5SX59c73 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CC72080A83
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924164;
 b=BkviFGunmCyGBbfI0JylbGVb/dlJcLgpMXOFfm5vkSHZTLodYtue1tSuYPEAM8S4wtB/
 dzCiOdlD8+mCf5RzRJqqVhjlvb7ZI7vXVbxC0HnRAVkH29CgTI1kGC1dCXROvFfMWKTOq
 4Bll+V/ARDJn/wabiNq+EucOEE6DrFECagVl1Nqkf0a2YPJ9NRxpNxsDNcJP4GoH1pApz
 VuEqpA4uJLsPtj9Qa2/5MdZSmzB4ZXvtvnBtPNxcF9dEqQAoqGCYFfk2OIb7wp/xM2/vg
 1TdUBF7+VwEAzlEmA8nZl16uRyjWV+k0m8Eun2WA347kOzJqtJVr2FjcQkB/Lmr993w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/SXEp2x1w8PAdkLvGPWRa8xEuF8R0MDjGt/jIVy8g5A=;
 b=isX5YdBkieL78OxRAc5awVRG10IR16cdZGjK4FIUgCV8HSqH5escWoA/o9xePU1O7aOZ
 pWwPBRL0X+jLcM8i2Jk8aX+x7ymV7fgjMh+Vwi10+/clyUHNz5QxuwSY7H1/lv+icu5CR
 T0hdwkFrwIRcuNT3G1tKJPUJez0rIiqNnKH5QrfsFItkaIw02WJSKMew8ssWmnxNqIfjG
 ThKBjgyjIBJ5LeApryJ+hqM0IHVJMsjd/VIZ541zxUN7OwHo4hp5qMZPCNCyYVLqCKECi
 IdRilx7MCrjV/URhMQrTdB3L+/pc8uRzTem9CxZoZIpmIpRp+/niCcVOC4SJcX1S1NA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FFrMiNAD; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FFrMiNAD
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC72080A83
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:42:43 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6aa9606ddadso254759eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791924162; x=1792528962; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/SXEp2x1w8PAdkLvGPWRa8xEuF8R0MDjGt/jIVy8g5A=;
 b=FFrMiNADnuuBhujz9ORXZ49RqLqbKd/fPy7zfBu/ZkW9FcQLW5x7MyvSfymQlLQoMt
 zBEcI3TI6go4UlEEzD7WPO+dQWlcT+a+/dQyc5pXZVQruDbVmg126YkNMrmr2tCZNiUb
 3MducwJjYAG4qpTCiJ9hkI3jmI4Bm4ks3R6i3hyYp8aWNIm8JGVbqCPD7MkVD7e5yAA8
 i3eXmDtYZfnucZNfsROmm4NNd+e0K5XwmazDzTpzrudWZ4FJthqrZKzer6W8qv2NZngr
 445NjBlfnH6g/YCZr8lTfu7Fa82UXjpaa/mYcrIxzSIBdACwv9HdyZDu7ee/Y6G+zygc
 Eleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791924162; x=1792528962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/SXEp2x1w8PAdkLvGPWRa8xEuF8R0MDjGt/jIVy8g5A=;
 b=bcFgAnzLMPdELHAyIjKWYCea+y+aPhG89b9EJciyVk4RKLKtARf0R7ld/0wozpjyVi
 qmtliAIbiMMAv18wiFfCX36/V8LXwG2wFCJXD+SBSaQyrOWb4/5YTqMBE0KPcQOVijYf
 aNzwH/x/ixi3Uu3yng/ZQPy/EG/5x8SIGwvxxQCzTR+x+mVEpDmU71583MbI2L5IF9KK
 ezSAS/yV6ML9smwZS8gKh5UrI834YcM6rdf/SIQZvV1G8naUgyx2HeaiDyzSePNSvoKL
 fOa2gsm0hLbaihIV2ExFBYOX3NAJ34TqB6uQJZo+HpvzanyBBY8oMfOoTmeXFbzJrBo1
 vNXQ==
X-Gm-Message-State: AFq9FYL4SU/dalX/4RiO6+Lwz7+DGlTJWR0DIkWb35jTa0qJFMHmCVgx
 ZUDbuaNv1WF3GQZUzoh11iRlTFna+Cwowtbs854JY281bXvOG0FviGIfQMMzAqE3
X-Gm-Gg: AYBFou3M6JdahgeHatZf7oX69Qsh9n17ex8T50FGQJ4ubYmLLVDVce5kPFzR5ut7BAO
 4yr7nDvjIFqIj0pDv7cxYG9xFLFlyJ5cGKCySJE/+X2/1+8Ol9YmzWSOVKmVIQT5hOQTc36RdEc
 l0rGLKTpvAi/aC3r1kjKDEY0DnSqGto52/790ADpbI7c8mjmYj0jn4h/uWwkFaRi8uWD3WfR1Iq
 TIasc06KCRB14OcgJzL2VmcOcle+Eg1F1THs1evFqoQvUTv2LynfTc73VvuE7hahKtTIfgQjGxh
 aY2xVHTDTN7g2U5169ntcLpAkFAJmt5hkwbUnyOHOdyizB54ghn/g376lhQqjXWxiY270buU2XO
 1GDij3twuDTCZhzqSj3brsOGPmSWysJkoNNaXTbxrwon+TIDvUxzDNOCrn9pZ4IO5ibvtwDOhnO
 tBqtURPZy5/zqPik09fx5zQVcok7nxeO/0+cUMnNccdDoPRuEvZkpUN1LvP/M6Zsd7SBNK7BcNd
 VsXblYoinr+3DJTKX9GcFsbdl6sqY+rqmxboKyn55iDUdQTJtHF9yiFNWHqkKVkOpx3HJQmdQIg
 4rs87CrncLi6a0Az8j9iAUW2OtfqyUE1UVbLVCCHG7cQpH/4n2ZTwitFpVBKyPzRu8+9IboYm2v
 M0YibyH/81dxj/ZHSZrogXPCPNOVCa6jEqARC9jGzaA==
X-Received: by 2002:a05:6820:1890:b0:6b7:8415:d780 with SMTP id
 006d021491bc7-6ef0e4eddd8mr10956814eaf.43.1791924162242; 
 Tue, 13 Oct 2026 13:42:42 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-83039076dc3sm14682914a34.14.2026.10.13.13.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 13:42:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 14:42:39 -0600
Message-ID: <20261013204240.2392493-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pydantic-core: bump to
 version 2.50.1
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the version required by pydantic 2.14.1.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 3c164a3dbf..e06724f3f8 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  cdb7b581d5d92bb77c831b50d39cdd561b45649056e0ee0f67ea0c56cc33c831  python-pydantic-core-2.46.5-cargo6.tar.gz
+sha256  c248df928b1546c10413c88dffe1aa31d44759b7c8a9239c0cfcf125fddd8fe5  python-pydantic-core-2.50.1-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 0b5631f0f7..4d22df466c 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,10 +6,10 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.46.5
+PYTHON_PYDANTIC_CORE_VERSION = 2.50.1
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/af/f9/8a06bea35ef8daf588f707784c973a7046e0034c8d8cfb08828eeffb8b75
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/a6/24/af4ec4be49fbc810f35b0bdcacc3d433b56bbfa469fd3bfd4ae116cd9bf1
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
