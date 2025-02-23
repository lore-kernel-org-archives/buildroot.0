Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554AFC021B6
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0782260785;
	Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysGuFhhOgGSi; Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 134EB60BAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 134EB60BAC;
	Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F755920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D55060BD4
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gehh1Bl5W60G for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C0BB160BAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0BB160BAC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0BB160BAC
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:35 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso37538485e9.2
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345274; x=1740950074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JirUBFlfs6T6wnC2pZ2hB1q084z6v0OVGzEOe0t0btI=;
 b=D358zzyMshHk5ylzd538mtb94Autn8OFKnGwSu4EfIPQFyIcdH0UPZ3YZFSfS92WJC
 JKROIyWKIi4IaKRgx15YCYwrlVC5PpQB8xlDxxZKZbpX9qdIFjBi6Cg8IgWsZsZGd/sw
 TkfyLWPDb+3WniQK9ssmNVssR1nqXoSW38cAC6OjnBP24yUQWE6OtH/C2ZOeZhYjHe+Y
 4VeNgeaApS90oscPa38hqwegOuiB+znUBAeQj5jONyimiTvgvk1Hvssxs+esumTzxw30
 nNJtitQb/QAKhlhX63ZNYnzSvThF3/4rEc0xWcDYvZeALJ49hYNSLYqaStw1u34shhGx
 dxtw==
X-Gm-Message-State: AOJu0Yzn+aGI/YaYL/WTHrHc45QgXBWVaoyHFo6mTVBdspg//FAz61uH
 JRY+0ImJdYlxK574bEIEBWxtPENiBRXoPKOq2xI9pCNyhJqen6DtJF6Lew==
X-Gm-Gg: ASbGncu+Aij1/kkY/hlywZXwfmXA/dOkSYpDxRzgXF8hUEPM37/WnPjShLFRIVcC5tj
 lSowaR/lMkYbobzJWdcK6OYY4j0a+GHWiD7IkkGNeqPU3BA6+FjmVp+jprEXGxwenUB5jP0iafk
 TU/r+U4Ol7XkOIp7P7BGh5lt0+6ReF0DKCO/MKbhNzTXmFW3pTM5kl4AOlzCU4IiLAS13gdy2f5
 cbKuEvWJsuc/r0FWLevExQg2jBlXFCcBpPDbDPuBcTZraDPy4qpbzK8yM9KgkWbylezFJfNPmCX
 1eUgOnWJ3vD2HLMHGTVrmaoZQ1gayrnqs9gt
X-Google-Smtp-Source: AGHT+IE7wAPsVTVhZKFSt+tovNVOwFHqbQfVtpQAKVC+3yIidsJW1OKjHFLO3xFpsBm+vkQ9b8dIfg==
X-Received: by 2002:a05:600c:3b05:b0:439:9ee1:86bf with SMTP id
 5b1f17b1804b1-439ae1e54f5mr99365485e9.7.1740345273477; 
 Sun, 23 Feb 2025 13:14:33 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:33 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 22:14:25 +0100
Message-ID: <b0282e714f50d466e317c4d5e320818300ed7725.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345274; x=1740950074; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JirUBFlfs6T6wnC2pZ2hB1q084z6v0OVGzEOe0t0btI=;
 b=ZabEYggXN6cO2PdmfZIr2jbg7CTf2V3X9QR388RaOzOGjRgIg1BVb1/S7BEwjZMu6U
 TxaOKz2+7bXp9dNOrTcW/VwuHc31mm5HcwkEuUJrEgMcTA28pMrDei8Kj75ue4F+vhGY
 DYc2ehrBIl/FSKxK8kPVgLpG78c9YnbRO4ciGek6sPNAnX2oN7N2JaVC8BwY4AxDz9mx
 9iX/3LpZNl0C/WiMlQhvZCcv31gAvENqFZZ/eRKqQxeLqcRorxng582BERMe1yDgB26R
 N+a69nVNcS1ymAW9pNSoF7jhEkPtB5lx2KuFoOlRdguQQKnaH/nzBhigOZkm7xmRY6wX
 47mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZabEYggX
Subject: [Buildroot] [PATCH 1/8] support/testing: set date in emulated
 machine
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When time comes to check certificates, the date and time in the emulated
machine should be close enough to the actual values, so that certificate
validity can be checked.

Set the date to the date of the system. This is going to be accurate to
the second, which is, by far, enough for our purpose.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/emulator.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index ef5be2a19e..1e7f6ce4e8 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -5,6 +5,7 @@ import os
 
 import pexpect
 import pexpect.replwrap
+import time
 
 import infra
 
@@ -152,6 +153,8 @@ class Emulator(object):
 
         self.connect_shell()
 
+        self.run(f"date @{int(time.time())}")
+
     def connect_shell(self):
         extra_init_cmd = " && ".join([
             'export PAGER=cat',
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
