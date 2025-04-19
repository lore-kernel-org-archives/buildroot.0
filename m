Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68D9C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C32706C7;
	Mon, 19 May 2025 10:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOpfq9CsQ_DC; Mon, 19 May 2025 10:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8D0706D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8D0706D8;
	Mon, 19 May 2025 10:52:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 120D4D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B58341C12
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFRsvC1Sfdxo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4D940D71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E4D940D71
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C8ED84BBD; Mon, 19 May 2025 10:39:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 17:01:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0994fd66d9bfa18e3ab3b8fc634ae084621e1ba
X-Git-Newrev: 9d6ab1244a3d8b9c4934caf9cf7810086de7c82f
X-Patchwork-Hint: ignore
Message-Id: <20250519103952.4C8ED84BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsigrokdecode: needs
 python3 w/ zlib support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d6ab1244a3d8b9c4934caf9cf7810086de7c82f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some protocol decoders in libsigrokdecode need the zlib module:

    srd: ModuleNotFoundError: Failed to load decoder usb_power_delivery: import by name failed: No module named 'zlib'
    srd: Traceback (most recent call last):
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/__init__.py", line 24, in <module>
        from .pd import *
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/pd.py", line 24, in <module>
        import zlib   # for crc32
        ^^^^^^^^^^^
    ModuleNotFoundError: No module named 'zlib'

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigrokdecode/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index b58c8a2a29..463cb25f28 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB  # runtime
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
