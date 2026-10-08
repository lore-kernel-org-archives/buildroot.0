Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9772CCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A80C6060A;
	Sat, 10 Oct 2026 09:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGMeYTqisxyw; Sat, 10 Oct 2026 09:27:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EEDFD60AE5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624450;
	b=iHN19yaWu6B36o9tOorqwvXH8hL7EuWu7oNkZR6f13fYYt8c6cLQ2SajT91zbS0oLCy8
	 b/jnsy5jkFKaVOfKpMSL184XKQPVr2h2Ispbsd/Q5odGuie3bTmVrZ0YS9wNfZvoz1l/L
	 FLpkHXfSkFDvRJ4xZ8uDb2kUu+eTqasDyXvj4P5i/otx+N5C1fPGMxkWpJjZvApUYRFsv
	 XS2e8e7pLN3X8RImHTYOjqjWF+0fgYQK8+3lYGPEH+Owm6d8YVtnTALjupB3NeK0U3D0+
	 AYLX/I582/wl+gx0kW2GVZinCSYXSotc2wIZkq3QTMXsg1LOKSAWhMRa7WvAVMNIZIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=bJhPfLTRDsnvvA2oaoQ4lS2UclBCQPL1bBnNj0trGLs=;
	b=NnRvb/EdklnowW9+cLl2FpIUAJta8eLcvD7a8K4XgIOlUTtkuYvbggk4jin/8ED8m+m9
	 IHkiFQvLjT1uK3W2Yxc1cCpe1GmdRg+HT5wixX8dn7G8VzK1ORAAObvHt9Gw2eJhuGilR
	 9b1OR+p1IoNlWXIN+Ux4MxTJFDSZfGVWsR8nLQN/SsrkXdS6WnwBRRPixh67QKqBKaVAa
	 oUlIXSbqoW7CcxqWp9Bbm++9PwMZwQUgvj0vrj+jSSxoYEYd8BkUZi+eUCnZjph/+VWkM
	 NIwmlsPs2gNXuw8VXelQY2lglX1M7ITegdRP8vNG76vePK0JiVcuHydobd/Zu/GsFyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624450;
	bh=bJhPfLTRDsnvvA2oaoQ4lS2UclBCQPL1bBnNj0trGLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MBc3pEInQtmcbJmP6jFha1sgH4hO9wXbjQuoVGRC5ylVqB9NbqrJXwGGg1Fx7+xgx
	 +DVrgylixcenMwJ9VcGv+CITGcr92BWtp3c/EDDfTHko7xhqLl1ZCUG+bnlAqRvwrj
	 BVmmJYGLNjjrAKKbvPMzPzJUGArlOafNbRLvlEYWywYUOF/B9t89S/ANU7pygc8HGg
	 6Z8b8wTnnKXqCxoVEOREK1GkanNj+vyTht91Rx+hIO0NqIPWrLbNxdprzmxtuHl5TA
	 MY9MfKz6qDZrZzh6hek3bsfG4aMU/tFK4+ccL7JNBTd9sThZkdHba1Wlu93BdfhzDy
	 A7CiohpzTRQog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDFD60AE5;
	Sat, 10 Oct 2026 09:27:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AA6B9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E442404C8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdncqyE_XPPx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C0894094B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=aIKtLepg/KlvhtZYoIuHjSP+m8Ufppt9FIXJhK3L8+yrdPS29yAckYF3Txn5A/OBLAh5
 /JX4JmJo2qewiJpDZF/74flIE6HYTHzNYAJUl76UNfkfhHcyOZTU9o10V4IGrPatiatn9
 OmDDo/M1DQCBvwarrMJcUJBStlVd8ewsZij1U+REFvVqmmqLihfq/LdlzAXEnuImdwuhn
 oQQP49s1EVDgwxc1LGn94ezzDSfnAZKDxp2aupjsuJUHksdHj+CaHyJlpKSjyxLbfXO5g
 88FHXLdo2tj7eWBIb9xM+hCch00JHNdlRP9dLxiQXb3ZaedY4jSQUqXFyjsZNb+7TcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=t39qEPNEHaYiBUPxjwP3mwMonqQMH1nwRnpOZQMOcbU=;
 b=IFppwoaO9cCilj6gYQW6A02bSLvsW/jV30U48v3R+Tr64rLaMfAQag4ee3xlVhox1sf6
 B6BDZFbJ/cdhLWTINLYNj4WOVtYxsQsWVqDO05IOr1td+A3OCF1UDUFxGB4CqMESmB+EU
 rb2FTrOh90RMYv4uyti+36DGTvgofzEjPU7WMs1yVCd/tWQ7sQPr2VhgQa75QZ+3h7mic
 N+nveBsHNhmQTLy19cvo4PjOpkCBuG2j//Kz6ykYWd6B9fLhcUANcIHT9UJMf3RDOTEpc
 GxnWgn8J8nRC6+RQqwz4I6Ali+0YvVTAVNrnbChwEc26J/GhDiTDKpKzfNvuZqdv2PA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0894094B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB3458F1BF; Sat, 10 Oct 2026 09:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:27:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c93df95e26e24731b3ae5ae917626d9619361462
