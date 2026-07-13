Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E69C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 18:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EAE380E39;
	Mon, 13 Jul 2026 18:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSzTbrJgYiaM; Mon, 13 Jul 2026 18:26:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CBA080E51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783967164;
	bh=vWR+6irv6L5CH1JP8vCUs82mfxLW8RB6O/i9aA/kaU4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gA9V2aB85bRWxWioMrrOKHC70fbiz/ApmnFOjXH5HGQY5+6NGtgw3bGsq9IuloMuB
	 AB6haR7PAlyN7rDO3LZB/NqnB9dnY3SgeJTVL5qEIqE4BYJojD4wCt8HcyCERdtfAj
	 0miUzieQ4lO/8WQSFehU+vBNXVAA1CzojMMHL+CVSVVw06uyHwhuWDIYGfN96uvEW2
	 N1FNF9u4Ua5tOf8QwgBI6pZ89D58hRREICQQsWxElEFP1gLGf4ZdtaBbaIeoUu2kFu
	 E1H3K+EGSMJr9E3s3KHBzxXCoUsmejwZfegYHUJ2KatV+FRWEct8a85HrazycW0pCM
	 7mwuV59RsHlMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CBA080E51;
	Mon, 13 Jul 2026 18:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DCCA28D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F53480E53
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sEZkq_Xra95 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 18:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=marcin.niestroj@grinn-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55AF480E39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55AF480E39
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55AF480E39
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 18:26:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493f4638f4aso1766355e9.3
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 11:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783967159; x=1784571959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2oSW9o6p8cpQe3Gy85zEDOOTl7QJXtNm8RUy5gMKwcc=;
 b=nICDEbexIuCkNLN1mZvwFms2cDiRgPJbad+5QTs5I1XnuRsmBhcgoOSiFHO2gnAw7o
 CvhAFwhWEqCWNnF6lZoGi9L+jdoV2p/ZJFZj51lIzpc7RZauxujHPNHkdM1lMM7i/Lx2
 FTEnXOh8UrIJuSAnrdlVuw9Z1VoGTDGalDNNQ6EYbWjB8VkZucf3me5Tl0/VMJP0U7gm
 pLCpPndJPi+zh9mKw5MJRBqfcn1VDiByjqjTqt+ycLXVL8wkgj8lW+7OXo4FXq1XnFHm
 lOj+k9Y3mex4eed+zwPuQoSnjH54r2/6xFxZu2a01vnHe5wSbPU4xOdgsMPhFT5O/Hs2
 RRwg==
X-Gm-Message-State: AOJu0YxvhCxoEjePGZY5nQcZrV5SA5kqMlX54b5KP46IJB5VrT6ZcX8Y
 pixR5JguYUEpC5J/wJkwuDUDhVBUHmOFiZD/WILkFYh/CYwyPjxDbh+/6M4NUrQMJ2YRc50e3l9
 PhCtuxSo=
X-Gm-Gg: AfdE7cme/M6AFK/RK7rQqaTFsKmXi1IUoQQdCgdlFKOK3/Ok9gZ3pXGbEU4V6J85zBG
 hO+tLwQgN+/iczok4usBU4OuU2hMKyvr5OIcElKTeR5grgOZKgKelbx2+uPdQXfBmbNkQJJKkuL
 hFmRTTO+YMUJwMV5TNnt6x90nk4+w4gGqe0uANFW1MFUTc8dzrRRzI8bb9KqXXH78RDzGwTiNws
 h0UL+IVBtqL8gqF3wgYKjkF6flK7DkQh0tW6SZYgAe+HmEU6Y7PIavHSbrIGEiQ50rRdIdfjcvq
 8S9bh9Al/NrgXUKT6zXtdRMR4qvzvVQyf8X7J/eM/Bw9FIKk0vIwfFzfikHSpwdZTiynRzHGHZQ
 j69UCkDNOrOw5v6lOz3ygtE+FWt7HSuUC7/RtB6oV/U3t0QglZjhw6zmck/tZaGiTzPx5eFz4n0
 XUT4gLWB03wEY6jLacRRQ+d3kudgtFncSQ664ZQd4qPVv8nAAiYowJnQG2Nn7a48VOjmV8EG2vx
 Hh9iTpiGDzEpvXahA7FQBdZXI2oLxR2kaM3+jA=
X-Received: by 2002:a05:600c:354e:b0:493:e38b:182d with SMTP id
 5b1f17b1804b1-493f881800dmr113691065e9.22.1783967158860; 
 Mon, 13 Jul 2026 11:25:58 -0700 (PDT)
