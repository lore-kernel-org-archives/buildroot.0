Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4353CCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119E860BDD;
	Fri, 16 Oct 2026 13:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO6k8nrueF56; Fri, 16 Oct 2026 13:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E30661044
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156256;
	b=Z0yjz9Q7nGftu4Plh3UXLt2qMNdnGHMwJgxksCjAXVMq+/k9+LPVLihe5S8OW0Z4lqKi
	 wE80lx3IbbUdi/rAVjeFFvA8NJ7rWJ6KW33RQX0GPI+NpnhTTCi6BOAXYWvrIPe3Mi1gD
	 0a8vq0VmE9OnZA+woETAiOz2IwnUj68VCUys5OGvTBPr8RBod5WQsdKDJa1ZcY/FkxMRU
	 6JRGUT/kIBwY2WaeCwyq2HIdmG+9GMDoVqnnOv37/iEG5f9OEoc6kx5f9+H2DX691jYoE
	 ofqLtKVFLCLMqRYZy3AZNsg4pKSjEiNwFsrh8ZVgqWY9Xn1o0o71BNJQ1YMMuGlRRiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kr0xlZgTNf6glHc+FAtA5Ky3ma+I3F7+UeLhOIHaknw=;
	b=YYFv7l1MpbHmbyO1g2mAgF42FdLCMXQz2CdcJ1nIdTtxoMO8a9aH5niIxC/VgitrlWyi
	 5gYJOvWEv5zRz/yEcgGJGpE1XZtrnVOjLely0fZdnQYwFC1TdtVqemPmHrYaFI2ifWtP9
	 ds7YbIm3GosH1UlrxNhKexLX32mTQAywmGYYHTphDa1LabiEraCNBkHYrIrUR9C7GnvXh
	 7rrEvl0KL2L52N7oyuaX3qtLxggHp5a/E3eysAFL9P0J8+7M/Aa4tVn9nPzrBo9tmwWpO
	 Z24iXdqFAmDESAI2U1YvqxkLEv5cQktORghnvsiEZNVZpEqRLZdgL8nmkL00VOL1Jcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156256;
	bh=kr0xlZgTNf6glHc+FAtA5Ky3ma+I3F7+UeLhOIHaknw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o+N7bGTMvLC5nhOzh5GRThBBtuTrpix83DkvqcJGKEcRceWf3mWhKq/7RxRmEzvde
	 aT8KnGZYjuCckeQVlyGanmzFZqKh9Pyl4kVcNQxIUBfsQXlYLG3UV0jbZwwW37jeoI
	 /7RCk18Hs6oi5ZwcOBdAmq3X1KpoYCFo/M4LzaxVXAQV3NdRFw0X5B0yg9HGKtpTWN
	 xEjQ+0esIWJUFnpXZ0vUubfxHUn79oeEjvQZ/4CNw24R7uzNtuAHmQqK5s/uz8jTCx
	 RPfE1+t3JMOBAh3Q83hDyfuGDaayWmT5hMK4IsVFlJ6pnBhDUzcRBYDzOAKVVuoB8a
	 VtMqiPwHOZHHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E30661044;
	Fri, 16 Oct 2026 13:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBAF769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D4E880772
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-mKUr1AVKYU for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 364BA814D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=AwG5hwVKdjV/7TKFRW8ttwnNrbuSkn883N5rZVfh7VvuZfFmGRlFJ9rXPcWv7z9UGWDo
 G/9BUWjVR+OijQF0gg8Osoe8AhWIj6osVBeD8IXQmML27eX33TVZwCpim2tsJxSChDXx7
 1rW9IkoLC6y2r1ULbzBlGzzZMt97v8tB2nuQmDzQ3BSfRcq0c7I7+LzwePD2FebrjD0vz
 9n/3uVxoC2kgWlB8hBRWbki6LsHjuHaxQ1cV0l6LOh0YDqFZKHVTtYUiLEm3w3vaqL7PU
 rod0QKjvr9NTslStgx46Ev+5zx3HsyxQTu0dc+96cPaA8IB9wigoye8alD8xCc0zj4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ei/p/inQXnz0W1LO3wZonk3InId5O8HAty3PHfoF3OU=;
 b=agXFMC9GS3B4PU8Cit2+z8GOsr55t6/LuTmXfnngJ/LbBdvbnCueetPP8PIbLb/ELI1k
 uc4hpcXpbgqul4UBV597jIHFtrSR/huxeAYNVUKwyZo3r8oj73ztOFuUoAVoeNIDDctcg
 gVu27HC5hBBTKEtoVy7ydZTEr5cZj1ciCXumlhDGbl+djeKIjnraPk6aGZRlfK35wCLdS
 y7mPiTwMZTFJ/DRXaxDdp+Yg2V0fpuOsZORaD34vOyYcfEmM6xN2sTR2DDLUBWyBlRi43
 ZXZaAMTg1SwGoF44ns3BBnITFEK1pujcyJXJdhy4z5zs6kCCDknTmdAFkv181pp6Gxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364BA814D4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2772D960D7; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c7d027a85889fb972dc9c9c23264ba832b3db59d
X-Git-Newrev: 450eadcd0ebba7fc7d3daa81bfb3cd20b9df39d7
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.2772D960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: adding myself
 in packages with LTS policies
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4618751974897016818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4618751974897016818==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/450eadcd0ebba7fc7d3daa81bfb3cd20b9df39d7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

To better track the version of a package before a Buildroot LTS release
is made I'm adding myself to DEVELOPERS file for those one so I receive
alerts for this subset of packages.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a72cf3fa83ca85d1aeb17dba6a8986d864906de)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62cf36f614..56f43de326 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3111,10 +3111,28 @@ F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
 N:	Thomas Perale <thomas.perale@mind.be>
-F:	package/go/
-F:	utils/generate-cyclonedx
+F:	package/asterisk/
+F:	package/bind/
+F:	package/clamav/
+F:	package/containerd/
+F:	package/dpdk/
+F:	package/gnupg2/
+F:	package/haproxy/
+F:	package/libopenssl/
+F:	package/lxc/
+F:	package/mariadb/
+F:	package/mbedtls/
+F:	package/nodejs/
+F:	package/openjdk/
+F:	package/php/
+F:	package/python-django/
+F:	package/suricata/
+F:	package/subversion/
+F:	package/tor/
+F:	package/zabbix/
 F:	support/scripts/cve-check
 F:	support/scripts/cve.py
+F:	utils/generate-cyclonedx
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm

--===============4618751974897016818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4618751974897016818==--
