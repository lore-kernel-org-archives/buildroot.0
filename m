Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78677E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A7E610BB;
	Sat, 11 Jan 2025 18:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QloGcSu9-BCW; Sat, 11 Jan 2025 18:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EFA6119A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EFA6119A;
	Sat, 11 Jan 2025 18:25:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF9FF940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACAEF41342
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_hS34dWRDHi for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F72341343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F72341343
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F72341343
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:25:50 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844e61f3902so234241339f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736619949; x=1737224749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0VuuuG4BkytszGersNy2Mly5j4K8VnOp+tiMdqVBIk=;
 b=PPTZKrXmJcnvoMtFYkL4QUn4LRXquqzN2rzbDnJZsEwSl/nKWNxW5z+E19rFRDhg3s
 PErD0iGzIJ+ScSGKCAQ93Y9gCqUT6ta2sML2nX9TlgK6kmjErxrGnm4BtoqYr3CfeGNp
 WXxKDxwD59NyY4yXBC0ZTl5a6HiEplXYcW0JDZ9u7ce8dXyo9z23Bn1z9uI1a1Z6CcJY
 q7CWO4Ok6WLzKxpLI0SUyS2Q55u25F5fSEyBJbMIaw3qGP87TqAH2oVvThJCtqBA+LjK
 REnWZt6RGaPXoptwbeSTKSbyb9Vqz223rlr2HPHs0FfnpYV+HB5wQ7ARkGQkVBmSGEbB
 +6ug==
X-Gm-Message-State: AOJu0YykCC4H6uipLhFq0OGXkjXazAmHnx1BVJoKnj1R3z3pdZxpmh4b
 dvhkLBO9TUk0YQyfWwPQp7KcPV7Qzxx0OvUzgzxNvII+kltqc12DFRkH/8seCS0=
X-Gm-Gg: ASbGncu4KRh+z8GSxNHW8Ta9H/vdpmHz/DwBI1urQahOCnkAS60QNzVv0viE8L29Znn
 m2WGnC+OPLjH+7uBG8jWbYXlb0K9Fw4bsFD5v8hUxwC0k3NBk+c+GfWc28uKJKXQp9zQV+p3W3X
 xOKWuFHzACe60ApYgFlvBlKok/IQbxxBrwWexciE2Np8b4w8Tocn2Zwiz7P3qu7dm6EHZ8+yLWf
 K98O5nd9Gwz2G2llNql7AAin2Q2ELndMV0INh43/mZGvyIy01Lck1YZg2W/2QDQ4J7suZRiB7p9
 Mu8hGJepXM4olDndW0Dsl1v9aZ43+A4=
X-Google-Smtp-Source: AGHT+IFpaZfpRcRTVKKdEgubeDQbe2OYf8lx1UXwW2SagCZdDoqNKb5+oEE2jXA6oZPJpQvIIOxd8Q==
X-Received: by 2002:a05:6e02:19c6:b0:3a7:81a4:a54d with SMTP id
 e9e14a558f8ab-3ce3aa7c305mr127606605ab.20.1736619949019; 
 Sat, 11 Jan 2025 10:25:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce60a9415asm7877385ab.13.2025.01.11.10.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:25:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:25:46 -0700
Message-Id: <20250111182546.2932747-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736619949; x=1737224749; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0VuuuG4BkytszGersNy2Mly5j4K8VnOp+tiMdqVBIk=;
 b=bJq3HTQsnmbd5tjxD/QLUNYqN9cQeDtKXF1eM5fBur16aCGtdnVwdM/K4apmJKzUtg
 VCm+cKvHtLkAHL2Lpz8zbzUdQs+OkUyP6HO8ggy3Z0ISX04T1J3IAiSOP6wfUsBRKPQd
 Zsij65Luc3lTUqCCcpVpwT6UrfpvoKnSSa8NlMucEtWLkWHLLWcaTK86aw5A6r0r530c
 6zIfz/82ettSnJHZda02E9+OhOy7EX7otPFEfApnRdeH0OnRi1gnmCxQOWxwPqR7oXAd
 j7iv9sXTUhzSwxFhbnODGR2Kvg/vHOwZeO/twiRdLjKwYRw+l585SdFKrMRnAyZyx4ID
 2j6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bJq3HTQs
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.4.2
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
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index f8ac0ceaf3..a7ba8f899f 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  07ebd88a2a7acee1b819738f3f4ca7ef  tornado-6.4.1.tar.gz
-sha256  92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9  tornado-6.4.1.tar.gz
+md5  c3a490d9cea9360ecd0805e4c2d1e87e  tornado-6.4.2.tar.gz
+sha256  92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b  tornado-6.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index c5e5a2ca0c..45883b844d 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.4.1
+PYTHON_TORNADO_VERSION = 6.4.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/ee/66/398ac7167f1c7835406888a386f6d0d26ee5dbf197d8a571300be57662d3
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/59/45/a0daf161f7d6f36c3ea5fc0c2de619746cc3dd4c76402e9db545bd920f63
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
