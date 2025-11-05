Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFEDCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E2C34132D;
	Wed,  5 Nov 2025 22:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSvtOx532hl1; Wed,  5 Nov 2025 22:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD46441323
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD46441323;
	Wed,  5 Nov 2025 22:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD5DB00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60BA180F87
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEIzh6y0zrny for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F6F80E9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F6F80E9E
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2139683D2C; Wed,  5 Nov 2025 22:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28694dcec72b11faca6e9d9371fb0f65c590de8b
X-Git-Newrev: a530492cd3e6de7ed5f9406f7573fe7b9061b3d5
X-Patchwork-Hint: ignore
Message-Id: <20251105222950.2139683D2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: require merged-bin
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0009107060497861692=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0009107060497861692==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a530492cd3e6de7ed5f9406f7573fe7b9061b3d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 256, systemd will taint the system if /usr/bin and
/usr/sbin are not merged, known as merged-bin:

    # systemctl --no-pager status
    ● buildroot
        State: running
        Units: 166 loaded (incl. loaded aliases)
         Jobs: 0 queued
       Failed: 0 units
        Since: Mon 2025-07-07 19:48:05 UTC; 19s ago
      systemd: 257.7
      Tainted: unmerged-bin
       CGroup: /
               ├─init.scope
               [...]

Although this is not yet an error, it will be in the future.

To be as ready as we can be when that happens, forcibly enable
merged-bin, like we did when we initially added merged-usr (except
this time we carry the select from systemd, even though it is not
yet strictly required, rather than from the init entry).

Extend the runtime test to catch any tainted flag.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/systemd/Config.in                  |  1 +
 support/testing/tests/init/test_systemd.py | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0cb10ea3d8..931134911a 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -25,6 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
+	select BR2_ROOTFS_MERGED_BIN
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 05a65223b3..7fdd5d1798 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -31,6 +31,25 @@ class InitSystemSystemdBase(InitSystemBase):
             self.start_emulator(fs)
         self.check_init("/lib/systemd/systemd")
 
+        # Test there is no tainted flag.
+        output, ret = self.emulator.run("systemctl --no-pager status")
+        self.assertEqual(ret, 0, f"'systemctl status' failed with exit code {ret}, with:\n{output}")
+        try:
+            # 'support-ended' tainted flag is only set based on the
+            # SUPPORT_END variable in /etc/os-release; as we don't set
+            # it in Buildroot, we can't get that flag in the runtime
+            # tests, even on our maintenance branches, so we don't need
+            # to filter it out.
+            tainted_flags = [
+                "".join(line.split(":")[1:]).strip()
+                for line in output
+                if line.strip().startswith("Tainted: ")
+            ][0]
+            raise RuntimeError(f"Tainted flags: {tainted_flags}")
+        except IndexError:
+            # No tainted flag \o/
+            pass
+
         # Test all units are OK
         output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
         self.assertEqual(len(output), 0)

--===============0009107060497861692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0009107060497861692==--
