Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDF4CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572F5608D1;
	Sat, 10 Oct 2026 12:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3Kfn5KhKOog; Sat, 10 Oct 2026 12:40:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3EBA760727
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636038;
	b=oPYAWP64RgQuyfEAIoHJxl1skT4xEtDJO/JyaFVF6ZZ6vP47wKTJJUJYgHG4/yOtthzm
	 LO0dfD9uFEQ4SIyDyhxcvPJtXmtIFFVEqjwKpg64E3mvozaqRbMAdBeMbn10hTgk+SIl8
	 i7ojL+QU6930p1wsbSi7NfXbAwAG+fOzS1gdeEqQwyGHD1ebakugVNXW8sRB9t1vfvBR3
	 anTDGMsiJJw3oHbRiWnqDStGKGvDOptSgKuQHyA+ZhA/nzzHBF4jLwgZrHnDKgOyW5ygJ
	 MXU49AWimvNa4z42LthdNoHhyhpoSFcHigGv1HXiHewlTTGuUjptZAvxlnplwMBlUAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RuEbHMnNjHFJFh2q5wezrr4Ju4hgVHwRIWvYV/NXGfQ=;
	b=WEP15hqnPlQxEbChs1DpD5FkkpPcSGF5lqntL0v12UMYSV+HT8Ara/1o2JB8SpygmA2s
	 mFMBse4KOXk1kq80PNNSBzeANnmMgns4cyM/yR3G0og8GJU0JzylHm8VZecRJeUApQh0c
	 F3+85cZeREvobzDrKW7Y0BC+IhjWunPugn3ntNQnI4t+3Sc+ndgvQfb5PyUR5pklRjFU1
	 0nCE2UYl57WeY5jTJvDVq8Hy020VMgq+FgyjiOgTmVKcZxWIEA5x2FIqtVJjNzieCKIT1
	 iYc5GQo9pDGdaeS+etpKhrVB0LzUBPOTlmDXk+gs8+hS6o6DCGAytV4Rv3mFnaui6KA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636038;
	bh=RuEbHMnNjHFJFh2q5wezrr4Ju4hgVHwRIWvYV/NXGfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YE3rxkBeKa8N6qq/9pVBAtAolMivrgrDaagKs5tL5D1gSIvgBFcKB4+S622XP9T0s
	 pouJE4emoSGjlgO2e4k5AwIOj/eDgYy0CbPLJjWvE6UJ8v+OO7AwwHZ3hf006yGlJY
	 mo4L1wYbUfubhpCZNrn+RnE8PKKqYOMKGpVA0dXQkwO9XnwoeFvEGyTjF3kcuiCJ6r
	 T22zHpZ1ZcQp4XF5CVfJrT1StdEtWz2nmACq7+OPHRnuZzVQ4674mQ8qI2TjTbELsh
	 SDLROiP5Lo3JJyPVnlQxNTLuqpoAP67gQFqvTUfskE0SSQ+13Ht1XaujMI7thBAbvl
	 q11GwQDpC0cXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EBA760727;
	Sat, 10 Oct 2026 12:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1926317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9767A60727
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWnw4YT36Zpz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:40:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0A5760680
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636035;
 b=GTxWrdHYuK3ipPDvDaWtU7Wic1zx0PbhulY6wko6i9JjuGnRNao1Mps5g4QxDMqG/tGi
 C02znal2/8IO0NHbd896RcgQER957q/sPScllVGPTD8BAaglUFIVkO0oBTu7qXB6sEapW
 r0wHepJo43JvLr4kzSnLz+lRwhOmGf1BZgI3aW+CZKMFX3bqkqE3NiBQe/Z7k4/QPyWwE
 86K3vPxWV4fla9EMMh+I2CWMvqicos14Sw3dG2ubEg6ovOz1V5YpbSSxPHA23ArjwxnZy
 hT/KeTrwat65kvEZnEp+gNWXwmUgrIJMyPuFzjGJR6TKiqSHHAI7a15iCkeBOz9maOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4ThMTTS7Zx1Jmc47O9UYWq45vpyIadCGBPmkBJtXLMw=;
 b=YnjWZ78ZCvf4F+B7u/68TWvYfy9EgZBmo+NyBUnDsXGN6PEbqWcQKST7Jab1VkL7FjXi
 CZgUJtNvnamEZGilB3jHZsdMF59/9FMscn80+xBfpVv73slIF6PZzE2AjrnUO6Tdt2w5o
 l3XBdSn4M++eTH6d6NknepRUniQLF8CUAt5unsAIq7KrHULSvpwbRm0NbllrnH5maNyDg
 9T7SCtdppDF6D1N7YQlKXZ+Wsfq9T+I0nenGswCFig+Yn9NakAJHmt7IZhZB6KASZ4lKK
 aq2bHvsbJIpoiLmQ+uVMuoKDYKkCL3kKA/Mk6NmQG1EjlCxyBV4ob0SlSnygxzyE7EA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0A5760680
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A29491B31; Sat, 10 Oct 2026 12:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:36:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dadf9c38e3d4646f3bcc6fd965fde71b6dcc95d
X-Git-Newrev: 529df0b58030cebd7773d1bec4900af1716bb42d
X-Patchwork-Hint: ignore
Message-Id: <20261010123917.9A29491B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/writing-rules: align use of
 genimage partition types
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/529df0b58030cebd7773d1bec4900af1716bb42d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
