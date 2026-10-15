Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B33CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D9B61254;
	Fri, 16 Oct 2026 13:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNEXIC98fdAs; Fri, 16 Oct 2026 13:12:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2783A6120D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156344;
	b=UfcXBnNC9PjKFdoELCuPdF9hOpBvtJ+QhlxnPa8hQ0d+06WNkgrs5QPC+K7lfTz0H7xM
	 NwsqRAyYghBX6fUsTqosHJdwkwUK01ZC0qcl5qoqp+VCizyTeuQ7XC7apwAI5aNOp1ZNb
	 6inGO1MtX4U+2MQf9DbkOeEEsRHQDTJARov+ZpLPogcw3hail3k6Jnu4Q1l9XwF0eeHrs
	 C8kgDrCZjHl0JJNKoCemC2Ll5k68wZ8+F4fADP7rA5eP9sLBuJijao0HgWbZakju21iYj
	 VCEeH6goT2nefFWOjewwJ1b0vOs23o1GsJo9tXT0O1LST2CK8FUOMCHNx915rNeCFsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gi+n6v2vuzTI4TrgW8q2UvreOHSVZJu9IyVvhFjyXv4=;
	b=OZ4fvl479FG4oCCE91826yfM6e8/An1wVa4jDbyA4mWHsDnQ+wOwIT5vwwzMvtlSYaIF
	 9Cl87llB/pbUqFIx93xA7X2qnccnK+lIG9mQmEIblUXhnZaGDiOmW2MQaQEmx83ev3Ov7
	 B77aPyOqGzh6MHHMu0pgNH2itnFiPGDRWsArkXe+CiQhukXwanzIXN6svkWwvcW0EUJEw
	 ILymXfiNY9GnYjIb/cYwgLt0L9UgeapzcNWq4FBTxUbg1nocKlWT83uka4mHXt+qn7Siw
	 QYVoGinpckRwLATwrVLAOjPg3yOxmonlydwl9S+rSMP2xPGOy0fLGhHsnerNXA6jZ5Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156344;
	bh=gi+n6v2vuzTI4TrgW8q2UvreOHSVZJu9IyVvhFjyXv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sOULQo+cOe29TY+JFFpxe0Vk4I0QwBqyR6RtUfBUl3sMb+SKgfiXgSeHKRC/wAPNH
	 MjS2kADGp1HgNnRdpQ3RW2Omkj82U+O6d73d4NC+vLoF3sPgE+vApkQp14XB/KeX8E
	 GpZOArxyzQmqRMtbwJSoB76/yvFm+/eOvZRJyvlyR758mN1TTUvjhg6DIsEZqlUc0t
	 D2gVqiauTZUMX3dc6k2CrHuc4wX1CXblaj2Wytv5gPHcM2VOXflNBBFykDJIQHxYB/
	 USAWYmy0Zr+KiicasZqYcK0OuIHLVkO5Ui3R6OB/jqzi7E46MvequfVV5CCY4yyBna
	 ub7M0tTOLoppQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2783A6120D;
	Fri, 16 Oct 2026 13:12:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5309769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A27D660F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz2I_s_ZT3KR for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 30C3B60F1D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=c1dNBN2pOVath+41alNxsOiMZHoaOuWKn0ajmKgZnxO9VCazQYhiQQNXahIjpswInNZu
 wX8M9NAb0/3JYi8N2PhpXOEPMhnVNiY4vQ9j/oebOfxHaDip8Ke7wuI985MPAUhE1FXxm
 itE4yWgRF8wBzLYdANzkceg2/C5/bteUrqJjT3MmEaSTJgrHjFhgfR7u8wg9vHZwzmMJ1
 IDNtL2v6ZmdtG36E1FxJ2I+VUgKuLvQWVclQ7KTs2gmhdgvcecNyt6nCNkKQ8nfpHsxDf
 H7VBSh7nlAOFZHrugpKEaukotcEh+yqA0OCQAYzM6Utr17x3+nZzc90YGeAX7hViDRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Hh3TVdwJA0hiz4nw7m1gpwlMF3X/Ouyvnk5XvsUAHZs=;
 b=jEJhXLbDcMdpduzHhEJyswIJ7gQYDWdEdgBVDVdgPMZwnvftPIn/YsuKkf3l1vb6zGWo
 0+4e4bJHoA33cuQUQfEnRIkO17oWpU1pztydgnrVzMDDyhkgbIlK/8Rpo776D2qPD/f8j
 /ML4GMKNnUBzGxHF1oxkHUT66pVD0BUocfH/ggSxoYejSejxGr48HXs19YZy5E+562bre
 p9eO2Lpj77zM/CoTB6CSe900/qq0NHkinWi/iqn5gOcahrR6KiO5zlctK1q/VzZpxSA2W
 WjFOwpowzZYIeuJ09DLC9TRzsbs/ea5v5Km/w16hpwyu5NU7n6uTXNC9kIhqp+kB1xg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C3B60F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20FC4960DA; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:21:04 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ce829cad92125cd1b6aed012e339da4035be5356
X-Git-Newrev: cceed8a0ab097d42536b635c66941a7d36e99d9e
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.20FC4960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/genrandconfig:
 reject qemu user mode on hosts with large pages
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9166875045531658899=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9166875045531658899==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cceed8a0ab097d42536b635c66941a7d36e99d9e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Qemu in user mode cannot load target binaries laid out for 4k pages
when the host uses larger pages, as the 16k pages of the Asahi Linux
kernel on Apple Silicon. The dynamic loader then fails with e.g.:

  GLib-2.0: error while loading shared libraries: libz.so.1: failed
  to map segment from shared object

or, depending on the target:

  qemu-aarch64: .../GLib-2.0: Error mapping file: Invalid argument
  torque: error while loading shared libraries: libz.so.1: ELF load
  command address/offset not page-aligned

This hits every package running target code through qemu at build
time, i.e. gobject-introspection and nodejs, on mips, sparc64 and
aarch64 alike, and is not something Buildroot can fix in the
packages themselves.

As this only depends on the build host, reject such configurations
in genrandconfig when the host page size is larger than 4k.

Fixes:
https://autobuild.buildroot.org/results/4848e735fe83dfeef4f24d32655c567951fd113a (mips)
https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 (sparc64)
https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 (aarch64)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 721e51f58a5477c5eccc9d2a41c6c7ee5e5529e3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/genrandconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 727c8193c4..8437d6342d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -124,6 +124,13 @@ async def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
        'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' not in configlines:
         return False
+    # Qemu in user mode cannot load target binaries laid out for 4k
+    # pages on a host with larger pages (e.g. 16k on Apple Silicon),
+    # so packages running target code at build time (gobject-
+    # introspection, nodejs) fail there.
+    if 'BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE=y\n' in configlines and \
+       os.sysconf('SC_PAGE_SIZE') > 4096:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')

--===============9166875045531658899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9166875045531658899==--
