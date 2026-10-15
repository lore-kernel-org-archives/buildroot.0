Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA6CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DCF7612A3;
	Fri, 16 Oct 2026 13:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id uPe25Yo-oHVl; Fri, 16 Oct 2026 13:12:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5C806129F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156369;
	b=F+TgYIA6bP4JQVaRcUHPJzQgzxe+Z/wNOrwT5LZ1C6C0DxnzynbgB+oISPRInswOwJ4O
	 VsLKrDKimDlJy/NYYlsOupL19GhSWSOf9B/Az7k25K2ZkM3W+t8NVGG6f9aC760DHZl+d
	 WyZetT0zAWYdT7JwfhGAb2m8/CbNJWqdWdI16SVxQ0CeKRzCQLXuWNnhW1jOOe/iyTCfl
	 ykhCsCERubL9hq5eBcugQW5SAiL+XR3n0wAyHx2pVXnPa0jvy9DiLF9nn58t2fqbkpyFx
	 Z9phu6PdXZiO9W8ISSYM4qvFlkMrjwevl4DsB2hS0Qrar20bl43sbKRrrzGbznCNBUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156369;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1kPr+Xdn4loHu5azKxWfczmQI12KnDOapoap/kBSYA0=;
	b=ONVYvT0pF+KzRW0yO82VGEd3C3ryV9Tked8BKwukkf/d7M4isQl41yNQCcsQcq6eAXRS
	 ArKyBNPII07rArWNxfoB0Pb77ZrbHj33cMxik0YlvDX105IxkWu7pQPfkNBNn60HlMVMA
	 XF9gw+5Isg8MxTqmGI4EZgk5f3Nv67owRC1ckDtwiEFW8Yt9U6EtA2KhoMGAlwFbd46rg
	 EKuNt0c+toyWM/CVnLO4NOiSehK4Hz3f0lekTnflYzxLy6fcyVZORuabmDiuS0Y7WmRKy
	 VILs4v6SDgSlxQjdDAhIza7Lg6EvmubjoZ+57mZ6U3KBNNoKCfkQRu0qse7G6gGNDQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156369;
	bh=1kPr+Xdn4loHu5azKxWfczmQI12KnDOapoap/kBSYA0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qpYO9WNqXRslWxCSMehbLKzBcvkeobXwNvm9zU9sKbmONrQIafRuADm7QTVx5msRL
	 qa4mLWcEzbfFswUN7vaHYfBvfFeMKjSiJHawZdxV/iSYYjUYl2DyCmm1f75hFGppY7
	 Ng0lgWGQX+gc+J9Tx9JgYdFRe34y/4qZ7T5Sgq0BAAivBsdc5iGu9E96G05BbDWnbF
	 bKDaNsVUvwNQEHlu83a6LGLP4SyAlXfvgyiBgNm995IT8ZsLozYIUL9BtFZ0bcw14o
	 5WM2XrpLXY0LtLtBuU5xEIDsvNuy7nTFCP8ztXkCvCE6mEZZCsEUkJcVf0bUN4j4td
	 EaVeqjFbEbryA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C806129F;
	Fri, 16 Oct 2026 13:12:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFBE8F45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C014C60F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kL1We02LVyO5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C181060F27
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=iL3LQiW/sX5nYGmkwUCSSKF380uyHoolJl6qv7zYh3/qcvWBLam1gS8xZM72MHvGkoE9
 QOoD8OFhxHqjELl9cvg476QthCVzrqH4Zml4b//GK+yE/iK5z+8ld0bSKFE8qGpwo2UAE
 6HIyHaWYULfClNmURm0pfel7FjwxkJlL6/HwSsPqFqRa6/dg4nc2QRf2su+54t/xPxx2E
 W3waL+fUMVZIiL2siQYWaw2HiDZevG4l/hW221Co4WjVDMCFH/Wq0VzqpWDtdT3GtvVxs
 A0QKzr72d+lkstVoz/YiTUmp8GKCabiiGHGzH3/TClR5u0tyQC80/Q2G6jVqp2jre7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=c/gZsNPVTQCP72kaaVdYNxITyrCZwcSPaQNf/Ku0SbY=;
 b=LRbFcVu5SBRT2ZDY13mv93aze7covOyRzdBRkYAwpU1ZK+kx6zGPbrWnQ3k0pE4VzL9E
 cCXgqhoyJphQtGtPPkPBGEMtMLj6wzBcuHBC3QraUlY9vyrUGp9zhw6OAN9pWOoKDgl7c
 FwAfjr0NOsf2ZSOXAiehS6FCCN8a3zwdwtHx5paG9T/2RhF+ASl6K2eCFsnYnhlgmycUU
 +FigfBZZgWGgRJC4akd4J4w1jahcEzKyAXIs/HXufqkIDe0p8G/qjrpYxXonVEjbMzrA0
 ovqayg5Z6+1A4d5ttXnZpnW2SaK0idRh1WdvtE+1zsdzhN+M/Psu8sZWu1kI9fu8fcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C181060F27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0BF0960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:31 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f87d354fe656b0e62e55daf8888318aaf9dc2986
