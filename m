Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80B3D40DAF;
	Sat,  3 Oct 2026 03:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7apke6sO0Kh; Sat,  3 Oct 2026 03:40:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6292040D1C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790998815;
	b=HfQdJ6qihVPoSV3zHEZxBqAffdFMzvW+IwqgCt+PNHqlGOq4nOQaz9qC8FD/JUwTAZPM
	 jYfsJ+vF2XzGJiW45D5VJsTMDH1rAHUsgRiYuB3N77mmhbZCxJlIItvtU+gl9DFxjJFjp
	 5IysYwCiOG0yU8NO2oYSVtGMv/joBluJU4kBH3Fm3j1KSUOsaCGMtnaXvrTv7ylxaHnBO
	 o9Wmv8kw9H7XROLiskojc8ZRDwQuS1Sbnyn6DZHVSGsCvygVQTnZiljzJzYSdAbnVFTPy
	 Uuddhp2HsAlLzlvfyoMMhUGkulMWbXX3/HZwORMLTVThbVMom6C0gDq7HJ6DOgGpYbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790998815;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=YqxU5d1ANouEMTMOiEDL8aUxi3xHJ9amLM3Ve2NY7Z4=;
	b=rj0H5kN/wrjcCBvKDo9gwKgHmsW8gO21gj/11VJM2GP738wZVm9Ttz6Ve8Eoy07YTGVS
	 7CG/ZRDBV+fmp02WAUoQwMGxnzg0NIgCzCi7gWYXQCfIv4Ssq41RrczWO85BkbWF2GvQe
	 jVju9zpeS63IfZC7if72DhJ7KnOe5uBwEGO2mcf3rwdl6xj4ig2pOkXTyKPMxUW6lDD/n
	 0FETV5RHZNyTURMtDI19rNPjcO73qW41no3rL6X8RBUSCyK5Gry4tdCeBRUZK1x7BJ1+P
	 coZn53ZWwDG7fYW1jSrscKLrmfOt/NUm+iIZYqDXGVKQmy7JdCTP7zQ+7c6VD09t6MA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790998815;
	bh=YqxU5d1ANouEMTMOiEDL8aUxi3xHJ9amLM3Ve2NY7Z4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fcgkqDepsg44S1h2GJaBbOMKIkxQF6Q22l0HeU5q047IcqVPxhSoj8xMEx8+RNR3D
	 tLFj/PlKiRb/EXfnd7sfq+wHp/WAzyJE1nfIOE2MnSEb27wLkAtVBqViAwXK32ltx4
	 X1jZcmO+Y2o1PnMOa6W4UUZIw4R1xAaTBIfeEll1qQAnfJN6V4XkYLFvo9z+Em73TM
	 cXcwruSkgH95K7/bUjKfvHampkSwj3ZBvLDT5jcc4KDMCEINXRHbj1hCciyg0wmo4i
	 qo/mFtkcrDd1hKG99nc3ECUk6rWutHoIgN7dJaNIOjPYFbF+FypPHUx/d9IxoSk3gP
	 Jn4OR4n5LuQlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6292040D1C;
	Sat,  3 Oct 2026 03:40:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1754F435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FA61400C7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDaxszF6Xm6A for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:40:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7641240059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790998809;
 b=qeiXrxgaq68fXLIohtEtJoE9cpSiqjQJZ4QflCH6uZwrn5PXur3Yp8f5h9CiZTR73Cm1
 TxA7jBtwb1nF8e5xn9Wrnk+E1DJdexglEuz2R10H8G5QgOOCgYXjWoZEWqC0juFyTrstc
 fB8kVIwiyBPAcYKockd0oFkkLimMhWfbZlNS/yej1BtqDeEGdbH9qN7VP99rXo2++xKuZ
 17XjngVYysjGBn7GuRAHekdHNMQS953rQXALpfwDpotniWhHbf98Elxmgrw/BRzA6IQUZ
 crCSSpr0E9UIpPIfTMnp0rUdQiigkxe9TEsVE/+4YyBcXEg0C6rTTQNB1B/SSs0yTrA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790998809;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=gI33xqROvcpn8iNx3poayVnNOFQlz4i/4cWcVuaedms=;
 b=ZyBvgUKeMORrDe23ew5eWj+l1ow/17krvH/y/Q0oRVYRt+WPwoom5dazqmexQvDIfyQz
 AULYZ5jcxQFm9FT8oWBnpZfA5YnYJQbJsjehzMn7lOJ0m10znB1zaTZvabQUjI6xZuRcg
 1h3bg8+/aT3923iWJveOWzYMgm42o5q8fikM7c/q3GguSqDAed2PCsLw9FL12XBVk4Ue7
 v9ZK7GKAIKFdaqz8zgftFzTc6hCCIbQvmIgeD+KiYkUC+C+9gEewNZhR5HpUoxUdqA4uR
 6YvqRDRKERk4anlIePiCxryYaD4Cg8nIMI1eJk/XGCCRr88aiUibBoFwEq7o74oxS4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HnSzmrzV; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::28"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::28; helo=mail-oo2-x28.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HnSzmrzV
