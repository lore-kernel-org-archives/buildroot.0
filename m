Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E546C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 05:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F6B81CA3;
	Sun,  5 Nov 2023 05:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F6B81CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImH3vjkQYyIx; Sun,  5 Nov 2023 05:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F94781CAF;
	Sun,  5 Nov 2023 05:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F94781CAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E0C21BF5DF
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6505081CA3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 05:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6505081CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cyvOlMszYtn for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 05:45:06 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 695F481BF5
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 05:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 695F481BF5
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35932aa21a3so13325695ab.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 22:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699163105; x=1699767905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qaMODkjWWSIqMoiZh6on/5jhGmt+z9LBTyWcVOA6c3E=;
 b=ZNmeGpQlJ1EchH3O5VYQhy4dWOOLyCAvSdeagwfBrp50oZXXgo5I2pB+YNyMj0KZGf
 UDzQyy4weZzWIv76UuNe9LNeencwDy2a6t4r2H49qfR57BN3V8n2zvlcBBwgi1nyUKDa
 8T92kq6r6AkH/WTLsM7shPx9FhwXs7ownZN27cgc1mo9PqOAKBSFHNx+ww8T5w1mwqsQ
 Eusna9qdyC8lNKTFgZ0vgfNePXmRn91rIqolj49pyk8pRDII7Dkmcy3DSdxL4iBqSB9R
 RLFcyQaal2uGgwacPi/XjYMWEa3JLVWhw+WXs9kEbKd1TO+TyWroIFyY9L9jRJ3kCAxQ
 H7Qg==
X-Gm-Message-State: AOJu0YzSeA8i/QT2mzR2D/JIFQEDmm87ARw8MFU8PzjDMU7sDu85v5E5
 wubDzeMcuACI0LREFFup2b3cQaXMWX8=
X-Google-Smtp-Source: AGHT+IEOsXZ3bjdajQgC9ANStbBv4RewAgRfjg29UtMW6M5htjgJo5uUhpQ24JwqTWa/Odfpx/LTcQ==
X-Received: by 2002:a05:6e02:2143:b0:357:549f:eca2 with SMTP id
 d3-20020a056e02214300b00357549feca2mr35493971ilv.5.1699163104977; 
 Sat, 04 Nov 2023 22:45:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056e0213c200b0034e28740e35sm1675313ilj.78.2023.11.04.22.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 22:45:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:44:59 -0600
Message-Id: <20231105054502.2846404-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699163105; x=1699767905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qaMODkjWWSIqMoiZh6on/5jhGmt+z9LBTyWcVOA6c3E=;
 b=D6j7wNlHzrfavFUj1SSRP1UYzAjlKN2D21yQ+bybI9ruHSyY6jlo3qKBzwf1oAEia9
 kDqIRvDsXRguCsSEr/l5Ax2Tb3Vwlt/p9CClrov6AiSCYMeZg3cPyIgkNBufYTkvm0hO
 zDc6KvdmMVG8gCmTj2znBOq4AX8Y2YwGjDrxIJDYFQ8bsOUKi1SYVOPdYdcYFD+1BbRK
 zvaqiC7LCplmD2P++q7kGXbPjF4vr7o0qmP9tPJLQjqerCnGpegAj3QHkm5MVIbrQdht
 8ft3ftFYWVGcqDzEKbmnxrg4ZdY5548WTjbIqu90skjBAgIyqbMxfFPBCI7xVQAldqyz
 2FLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D6j7wNlH
Subject: [Buildroot] [PATCH 1/4] package/python-calver: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-calver/python-calver.hash |  5 +++++
 package/python-calver/python-calver.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-calver/python-calver.hash
 create mode 100644 package/python-calver/python-calver.mk

diff --git a/package/python-calver/python-calver.hash b/package/python-calver/python-calver.hash
new file mode 100644
index 0000000000..ebc054e617
--- /dev/null
+++ b/package/python-calver/python-calver.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/calver/json
+md5  e1fd924b9bf953c0b28c49bdfe117d7a  calver-2022.6.26.tar.gz
+sha256  e05493a3b17517ef1748fbe610da11f10485faa7c416b9d33fd4a52d74894f8b  calver-2022.6.26.tar.gz
+# Locally computed sha256 checksums
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-calver/python-calver.mk b/package/python-calver/python-calver.mk
new file mode 100644
index 0000000000..2fd5468ed4
--- /dev/null
+++ b/package/python-calver/python-calver.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-calver
+#
+################################################################################
+
+PYTHON_CALVER_VERSION = 2022.6.26
+PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
+PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/b5/00/96cbed7c019c49ee04b8a08357a981983db7698ae6de402e57097cefc9ad
+PYTHON_CALVER_SETUP_TYPE = setuptools
+PYTHON_CALVER_LICENSE = Apache-2.0
+PYTHON_CALVER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
