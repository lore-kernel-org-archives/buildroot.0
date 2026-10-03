Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E640240E3D;
	Sat,  3 Oct 2026 07:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xDJ8U1UvT6q; Sat,  3 Oct 2026 07:19:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1930B410B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011974;
	b=jdH5WmWxke8DEiFY+hnNzXsFAilxZ/IhdSsd9S4KQGN5onsicmwqT4lqa/7eLHqXtZje
	 XHb5QAKDh3VlxKqLnTduFmTX/fh8pTLxMPRBx/vuyJibbRhdoBAoo28s7Xvi5iJEyTUxB
	 LBD1i5/W2C1XIQKO7JzUhqW7mtrHxzUNouXMvv+PJHxpYOWKamFNp3hpAltId+LrqO9mo
	 MkW/7oOdO447UfF0HhW0dseM/MVxVWZxXCc1E6vkkKRNj5ij8cY97mjHQnWwBv6Zam57W
	 e7ADoVGpZdGdRsl0Ne2TIVCuhlU67RXN8AR4P2RNsiUmzNSSLopo3TyrgOGOSWvqoig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OtjgAbK78Gkr8RIkHkJJ5DjN0D1fH2xaynGOZKNkJmQ=;
	b=DGxKj8PFnkxlg3FHqA3F3F7MwNZjEve+0Q5TzdbC8gsH8UGle9q2i4wX2VseuplRf2xW
	 YdzJ1JbWz0tcCQZZFubpnTCoekRSwrr5cFqHCscxfphZb8Zk2L7/7+za1r3jVUGPS9Voc
	 ABkQTKHUzIu2WJY2eDLVTUOwwN4zdCuO9ybjlrxtp+wcS8y0jPUF00c46T5P++2qoO3I8
	 u4kCsy16LptiH+PPgQPZOHDypolKtSOF3D/yNlP/XnwplM10A5b0drRLRTle9PwY2bQTI
	 Mzyl5YhSdcau3UKTPmeo9T7AL2gtNR2EnHI6RbrS6ONslJtu4qB3xbcrhDOuLmFvRRg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011974;
	bh=OtjgAbK78Gkr8RIkHkJJ5DjN0D1fH2xaynGOZKNkJmQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LHDiSuZsdh79p0jvsCg/Axx1kRulPMFSDg+aGG8wJrw9ksdj8qyGnqL/QKuMnNo9w
	 fR8oXsaENWtzJBDYgRmmRxwnkNpjkpeDIkPAroJ44zzZxjQjEQUbDEXDFRtwr/ibmo
	 iK1e8GudDUM5Ve38n6/8R0A0/B0STzavrkDNd7otMMr8fELptXno/o5+K/TezaZZRL
	 g2YK0PXjPXH7GaSJYnU9E2xtbo7YsZS9beopfqn7lJX77vwwM+Dzc4MfBZScwFnHXr
	 ICAUHfDycwYO++FMN3WMltsgCg9RJQ/XqXiRMYK8ogZwBnr5X0GU+UEtT6E1h6I8HV
	 k5Lde2/6ylPvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1930B410B7;
	Sat,  3 Oct 2026 07:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CFF834E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF1460DB7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fVYK9nx899Z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:19:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 95D376065A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011971;
 b=HlSE3BGISaADC+mfCvIHKtTTDrWPck8Dv68krV3AiPkfu2K8Jx5LywjLrU1DSpfSFrV5
 HeMD6DBBuXUy6/KAYnISKaqzt6KBXcCCqrddyZU5kYClP1fIjV54HNoujJ+2QZZyXAIZl
 i32s5m6+L2sPjP8mbynv6mXvM35JzIBNfEjkiB8Eghm12TP+s4ektSCVc6yWfGla1m5io
 K/h4vCwMNNe2PIpOz5glPLzLVuoO/u7dCLH9IiBZPw+iMjWVnVpPH51r7Q/QQjY9+vXpB
 tNHOrBB3VkdnT1hMaacWyVby8Jp8L0itK6izo508uql/A6LZhbsJVrYJXM1vxenCwCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011971;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NP/qDwgXxlfiPHyFbkMKxSpigNjrEGU5g86geQw6SCs=;
 b=U90udMKE00zrq0Lj1pnkcq6ImsTxRdJuMj8IOZc7OrZJuGMzl7OaQ2q3bLBBa/MluZYd
 FF5erLUgJlqBzRgdA9WXGcckWIIelZe0QrOHVhwbVv8ATRO1bEzRxA80avI8pH5CWjQha
 64W1SVo2QxT9xXOKQqsGqaVFq2kOP6//hcSLYXZ/BBssv6h30AdFonmydOhS4kTBO6bnV
 w0Q6iBKdVe6WLHSXrb9u78Y3KvpbnOgxTOrQD9zNIj6vUQM5NARiELsgN0c/UwQQRdd/n
 V3p5i6q35W+47R59nMkonDP6dHqEmomW3HPEzi6W9vGatcmrmz2Ba49gQTpiLg0Ttjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GCaoGgN4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GCaoGgN4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95D376065A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010938;
 bh=NP/qDwgXxlfiPHyFbkMKxSpigNjrEGU5g86geQw6SCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GCaoGgN4wo0vpZqSi/PiBi228siX2MulJLXhVgmo+gJMar7AwINdtprc6e1ovoZYZ
 AX8b6e/lV0a41nOtbCKnNnpwFGESb2c7qKynb96MQtZTq2TInUywJDEZ+ehr/u54cN
 7BEvmLv08NpI4KOLXm1U5uyVq6sCLqGIXT4+MJEj91FsBF7PoxXY8iB2Y8qtkB1nz6
 4i9YT25oBIh+SZBdjcd5tZC0aVIyusZL1AeLLY79dYPbSZNje5le5NLRhSUSJS+JsK
 NbTWtZumjO9tu9zjWjGcNh0k9blAUgMp4f38Te+6T+Mh3LXjD0W9xBXQOriKyi5tAA
 yACs502XC9frw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 LwDR0L5XJrbZVk9/omqn3pk916DtzFFmU4h8mJVv4aGZL9iVxo+itdkV4WJtqn80LnHdAiL2Ss7
 Y/G/dgSHszK9eqYKt8T+kNybxQ7czK02PFIA7gKnqOGF/7lYL0cy1bTVs/R59wqcvM1hkF9qB4c
 dTMDksHouZ6ovXssxFwJ4y3EASUVyqxxSnxr/dkWgd1p+H0nyKcK/d5Y+MNDHL5+pL4GDVnBYl5
 HHRt7W201NEs1nAVWDmbBx8nZ8x9JaPfC4QF4n0I1CC3euSWVej6SGoUhsjeYJn3LjfcXMMzrvE
 +viKdHYnDZtcSrxxgj589AOWVoCH/mPpqZg2AF9cp81HvJQMCgv1ZBItE0wyPtwpFb8A7jkrE/f
 TbwNFVytkQCBBI08vnsn8bi2Ua932tcUpQJiLcr3cMhwh50Ca5X3g3fL9mYHyvFPbr/m0tRbMM5
 sa2fyL01CPsnsAMLQ+sLYO525cgkJNKI6/JqjdholsCB+zmaZ4lV+vTC977J92x/o2O5BptBU3H
 9MqlDoSgcaOgnakjsVoLb/D43/XF9bkDmrpwW1RKlUYtiRDPDWiWLTSwkNMhoqBfYw8E1ZECDsz
 ck0vEJKW9m9JF+cYdKb+7rLq+KLS+9QnFOkwfItfBYfjx1SMexb+JQCF4kprY/Z0BfpiloU1RKt
 w7MluQ4QNzi0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E188A4C5487;
 Sat,  3 Oct 2026 09:02:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-40Mi;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:57 +0200
