Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A721C4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ACEC6065E;
	Fri, 17 Jul 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LUK2znVXtG6; Fri, 17 Jul 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A3560678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784298339;
	bh=mj2p2eBkdi7cboFRlBiy+fwdsA0VoxLpqrU5DxsV9rg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MA+E9xocfKKBMWCB4oWRB1Uy1HE/ERRDY2cX9zPVmvP+ma8ahXcXZkIKK5EVpiNqI
	 3A83Md48CDHoWKe1p1HzuvDTo971qw+2lA/GGwX7gKy9wdh2QdnbaEdHVLAZw7wsuG
	 +dGm2FQU1GPSggefaHpp/tgLbWXUWWlfCa6u2zV+OKz3hypdliwI1uuNdrBhSQQjb5
	 YSuu+CWEVvnZ3WHwsnCvp+jJI2fuInxGyNDz/UuDQkI+G/dp7sS1bKrqKrlGnXoY1t
	 hhBNMSU4rS4MidSV8+/9jtlXgGo0jECSipKAE4YdS5PS2TU+uzOptiZHB8RcPDOs+1
	 eCU9c8BV3HQlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A3560678;
	Fri, 17 Jul 2026 14:25:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43230320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2953D40990
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hw6YZuIn6XS0 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 14:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 156E740569
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 156E740569
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 156E740569
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 14:25:36 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5b015532f7bso8010701e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 07:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784298334; x=1784903134;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZVOFrTEAZjdvibex1824OshGVx0pC36TdOVA5udi89o=;
 b=V8RGwgV9jTNhPB3cvljJLOELKGq/PTXBUggUk0VCzg966tyPZ/WOVVl/gYfXOUzE28
 5O0DTUO4sOXXRiqYL/ZVwN1vG46oViDpL7cj3cYaZKnQA22NinOZYbIJOglrUnLnKr+a
 dbR4VzGMaQ1kkq95tBWEQQ983GUw5slwhGHGn9XBdtG0KRgkFzu7q22rokEzvLuVGMy6
 LJ7yTwfe/TwtOqck3HOM9GcV1w3A1COV6/RzuU8h18IHU3zkSx0Jcoo3/Se03yh2bYTH
 IrrKTaiVWRBnfi13/GYVk/fF4/iBxUA0hAQ+UzFgQ/Ze+CCQ4/NtO9Zo2Rt0I9AaPCYA
 PEmA==
X-Gm-Message-State: AOJu0YxK68Oftph42KvEZGY5UoE9XVmYNVKG6cAwq3U/XgYG3buTCiW+
 8r8WCjoWnEJBoeJv+/YRHXz77no+JBNfKCcvhk0UX8chVFh3EgjYbpTgqs3cMw==
X-Gm-Gg: AfdE7clPCuA9uOrpE/f5nXod/5Cu+DdFUMQFZE7UIDOQzu8hHQb2PmZXBKjTv7Dmt4E
 lZ9yNY7aNUzY/TORhD9J50JDOxxhh4GGutCisoIQdy6Nqvc5YY/2NxGh9ccUWLZZN8jDybEydww
 V7B1Rok3Pp2oKL81Z4XyBwJ83x1EZgfvhelnTIhURpn/qPErjUDrZp7Jmy7ZKX6W4zUklZvkRLg
 7f+uoX5cjwJ2/m2kanMwDh7VvUtznPHvHp/NRn+SuN5Vq2OQJvuVI0EyzxH1jE9Nvk77Ckor14/
 dk9rlIaLEJLOoXucSKJUOK8FtGWcVn/O6ebFgW/DC5ndUHMuQT112pDM3GxOCbeNmUA2u5GTYKi
 cvsk1saWiaNTTwQ84v8EuZrvkZq2RFniNVL39oUplOMQykkx4t3sm4LU0KTflOKAy/d9nv/wnwy
 bnr8cQfbhOGWqQBbKlXCIzyBZmNg2lKboirOEqAtkP
X-Received: by 2002:a05:6512:603:10b0:5b1:5871:fa60 with SMTP id
 2adb3069b0e04-5b28f8694efmr504750e87.21.1784298334252; 
 Fri, 17 Jul 2026 07:25:34 -0700 (PDT)
Received: from gimli.addiva.ad (h-158-174-22-6.NA.cust.bahnhof.se.
 [158.174.22.6]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b291e0ea1dsm361762e87.43.2026.07.17.07.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 07:25:33 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 17 Jul 2026 16:25:28 +0200
Message-ID: <20260717142528.2709557-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717142528.2709557-1-troglobit@gmail.com>
References: <20260717142528.2709557-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784298334; x=1784903134; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZVOFrTEAZjdvibex1824OshGVx0pC36TdOVA5udi89o=;
 b=fBfA0oX6fC5tKfwk2Ne4uxjyTILTMX7D4GHv53e4umzSVZYTJ8u1M+1CP8947b9zup
 GnHkogVom0cQ+hiX0xJkVaXA0XsjQpMUjwHJKvI96Bf8oAkL7j+uwMZGzQHLd91PzqW+
 3Ltn7YMHnCHLnvLsY05V1TEQcVmCdJQVs8LDC3W9EyzdKH1S+P878WjPxYa+Ewa5Razy
 hAl0ZS60kGDSeGF4COyEbnAsjtXpyi+4qOnjCwITsg6saF4FZ2M/6d3S1JkXGzaUY+sI
 F0/zAQJ7jwjA9kvuN3mzYp8s0/TAZt06ufwXErOYgSNEfKVnHcfVsYogmEhIhusFyzsn
 KhIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fBfA0oX6
Subject: [Buildroot] [PATCH 3/3] support/testing: mdnsd: new runtime test
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

Boot an armv5 image running the mdnsd responder alongside the mquery
client, then check that service discovery works: mquery browses for the
bundled _http._tcp service and mdnsd, on the same host, answers over the
loopback of the eth0 multicast group.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_mdnsd.py | 38 +++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 support/testing/tests/package/test_mdnsd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..82300c4a18 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1664,6 +1664,7 @@ F:	package/ssdp-responder/
 F:	package/sysklogd/
 F:	package/uredir/
 F:	package/watchdogd/
+F:	support/testing/tests/package/test_mdnsd.py
 
 N:	Jochen Baltes <jochen.baltes@gmail.com>
 F:	package/altera-stapl
diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
new file mode 100644
index 0000000000..43057d4351
--- /dev/null
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -0,0 +1,38 @@
+import os
+
+import infra.basetest
+
+
+class TestMdnsd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MDNSD=y
+        BR2_PACKAGE_MDNSD_MQUERY=y
+        BR2_PACKAGE_MDNSD_HTTP_SERVICE=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic,model=rtl8139",
+                                    "-net", "user"])
+        self.emulator.login()
+
+        # The responder is started at boot by /etc/init.d/S50mdnsd and
+        # advertises the bundled _http._tcp service from /etc/mdns.d/.
+        self.assertRunOk("pidof mdnsd")
+
+        # mdnsd only answers on multicast capable interfaces that are
+        # up, so wait for eth0 to get its DHCP address before querying.
+        cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
+        self.assertRunOk(cmd, timeout=30)
+
+        # mquery sends a multicast query for the advertised service;
+        # output is one "+ NAME (IP)" line per instance
+        cmd = "mquery -T _http._tcp |grep -F buildroot._http._tcp.local"
+        self.assertRunOk(cmd, timeout=30)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
