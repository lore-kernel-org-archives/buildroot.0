Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3909C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 265336108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 265336108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4A614046F;
	Mon, 18 Oct 2021 19:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DN3kYgqDhYF; Mon, 18 Oct 2021 19:58:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF8BE404A0;
	Mon, 18 Oct 2021 19:58:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C60D1BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C864824EE
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKzpFw73Dihx for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:58:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D30381DA0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:58:35 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y30so2863235edi.0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLK+zuWoULkchjtZlopjZ7pcLyNa6lBw6xf7lZ9cC9w=;
 b=cqdVT9JAJMzZuBVKM0ZpY+6l/7sWi1IJXDxds0N6ktVzO6EwX383iF5ITdXhLhxR3k
 oics+eh07z2YKU1QkMAr/V3ozBCjylLcwHjvOW/TCYsWi7lCrVPZwx8AQ/+u0VHwXWoD
 NPspIiAlVE1fQvMocOmj07FA6v7q6ctgr0c8sL2MY3ANtHcbUsxPEBm30bw5vjzuMs2K
 /lMBAX5D9lmqoMgMwH+sHvWTE91Z/GfwI7GBfj/1MyovRphh4V09FQrsX5uEG3wEx6Vv
 J1aQtBG0qgB+VvvKkHoxyp3LWap9gF/zRSXKqZBntTmgs8jkiah/76ulBNapnNHoHN5a
 dWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BLK+zuWoULkchjtZlopjZ7pcLyNa6lBw6xf7lZ9cC9w=;
 b=Gx3+n+fnLzI2eYd/5q7Msr/xWYwhlTi7o1Fr++3TZ6lF9I+GatUxImiP3IjSc6fnDx
 f4vYwa7BSiTmS4q4XM4Mv2QxHCpnXdCvVPZPksfCHDBwCig17bzXRskVHDHTc0Fs9eqN
 mHr5RprAJvIFOwVLizIp9i45EVTtk/2QVMb4raEKhEMDNyIlLzMSA64O5MARQQ/hIRer
 a84rDbZ1A01IZWsgunaTTiuZZJwRUJLYNl1ndZIwyU8eg2fDCAlsIOtMwB99N70H7DeE
 z7ePA8+xz5QzLaMqKy5a2tihDEYvs+1Vwm+w2V6pOKrvSydImtF9c96QKgfdn9U9mhyU
 WIpg==
X-Gm-Message-State: AOAM531exS2LqzTF+V2m47M2Vg+XpF7zEfImmIEXTgZUCy/sxtIlOIKv
 Cok9nqvxtmKLXBAFveg9Ho299iuP4MebdxHs
X-Google-Smtp-Source: ABdhPJy4pI9DwQhX1bVYMUq/8A0+FPXVmaWi7f0lxw17j44zewIvdR6ywwEPzV19HUWw8j4CilkvKA==
X-Received: by 2002:aa7:d985:: with SMTP id u5mr17925293eds.161.1634587111549; 
 Mon, 18 Oct 2021 12:58:31 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d30sm10463916edn.49.2021.10.18.12.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:58:31 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:58:21 +0200
Message-Id: <20211018195822.2263226-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] tests: sample_python_dbus_next: ignore F821
 flake8 error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The dbus-next package uses the Python type annotation for dbus types. This is
not compatible with the python typing assumption that flake8 makes.

Exclude F821 from this line.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829
partially:
support/testing/tests/package/sample_python_dbus_next.py:17:36: F821 undefined name 's'
support/testing/tests/package/sample_python_dbus_next.py:17:48: F821 undefined name 's'
support/testing/tests/package/sample_python_dbus_next.py:17:56: F821 undefined name 's'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/sample_python_dbus_next.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_dbus_next.py b/support/testing/tests/package/sample_python_dbus_next.py
index 1fcb76f45a..710bfa8c04 100644
--- a/support/testing/tests/package/sample_python_dbus_next.py
+++ b/support/testing/tests/package/sample_python_dbus_next.py
@@ -14,7 +14,7 @@ class SampleInterface(ServiceInterface):
         pass
 
     @method()
-    def ConcatStrings(self, what1: 's', what2: 's') -> 's':
+    def ConcatStrings(self, what1: 's', what2: 's') -> 's':  # noqa: F821
         return what1 + what2
 
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