Message-ID: <20261003070128.1295458-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 025/114] package/python-flask-caching: bump
 version to 2.5.1
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-flask-caching/python-flask-caching.hash | 4 ++--
 package/python-flask-caching/python-flask-caching.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
index cc799fa47c..a7eb08724c 100644
--- a/package/python-flask-caching/python-flask-caching.hash
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-caching/json
-md5  5e628f2a989e60fa99b154515d1e2499  flask_caching-2.4.0.tar.gz
-sha256  a7f14e43617cd0612a57bec2f80516d6d2ec888bfc50a807b1e4e41ca345a3b5  flask_caching-2.4.0.tar.gz
+md5  012ea61f220cc033a70d286dfdaaf33f  flask_caching-2.5.1.tar.gz
+sha256  f75b451fde3faac0e278da72263818134deca8c4ba6bb07b9b3b238991368dae  flask_caching-2.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
 sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
index 0b32c87055..7e7563f391 100644
--- a/package/python-flask-caching/python-flask-caching.mk
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CACHING_VERSION = 2.4.0
+PYTHON_FLASK_CACHING_VERSION = 2.5.1
 PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
-PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/42/53/5c46b6a80adc13ed9179879a93cfc2c1f190c64c48ba732b4f5819df520e
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/a2/74/37c0cfc97444bc639a2854808c55ef61266c3637ab0a64c794b9f6ea1649
 PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
 PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
 PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
