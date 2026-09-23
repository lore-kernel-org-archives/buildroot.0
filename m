Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0B5C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B0481376;
	Thu, 24 Sep 2026 18:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hRy6T2jc9JJ; Thu, 24 Sep 2026 18:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B28C81370
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276327;
	b=iRmL0W/MuYVi2BAHbDf7SJ8OFat6jdG58uH1hdMt6kfJoOuU3J8eeo4yV1gmxNq6rMQD
	 4KsR+xnYkwlKl/GuhNCVLIsJW9Rjsgadiw8oLc1Dsn4yIIC0RxhXdPhSlr9GkrJ2SMRpg
	 q/58ojePU5mRrUwCy9MKPWrx+fj+K0H5O2irsVWKj13T1ZmzJzaS8WI+ea3i3Ks7ZPB3n
	 ij1qVxonosSYzqawQDJ6Tf8LPu41794COdPHe46nu2qU+bfqbeahWdMFKG576FX05UHCC
	 KvZX+MW8YjONnamqRsCiYQpncyXgOjm/stZst9tkADTDMJSvIyTR3deoIyMOt24jzEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276327;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UigijTKAORNChFHUo/wGH3bvmf9+cNVqKhOxFxoz1FU=;
	b=hYHThd0bC9+vSC/M8FMvV8KwnDBRoJOGlSuNDugoms/PWyGXCS19EEbkaiNzYHfPX8Uy
	 z/4j1miwVk3gs3lgbLR6gQ0kz9gZGhpPhiG+E7IysYOvubgH5wrYg8atZSyUYOAlg6Bbm
	 fq4YYSITjVl31Gq9nAvfaEHGPimhfqL+Uk4Dx4HsLfaI6zoK8N9g4lXWg27F0T8RVjgjS
	 kOozoMbIAzEksEGZa/Z0/3NIAnUqIoH65toOsEeClImYRDrQYq0ydQANQ4CjV3JdGqxBi
	 qstAd4VudfHf5/MQFCv32bqkaEDIz9hu4zZ87WlQmLdQFsxRldc6oFJNdGbKV/KpoMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276327;
	bh=UigijTKAORNChFHUo/wGH3bvmf9+cNVqKhOxFxoz1FU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iKHVNnYxXrjQYDQTYs4YWpmkaJ3fbcCTmIWSHsLaFXond6BU2Sd+FzP2wtxqYPvIq
	 L8cEhYHmlt26Uunzqdc5Tduq4G9IxYCJSoCNEjf7SMIJ4qDyQvFOK4wlykZBH0sW+Q
	 DCebpB5ipoYBUGdbMyZ8qN82nkPo+KLjG1Q4byHPWNcjjBFpQxvwvw4m2/t/LBO0xH
	 nAqPRLXg4DCYfso8W03qJllW3bYe1MDYTP4OaUV1CTsrxL1QqpnXIY1JEHnB6OZy5E
	 hNHyQWs2ATfH7KASXqQCyscEWEN7Ci0BA8aMrXAo3u6Mr+rchpqkDP8fzAtglVsgKF
	 OpeWsY5AxKzbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B28C81370;
	Thu, 24 Sep 2026 18:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0968332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2F3581235
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYXo1h5X_WD3 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 13D8381219
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=hRk7H9RWwE/pbfQ/hUIhBu+FAIaPANB+TqW/HK+MjXW1woJ6b08dpfDl9sxxZbp3NsNe
 M9Fq76SU0XHchIi2DdWHiO6YBvJn7xxcSvtvK+uNNE1XJUvcu2E0zS2SQCKxTkNwar0kn
 5dlb6VWbS3Glf9BliDb1XQxbm0khu1h3xXnYroUKF7/NVGyoc7A1OKdPhnbnJ2NUqmgiN
 g2l15Q/tP3d+3nCv1fsZ4Hz7gYrqLkEgWKg/3p4BcelDBOpSzx9XK7Ky7KaFBB/D5BL0U
 EY06hReiWUegBdDkBLSg3EYgJDA4Ldh5P8MTlwQ2rPybKtkOvIXnbN+tM2REmSgykhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lVGHhUKhjBNxNfDbr47GHPEl4d/AOVIiAHGeuplewgQ=;
 b=kEF2WZXl9M8AX3E8FxkgCG18rmtw3RPIPsdACu/lXS17Pi5cCC5NUmSpSwXHgmUF7SAN
 JDqQyc0pOKlQU91srQlWbcp3qZwUCiRHfZs70lnju5xo0pTtBEu2+atcdAnk7QPMCKSnT
 AnnJKwJvuRtFq2o6rJKa42tfSjgRyT8CSuegtHYgMFxMbSQcnyuYLacpo+QKI/TvNsSQW
 /NaMwEb+o0rztalfC8in574pcgYpwEC9GEItkGvoeWNwu0yW0zCnWxR9TTmDo+aNw9lTt
 3zKAY32D6FiCTMc5H4oL0egbg8fL9CIRk92hxtX8FtTM4gwuCAv48b/YwDJfvwkF25A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13D8381219
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB9AF8D5AB; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5b6bcde02f6977914bcaa935a9b23f2fc8d4dae7
X-Git-Newrev: 3716049995b1e80990d05aecdeb4039b868ade7a
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.AB9AF8D5AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ndctl: propagate
 !BR2_STATIC_LIBS dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7045205315570363803=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7045205315570363803==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3716049995b1e80990d05aecdeb4039b868ade7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

ndctl selects kmod and keyutils, both of which depend on
!BR2_STATIC_LIBS, but this dependency was not propagated into ndctl
when the package was introduced. This commit fixes this issue.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6dad789282b9f48d3dbe799c40648a5459dfdc17)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ndctl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 708871d693..79bae61ebb 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NDCTL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # kmod, keyutils
 	select BR2_PACKAGE_INIPARSER
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_KEYUTILS
@@ -19,9 +20,10 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 \
+		|| BR2_STATIC_LIBS

--===============7045205315570363803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7045205315570363803==--