Received: from mail-oo2-x28.google.com (mail-oo2-x28.google.com
 [IPv6:2607:f8b0:4864:31::28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7641240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:09 +0000 (UTC)
Received: by mail-oo2-x28.google.com with SMTP id
 006d021491bc7-6dcf2ba1fa0so304023eaf.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790998808; x=1791603608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gI33xqROvcpn8iNx3poayVnNOFQlz4i/4cWcVuaedms=;
 b=HnSzmrzVCk1Y8wp4FoFfDEIRRS74nYLRlI+YJm0cA3v8vdDbKAUOoitMeL5064+rMN
 jkiA1YbqREhMTGdSnGa71li6B5vfIuzK9mp2nabbWyPeOC8lA7G00v9cTvJ8NIFPqUcG
 mE0+0xYPk8EzZiYG2x5Xs3JW2tckhoWu+mMrZ3bCacJTyqYcn6PYlN8XKnHuO2MZeYKD
 l4TeMjiu/QWJUuYvafBoEZymC2Q0Sd1uFALzzoBqQCqHb+EaXBhU5ZEb0MX29S96hXZ0
 qvGe196RAOiYoQLGRtPdA/GRTUzhJ8qttGUsaav46mC5uL/SVbOpFj0FY9z9vBPpJwD9
 J+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790998808; x=1791603608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gI33xqROvcpn8iNx3poayVnNOFQlz4i/4cWcVuaedms=;
 b=H3F1urxoSTr9S+Rik8JAstGev6qyxNeDmsnemgv+MADETlLIihTp5JfoJ2ITJzYkML
 UjlXwO9FvspWueInKO+oNOQhpvvAb1Vfr8LidaQ9Vr9XTy1GAGQt2kG2SFpKD2MXYSvF
 NiedWOMwA3s0ooAsCThXNSLePqPZF78H4MPCRHBw/KMKsZzVBJZUyExREjpukroJA5FD
 vhAG9zSKCCflGmueRpOLCAcG+ASx+8pLFEsj+LS814uOlJ130Iqxbsu0ragb9nZVmCpS
 BahO0wgP3EoAvr/ufVg1M2ASXzZfbcddo0UUyA82/VA5KXcK8VfE/hVblSXej6FB3eio
 fZrg==
X-Gm-Message-State: AFuF++lBKCyAqs4cOUG5br7K1knQLVHyiauQCx7xiJ7LZu0fqQDLi1Rr
 CfUiTccR1z6Ctgpb1ruzBrWtva9ONeOpWJfAy8yac2y27i2tA7dJgsEhSMViSA==
X-Gm-Gg: AYBFou3tYsyMflZ7pFef4CIPKJ7TY02mZyR7q/75MjMtddOdKBQfUBo7KR4TBCP0fE/
 nOGpoYSwRXa9/EEX9gTPV+ihNy5DnjjydGLy55Hvlg03CfEoricRQUp2f1+RsNHbWwn4/NYDyCi
 larRagymhwwfyBGb4y5Pv+2kY8tzknDmWKo+wqNog0x67fuCZ/Xh2MnhHoepCVw9VKbgH81ra0D
 SfHAWQLxb0PJ1vZw9bEk2OqakUYWJ8adV7kRYJplLZdqicrHZkULb4Bl3KNRcEtVqmrOlJ75LH1
 XCNbxZxLzwM2SEWtb4SHSqQUsXcvwOVb5vuFLiRy49qE3MVsEH+3XYMv6TTA4qasnn44rxLwjEz
 DOkdmwuCfIVNtuA54KF4sp8bVYk96sAxXgRyVdYo8rDR3i1gnTNVbPnWyOWuIZDVPfvupQHfGFx
 QaaSPe3l3quL6Q1rzDwRXA/wipRiYab+abVo288GfXmx585eOF8wSzb8Ng2Kxn//oFnNjS5yUOv
 8ZJSyPF+gH3NqiARJoNSLgynlDxhbSJMemDQz9RUTBUwFopZDUo0+1e6mxti92rh6l7116E9qox
 0BUaaercmcuqXlV+3wTqUUp+oTi3FWd1lEiRbHCwdweBimN5iGuOZeAhYvdyPuKUXmj2fqLO1qm
 Z6ISe1QJcdINieco4NL/PKsjE6WPgKXrmnQ965YrX/Q==
X-Received: by 2002:a05:6820:1612:b0:6c7:6c8c:14a7 with SMTP id
 006d021491bc7-6df302dabe0mr4018623eaf.5.1790998807955; 
 Fri, 02 Oct 2026 20:40:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3afab7adsm4203344eaf.10.2026.10.02.20.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:40:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 21:39:54 -0600
Message-ID: <20261003033954.462113-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003033954.462113-1-james.hilliard1@gmail.com>
References: <20261003033954.462113-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/python-h2: bump to version 4.4.1
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
 package/python-h2/python-h2.hash | 4 ++--
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 5adfc86f52..e330c1bf21 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  b4781bbaaae609aa759565585718e0d7  h2-4.3.0.tar.gz
-sha256  6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1  h2-4.3.0.tar.gz
+md5  8ad21558fadb74bc42af25681c9ba7ef  h2-4.4.1.tar.gz
+sha256  4e866ffb1a869ae14dd9b5e6beb5c24a13da0495ad72b65925ded182521c1516  h2-4.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index d9cfbdbf92..38bfb4fb9b 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 4.3.0
+PYTHON_H2_VERSION = 4.4.1
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/1d/17/afa56379f94ad0fe8defd37d6eb3f89a25404ffc71d4d848893d270325fc
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/e7/85/7c366e69d84c17bb778fe41419e1fbcce3033d5b7ce29bbffff0a98b859f
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
