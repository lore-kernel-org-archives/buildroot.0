Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE336CCF2C2
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED508610B8;
	Fri, 16 Oct 2026 13:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjuralWMgMsx; Fri, 16 Oct 2026 13:11:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1C6861164
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156299;
	b=sDAJLOVuKUh+T2z4kfPPjGGv5T4hVaD9xG60pAKjzh2m9OcGfULSD9g/Ew5oTYqqlZ0W
	 lGzpkBeSVLLDxxGaHDRa/8jFjMN2HvnOL1dlWO2s46qyOSNtk5xL8wrvzg7+cK/0GRv0y
	 QuQEemECva+WGdljY40QW1MXY/UBQlKmtsxYlCjl+d6Rdb10GsEQOqjH6TBcJ8aQWBBXl
	 0lUYPKSo6IWeF2tPy9wgJHbL1IRSRr4SRHpfNrQkJG0YJgQVc9tkvm6af6qoyk3M6Zsx1
	 qkWfOWsCb+o1qCZ9yH0UPgDNA6roJZuBDkLnlijdCI37o9MGgLV3Dh0VpeT/JvCRdDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OUnM9BCvGnJre3FgMKbYt0b/KWS1o+sm98KgCQQCXQY=;
	b=QskdsQpNJD6PmNOeThGaIWin2742+1mXhpIsxIfPzXE9Y9v8sI4RB5WPNPbu3iBRpclO
	 I3qMMF2bWN44KoQwcrIYXPcphg9RU78InrfmziZHBgdBKc3bbuxxNbOnpLVsGzAlnRzTR
	 9a4Cd3gzMEZTtoa1EVWX7mbIaBUbAKMtGduEMyyki1I2u4SITlyn7iNlgf9E3qGb2te03
	 0wncnMcYBJ9wnCmcrTNkNo7BQYnfxQi+j4tkK0ULMzy6GvK50nFj0XuPoY3MrtRVHKLUC
	 9QDzBaCkekH5nJ66KnnshXRuw5KSMIh8ATn2LAQh+8VrdfWWDa3+dgqNEXgU/3GTs0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156299;
	bh=OUnM9BCvGnJre3FgMKbYt0b/KWS1o+sm98KgCQQCXQY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D6MJ1WqbxX8I9RO77LXGKKiguQ0x2+UwXbrSBA8KsaaDsrB3n1YjF1ft1x3wxpuoY
	 hLnPscsiiJQ4JjjDgsEXP49OTqVKlZdMUtaTztg0SrUQ5w2XeUGhcHppbaPcFV1T0K
	 +WN2AxbbO+WDAkO3tLOsngtnx9CRGfRpkLJTuE3G3JBJvlUdEX/PCGt5Kl77xs58zj
	 fuq7nJEBxwLV5Iu66tOvmzB1gOaNTjnAmEOM1h/YDhSiiv0s3YTvBZRBkRNHeTDAMb
	 MyyyImWqTQyH43DE9G+ftBnKa9znPmI82uxGcbYmv0niIHwqyW9pRvGI5iley5lPuh
	 6j+3etCr500iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C6861164;
	Fri, 16 Oct 2026 13:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 206F2105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060664016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO9wQCsjE-_C for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 50EEF4016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=UrAtYjG/G4CHc3kKSMO5tYJbS5q96lra8I7hXEkBehAJ8S0FfsfcSdt9TPYGcoYp82Xp
 6N8KxfSvAN5RMv/b6dhmQD52bpdrQKBIJMoQGkMU5b2YDLEbY+dR4sO83MfNh1H4zWU5+
 mBQWYnLohMQCKbjtrZy+uGzUTwmjrtF9pPTxVkdZrDIyOX4A/2mhKseB5sfvoE3zNPsmN
 L5Hlq070iZw3m6xF9oj0c7vh+wFjmQu3sK3AayyNZHxpf6l+veQUDNwTHiA1vl7SMP3mR
 ug1gGNQzGDGP3wmYY/ju4mqxKOArVT3W+ICaYsxLB4vKZKQAIdvOPrj/vewbtlQ5Big==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q4eqeoCXsCyJ6nF4IY3cK74rj6nqbio1tEwF+YJWQp0=;
 b=Y8zs/LW2HNRz5nv00QNqj2BWdcz+kIWaCzVFrstQYTT+wZeXwQDjP3u4end6wZAGK6yT
 eadH6VZT91Isujf+w295W15jeyaXIrD7VVSVd/cWkptxsi+R6Gg+VreInlH67kyfml4tJ
 BwZFTVk3y5/SaqdNUit6pr9rj9NIENU95in/Nl4Nq/Yke7SrXCNMvQctxkfVwOj60RU9w
 bg0NQRuMMU/lZqKsxGynBxMvNIbdy7jj0HgOIRRMowh57VriPGLeFWk/0N6LfKT4YBgZD
 VBEsy/ciiGKvZAs7sE/Jcjj+Jf02JJR994vytOwJgu10k891ila/alTZxjON3LSTW+Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50EEF4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40E5895BD2; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:52 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 500860e2f0cd5363ed8473f8ff17f8a829e5093d
X-Git-Newrev: 941072daedb73650ae2c59069c8efc79291951af
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.40E5895BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/nnn: add
 BR2_TOOLCHAIN_HAS_THREADS dependency
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
Content-Type: multipart/mixed; boundary="===============1496255656164481656=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1496255656164481656==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/941072daedb73650ae2c59069c8efc79291951af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

nnn links against pthread. Specify the dependency to avoid
unexpected build failures on toolchains lacking thread support (e.g.
br-arm-full-nothread).

Fixes:

  https://autobuild.buildroot.net/results/5cd2b7a288a1681068448de6715e731580908206/

Fixes: 7856e41685a179fdda7b21a10455e52fe5fa5cb0 ("package/nnn: new package")
Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b8cd6665bdb6d8f67b71b859a0d78e3a2584875)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nnn/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nnn/Config.in b/package/nnn/Config.in
index 64cfa8e0a5..555ab864d9 100644
--- a/package/nnn/Config.in
+++ b/package/nnn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NNN
 	bool "nnn"
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Building nnn without widechar/UTF support is theoretically
 	# possible, but in practice it leads to unstable builds.
 	# That’s why the WCHAR dependency is here.
@@ -15,6 +16,6 @@ config BR2_PACKAGE_NNN
 
 	  https://github.com/jarun/nnn
 
-comment "nnn needs a toolchain with wchar"
+comment "nnn needs a toolchain with wchar, threads"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

--===============1496255656164481656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1496255656164481656==--
