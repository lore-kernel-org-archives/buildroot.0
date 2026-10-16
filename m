Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9714ECCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB4061042;
	Fri, 16 Oct 2026 13:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNDtY2_ZbGsW; Fri, 16 Oct 2026 13:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 22EEF61037
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156254;
	b=Pn6XzW252jd17Ja9BCUMyG57GQEQP5mI/vBtGIfwpkQgmVDpQMHiOQLWeri+FN4PUjFP
	 bxQ9YfiNGT8b4n7+fWrsjKwlyx+HiY5Rq/JmTefPrgMQkkCGEK//+Pr4HEant5wnLsWGC
	 L57vuWFI0gzp4dsjm4SnQqSPizUMJKFu96n/Hc941XRHyv7OD17K0E3ufHv3LpOgASehD
	 /SGPH8cLbvPoEME6KnxvZPuSlwLrhTmVeINzt/4/vDe6YqVzIayBmiM0GTrE0uk2/rgWo
	 Pvd7Tf/Wi58h03lnzV59yv4fGNFhoG5OGMLDQXHVJ7KyhP/G1GnWErlhMybyfkwy5Gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156254;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/408HZEePkg1Q0CJh2LI6exOqGcQJPjudJ+l5kvU9Hk=;
	b=jTP8Z5xSYfleYPNebhnI4Dmpot4Ehwqvq+pAsFMI+Sgha8CymUJ8ljwBcCzYFiCWvM00
	 RjLQ74v9dzko2kzOp6OP511Y7qAxgV4b4ubXlVRGGvVBN9vKOQ9IRfkdvFyGtiUMqxV6Y
	 9kv4Y2JzCVrrB5ZYt/v+hbc4QxmxYOmfqa9MnLtNbdeK0nEMHGms4qhNkzJ3DLewlSty5
	 l3s9+2JDGHNLGY1q6DO9W2Uelir5Dz9Gl8tLO/PKCNQOvCy/9PWmAm4TLlMDYxMaYZOrM
	 IfXKsKNY0300QtFoHAg84PXbGF7DgkC2fBQ8TZ8sRdj/0h2BROGJbjA4LXj6cmLSwxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156254;
	bh=/408HZEePkg1Q0CJh2LI6exOqGcQJPjudJ+l5kvU9Hk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RuyTJXwfnra2lj6iLNGtrbiQXotvCw5jQ3SXE6nxA7xH2qn6cOmWtADE9ovbgv8gG
	 XEo0LddtwpTlp1gXpiErnyeBB+Y3SxpfaJcIBWabzXmDxD2qG5TkvJrbdgJ5lKnbOH
	 e7LsiN3s+vcKmv8wKKv4QYwVqbigfszl6htGTK+0jdJcW8Ff3qxkqdJZ/kzcgxSpXi
	 j48EU+k6XmueXFqC2GeUIO13teBKjYlRQFR14WDw4UNb+noaX4rS3JTeMyuJ2XvTrp
	 +1Rf1Mw6eid0fMOP34ByxkZvG0jPuUVYFoBnOYclwNwFBF44yiSYCTjrG5h0ag3qFA
	 5VfHOAjCwPNpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EEF61037;
	Fri, 16 Oct 2026 13:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 451251F6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43187814A0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtIcDBAurKjs for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 461B3814C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=EVN5GhHHuOXcmDiGFtuTjjbTbJLFMEEGlHzH+52S/aN3j2f0lyW19zyDn3nHyuzksgN2
 ln7Ontt5/Ca3M1pd+rRMzN9jjSHpmyPIyj4rtCpFcyIWXsTYSTPkji3ylcWlxkUC6AtOA
 4GHaLw6hXv/uh99LgbqcsKCXvxBB6aoA662vNFZSaCVCse02SVePSLoBnMIIs2v560dTO
 t2xExxpgWDCLYBldgs9qn9CmxKAqGL34+Bfp3W9dijQvzY/dJZQ9z90odOTl3u+ngh4FY
 NDwo2xtuRmSesTQBlPFmoeqNzM6alTN0reylhbPj86+xEVSIDvRTP/RpgeMCBRPUmBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=z/F8FqNfeiy9S0yh4uJSN+7gcTw0UPQEsdDGj+91n/4=;
 b=A1qlxxCyPMHOgZVyTnNDBFgGwDQLq1Ghs4Ng/XCQTK6IO6pt6/z6xOl+puonzvMzbT8Y
 G06u6MiuPmNehMB/CIdp3rmxJyJMv521QCaA1GPrrz9i1RWlRd1mwVdZ1DA6er8eD/etz
 cJgzYplrybFa4ZtreeoSIwobvJc8R7Wm65znzrYT1OJ44PvMg7k7+dRUmTnj+NA/4znYh
 GugMCe2q5Rcu4j+VAF/wHGFeYmFsSnR6nRfSxbmuTOdRYXgU6pPACH/tmFUJ62oUbyktT
 pyvRoENJoX0diGEHCLUTUwZhVpV70gmNdBnc14zoMtnMvOlzH4Rn0z90h/+wXl8Rn2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 461B3814C8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 374A1960D8; Fri, 16 Oct 2026 13:07:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4817c8adf2129b1f4c499c53a1612f610160c8ab
X-Git-Newrev: a0fb500aef58981f72d1c2291c837d32ca49a8c8
X-Patchwork-Hint: ignore
Message-Id: <20261016130708.374A1960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk: also
 disable internal ccache in the build step
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
Content-Type: multipart/mixed; boundary="===============6074455492501021289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6074455492501021289==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0fb500aef58981f72d1c2291c837d32ca49a8c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

WK_USE_CCACHE=NO is only passed to the configure step
(WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 9f0aacb6346083db480478c59711507263455aed)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ee9e707cb5..192a340d0a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell webkitgtk not to mess with it.
 WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
 
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \

--===============6074455492501021289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6074455492501021289==--
