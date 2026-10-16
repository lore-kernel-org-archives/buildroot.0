Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563E5CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A11060E95;
	Fri, 16 Oct 2026 13:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTH-LK_GnyQg; Fri, 16 Oct 2026 13:09:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DEC9A60EA3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156170;
	b=tEh5cSIVyw18pIyIJy0FMzitNN0H4lOqASYx1/zUXnmvNM30vYKCcCtoNQ1d75xV4tpb
	 WAMTQWldz4KuZhOH/18/Lzfwfhj6GXtplVK+mtkpSXl9UhiHkSXUKJltvvurI4OyuUBHv
	 yF08vsLl8yrrCXOD+K+KqJqAdFassUcOjFo6YGCuxWy4HajO5zFGDdG+O3apILrIND8Ab
	 Wnru/CjOMTiDC/Rsw7jCcOji9mM9AwX30zK9mrT8ErhctjIN4fUqHxmpXAazZZ0xJfGLf
	 McrmnfbodvY2SlBZcpMA7Ii/173zigJwdsMcYb6HAGqVghyYmtPJnif7axfUZRKf6eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=8vOHG981s1cVLISxBb7VslYg8aQV8vF5njFT73Gm66k=;
	b=r//fHgrAcK8l8XTJZma3XXQgFo+7B18M24MN9cR47tFJGME3ByXDbF36u/WmtXsYDsP+
	 Yfg3zLh2TUAOgbcN2aYlPi/CZ8O95rZbU8HDBKahsmG54qEwwE6JF7qsx/N7jJbEL6I51
	 ro0b1lP259P2jcQ2mW9vMj0jnZ8ZFpokgxZm+eBoSYEgQn3bxFk8wnsjUlJcstwx+rioM
	 Y/wY1gf7S8OZJ3+ID1BtBR8CzUYkzbF4Xcj15AaOU6WXs+b1VardywxOV8MzWnsioq1AI
	 6a8+6PreEBRRJ8B1/gE3pCWP1XBThgKMSeKa5yKFhujg8xnsvOw5SdECB3uEBjM165Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156170;
	bh=8vOHG981s1cVLISxBb7VslYg8aQV8vF5njFT73Gm66k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j/EYM7gXZeUlDwOUVycUa+8pTiTpgIG7hMIon98I4xwBxfX1V+1RDmU3LiB57MeZK
	 anwD6Zcdw9Rmkv7eIZwWogwfhS2avRlFGCCrOg2pdhfWieTMuycAsI0DAJ4y7IM4Sd
	 MWHixOEuItQ0x/fxY1iNV086xHE/rWfw7rQn/UsBlkL0A9eDci+dwPSrLbIG9smpk5
	 wfNouPdRVG8ONPNaiKxZphcK7V50Xd5tbWJcVOjxtdfcgTg4Pyu1z4u2GIyCYnSjkx
	 C7lhTLSGJNRekrto4EliFbadXZ9CNumrhoG8FcscEVlIuY5U5tkMCYz/FwX6AOWtxP
	 7SMR2zxyfSZBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC9A60EA3;
	Fri, 16 Oct 2026 13:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A38769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1708F814BE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEAAQa2uPdRq for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 61324814C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=TYNIYKti7UeJjtrwrhFKCFAK2J+1Rxns00xnjEMSE/UagW0i4iy+GeyCwhzQiMxLJGf4
 zxSkCu/eF/9DA4snhCXImtiAspYVBm/HY8ZKUHjKomXikKr0/XPu9YWQCDVdOhisLrSkj
 EXuFIq5AdRdyswsO6TGbSrbOg8GnGPVsUALIEtMh8TgyK3gRTCMgzE/VeR8K+RrIKzbb9
 X5/Uyoz8t4ecWAJ8GGdhbzwqgt3yP9jod+tEFbvd3lPFZQIIZgBEcZAeUf+IqyyYntlu9
 g3IAHtCTdBt+Q0HFnSsP0LIyh30MJMSgSSDiTH+Q1s0FgBLDXWsZwwCt8wz0U+rYlYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TqMCG141I2PI1WpoPxPhyEhHx3L9wpibkn2HVxOomvM=;
 b=iyAavqJlchhc4kxsab1Cx0OmMAcaKopTmSnnx5MyXkSYCbXibhxtEbRjpScbAGkL6CW6
 CnxGEnO5Aqz83hy2cZqvad2758A8PHIziyKIFfsGKh2on+Fj9vG7mg4UxBC8S4NBV1kBa
 S+qLLMm9Ea0MRCPlCUakhbjxxZzEIUntSA3ZNFiDl3WtGyPIYfGfOZsoGJNzNhFQeeiVq
 /ckLRZ14IZd26TPFmqBIp2gn9j4QUBpkowHtY4HK5205wiOp03rZZW81o4qhokVNZwJLO
 QiSfJsHWU3mA6Z5qonv2rGcDPxl6EMYV2pXIksr6irmY9fOMhLS6md8pQmIgnIAKJuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61324814C8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52399960D7; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1ee99ee72a05fead83adfad3a9fd369240176bb9
X-Git-Newrev: 9ef7f8a225054bfd7ee4ffb8209df0e97b2fa78f
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.52399960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5880376544980161682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5880376544980161682==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9ef7f8a225054bfd7ee4ffb8209df0e97b2fa78f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============5880376544980161682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5880376544980161682==--
