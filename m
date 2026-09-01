Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63CCC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A507381203;
	Fri,  4 Sep 2026 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RoQeKsBIj-Ee; Fri,  4 Sep 2026 16:22:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2550A811F7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538977;
	b=nPGn1J9tvbZV5760o33Q9u7o3OVchmVZjcg5HOXWO04+qihllt7ruFlhkx4WYPbAzSUr
	 fgP7iW0VY5u+w1iZBFqMbuZqcmaO++iRfobf36+e9lN8AJMD87bMCVYGNVTfv9U0C4PoD
	 T1Zmq7NZ36VqgQwdoHMZQl5yTxztxVdclKT4wWPOsKGcorp3stEjT4jT2hfwbr97lTzhU
	 kZeGy4DebpLxE6+EH8ryv24KqiDzSm4lGAp2ZuFsqFdeY3kKJdk4t+rhkE5t+svsRnjXx
	 DA/gSBuzREFdJeusMt3+/qCbrKO46Gt6+DvpV46aXnllH/K7bvkTE4mM7945dxOPOjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538977;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YtAJtVlnu5A7myPjNNdi7xb8Yqz83mclOxlYrD9YC3A=;
	b=bMGKhbjfiwZGpSBceWyf0QDZsND38Hrc/aQtu/116NwuDcla98RSDK9NNKeYTdWy9wR7
	 hLrAF6ETeGTHjggK1u5o+Zn2ROp0vluUzNgGuyyTAtBeC0sHb338EE4+4os8Zf7kTZTY/
	 QCtErx7iR+EYTJGuIteRSH384B8grGKwPhpe2x9fDJjqIXu77lw4efWOvdGEyFLthRrpC
	 cnYww01ZNrlJYnznoQgm7Nj1duRK3zz+w5sWOWYjPgVIIiLT+MiNM0yQF+0UY1uy4Asqz
	 g4fD2Fy+verO4LjXIi+r0aJEpke4D8ZzZfz5ZfTCjtdV8DkVVCUghM9ht9EhadXIUJA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538977;
	bh=YtAJtVlnu5A7myPjNNdi7xb8Yqz83mclOxlYrD9YC3A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g1Hbj4G5rwz5wdCwhKjjh4SdG9vCoD0G5n5TiTlkCUZFB7X5J+xaYnjqAp5C5GbGY
	 KMI3fZ3KDg9ESyGgkqgbuVYuwCZv/P6i4EFdMht4cW92Ahcks10/NV/DI/GpBGOb+k
	 KAm3How72tfEKlisxP4fDopCIBfh6qNP6uvbJdBGtOcSnV9ggVygiTG5AV++9G5Ovn
	 41NzKgcVj6SzY+Hx4HtQS/FDj1q4EFzndzB35KlIviZlaUW/IjUfAZqWrI4PY9s5lp
	 nUKqtJwT+hdwUxJVKoNv56D3MKA8mOu+ZeXy8RNyncfZ4OhDUoTL9smn45e53AHXUJ
	 MFQ75CIUDaL/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2550A811F7;
	Fri,  4 Sep 2026 16:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E4FB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC93440A60
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThEgUsvb-wgp for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 180A440B12
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=TCJxiiIQksqFHzVuqYxdILsSOtX02Mztrr/JIQ8smXtCWiD6BmvYZlp1N7GEPpIRA5xw
 PWuS0vEoP6AKa8iSsA4n+4dnYT+Gxc62E834N8Deyy/qlJZD70XR+0u2kiinE4BIJP5oa
 8cploAK/9NznwmsE+PGKf6zkqh4mFFe4I226NBOQcvsuaUNiVNSeXmULrrSTuXMNDzPaD
 ACjFyuCMnircIYo4DWCoOFK//3KY04R0mFDcmk+pAPe+KoZffS9enpF2S+TamIoxDK8Tg
 t7ghb59TDGXXgZOn+slelITvn8KToLBJbscWpV0/Dmzp8W+Bgco74J7ARlD9W9THDmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1iOq0VE1TFyjhRXAtYoKTbeN+7ZtUEXPsBQ0ez0mOwo=;
 b=WgQ0LVDCsurLSZ5TVPekFrA50dzO7Fdf9xLjWFmcdyius9/4NkBCC4krl+nai0PHxiDQ
 EfOANwZE/umczZHfKXmbt/Xd/gIAsAtVYrI5FrugP++eCBivBrDrF5o3zP69LHILXh/U6
 IKxETZyjhmd/CnDCGXwf993IZbghsKGWbhIscqT7h1IXNk5qR8Gba4jabwYcDrMINeG3L
 3LaTCCOmJU/2O7kx5EFAkQ0r0YOYlq180SOxPp8fL05OvdiaA28EG95G/cD5ywfC//VIT
 IuKhrMsu0BAzzd+rIWBNbNk+7VPQrmoH1bPIEs4nFB8qVKRHXOvmvUEvDmwF3R0OJlA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 180A440B12
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A67994C40; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 20:11:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dae674d98c951699bb12d9c2686fbdc2f4d036f
X-Git-Newrev: 6c3c5f8728ba9782fe11867723e0ec25b89c72f6
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.8A67994C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_*: bump to Linux 6.18.40
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c3c5f8728ba9782fe11867723e0ec25b89c72f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump the versal2 defconfig to Linux 6.18.40.

Run tested on a versal2 vek385 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/versal2_vek385_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index 76eb455043..13df1a9c84 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -6,14 +6,14 @@ BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
 BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
-BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches"
+BR2_GLOBAL_PATCH_DIR="board/xilinx/xilinx_v2026.1/patches board/xilinx/linux_6.18.40/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1)/xlnx_rebase_v6.18_LTS_2026.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40)/xlnx_rebase_v6.18_LTS_2026.1_update_merge_v6.18.40.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_XILINX_FPGAUTIL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
