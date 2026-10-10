Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C80CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487EF40949;
	Sat, 10 Oct 2026 16:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6FGgXget_br; Sat, 10 Oct 2026 16:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31BC5408AF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650690;
	b=pJpSOEv4uC3o/cAdxyKvxK2iXrcS8TJ+YaREpyDaDcVVSLTzb2zAM7xcC5XM0Yd5A2vP
	 QTYyaiS4zkHhLZ/GGMEFiLYQtAAgMU12UzLXAzaYuaUvbbviJLUK2vKUNDPSPXtX020mK
	 CSmKbvMpeEUyFLfpPlSQTFQ7D5+KAJfr886pbpVIlul9bklbDX09d9NvWKWst/mJH5KO+
	 ji2yZfZm6gxcarOTWDNKQCiQSoW96HRnSg9VKmCPxiO7u1WnINd9kOIUU8IF5OKbNkv3P
	 V9wn4486FmzLiLKh7xNoQ2bQT/joTOoBusnYoYFd3+ax4SvmmCN+BFHBfq75V8GZpKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vfhQGbg3XMiPZkzJzY0RjnSzsmMtP++E8RWAjCZOlsc=;
	b=BOZpmLK+P3mdTxGzXVaSP+G+JM5/N9QzlUB3H2vvmqy/migxlEKMY2yw2nQa4rru4Eyo
	 Y50zOlRC1DRj8SM6dACXrKoxKXrkbBfYUaCLiFBpLlOgdvoHozIC+/iDRdLe3jqLo5BEx
	 aYXoPy8y+Q8Qxoyg6nCgoMvIwFpBVztPSYfc16ZN8M+A2E7D1NqXNHrmm7P1b+3XQupMG
	 lU/5NFAosKX1bEPlbFcoJDL6wJTTxrhOhyM84HCTBVAB6giqWL9/1HEAWvkBzRycqe+hI
	 KKxORf/U0ooVWa76Xl8QSti9HDWpo4B2k8mR3gBID2Hp8ZhzBOWQf+lkPOVFwCSLOhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650690;
	bh=vfhQGbg3XMiPZkzJzY0RjnSzsmMtP++E8RWAjCZOlsc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a6p5SBacnXOAXURTm9nRcgUIN1EZgxyZ67wcFs32ZmcV4uUTHPnwpZw/TrdFOeUAr
	 sIWP7SJeLc+5GF5Bp8xUNYrVIdC7+Vw4EtAzgzUSXspwM16I8tJCJ9roQqPDGk4Sq/
	 wIIedGRyBiAtUvD6bHIxeDv0XoGUwXJnUi7NE6TJachwPTAI1pz9ZW30/2eYjDv5r6
	 bbP8iBzEo1Fqkw2qdAuT1rKhPaFar6iy9xaOBMjD0486svQBPTucizCBGl+jInx8z4
	 uKb57f9u1M0FJAz+Xzd6LKeIL5eOlZCCCV0ebb5yR9AqEy1PJDawh+EfxdtQF4eSJI
	 SSSGO0ClJW25A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BC5408AF;
	Sat, 10 Oct 2026 16:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFD0E9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA6C14005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItGTX6l0qAqV for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 07DF240004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650687;
 b=KoofwdkvUAPdBGEkdzgVKM36cvMu79b3f9bI3SKvHs6HCCjy2FeAxXUseaLimO2TNczI
 737wvl/mi6pe9ejIroO4B73fmVtKWk87TiXPNgTxVJ4TbO20ET4oTsD7B03/OBfQSs/Er
 PBF0AJTAsSONNrvDv0thuunmWar1ioOD1ses52Ol6b4clxCuNFc6+MpMQIkl7K/6ykpVD
 J08bO7QxwV8te3jWd2VRF7m+izJalmR6NmZRi810nlcBeMwIyvaECXV+38Opiq6vWLMVZ
 8lM2+RdYi4Fyefwm20cGwxwvXQ3b431ev5NLaO1uR2B0yLgaDNpCtLZtjv++FCqqjXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QjVKFo+63NpXnOcaEfJuzL096Iw/7pcL8QCh+ijTwG0=;
 b=iLRq16i5uxelMxA30ysGj8qFdgg97dNTgBPuJUC8NyLBMtaPBqlWEBPJnaOIGdUPpKpf
 nEbSo5ejRU5DeeGyneR9q35gcw76WIA5rnvsKwqZQ9X8S2sjEXjw3FB1h934xxACh+5iT
 2nsLsMG09JMhX5oTiWjEozMNIQ8AGCQbj7uED+RbjeQPX5a9BWaYyxkspVjVNrai4dNw/
 H9zlx7ilnbTTwYLUQu2WfdI0m5paW+aGDW3WEF2HwJN8hegPQQaUJlh8qemG2EnZkOUrJ
 eyNRF1OByGTJJ5SHLeYWr3ZSV3yVlz7kqRN11Ox0WN2y6/CXM1DSS2eAVqyBkZtT54A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07DF240004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABA7592399; Sat, 10 Oct 2026 16:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:44:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9054c08eb6e9c1a5f3247b91e9cbd73153a1c490
X-Git-Newrev: 8697b99a2ebe6f2f2c113b74c33f93eb9d849f21
X-Patchwork-Hint: ignore
Message-Id: <20261010164328.ABA7592399@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/post-image.sh: add custom
 hardware support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8697b99a2ebe6f2f2c113b74c33f93eb9d849f21
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

By switching to the LINUX_DTBS variable, the post-image.sh script can now
work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
the transition users will make when migrating from a zynqmp evaluation board
to a zynqmp custom platform.

To keep the example post-image script as simple as possible, it assumes that
the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
filename that u-boot will use for booting. Users are free to implement their
own post-image scripts for use cases with multiple DTBs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/zynqmp/post-image.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..67b0be65b7 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -2,13 +2,9 @@
 
 # By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
-# devicetree listed in the config.
-
-FIRST_DT=$(sed -nr \
-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               "${BR2_CONFIG}")
-
-[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
+# devicetree in the LINUX_DTBS list.
+LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
+ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