Received: from z13.int.grinn-global.com
 (2a00c02040fe4aeb6bbef322d0423b68.custv6.multiplay.pl.
 [2a00:c020:40fe:4aeb:6bbe:f322:d042:3b68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464a96fdsm1436463f8f.24.2026.07.13.11.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 11:25:58 -0700 (PDT)
From: Marcin Niestroj <marcin.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 13 Jul 2026 20:25:54 +0200
Message-ID: <20260713182555.3147249-2-marcin.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713182555.3147249-1-marcin.niestroj@grinn-global.com>
References: <20260713182555.3147249-1-marcin.niestroj@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grinn-global-com.20251104.gappssmtp.com; s=20251104; t=1783967159;
 x=1784571959; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2oSW9o6p8cpQe3Gy85zEDOOTl7QJXtNm8RUy5gMKwcc=;
 b=anF2D7jEdTdLJNXLPCZo7aKFWkJ0xWN1+7SNt77jbwPVmUUmdwQJWnQGss778ckw38
 JN4WH9Nk3eYNavIwBW2Ab4tWeIEpyEU7VrYirrlhidkJys3xrUlpa9uPw6WVzjfZukva
 WH5iju7lqAPw3kzon9m5QDc3XyI+fhj8TE9Tnbf12mCsJ+wbFLg0XsSw596HqzKEkdmM
 Zi8gv3lmmEbDRN8s01a9TTK84nXyn//Vhp/tbbsnd3E70wTt9N4Y3IpRutLHoxPahKqy
 vg3jOjM5SzwhkDdS4rEfm+RimkO7TnFxDyxzkgaYe9yDmic9ULmLxt2Z3eTazgYqtSAd
 o3AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=grinn-global-com.20251104.gappssmtp.com
 header.i=@grinn-global-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=anF2D7jE
Subject: [Buildroot] [PATCH 2/2] support/testing: add runtime test for
 easydbus
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

From: Marcin Niestroj <m.niestroj@grinn-global.com>

Test an actual D-Bus round-trip using easydbus:
 - obtain a name on the system bus
 - subscribe to a signal on a chosen object/interface
 - emit signal with a string payload
 - run the easydbus mainloop
 - verify the handler received the expected payload

This covers both the default Lua interpreter (Lua 5.4) and LuaJIT
(Lua 5.1 ABI).

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_easydbus.py    | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 support/testing/tests/package/test_easydbus.py

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..7185071a99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2272,6 +2272,7 @@ F:	support/testing/tests/package/sample_python_dbus_fast.py
 F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
+F:	support/testing/tests/package/test_easydbus.py
 F:	support/testing/tests/package/test_netdata.py
 F:	support/testing/tests/package/test_python_dbus_next.py
 F:	support/testing/tests/package/test_python_pytest.py
diff --git a/support/testing/tests/package/test_easydbus.py b/support/testing/tests/package/test_easydbus.py
new file mode 100644
index 0000000000..ac59c4d4e4
--- /dev/null
+++ b/support/testing/tests/package/test_easydbus.py
@@ -0,0 +1,86 @@
+import textwrap
+
+from tests.package.test_lua import TestLuaBase
+
+
+class EasyDBusBase(TestLuaBase):
+    dbus_policy = textwrap.dedent("""
+        <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+         "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+        <busconfig>
+          <policy user="root">
+            <allow own="easydbus.SampleTest"/>
+            <allow send_destination="easydbus.SampleTest"/>
+          </policy>
+        </busconfig>
+        """)
+
+    sample_script = textwrap.dedent("""\
+        local dbus = require 'easydbus'
+
+        local bus = assert(dbus.system())
+        local service_name = 'easydbus.SampleTest'
+        local object_path = '/easydbus/sample'
+        local interface_name = 'easydbus.SampleTest'
+        local signal_name = 'Pinged'
+
+        local owner_id = assert(bus:own_name(service_name))
+
+        local payload
+        bus:subscribe(nil, object_path, interface_name, signal_name,
+                      function(arg) payload = arg; dbus.mainloop_quit() end)
+        assert(bus:emit(nil, object_path, interface_name, signal_name,
+                        's', 'hello'))
+        dbus.mainloop()
+
+        bus:unown_name(owner_id)
+
+        assert(payload == 'hello',
+               'unexpected payload: ' .. tostring(payload))
+        print('OK')
+        """)
+
+    def signal_round_trip(self):
+        config_dir = "/etc/dbus-1/system.d"
+        config_fn = "easydbus.SampleTest.conf"
+
+        # Allow our service name to own the bus name and receive method calls.
+        self.emulator.run("mkdir -p " + config_dir)
+        self.emulator.run("cat > " + config_dir + "/" + config_fn +
+                          " <<EOF" + self.dbus_policy + "EOF")
+        self.emulator.run("killall -SIGHUP dbus-daemon")
+
+        # Drop the test script onto the target and run it.
+        self.emulator.run("cat > /tmp/sample.lua <<'EOF'\n" +
+                          self.sample_script + "EOF")
+        output, exit_code = self.emulator.run("lua /tmp/sample.lua")
+        self.assertEqual(exit_code, 0)
+        self.assertIn("OK", output)
+
+
+class TestLuaEasyDBus(EasyDBusBase):
+    config = EasyDBusBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_EASYDBUS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("easydbus")
+        self.signal_round_trip()
+
+
+class TestLuajitEasyDBus(EasyDBusBase):
+    config = EasyDBusBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_EASYDBUS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("easydbus")
+        self.signal_round_trip()
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
