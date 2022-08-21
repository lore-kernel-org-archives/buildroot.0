Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C2CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 08:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7394060B92;
	Sun, 21 Aug 2022 08:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7394060B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3x1PVWvbzVp; Sun, 21 Aug 2022 08:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927AF60B8B;
	Sun, 21 Aug 2022 08:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927AF60B8B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0E91BF28D
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6530E400E5
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 08:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6530E400E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5mT5Bo4PAbQ for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 08:41:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 453E040385
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 453E040385
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:41:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso6200775wmc.0
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 01:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=ZSPfq4QRmzPF0gcMPKmIdRBdrUCiL9/Hht9agyMQ92E=;
 b=2Z7X6xNNKLYZrwXsGNlDXqdbT7VGIc1dcfc7bYcqmAIxTJVTLikO18jj0X0CR6MdRK
 5qk2dpbXYH+fzG8zkL7fEiiHFm6FxiLlFVR3eov3GQ3K+Y3AsWYZd4z3/oi4vsAFOZHS
 esVrq5ZZJ3MAl4mqCKH4QveH0dLuMY5sCmB3+ZBrvqr3wNpcsPmplxu9kGxJbVV6J5Q4
 ebSbGUUVt7AtIvuATIIdOLp7/yFxzquUjstu8urolex/uZspBZyGCk3LZ29XrLqjxDhM
 bzM0pcCKmNG7th5/PIav3TURqYxkGuwbhQ+tj8bM2vLpsh45CY6CeJpcC0Oc26AiAehM
 J8Rw==
X-Gm-Message-State: ACgBeo2fxccbUtP1704RPfJv+GUHeHAOLWFEPSiroxYGmxb3zkcdVBbg
 5hFFmc8SABiQfzeLRZu6ibaklpo56M4=
X-Google-Smtp-Source: AA6agR4hlY+2diI4FfDpyb13MIDnPfsnsdY93TSf/A0QJ2tbmWI8ZXJlJAqTiM47qwLzjxc3QP2X2w==
X-Received: by 2002:a05:600c:1554:b0:3a6:23d7:1669 with SMTP id
 f20-20020a05600c155400b003a623d71669mr9357345wmg.70.1661071290298; 
 Sun, 21 Aug 2022 01:41:30 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:b8e6:fe51:1cfa:c9c2])
 by smtp.gmail.com with ESMTPSA id
 z11-20020adff1cb000000b0021e51c039c5sm8388393wro.80.2022.08.21.01.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 01:41:29 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 10:41:28 +0200
Message-Id: <e8e8f938d57fc7afb0e6e4a6a971eca7896b7387.1661071280.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661071280.git.yann.morin.1998@free.fr>
References: <cover.1661071280.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=ZSPfq4QRmzPF0gcMPKmIdRBdrUCiL9/Hht9agyMQ92E=;
 b=AvN/hYs1ikSp4xUYqDUFJoqqq+KAUrfr5xwIqDQoRDaORe5THhQtMPD19UUb/nR42X
 vPDIexzLwR/OJVGVq90DeBb1C89iX+jCIPzCtYU1uG5mhkPZMfYPV5MFn9ZrSVCbugTh
 ZB6XkSFqqjjBBR8kXC0bDRxQ78Ys2rC+pnLA152lBzrpdKcj9ywN1gaeIobPKitTVOWh
 wf5de/vZFvJMV96eaFaSf43ca+wF5y9N6DUEgp764ma485Lk7czZnLdisFcBS8kYdHEy
 23jcyDqwwcZ1MQRXjDPgrZeNnPojxdfpsZxdjrveJA27haM9+jEB0AFpm2W9IBhmAw9w
 g5XQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AvN/hYs1
Subject: [Buildroot] [PATCH 2/2] utils/genrandconfig: dump traceback for
 unhandled exceptions
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In case of an unexpected error, we currently only print the exception as
an str(). For example, the recent issue with the glibc version check
only reported:
    TypeError: cannot use a string pattern on a bytes-like object

That does not help in fixing the issue; the exception text is also not
usually very user-friendly either anyway.

We change the reporting to print the traceback, which in the glibc
version check mentioned above, the error is reported as:

    Traceback (most recent call last):
      File "./utils/genrandconfig", line 740, in <module>
        ret = gen_config(args)
      File "./utils/genrandconfig", line 676, in gen_config
        if not is_toolchain_usable(configfile, toolchainconfig):
      File "./utils/genrandconfig", line 186, in is_toolchain_usable
        if StrictVersion('2.14') > StrictVersion(glibc_version):
      File "/usr/lib/python3.8/distutils/version.py", line 40, in __init__
        self.parse(vstring)
      File "/usr/lib/python3.8/distutils/version.py", line 135, in parse
        match = self.version_re.match(vstring)
    TypeError: cannot use a string pattern on a bytes-like object

With this, the error is much easier to pinpoint (it's the last one that
is not in a system module).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 21d4592049..4c00d67691 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -25,6 +25,7 @@ import os
 from random import randint
 import subprocess
 import sys
+import traceback
 from distutils.version import StrictVersion
 import platform
 
@@ -737,7 +738,7 @@ if __name__ == '__main__':
 
     try:
         ret = gen_config(args)
-    except Exception as e:
-        print(str(e), file=sys.stderr)
+    except Exception:
+        traceback.print_exc()
         parser.exit(1)
     parser.exit(ret)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
