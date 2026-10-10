Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F282813F1;
	Sat, 10 Oct 2026 07:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7x4StxQvj0z; Sat, 10 Oct 2026 07:21:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 925E88140A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616867;
	b=Nq1gYBCxxb89IuY4yQguXF005SE8W97kdHP4Ea5RRl5clQ+Mazd3yvJ9THM80kjTZ8lH
	 5Jx1h6Uhh9IuyVELhjCDHZE4nenxo2/rC+YzSEwDQOjfuc9Z3XYZbLLrPgR9UT/6769NG
	 kWZHfGzsXphTd+3lplBWA186mV+LibTyC55UA7K4qExmscde1TJXUupsSwnNBuR0q4+bb
	 MfibtD1qQ3JPvNx5KKe3IRfOCWS8YmNtd/2yYYrbeOPly+wr02IfmzqA8SNX33CY+r8Kg
	 LeB+cOsvPjh7hEtdRwAEH3NJLhA6XAlD7sxseq4oNpfKBR4EIDa/XxhllEAIhe/GXtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rmYaSEGJcZP4LsvWcA0YhgjUhroMwCFT7ogtKN/+E00=;
	b=JxUX6l8BlYDh/CIarzN5mA30v4eEdg9UryTgqEPuQXFEz2tGOMQJQHKlAS45WLRvuwKn
	 MJ8tjqBbbJxK/Twag1NmXjPsx1tF1I2lMf5svmNXXqH+rRw4YNP2LuhHl5rXTmoGGcFz2
	 G3jvY5s//lXpRV3K1RYDrsRYv1lJ5bGSEEGT+jFypOl07+1uOHL6JCR+st7h4pJ+1FJK4
	 lYB9Cb8z1O2yWLxQGfqcCJj7oxnA1kCdygBLnFApqiY8ntAvNARoyUlQ/qkuHxIw5SQed
	 VvEVsgJpwwudZJTVjvxaH5xJticGXeEXvIgwub7N3v2/f0ZSHNrDw3Z9SkkyGLt7EWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616867;
	bh=rmYaSEGJcZP4LsvWcA0YhgjUhroMwCFT7ogtKN/+E00=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N++39IZ5G0LMLkbCwzrw1z1F4dM0IbaIRNdDu2kjh3lNNYnTPqsi7DPu/9IszUMVe
	 sj+VkvsGgWWqpDHW3BpQRIRUZ8HK0uF6Lzyvt+65ESFi4qihL8EbIxQllTAUil+0i8
	 2VEtLRRcjQm7//w2gds35hswcWC9PNlcmt1rJXETJzWlJ6FSVk+s2+cblL6onB5N+Q
	 nNqmV+SlLDhfxjIH6A2aDEgNUtHXC7Fqb+7ASYZ645oPN5JJaqMdBggUtKr+vsPtN5
	 tNb8qrjq4uwTinhfkFkoxIx1CtbTjQJFlYAGtopxx4zwfqpQECr3xH8XLM2GAzSD6K
	 Qy8NDNPQPPdAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925E88140A;
	Sat, 10 Oct 2026 07:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4863380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D63D9400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M6CZLcHIT8F for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 284DB40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616866;
 b=GTGf4FMaTYSiUXw/BuAG/MeDCzo7L7QYzXrv7xXUgw40GNnlyIP1P158iAWXy181hH+a
 FxA96MuEEqItq4j/zpaU7lKRBdhtRGCY3nNDh/h0+WlHKVN8Wios5Vl7Vg4dmy1/v01nN
 lyaN7qz4l0XIF3obA8cnyWpx5iWvfA9GtLmAN6wPWJxL5gNqrdCj9VxVvcG4AL7OmnWUb
 Q2P8ePMDwlqm/Tolvpgl45Iitw7eaRA7OnY6+NzH392jSJua51h9iIthmcI/2VPZWZwPH
 TtaT3N+0QyoWnc1NM1pzzzdDlQKINxTx3XDURXPVMpTlGhwQtD8n3vuXS2aWjm7RIkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616866;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ulxXuJhBd7Mk/P9bNs0xLXAQHR1na4xOVrYnkbCa0dA=;
 b=L1W00cLTP4NFvGZqipS7hUB+aphRtFgjM5CA7tdJeqSIZgJYVfSfTOOMscElLHTVjd3K
 4+oobldeZTw20P1N/6lPiPyE/fpPQS2NDfE9CuV+y90rljAodWoKdEiuavyYufIbGUJEq
 HvUArc/fZJsa7ZtBMPizHmAgzgg1SAXXG8FnJM7NJLT5t4CfiNd7tbGavdniNP7jSUbql
 cWKwTZUkueX4moD6VBhU09u6ONKTary0evMyLnLuHzant++fAYuUONmf9ptqK56mJsm45
 pFFr+w0YgY8z2N/GfvV8KesxpyyXGJR0T6V6goUR/kvZffMn/2GbRhtLm+GIMVBXb4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 284DB40068
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:21:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08E808E693; Sat, 10 Oct 2026 07:19:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 09:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 823ca6bb0d7348fbf7e224c1021d31edb5632ca7
X-Git-Newrev: a9c6725d16fe35dba0ea7a15bdd7c0c4a83d700d
X-Patchwork-Hint: ignore
Message-Id: <20261010071948.08E808E693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add rtl8761cu
 firmware
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9c6725d16fe35dba0ea7a15bdd7c0c4a83d700d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- add rtl8761cu firmware deploy to BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
  option (e.g. for Asus USB-BT540)

- while at it add missing rtl8761b and rtl8761bu entries at the option
  help text

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 3 ++-
 package/linux-firmware/linux-firmware.mk | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7533b3d899..833c07b615 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -137,7 +137,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
 	bool "Realtek 87xx Bluetooth"
 	help
-	  Realtek 8723a/8723b/8723bs/8723d/8723ds/8761a
+	  Realtek 8723a/8723b/8723bs/8723d/8723ds/8761a/rtl8761b/
+	  rtl8761bu/8761cu.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT
 	bool "Realtek 88xx Bluetooth"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 17fb565cb9..50c84082ea 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -97,7 +97,8 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723bs_config.bin rtl_bt/rtl8723bs_fw.bin \
 	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
 	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
-	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
+	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin \
+	rtl_bt/rtl8761cu_fw.bin rtl_bt/rtl8761cu_config.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSES/LICENCE.rtlwifi_firmware.txt
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
