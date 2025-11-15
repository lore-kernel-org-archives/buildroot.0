Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492CBCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F3841531;
	Mon, 17 Nov 2025 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqxlnhCCEZZN; Mon, 17 Nov 2025 20:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3613414DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3613414DE;
	Mon, 17 Nov 2025 20:08:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1042E158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EEE561438
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2bWqs8XRp4U for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ED7D6143E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ED7D6143E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D3518405F; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:39:05 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: f44bc9776ea46c959a82d8161a1504cd18470955
X-Git-Newrev: 14929eed311c01f1b797f2916e804a6070448df9
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.8D3518405F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/pkg-generic.mk:
 Set <pkg>_CPE_ID_UPDATE to NA by default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14929eed311c01f1b797f2916e804a6070448df9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The commit [1] set the default value of '<pkg>_CPE_ID_UPDATE' to not use
a wildcard by default. But instead of setting the value to '-' it set it
to an empty value instead.

According to document [2] section 6.1.2.1.1 the 'Not Attributed' value
bind to an hyphen ('-') and the blank statement bind to the 'Any' ('*').

Because the CPE matching function was incorrect using a blank statement
worked to remove the false positives but this is not correct according
to the CPE documentation.

[1] 53a8616460 package/pkg-generic.mk: use more sensible default value for <pkg>_CPE_ID_UPDATE
[2] https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf

Fixes: 53a8616460e5730abe703ca5a46bae0039d548aa.
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8430ca7c28456fd94d855270c61d2511eec28c38)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cf55101265..0a1e29a04e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -727,6 +727,8 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  ifndef $(2)_CPE_ID_UPDATE
   ifdef $(3)_CPE_ID_UPDATE
    $(2)_CPE_ID_UPDATE = $$($(3)_CPE_ID_UPDATE)
+  else
+   $(2)_CPE_ID_UPDATE = -
   endif
  endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