X-Git-Newrev: b658ef139f96368f678ad4f3f85fcdfc1ea33051
X-Patchwork-Hint: ignore
Message-Id: <20261010092602.EB3458F1BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl:
 remove patch 0002
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
Content-Type: multipart/mixed; boundary="===============3057819135366532469=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3057819135366532469==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b658ef139f96368f678ad4f3f85fcdfc1ea33051
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Patch was committed upstream in a slightly different version
https://github.com/openssl/openssl/commit/098404128383ded87ba390dd74ecd9e2ffa6f530
and was first released in version 3.0 which was added to buildroot with
commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5.

Added Upstream: tag to patch 0001.

Renumbered patch 0003 and updated Upstream: tag.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7dab0537a0c414a5282f1918550f06a2dbfcdd2b)
[raphael: resolve conflicts and renumber patch 0004 to 0003]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                                |  2 --
 ...roducible-build-do-not-leak-compiler-path.patch |  2 ++
 ...se-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 37 ----------------------
 ...s.patch => 0002-Revert-Fix-static-builds.patch} |  3 +-
 ...stall-process-to-avoid-multiple-make-dep.patch} |  0
 5 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 441db0f32c..55359458ca 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -607,8 +607,6 @@ package/libnids/0001-libpcap-use-pkg-config.patch lib_patch.Upstream
 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch lib_patch.Upstream
 package/libodb-mysql/0001-fix-syntax-issue-while-checking-ldflags.patch lib_patch.Upstream
 package/libodb-mysql/0002-mariadb-FTBFS-fix.patch lib_patch.Upstream
-package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch lib_patch.Upstream
-package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch lib_patch.Upstream
 package/liboping/0001-fix-utf8-support.patch lib_patch.Upstream
 package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch lib_patch.Upstream
 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch lib_patch.Upstream
diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
index d283d8b329..7474822709 100644
--- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
+++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Reproducible build: do not leak compiler path
 
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 
+Upstream: https://github.com/openssl/openssl/pull/5218 (rejected)
+
 [Rebased on openssl-1.1.1.a]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
deleted file mode 100644
index 8adf7e51b0..0000000000
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b57cc2e4ee21babacbffc243626de72c248068ea Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 5 May 2019 18:30:55 +0200
-Subject: [PATCH] Configure: use ELFv2 ABI on some ppc64 big endian systems
-
-If _CALL_ELF is defined to be 2, it's an ELFv2 system.
-Conditionally switch to the v2 perlasm scheme.
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8883)
-[vfazio: fixup for 1.1.1d]
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
-[rebased on openssl-1.1.1i]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- Configure | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Configure b/Configure
-index 1b020faadb..4614b5becf 100755
---- a/Configure
-+++ b/Configure
-@@ -1691,6 +1691,10 @@ unless ($disabled{asm}) {
-     }
- }
- 
-+if ($target eq "linux-ppc64" && !$disabled{asm}) {
-+       $target{perlasm_scheme} = "linux64v2" if ($predefined_C{_CALL_ELF} == 2);
-+}
-+
- # Check for makedepend capabilities.
- if (!$disabled{makedepend}) {
-     # If the attribute makedep_scheme is defined, then we assume that the
--- 
-2.25.0
-
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0002-Revert-Fix-static-builds.patch
similarity index 97%
rename from package/libopenssl/0003-Revert-Fix-static-builds.patch
rename to package/libopenssl/0002-Revert-Fix-static-builds.patch
index 970626a725..18030d81fa 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0002-Revert-Fix-static-builds.patch
@@ -5,7 +5,8 @@ Subject: [PATCH] Revert "Fix -static builds"
 
 This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
 
-Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
+Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-3791009156
+(rejected)
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Dario: make the patch to be applied with fuzz factor 0]
diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0003-Serialize-install-process-to-avoid-multiple-make-dep.patch
similarity index 100%
rename from package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
rename to package/libopenssl/0003-Serialize-install-process-to-avoid-multiple-make-dep.patch

--===============3057819135366532469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3057819135366532469==--
