Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14092C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FAB6120A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1FAB6120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91EF480DE3;
	Mon,  8 Nov 2021 19:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhOqCGngEGHj; Mon,  8 Nov 2021 19:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F201C80DA0;
	Mon,  8 Nov 2021 19:27:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EAAC1BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CEAD40003
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id noXwg2MRWE0X for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FCCA400C5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 19:27:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t30so28789091wra.10
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 11:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+BRghd5ITMRWE4WGpcHSeV0ovAbZs7Q5J0NyB83zNT0=;
 b=ddUUTmh5Z9PBWivqtJ2rdKDElLWeGqcu8zTLK3vo9L2JMFNhr7L09M007VbDmq68rk
 ZZbAjFNMg1VTCPiEEephm/KvY8aKQrNJJs6fzwWZZZDQgo81WfYJVfWZMcbN2bJMMN1v
 AQ0CiKpIIF98zFQ1KXaXqgna3FybhpXAeohIOncXCiaXyG1KzuQOvBUDj9sfLc67PMY7
 bl3oQ3btEc3bZPCRh7epY+ha+OWYBZSvTs1Gb+NkzuvUqMc33wBhFeJYy71/i7C5zguX
 KT2ONEsQcWdUwNqZ8CwAbpkF2jMU2jNn4qN9PVKqCqL2Rehdm+MehFNCy00Uvel6H0Uo
 42Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+BRghd5ITMRWE4WGpcHSeV0ovAbZs7Q5J0NyB83zNT0=;
 b=CaheFHxK7DGCkziJeQ6JYf3OGwqpJiN+W8U3QO7frMiIPN5tmVh7+4B1U3Qd6eSpZm
 TzrSowL1mAU5bdsMZT9pNQtFMcfR0uQBsF5rqLFb3yZmKmjIrW/wAEiXs9ngg9UvVh+w
 ajt+yDFT/QlJE8hBEFAinyJy7LZAZKzS3Aud08Jj9uGX08yMwNebYUMllHfH9uRYFZnH
 QNG4Jsr3KFlTeyS6vZy+2DknW8Q6nytzf3tVYJwiu7rwwvKfb3PCOwPZeW93Te/UQ+06
 A2UM0TDmmFJy7mhWDwVLNZUOHraxy/l1ZK+HmNcg7ozW6Jbrb3N+2ihJlfyHFDY/4n/u
 8iIg==
X-Gm-Message-State: AOAM530Mm5k4ELEa9JqoWTfc2/FN+zAgWBlvXOmzPN7cDm/ygofuARNm
 eFQK3jqy8dcaBO2G96u7ZmMVps5RiUtL3g==
X-Google-Smtp-Source: ABdhPJwJsNdDZ8Ef5nCQr05VmGqw027cbzBIZPLJ1cAi27BtPx0tXjVZ4VAMs7/XYzBQBliLlKWEFw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1859664wri.297.1636399633196; 
 Mon, 08 Nov 2021 11:27:13 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:f823:1d08:390b:d00e])
 by smtp.gmail.com with ESMTPSA id r1sm256016wmr.36.2021.11.08.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:27:12 -0800 (PST)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 20:27:06 +0100
Message-Id: <20211108192706.456116-2-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108192706.456116-1-texier.pj2@gmail.com>
References: <20211108192706.456116-1-texier.pj2@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH]
 support/testing/tests/package/sample_python_unittest_xml_reporting.py: fix
 flake8 warnings
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

support/testing/tests/package/sample_python_unittest_xml_reporting.py:4:1: E302 expected 2 blank lines, found 1
support/testing/tests/package/sample_python_unittest_xml_reporting.py:8:1: E305 expected 2 blank lines after class or function definition, found 1
1     E302 expected 2 blank lines, found 1
1     E305 expected 2 blank lines after class or function definition, found 1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 .../tests/package/sample_python_unittest_xml_reporting.py       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/sample_python_unittest_xml_reporting.py b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
index 8fa92aaccc..cfef4df22a 100644
--- a/support/testing/tests/package/sample_python_unittest_xml_reporting.py
+++ b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
@@ -1,9 +1,11 @@
 import unittest
 import xmlrunner
 
+
 class Test1(unittest.TestCase):
     def test_something(self):
         self.assertTrue(True)
 
+
 if __name__ == '__main__':
     unittest.main(testRunner=xmlrunner.XMLTestRunner(output='test-reports'))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
