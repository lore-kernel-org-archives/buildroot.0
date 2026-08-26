Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D92DC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C3E809B1;
	Wed, 26 Aug 2026 19:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwLSJ1PsG13J; Wed, 26 Aug 2026 19:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787772702;
	bh=Cno4KoZszgtWeBImjjVAhXGCO5OWaEyhIF+zFLTNERI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PcMV9aG6CQIWFwrGPkpr+LzZfKn7rwrS5Ykp3tP8QfslGPl4ZOvKz6pkQFHvqA84T
	 XLu3Rct3zDmq8WLrjpa4V0ua0AofxbennZVnd6K9p1dJ38gCc5CjgeftSouoBwKx0K
	 Jcj05JRLyWhucujHB4mKMtmzivxiwENcPpUOB77yp3xpBkQeH7YVIcct7kVD5j4Pjl
	 IrTIJS2D4SUHwibj9Q6olXcYTE7Z3DT4yILQwVONvqY1GKQ1vg36UFYum8VuLvtSli
	 wVIQ1fbk+XeB3PMOUilP6OHUBuVhhy+I4jOSL+HHpbgiZckI8RNeCrwE9ptlVUIeDB
	 Ur1w0T59S+nDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B91180980;
	Wed, 26 Aug 2026 19:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C5239A
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24F3540401
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIzPqOO7fiNS for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 19:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE601403F5
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:31:39 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a082b3671fso2035478a12.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787772697; x=1788377497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JElpMKHlO9aN13UEMFWGZmiXVfSsaCRwy0DmpQpeZnw=;
 b=Xjt0tMiSUQGEo3L5OXUeskTQEb+c+KyJP6CzFVNrVyrSzd+06cNpA3/1Z2pI1ox9bh
 w3do5z1eJ7Xdf6lbti+4yd8Jc0QB5nFL+g6oOPbYjJ9/dg55ru+bzPjEeZ2vk4pXKJTQ
 tZ9Ts5MhDR19dnYfXPiBvW3Z9dT8cgc2ccDNM44j5fZjKFZ4fvPwjWy7Zc1CF2/1LGSv
 FibalxZK/T6P5Iy54wbo+tUtKnzdXsc7NQYehIeYzvomBRXoQrpgcnuOE3Iv8Y3Ng0tq
 J1kHQm9fYN6HlXHuo8FQReMzmhACDYw57dGVACDKTxGx7h6Tnpd2B4OH7KoUccaworgR
 x3Nw==
X-Gm-Message-State: AFuF++lNOpCGYqLSOlsLAQDUIvoQ3z0DnX24calNrZ0qtXOkRd0rUEXI
 eNqRP85+rWm/23/xoFxLbOB6aLD+KtNvGykBiwsH86A8WrQfjSyCsLPMrBD3iEy6pPb55O+0bk8
 hRognYes=
X-Gm-Gg: AR+sD136BoPcZKAqI/HgKwah/HR1IWMTH898TBvKgG6ovlEwgL9tq7KXEi/hZhklmOf
 j1aBzgiMpHKal9rPtdG3TJgDlE7AK6603JlDpf++SZR/RWzFAF4XbKAUoLvBwrlDAVPTjD7iN80
 ynAqll6UOL9rnNGp3hxa3Y3KUCn7P+NbuXJDwxVi2x/BF5eWo2d9GJWhuQcuRx2pq2HYrcEv1xD
 2jSnR14+ndVO4ZZX2pv3q+L4X0S3o1h3CeunpQfGo0GZ27es4Jf407h6jJo6G5iUH9BzA2TKnGQ
 XaTFPrSgNPjwYIgY0ocrooZhqG2fVaGzGa7e3rwSmR9326SlTPhdevXguf5r4He/3JMpCobS2a3
 64Dr2ebU636YTSzqjkGwxoV30EFcLEqF/akeNIZIdq4mVJGdr9s0RYsRZmNoZE0/iS5ijiCtstK
 o+NHm7n2FGVQR/ART9elWj/NzN3Kq5ljZOOmbItlp+gOte/W8yxbpRGAzrO+/eRtzUwESbNwD97
 EyP+2GQq/ZFR3pokPl3KT/wj96hDpKLs/pYFU4S9+WL3ytO/5WEsa3wg9xTb8w=
X-Received: by 2002:a17:906:fe08:b0:c21:34a3:4d9c with SMTP id
 a640c23a62f3a-c250c345beamr1173001966b.21.1787772697480; 
 Wed, 26 Aug 2026 12:31:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2533945d28sm151803066b.11.2026.08.26.12.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 12:31:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 26 Aug 2026 21:31:34 +0200
Message-ID: <20260826193134.3720281-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: TestMdnsd: improve test
 reliability
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

The mdnsd runtime test can randomly fail on slow runners.

It's hard to reproduce locally (only one failure after a few attempts)
but we can reproduce it easily by removing the while loop entirely.

It means that the "sleep 1" is not used on the Gitlab runner.
The timestamp of the failed job seems to confirm that [1].

07:06:55    [BRTEST# while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done
07:06:55    [BRTEST# echo $?
07:06:55    0
07:06:55    [BRTEST# mquery -T _http._tcp |grep -F buildroot._http._tcp.local
07:06:55    [BRTEST# echo $?
07:06:55    1

So wait a bit for mdnsd to be ready.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152862

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 214eea7dd9..2637af7c12 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 import infra.basetest
 
@@ -30,6 +31,9 @@ class TestMdnsd(infra.basetest.BRTest):
         # advertises the bundled _http._tcp service from /etc/mdns.d/.
         self.assertRunOk("pidof mdnsd")
 
+        # We wait for mdnsd to be ready...
+        time.sleep(1)
+
         # mdnsd only answers on multicast capable interfaces that are
         # up, so wait for eth0 to get its DHCP address before querying.
         cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
