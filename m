Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0562CCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF5A260AD7;
	Fri, 16 Oct 2026 13:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJfuNPOpcCOn; Fri, 16 Oct 2026 13:09:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BEDCB60EA3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156171;
	b=cHvSw5LtXUYlJwtBe9UJSKMl+ZgQJoHl+tla0UFDUK7HJADyBlW2W2sz4bpBy5uuUJMG
	 X1wXgD77Fl192jOQ2yTaoKqmyM0Unbn4DdwnokquXkg702J1yo/TtWT0jZgpX5oAbCzaH
	 OXxlyXsOP77drd9zyEYVmam/vZOcuHGgFI04N4gKfbdfjZoii52WE0iDlPpUQG7V0gxAY
	 VZIbxAUlxbqmhds85mzwy0F26jbF8EWmYQer2iG8VcvoLbHLJ6IlJ5prNeSQLOAVvQZOA
	 LF6S/Kz7JslvH5C7zF9I5vQoX6hj5i1HyRWHkoRebsiQTZOKsDiCaxAGYcV9+/L3CcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156171;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9tK3CTkcBjTSQzyGJZ9+qwFKTduswbuKbVnBnQ+KEAc=;
	b=b089rJQxgaTsnc1wyh7Vis4BaiOck+MH2KqrSSDpQtoXVAsp3FzU2HzUFmEWSo9py/2O
	 AVNdQ1fbgWCxCSyXgc3R2zO7hlumQfaY9J/x/cutxogy1pnOUj1bQESGhvKKWKbkNY7XU
	 fYjXd1A2tJKmghbOz0cyadc2MOWMLudD3VwJ7nJrsaDh8WIfY3BcOhJlSuczM0UqJF1X/
	 lL9pQm9J+jku2CG4XhyzbBz6PjAIdVuwAPVozHN5on4Sj0zRF0LUKgn/B+i1Db1iQZ9V/
	 fUZek49+QUAvAMjtHjbiBNDjGCpryOhjs9R+nFMy0wVoYwWejJiWaqgQXIAX5ME4kpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156171;
	bh=9tK3CTkcBjTSQzyGJZ9+qwFKTduswbuKbVnBnQ+KEAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mYrgjYB7RzK52u2ubrqh8fiXTuKEsi13tEtg7QpWRM0psm8/pgyAnWNGtb6HZUEqK
	 WMp3bIEPP0RaTq0y6wdD+0XMOE+tPk6nASV5XRe4/hwvLjAIT0dGmiv1lQBMcVjt8K
	 peZcbPFasXYWkH1jI9TuEXdEnGTLrLdBh50TeYAwaclAvM0D3O19U0m452z+e8f2+S
	 1NglImhmVbQnI+guuMtyfjrqp9CQyXoc2tok6RAnCeAdGc0CfVou7aB41sQg7qnH+7
	 sBv269VLdS5JZmWTg0vkrpffJoOmhL4uiGZ3t47IwgAiNp2K6rDElHiAQkySp28nyT
	 ayM0j4q/EJ6jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEDCB60EA3;
	Fri, 16 Oct 2026 13:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF8A1EE3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C382814C8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec3SmsPo12oM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 830BF814D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=JGa/reWumulXgm6mjrW6j+Yg3SS9BpzaxdjVokpATlhEVWZBoddPUsE6+fgpZzbJUUbS
 ocm1o2DSuhldV+fuBKG2Qib0KNE6cLaRaBpI9W+FaXrnPOWwJCp74zT8Ru8U97Jxm6Q58
 hLHU/cDo6oVO60O1e/+qcKzUpoxCObRS505Ht9Qr0xSRc3isMp+H6NC+FJxuqq+I9rVj4
 oNeldXUVymSs68eHwHzFCLgkyfxlB6MmACGRW9fDFAw5xVhXLJHWt/7ys7xzrHp2e+8MZ
 52DqYjzfji//RwdAiAFz8Eeki9/XHH3VISAeJ5f8Yhk9+nxUMIqUhAyhiP5caYzCdpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+j6+0N+Lp/iMJMv6mJ79kZxIspzUp8pFsCz3s206d+w=;
 b=c+nhWgSKPGG8q4gUjDwT2IixDpPXG5f+nvdNh8PQfUgCXQE98nicp8cEv7j6BzipgsPr
 d6RSpPZUUBSaIrtQU9W54hsr7T3xQ1SwYh072boTr54eketlkd0HbGFbUiBAy/7SXZwBl
 CggdGE1xBgnbZXXHt4keA79m67OopUR7LU3DpJm9zLynb74YF9Fmoxl/VtfdU2GyXobn2
 YluD+fJbcg5dCYpFSBnL+CVnvkIzwYJtlZdAvI+zWjTmrDm9JUZ0VYB++GZM64w1kJ9v8
 XmfK7XKIqmC62eT4tnwcPsHvqR0PgzmegH37PAl/XJ/tqb07tJdMbO6lFqRJIIiy++w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 830BF814D4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74282960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf23e68a4c33840690bfb37a2484d52ead4756ba
X-Git-Newrev: 61e4e9fa6d3d11ab44d4f2955530e47a663bf71f
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.74282960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlitecpp: needs
 threads
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
Content-Type: multipart/mixed; boundary="===============1107455711397542949=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1107455711397542949==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/61e4e9fa6d3d11ab44d4f2955530e47a663bf71f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

SQLiteCpp has an unconditional dependency on threads.

fixes:
br-test-pkg/br-arm-full-nothread
https://gitlab.com/heinemml/buildroot/-/jobs/16865965420

The problem exists since the package was added in Buildroot.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce4fc125fb32510c1378cae250040ecb9c8fb25d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sqlitecpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 31de9a3904..614c46cb54 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============1107455711397542949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1107455711397542949==--
