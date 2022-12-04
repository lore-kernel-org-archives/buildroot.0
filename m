Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D50C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 17:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26223409B1;
	Sun,  4 Dec 2022 17:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26223409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVH2tj4oFI3A; Sun,  4 Dec 2022 17:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 132984089D;
	Sun,  4 Dec 2022 17:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132984089D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E20BC1BF2F5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB124013B
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB124013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spWZZCcp7Dgu for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D07A240124
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07A240124
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE98885517; Sun,  4 Dec 2022 17:29:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 18:29:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9fcf6ea43505918d28e12511c782b74eaba663a0
X-Git-Newrev: cd95a33511b9d9de6f6885ec75e6f39608238b9d
X-Patchwork-Hint: ignore
Message-Id: <20221204172932.BE98885517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-golang: use
 package go env for download step
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============3060021697260672340=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3060021697260672340==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd95a33511b9d9de6f6885ec75e6f39608238b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently package secific go env is used only during package build step.

Go vendering is done during the download step and it's sometimes required
to specify package secific go env also for this step.

For example, when importing custom go modules who are hosted on a private
host, it’s required to set GOPRIVATE to avoid public sum checking.

Of all the environment variables driving the behaviour of the go command
[0], there is none that obviously have an impact on the behaviour of
go-mod, unless they are explicitly listed as such [1], so it seems
pretty safe to include the generic environment variables for the
download step.

[0] https://pkg.go.dev/cmd/go#hdr-Environment_variables
[1] https://go.dev/ref/mod#environment-variables

Signed-off-by: Patrick Gerber <pge@ik.me>
[yann.morin.1998@free.fr: add [0] and [1] and corresponding blurb]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-golang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0b3dc3d32f..cdc67b32c0 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -87,7 +87,8 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct
+	GOPROXY=direct \
+	$$($(2)_GO_ENV)
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.

--===============3060021697260672340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3060021697260672340==--
