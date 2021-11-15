Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73019C433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 23:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F202C61BA1
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 23:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F202C61BA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89572607BD;
	Mon, 15 Nov 2021 23:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWOh7z4EkoTc; Mon, 15 Nov 2021 23:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E604C607BA;
	Mon, 15 Nov 2021 23:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7A7B1BF8A8
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 23:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D56CF4017E
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 23:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgOAJ68PoH_4 for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 23:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EFF440012
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 23:54:00 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id z9so17255854qtj.9
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78iU0z88oD+pigShYKEJP3J6YT5hAdva5JZZtQQRGag=;
 b=gtBOXena64jVJCWmIiUte/4OKNysYzLcaV5nG92dv4G1JxDdQvAPWLuc8KtdmppnWf
 hPPZPWbDAbnB88jk5bRQazPZcE1wVbcfebcgmUmORSo/CLztBrACK7l28a6ml+d7St48
 SNivlNDYXtJ/Lm3pQLgsGbHYKdmcewyYTXyPt9zWD3QPD4EnUaW9AJUeS+1QGoReI+ik
 KmLFnJEa53hskmiWKi7/rWUtxof7BKnoGJBKmCKkv6Bjru5/PpWBIK/2NxtaNSYryCd1
 qFDsNffxuYP507e8iAA2pXG2NuvPdWGSCZD403lwdBRXvukKNm6ybJZYuoADPR+RBjrE
 t5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78iU0z88oD+pigShYKEJP3J6YT5hAdva5JZZtQQRGag=;
 b=l7rFh7jJx/D9jzL2gzp8TYAC9BuTCRi09aYiQmCkZ5XCQk++o4eryMOmheHogJ9+1k
 bNou20fRrGSP866bfgDHqJzNSgdeslSWTp3xZSw9sbWJkTnUINFamyMwRyPSZ258hb+b
 olzf3DDKExccodRYQmiu7r1eimnb7HXD2J0/LHwR5PZYqkHZ6hhNu9qqZDGqtevRz+m3
 vCZXe+0y1MuY7oJF2xu+x3qyCvyE/aueS2IHo7d0zU1XyavYJ7JUkVzJC078YlwRXiUC
 /P9MfgbAykwZ/HrTPj+uNcnfmr7DzdZoCs4/Ogb9kUSsIHzYqyKE1Dq1dEY+YvefyCXh
 /fjQ==
X-Gm-Message-State: AOAM531uJiSEHCBQU8pbGePVHzF85TPkN+8mk5zyBNOXOpSQlNjKGi8f
 +OMpxN6BRnjipQiql1qaLIA7r7gQJMU=
X-Google-Smtp-Source: ABdhPJzc7PzGoncpnFZYF0abIdoSFd7aLGyUSylJfo3V428EyMH0C74j9x/4v8VrQ14iOFhzoc+MpA==
X-Received: by 2002:ac8:183:: with SMTP id x3mr3006583qtf.270.1637020439380;
 Mon, 15 Nov 2021 15:53:59 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id s2sm2359662qtw.22.2021.11.15.15.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 15:53:58 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 20:53:36 -0300
Message-Id: <20211115235336.3814968-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] utils/checkpackagelib/lib_mk.py: fix check for
 overridden variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Titouan Christophe <titouan.christophe@railnova.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently this .mk snippet results in unexpected behavior from
check-package:
|VAR_1 = VALUE1
|ifeq (condition)
|VAR_1 := $(VAR_1), VALUE2
|endif

Fix commit "163f160a8e utils/{check-package, checkpackagelib}:
consistently use raw strings for re.compile" that ended up doing this:
-    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")

But raw strings do not expect escaping when referencing \1 and the
pattern ends up searching for a raw '\\1' instead of an occurrence of
the first pattern inside parenthesis.

|$ python3
|Python 3.8.10 (default, Sep 28 2021, 16:10:42)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import re
|>>> p1 = re.compile('(foo)bar\\1')
|>>> p2 = re.compile(r'(foo)bar\\1')
|>>> p3 = re.compile(r'(foo)bar\1')
|>>> s1 = 'foobarfoo'
|>>> s2 = 'foobar\\1'
|>>> print(p1.search(s1))
|<re.Match object; span=(0, 9), match='foobarfoo'>
|>>> print(p2.search(s1))
|None
|>>> print(p3.search(s1))
|<re.Match object; span=(0, 9), match='foobarfoo'>
|>>> print(p1.search(s2))
|None
|>>> print(p2.search(s2))
|<re.Match object; span=(0, 8), match='foobar\\1'>
|>>> print(p3.search(s2))
|None
|>>>

So use '\1' instead of '\\1' in the raw string.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
---
Caught this regression using unit tests.
Before:
https://gitlab.com/RicardoMartincoski/check-package/-/jobs/1785343039
After:
https://gitlab.com/RicardoMartincoski/check-package/-/jobs/1785364353
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0278354434..572fe75990 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -77,7 +77,7 @@ class Indent(_CheckFunction):
 
 
 class OverriddenVariable(_CheckFunction):
-    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\1\)")
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
     OVERRIDING_ASSIGNMENTS = [':=', "="]
     START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
