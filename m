Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD64C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31C00840EE;
	Fri,  2 May 2025 11:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgQa9990do3E; Fri,  2 May 2025 11:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EDA840F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63EDA840F5;
	Fri,  2 May 2025 11:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 166E722A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9D141E62
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feHwnQ-8smbL for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7886F41A36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7886F41A36
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 726F9863AE; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 55e5e028743ec5b7407643f98f11d78781b98df1
X-Git-Newrev: aa058cb59cd086ab4e208d4662e595ac0c00bc43
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.726F9863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsigrokdecode:
 needs python3 w/ zlib support
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa058cb59cd086ab4e208d4662e595ac0c00bc43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 9d6ab1244a3d8b9c4934caf9cf7810086de7c82f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
