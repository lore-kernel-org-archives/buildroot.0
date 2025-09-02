Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CE6CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 22:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08AB61276;
	Tue,  2 Sep 2025 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfCut0qMlgHF; Tue,  2 Sep 2025 22:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F008161362
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F008161362;
	Tue,  2 Sep 2025 22:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AF6BD2
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F059341F64
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HNy54k0FIb7 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 22:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDFE341F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDFE341F5F
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDFE341F5F
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 22:15:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-45b7d485173so36770895e9.0
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 15:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756851350; x=1757456150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qJGaQU9KkIWKnhpMo4W0sdMEGSiRbHweFlVYL0JEzlI=;
 b=ap9cdiCNa1zhfTDwqiuC5F1Cx867wcgULjSAtKzVFQGdy/CiTgYgbUJtjotXx5sK1X
 aSCrK+7e+KbcOYnDv5Ek1IWcLvDDfhGfp3y1DabO66nFeTnEe1ipzooUDUftccXQE+Ye
 iSiqipHN/rqOgAFWM51OllMOL2Ni2jQVnt9o208CCd3ksaVEJdZZUsW6W960FUar25Zs
 CPJqjZ3gn+YN/jLz6mLdCWGPPgXFstAGj1Gsu0b/vJaa+/x9UCRUQYkFsbp0DohIqp6I
 0rzIQZ/pikDU6W1aZ3jHDOXO+YIvge8rbOBxJEFc2VL51pS/ZQ0p44QbL8bekvUR7RH3
 HXFw==
X-Gm-Message-State: AOJu0YzVD3QzJHv+m18CCOOvzy1LLwKhNPMNEaZ1uPs+MM2Ku4Oc23ty
 nvftWeHReKELhT71xoWP3P7HR6DAvtYOdTqIteLKbOT21qCY+4GUQwvJn1nLcGt9FUFAn1wwCoO
 4dr3mIFU84A==
X-Gm-Gg: ASbGnctpphHgkFF5jnx1UzAi02cWLthpAqidL2abUnU9BizQp4+1sJ5ub9PuaJkbtZ3
 mAsqUGVqxnDPWvDXqHR9rDz0JVxhYRw/joCKdoApVZI34dkhkcFGernpuzqbCJ1QwsXxzxmbjAG
 VzChow9Oab0GqPWaDXcWLMSjsIJDmFboPnmyitKvIWm74TA0Dt7n9rprKsDQ0AgTG0nzrgw/vcY
 RrAJzsOTYYl48v22i4o36qQoPmPpxfi8b9dK0uGY+QAqKNz072BKNbz7eFSq8SpYn8+mw1HwAsB
 piSf4U0ST7UDTyZe2irK7VNoIpFQEF/zjmd1kw3JH/kmHdpQrffLT8obUMLhbtX7prWcxN4HH1F
 ag0xtcN8/NT6g/mjXsDYi1fFNjqFxv33GgPfq/kBf4FSRObyvfgiDVJzlAc9eENz9TKFysjKTxh
 IXiYJYgSGOdSi2VErkO9XZVNtO2+yGvKk=
X-Google-Smtp-Source: AGHT+IHiqkockPnlTy34OiGfo+wsZwgZuxA9OWzT+XgDmNcUktDSb9icDuVLTk9Iyr8898kepR8tgg==
X-Received: by 2002:a05:600c:1c19:b0:45b:8914:7a9d with SMTP id
 5b1f17b1804b1-45b90a41062mr45463445e9.36.1756851350456; 
 Tue, 02 Sep 2025 15:15:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3db9b973869sm2218006f8f.18.2025.09.02.15.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 15:15:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  3 Sep 2025 00:15:46 +0200
Message-ID: <20250902221547.2205648-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756851350; x=1757456150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJGaQU9KkIWKnhpMo4W0sdMEGSiRbHweFlVYL0JEzlI=;
 b=BxSP4mkLKKRqCFyMgJJtuiWbOv+R5yFuBh4ga0EbDJnAzrhV4XIwc7TFZFa3P4Sabn
 F1COZJimFzJ4zfvDDrApowcw132J3DNZdjrTLJlvweEeY+Outm7BQFyczhZdS75Z586j
 cnvKFV5zrqpCRJF+AEC0yORLX7T1p5me8EhMs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=BxSP4mkL
Subject: [Buildroot] [PATCH 1/2] package/firewalld: backport Python 3.13 port
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The module pipes is no longer part of the Python standard library. It
was removed in Python 3.13 after being deprecated in Python 3.11. The
last version of Python that provided the pipes module was Python 3.12.

Our firewalld 2.0.2 version is now superseded by several releases
(up to 2.3.1) that include this patch (since 2.1.0).

[1] https://github.com/firewalld/firewalld/releases/tag/v2.3.1

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11198422466 (TestFirewalldSysVInit)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...tions-don-t-use-deprecated-pipes.quo.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch

diff --git a/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
new file mode 100644
index 0000000000..0deacbcca0
--- /dev/null
+++ b/package/firewalld/0001-improvement-functions-don-t-use-deprecated-pipes.quo.patch
@@ -0,0 +1,42 @@
+From 0bfa4eb3e15d8df8a68a8c3429505905afae112e Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Fri, 7 Jul 2023 18:13:10 +0200
+Subject: [PATCH] improvement(functions): don't use deprecated pipes.quote()
+
+Since Python 3.3, shlex.quote() replaces it. This avoids a deprecation
+warning.
+
+Upstream: f7f5613b76c044c62c876ae87c6b85f5a41acb2a
+[Romain: backport to 2.0.2]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/firewall/functions.py | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/src/firewall/functions.py b/src/firewall/functions.py
+index f7133d71..6213e778 100644
+--- a/src/firewall/functions.py
++++ b/src/firewall/functions.py
+@@ -34,7 +34,6 @@ import socket
+ import os
+ import os.path
+ import shlex
+-import pipes
+ import string
+ import tempfile
+ from firewall.core.logger import log
+@@ -607,10 +606,7 @@ def checkContext(context):
+     return True
+ 
+ def joinArgs(args):
+-    if "quote" in dir(shlex):
+-        return " ".join(shlex.quote(a) for a in args)
+-    else:
+-        return " ".join(pipes.quote(a) for a in args)
++    return " ".join(shlex.quote(a) for a in args)
+ 
+ def splitArgs(_string):
+     return shlex.split(_string)
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
