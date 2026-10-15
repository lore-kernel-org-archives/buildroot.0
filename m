Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CCCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD4A61373;
	Fri, 16 Oct 2026 13:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8tCfk2mxPCE; Fri, 16 Oct 2026 13:13:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1943661370
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156406;
	b=rzk24M5nsxdwQpAa9gc2NKn1kyeWLkWQJgkOLBOeFE7n2rGXmFx3ioUT9g24bP6BP2v7
	 N/yJe3uyp2cKOmrkCUK1oturfvusSuwtjmmaW21VvVOeLEAvYuEfmBkN3y3EILVAyNc0l
	 H5I9YvD3Xk8/uRjTRae3dDb3FcInwaLXMfDp+R6phzcgTd/OLl7+0meec7JWGsFFCQLh8
	 NGOx1inzJF9h22VFtrafrYl/HN+J3V0IXcrzuIxqyZngLLuK5wEqOMa3qIGlKaIrF0Fv9
	 MKD1n7OmEdgGJ3DSxo9QVey/JAjz9TvEyftm8UIwSW/KMd42+gd+Zo0wlSOMs5Sv37g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oqn8TA9ChBdJSL15wFLBTCRPSm60+eNYzxwT9fADRgk=;
	b=QG4DgHooHFhheF0+NiHCMHP3kGMoRYhngUsqkiKrJcxLTJBZt2Z4nhzaugYIlGaw69Hv
	 Mws5DiTr9tskVh2Zb9GPxdHu8XI3KXM6PNjLY0B39I6PQh1O9lMG7c+2dwPXj9rPvDNfC
	 11SRjRz8MnpHLuznC994iRvsUgF7Ep9Cr+1C0Md8aI4P1q1TBJ9HGeR4+J+msOnXBi63J
	 mAtqtN62kg7H6J0zRpNkJDVWqKhscY51Bd745vqLcwjnxFFuN4yr0OspBzpaCb+HPAcg2
	 g7itHFqMVvUdG+RKobp9ST+9pED3tBGESwmU3E3NQ9iGWKMAptjE4zRAhQ+srEC/feg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156406;
	bh=oqn8TA9ChBdJSL15wFLBTCRPSm60+eNYzxwT9fADRgk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=egysdmUj2vK+cA0pkBkZln3B0O5Wux7btcGgd9cVdJuBe9u6hVV2vxk6LB+oZUP9H
	 t36NePT+DhMGrq3R62guTdsYr3TfVxCKgbzXwLklgYW4SUD1+uatYoJWXtKt0Tqomv
	 0MLGPMVwDqSzkr2gXJL8SsKy8nAIhDsLHbR5Zd72IkWqUKTbFyyMAn10Y5XuYGUB/Q
	 2DCJsBHwc7CC+UxxpMtEunqO7joBOzifNJHq7ngsXMRXQXI11lOkIdLbYGATetqKId
	 Y9515w0/Npg0q9RneYmExTlSUTtruer2DhHXUoGTW2+/unxkxCN0khf3/joZeRPgtA
	 Gj8ArKgIx0vQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1943661370;
	Fri, 16 Oct 2026 13:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFECE105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0CFF60B3C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uv-_ayU0YisQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D8ED60F3A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=C4ggE9bMbQVtzqnmwkBUCi8EAMRkSZxAEI/clO8v1L/LeabulpdGzBS7ty7wFVHGcvov
 VsUCgrA6aVrIKka+c0s3iPtR/H/3iz5ZTvuXhuiv9rVnnhdxWJL4iKRI9BV19EQAo+v3+
 HH9cnZOO1WsvU7uSkRfwSmf4NpQNddN9SiFAclnj3ysGp/l77DfyP/Io/5pG5GMednQWL
 hdOQqbFYIGHMLrS3BzT/janQdwRq7TmNECXFKPZ5Cl3jfdKb7ZQnr2Kks6Xmy4IMV/JNn
 iE27sAuVLL3GhXXCcM+qZVbQ6xjYDEbkiMAqKl3AVEtCNsbGVv0KmJ7ExeG22tPQUqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Pl+NU5LLQAqi4RjtWqVzZZ5ynviuLo/OI4B/Snudt8w=;
 b=EnZhtJbWgy24xa7aYZRQfRb+kZibTqsmTKLAqgxfTkhCk0VI84olb4LF3RUm0UfP5YGu
 63cK9JIw2nK+gitrtPhlD/7SZQt8yoh7PT9LuUTScqyJz3Sx/tUAiNEbX3MnrpCBVQTmu
 ewWp5wZmh4k/zI2jwXCkhCRaGh8cXvME//Y9CUNII4hFYDHp/UVv8OBiP1nQrBM4mQnO4
 DOYNI8NtvoHmrELXpfJ+4/w6qwAOi2j23lwG8d5jD6nmLeQZ2OsI29gEMds/mJHAkxADh
 S8e02XqzSCc4CItYQKDknV2ZJ+G5/ip7HeLSMmtDE2It7dA4cTNQ5DL4LtkGz0bvydw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8ED60F3A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F17D6960D9; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:12:37 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 66eaacb941092a8a83fa9db34b79a994a1d5b8a9
X-Git-Newrev: ee301c0b16064269a09b1157cdd1f0607e26045d
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.F17D6960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gumbo-parser:
 switch to Git download
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
Content-Type: multipart/mixed; boundary="===============6303377947554562821=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6303377947554562821==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ee301c0b16064269a09b1157cdd1f0607e26045d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Codeberg has changed the way it generate hashes for at least some of
the generated tarballs (see [1]). Since we cannot update the hash
without changing the file name, we switch to Git download in order to
have a different file name.

[1]: https://codeberg.org/Codeberg/Community/issues/2861

Fixes:

  https://autobuild.buildroot.net/results/7e4e5d6f1ba4222306cd88944b39a75c730db771/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bde76bfe85f4c0ed7e838c08d001c27a27469d9a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gumbo-parser/gumbo-parser.hash | 2 +-
 package/gumbo-parser/gumbo-parser.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
index b8809d4db9..805cf01787 100644
--- a/package/gumbo-parser/gumbo-parser.hash
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  dbdc159dc8e5c6f3f254e50bce689dd9e439064ff06c165d5653410a5714ab66  0.13.2.tar.gz
+sha256  bc17a7505d57e386df60ffc37208abbec1dcd6fc494040b75c6e0342b0bc75eb  gumbo-parser-0.13.2-git4.tar.gz
 
 # Hash for license files:
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  doc/COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
index 6abd24415a..7e663fca8a 100644
--- a/package/gumbo-parser/gumbo-parser.mk
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 GUMBO_PARSER_VERSION = 0.13.2
-GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser/archive
-GUMBO_PARSER_SOURCE = $(GUMBO_PARSER_VERSION).tar.gz
+GUMBO_PARSER_SITE = https://codeberg.org/gumbo-parser/gumbo-parser.git
+GUMBO_PARSER_SITE_METHOD = git
 GUMBO_PARSER_LICENSE = Apache-2.0
 GUMBO_PARSER_LICENSE_FILES = doc/COPYING
 GUMBO_PARSER_INSTALL_STAGING = YES

--===============6303377947554562821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6303377947554562821==--