X-Git-Newrev: b7ef4f78ccaa8b524277e3728735e3af841c5203
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.B0BF0960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 docs/manual/writing-rules: align use of genimage partition types
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
Content-Type: multipart/mixed; boundary="===============1824541304029194539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1824541304029194539==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7ef4f78ccaa8b524277e3728735e3af841c5203
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot boards use a mixture of the GPT Partition Type "L" (generic
Linux filesystem) and "root-x86", "root-arm", etc (UAPI Root
Filesystem) for root filesystem partitions.

To have consistent guidance on building disk images with genimage,
update the docs to recommend using the UAPI Root Filesystem types. The
UAPI Root Filesystem types are part of the UAPI Discoverable Partitions
Specification (DPS) which helps set a wider standard for system boot.

See https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
[Arnout: some additional rewording mainly based on input from Niklas
Cassel]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 529df0b58030cebd7773d1bec4900af1716bb42d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 docs/manual/writing-rules.adoc | 46 +++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
index 03e4f2c61c..1e3e9e1c9f 100644
--- a/docs/manual/writing-rules.adoc
+++ b/docs/manual/writing-rules.adoc
@@ -141,9 +141,9 @@ endif
 === The +genimage.cfg+ file
 
 +genimage.cfg+ files contain the output image layout that genimage utility
-uses to create final .img file.
-
-An example follows:
+uses to create final .img file. See the
+https://github.com/pengutronix/genimage/blob/master/README.rst[upstream
+documentation] for details. In Buildroot it is formatted as follows.
 
 ----
 image efi-part.vfat {
@@ -198,22 +198,30 @@ image sdimage.img {
   chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
   (not +kb+) in place of +G+, +M+, +K+.
 
-* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
-  the EFI System Partition (expanded to
-  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
-  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
-  _genimage_) or +L+ for the root filesystem or other filesystems
-  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
-  _genimage_). Even though +L+ is the default value of _genimage_, we
-  prefer to have it explicitly specified in our +genimage.cfg+
-  files. Finally, these shortcuts should be used without double
-  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
-  specified, lower-case letters should be used.
-
-The +genimage.cfg+ files are the input for the genimage tool used in
-Buildroot to generate the final image file(i.e. sdcard.img). For further
-details about the _genimage_ language, refer to
-https://github.com/pengutronix/genimage/blob/master/README.rst[].
+* Every +partition+ of a GPT image (e.g. +partition-table-type = gpt+) must
+  explicitly set +partition-type-uuid+. It must not be double-quoted. Buildroot
+  follows the
+  https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[UAPI
+  Discoverable Partitions Specification] whenever possible. This means that the
+  partitions define a specific +partition-type-uuid+ depending on the intended
+  mountpoint.
+  +
+  _genimage_ provides
+  https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section[shortcuts
+  for many of the partition types in the Discoverable Partitions Specification],
+  and these shortcuts must be used whenever possible. If a GUID shortcut is not
+  supported by _genimage_, the full GUID must be written in lower-case letters.
+  Some common shortcuts are as follows:
+
+** +U+ for the EFI System Partition (expanded to
+   +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_).
+
+** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
+   system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
+   +root-arm64+).
+
+** +L+ for other Linux filesystem partitions (expanded to
+   +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).
 
 
 === The documentation

--===============1824541304029194539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1824541304029194539==--
