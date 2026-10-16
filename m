Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949BDCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 594FD60B38;
	Fri, 16 Oct 2026 13:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpjLI257CnU1; Fri, 16 Oct 2026 13:08:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4663860B5B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156131;
	b=C2ua0r1Ty2Bcq6j6VEq/ZT4swPBtiKtbglAlGU7I0cyRq2/+P6DXI/YdehUmnhQOV5vn
	 83zAXtfU+FfOSmV79Iq2yVWHEnmSmGiDge6lKqmuEuAHEiXmZka80qh7ohHJGOGCwHByu
	 YuWmDQusukraVE931ppmJz2oSQ+UYE6bOrQp7D0Ci+EpfF9MZ3AacJRznWhRgg8J9J+UZ
	 9F901kJt2kdKfs+tz9Q6WtsRfWw429+GzYWC3qTc1F39E1b6scgyj1iiT0vlgV2SZV/nr
	 fimrI1PjQfg10/RJwA9GQQEto87ELBt3MTThN4X7QRM13Ax0mVDNG5TSDEZ8+5C5jVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wQaroFJJfQ3DobBnh3d5oZ+q318lrrvyulgdN3FtV4g=;
	b=rXS8Mk3Gom6V8TK7XeOjOJWU4SyuiTPWN+EkcTn3B0ApR7IGmw3AOgKB4unvuwVYmRk0
	 iQpQgXfWr8zzDjguzPQsuDD80Hk+FSib3tH/3eiileoSbmtO1uhSlpOaI0is94B6c5crj
	 4K0TbS9sgYBE369C3KgLYXdA3aMSylBBNqK6PwyAbVCGxuP0YvgVr2Yb27PuARkntyENo
	 hH5L5aUjtQYVn46yg566tdm7Q4BcjACyimkkv9Y4tN0kDTt6BA8YT8trqO5F6w8rfOCpa
	 91DddH0+E8jKVehrXP4NYvZouCuss6M5esjug0crNFbhXxwuRcAsf7kN/VYn0UYsPLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156131;
	bh=wQaroFJJfQ3DobBnh3d5oZ+q318lrrvyulgdN3FtV4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q7Aw9Bj5KAcqqCKdHQYY+62nVio+aqDRtpFF/gd9O5/fVb4oM0ZL7gP7qjOOfIrCM
	 E/gBwS2fEbW+E61t6j8pM7s0RdjmuyJ8HfsAvg+ZWwgWVcGdFDyg93dJtDEajY/T4K
	 PpdC4a93GDpyP6PGnU7mgW3mQwGUvgtiN8XDclHN1wnmrm089CZbSDjhx2rbdcPIVy
	 lZ78JsxoSoCrcbs70ftOm5imvlmgwfeiUTx7GOj8imVJUQE9WZuYqav94u/KbebBaW
	 T/j7hD5YY+BOxuXFENjiwpPBEWT4456DWKi2Iuvtk4D9f/rt93U/MyJAzmExGH7UFF
	 XYXFpK09t7pUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4663860B5B;
	Fri, 16 Oct 2026 13:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DB42769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E74D409F2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8p8A1Wz8QYUG for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 048B5409F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=ZD5AaQgmshRMBqhHk4Gj2VhCe4axdf6FBLRuABZEGWwvNXqLYHn54OzjnBKRCMKV6G0d
 WpyuI2zDA6I5PPvlsTfxBQtuiUlRlnMpOm84gdQLl+t9KKeHeWNbU0jqw8YmRBIR6i2F+
 y7h9SapBnHuI+BJjZJah9M9vmHrKc+QGCYrmAyW4+uy4+J+BRLvrhfZ/6dZWv04EgLVO9
 7OAM+blQPIRITc7ZQdtjUAbDPviQXo+F5HB18ArhP3XP+u/mQtQAjE7Z0qFXP8KGJtcAC
 WyCJ6FGED0Cd+/Y2MNOeYyZOZNi3mDd8TLgWcrUCl8I1Qa/Yi2svsz+echOv1ci0LTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5SnG314Bx4MYxL+ME8I16O022MczCHXnlDXEtkYUgwk=;
 b=nnTloXLRyCWjRb+DcaXTX9uTMrYK3OYOXqycPCf++nRCRVYf7pTCs0nTCJzSrWaDpEhq
 BqOWajr4dO41sP7FuxNAGdmm9PwRh9TZ+OSh2fh7k2CN6knC3v1Rni6vQ8TdzGPXATo6N
 evRHVvYCP7fRFjERIikIaDgRjkngxvCVpRHZWENPKdkbz9/lBmjXS93oaRdKoaDYFsVGS
 lMgqdqghv1nohBINfdsQHqE0JRb0viOC7yE2jLqAvTYeK6OX6skQquZn8pm3VRiMLEzB5
 gQzjWX1sg/d9rn2QltgZc/d5ubfHoeYPNQLPElxLq2AYRFgMUArinQhMinBf5s4HUsg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 048B5409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9BD7960DA; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36d34369e48f190a590df3ec8dc5acc5a5154b9c
X-Git-Newrev: 2b72a86f15ef3d9b34f5e4c18c14c7eefcb576bc
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.E9BD7960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/genrandconfig:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2755279128568139321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2755279128568139321==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b72a86f15ef3d9b34f5e4c18c14c7eefcb576bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 67f0ea9f73..3547d05b2b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -126,6 +126,13 @@ async def fixup_config(sysinfo, configfile):
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

--===============2755279128568139321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2755279128568139321==--
