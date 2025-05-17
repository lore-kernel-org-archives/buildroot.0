Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8616EC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C82C84850;
	Mon, 19 May 2025 11:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG7S5TeDvru1; Mon, 19 May 2025 11:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF88084851
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF88084851;
	Mon, 19 May 2025 11:02:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15509D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41E4141D7D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UDfNSjEmH8Z for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE5540F4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE5540F4E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC51F82A2E; Mon, 19 May 2025 10:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:33:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1026abbcf9b3ea18c39b7641f393264d0108f5ac
X-Git-Newrev: 4cca0f30f2b263acf97c6d0abd8d31e2417542e2
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.DC51F82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-autotools.mk:
 LIBTOOL_PATCH_HOOK: also handle libtool 2.5.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cca0f30f2b263acf97c6d0abd8d31e2417542e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
https://autobuild.buildroot.org/results/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006/

Libtool 2.5.x has been released and is starting to be used by upstreams when
generating release tarballs (E.G. openvpn-2.6.14).

https://lists.gnu.org/archive/html/autotools-announce/2024-09/msg00000.html

It needs to be patched similar to earlier versions, and the existing v2.4.4
patch luckily still applies, so extend LIBTOOL_PATCH_HOOK to also patch
2.5.x versions with that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Bernd Kuhls <bernd@kuhls.net>
[fixes build of openvpn-2.6.14]
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 8ffb0e0047..16b21acb6d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -74,6 +74,8 @@ define LIBTOOL_PATCH_HOOK
 			else \
 				patch -i support/libtool/buildroot-libtool-v2.4.patch $${i}; \
 			fi \
+		elif test $${ltmain_version} = "2.5"; then\
+			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
 		fi \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
