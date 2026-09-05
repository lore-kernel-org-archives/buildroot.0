Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B417C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C236060C;
	Sat,  5 Sep 2026 17:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhZoDNzpIoFj; Sat,  5 Sep 2026 17:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E1ED160D6B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628045;
	b=iWI3KJglT5DxSkVZ0O1iKzfXAIcwsI5S9HT3f1KtM/BJQvDkwBK39bzrPDTlRVJ3Efdu
	 vpVbXxjokHQWqyXvqF6g29ZA+KJC6uTNWi/IAv67GyoJ7dyKC0AVCKZ0bPHjNXMs+lR//
	 K+qZebHL1HeeBW/FxRe7OwbtswSzi6VRuHKnTjU4E9GyXwyiwna7RPNHikx2NuqLOX2Cn
	 YYhdp2w+sFgmVI6VLprIUL0fsgjI2woRYXk+e24fPn3yiH2bHjN+Vpxv+U1M+qMb9fRE9
	 JRCspUb34ZBADfH9uMpGyy875k4ILQ0fWsBYqXoXGbBblux8f3JtcWI3pzxUHnx+9vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LwWuVrjKKn2T5N52ghcAcg697hlJpu29NBjJ/+Z3jnk=;
	b=j3gQzki19mVpC3NYySMaJYdPhXFWqdOwPEQ+F1d3+n4EMQPfeFX1ECE/Sx9XVRsaxgeX
	 wyANSrKDfGd1yItehcy8B5ZUdQ/Yg4Evcrtk+tvfage6vb05P4SoJ3G7gRSs0OX6i6hlu
	 +mlO/yZ5JBSMpilvwXZK6wKD8U44v31Hqh/LzkUlxZ7Vms4CUAuUI94K0RWFRp2cymEo0
	 SQ9jXkNHlMcxlwY0u+LcPl/Fo8DejDCbgsMuJLXXxZ3Rg66TVhwsk6CWRIXuucAvzaT3E
	 zVz/21SbUjBKueouV3c4xz0GM62JVvfPKbJQ28iVVTlEO7CVLgiYPiBygPb6B8L5zXQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628045;
	bh=LwWuVrjKKn2T5N52ghcAcg697hlJpu29NBjJ/+Z3jnk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XyypY6pXZwqvETVmLU2N3R2zbJwzA42ccCIhTQW7EwqCbkpqsN4qM3XT1WnU/qN77
	 RrPLlsFVR7j2pS2Zjsv6BJWZde6Sm/f6di5RKGx/9k5XMObAfcdBESWPSqisL3aJ2F
	 ZtWIqwiLcrEFMetJ+SiD4ACYV1rSdSlMVVbXOUGDUk9qdCh6Wy6Yju3wxQYf0hjLg6
	 1A1zKXvuwhoFEb2p0FqajAIxI4J0P1dDhURtnPxZ7CL5TG6zs5X3oaTpEIXl4VTSbn
	 tZxawrgWAgjBbQ6NY9tp3MnHEXJT5KpgAqddNpnwLFRpxfSeRIpwcY7GpZQdo8dtK1
	 0MnHCOA//JuZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1ED160D6B;
	Sat,  5 Sep 2026 17:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B174D136A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CBD81097
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jpkcAhakpHQA for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2B60E810A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=N8IatvjAHk5O6fgFhJLam9mVHZbsMjs+4oJtWouuXxeFY/3qXvb+Car4GYlQ2UUqqYup
 FryUplam7avfWGYMIRf5BMjhhKWL7tW+ZIPp2dPtQVPy0PjFe5XsAeK9uA3et6Kcog8ud
 JfIrP8ItGQ0et74/EGTaEF7S0Aq7WFFdnUzqghBbYRO7h0R1jumFptZQ7QV97s5AggTti
 HB8+W65JfMwAvS4ixuAIFA372ulp3T0dfZCdSiPULYmj5HKG9XwhkUHpNSNU+RQW425KC
 d8Acge8qKkKrBuwZ1XLuhmF8EToBbaai4sJcRomXhrMoVfkKfWeJYzWYJWhWun9L1cQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sNHtkAD0n41lx8e5nmmyHxEw0surfDVR4cpVXDJMcM0=;
 b=kzel4RkDSNxDHq2x1My80DbU6aHK1r+33HlfO6vOmprVXCToTrl2Fu0N+CTQUuONvLbK
 NZl+xTzsKyavQLkbHTQJvShj28SDgp7fjulueyEJRMk8m+g05wSw1xEycmEQMKEtNE0yY
 2GP9gvYydmIFC8v8GIKxPo8eCAezCwa/QQZ9cCvXNJGSDEjAJOsOJp3RDwOyFzyDpiHNN
 rS+pu/K52WH0bvAFJhTUID+FIgH3w6Qyr3mquNGWyhPDHXYCd2JkHxIrBD9HEk87xW1ts
 kOoWYKCUTIOSUkZgdM6Jjd82xzRaxz7Y6iOiMTYaPdLXhtrMaXCApW68dcM63QnS6ng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B60E810A4
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21D9795261; Sat,  5 Sep 2026 17:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 173cfaf5a324bf7b46531084738e5d0b1e3044cd
X-Git-Newrev: ed4b68385d22b569779beedbfeb95288d09282eb
X-Patchwork-Hint: ignore
Message-Id: <20260905170604.21D9795261@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luafilesystem: bump to version
 1.9.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2511844981743036673=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2511844981743036673==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed4b68385d22b569779beedbfeb95288d09282eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

update homepage, Kepler Project is gone

diff LICENSE:
    -Copyright © 2003-2014 Kepler Project.
    +Copyright © 2003-2010 Kepler Project.
    +Copyright © 2010-2022 The LuaFileSystem authors.

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luafilesystem/Config.in          | 2 +-
 package/luafilesystem/luafilesystem.hash | 4 ++--
 package/luafilesystem/luafilesystem.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 7c130f8d3b..af0d20ba9c 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUAFILESYSTEM
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
 
-	  http://keplerproject.github.com/luafilesystem/
+	  https://lunarmodules.github.io/luafilesystem/
diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index cbe38294b0..1a0cc76809 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  576270a55752894254c2cba0d49d73595d37ec4ea8a75e557fdae7aff80e19cf  luafilesystem-1.8.0-1.src.rock
-sha256  beb2c9eed6466d572c3888028a77421206053a3c023429cbd69e5015badba842  luafilesystem/LICENSE
+sha256  3de68d619f6ad95a27f4728814375447d921305194b7050dee6199057c31282f  luafilesystem-1.9.0-1.src.rock
+sha256  79ede8f6cc1b3ef5bf6737af76262e796c64bf0f7253861c8103b0ce454b8f38  luafilesystem/LICENSE
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index b8b07176c6..be27fcd4e4 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.8.0-1
+LUAFILESYSTEM_VERSION = 1.9.0-1
 LUAFILESYSTEM_SUBDIR = luafilesystem
 LUAFILESYSTEM_LICENSE = MIT
 LUAFILESYSTEM_LICENSE_FILES = $(LUAFILESYSTEM_SUBDIR)/LICENSE

--===============2511844981743036673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2511844981743036673==--
