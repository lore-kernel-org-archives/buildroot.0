Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0869CCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B58E940CE7;
	Tue,  4 Nov 2025 21:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6RVGtzmNXJg; Tue,  4 Nov 2025 21:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA04640C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA04640C9A;
	Tue,  4 Nov 2025 21:46:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E40CC222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B6283376
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjIb-BTQx9AB for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 21:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D6183380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D6183380
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 21:46:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C5E83CCF; Tue,  4 Nov 2025 21:46:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Nov 2025 22:33:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35f376d88e302cdf6acb0c11a70011760135a7fd
X-Git-Newrev: 8430ca7c28456fd94d855270c61d2511eec28c38
X-Patchwork-Hint: ignore
Message-Id: <20251104214608.21C5E83CCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: Set
 <pkg>_CPE_ID_UPDATE to NA by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=8430ca7c28456fd94d855270c61d2511eec28c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
