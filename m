Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401C6CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0202980F65;
	Mon, 19 Oct 2026 08:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBoDDSKTpJw2; Mon, 19 Oct 2026 08:45:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13EFF80EC7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399547;
	b=ilervI9niygsgibfPlT6OXb7gVX44BUZW/OAEXvJRn2zktlk3OdFU7nLgPBss168A+nX
	 AtgfKJlIsGTvPF1s55BTWget8TtbvcIU7khP9FgyQ61MmjSCzxI6lJ/fS2TMHX/xdg8gT
	 jI6CDiXfuASTaVlQ3g55walkxlh6pMcDoVU/aBK/U7x9O4erL8LY3P5kJL4wimNtuoknb
	 vGNZCQaBSKhAj5vnqwNY1a+dNetjGeOiwOKoDwz7FnhuKakS5l2us2eTDVAk40DzlkKMj
	 y366kVUMi1SzzRsehWf2ToGZ3lBUfXV1IbkArvMzDpJyLUy5TcrUVi2e4TqXntmkYiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399547;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yXJF69VQgOUJUylDtcD8o9miaBhsA59OwTUibrTe4cE=;
	b=kTu8t+5YAbjcSFWCBZ6VqLAmqjrbtGnx9pb6WhVgb0Yi0RaO0vknf8W/ZJzsFUOjoqoK
	 Lssff2ZWuyR8Me9LR8vKJMoZZLZc0Mqk62JotZrSgs2NQ7Jr5fnEaF2whn2xnryfEZaPl
	 nHzr5sujNzKfZkaYE9WG8yLXMbzHSTmNl/b3HBL+6UoADb54Tezchr0fDzFrymtSO30aL
	 gIyXIjrKt4MOhPkzhtvLEZW66Lco3Ovhc4Uvg49hIjzpchDLXgWJFo8DYrGyA5ZKLX34X
	 o8BfRDj0pkPiP6TdGu/QnGQ2HkTpjwVt7Sju49hWGTevgrmFvuGK2EtKQTJfHEQ+aWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399547;
	bh=yXJF69VQgOUJUylDtcD8o9miaBhsA59OwTUibrTe4cE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VJmbGobsw4TiMAhxta0YcQI6RLa6Ih2odcKnPsI+kqRuPq0cAwVWGyqG2ildFsLHg
	 YNwZnIvIemuPStidCJr2FO45R+KYoRSTc+ESlzfHCpHknu51fnIhL8ANlVo5OczqZM
	 2K5cF9q3knxABSVqFh33l1T431dSOxrL8SZNQpZFFJ+/E7gw8obafDKH/MBt+cIxIr
	 SPZMgVyM2rTKsaoDoqqGS6O7w59jPryYTZaKNGtl6Ymij4IGJq9X1cJZ8PvIn5uz7Y
	 ZY8Y0Z4v5aNi5OZLK/jSI0lD/Xh81ck9+BkLCTI75VZzfLPkqrRJnWlqnlD7dYkbFd
	 i7t9Dfg3Vd3yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13EFF80EC7;
	Mon, 19 Oct 2026 08:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E3BB465
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BE446072D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahPalsP1Zidd for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:45:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7AA9E6069B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399544;
 b=TIpXM6QsEOriLHgAR5R4rWniGrPXWes8731f7Hr/cHv5UNqoeOquHln3Av/dJo5WvGEA
 644jqB/WulZTWUKMGQMoU1BpdzdFCWSTPE4toRIQ6c5MwWwGoykdkMR3cZ9SpxuwMg2Yz
 ehMkI9o2cAN4wpFQvHY924o1kJzAXhy+xtlnVtyxEueaTu0F2LgzsD+/ajulBKD/zohjr
 1v/9BSSbxTagqnEMnnfCo7twEs1smsuj67wo/0zXNr44+w0OJSSQRlhEztNjiuLho+5im
 kfWoIbPODAjJe0MVaW9+IAj1KdvMbRfJK9LMO9n1jla6tsHEbEoB/ZUWTAQIXSz5G0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399544;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5J9V9KbztHZnHXnEcqaleMLdvC54Q79lnaIIgFNir80=;
 b=XrbVkqf8m/sSCUewBrKiLwXfIIf7y/9bu3etzEz7QktIvHRqOGRuIqwmtdubgiPjjZot
 QO4uOtgsYYUR4Z57TVu0AdYBSElAlb2lEZ4ATh0vWgGru7vCZ9rkdSdDs/3smBKRuHCee
 45syGm/uUhUgkKQMDtlAmCv8xXArJlxIt3O5rbrQXx5rvsZX3IKiODtqIm8WCEKvpNOA5
 lvTsjYJrz7x+JzMayY7tt+aBudznJJ0k9GAJT7N5vmr7B0NO1k7l0s/AH8gLwNLiRFUm7
 jwuY8zPSOIl0K+tRKSeByjZWRTLY2I8HyfiVI0ddeJyv0UgFbLUiBGxA9TOKSruNCqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AA9E6069B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:45:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0205984B4; Mon, 19 Oct 2026 08:44:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:45:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d58f66c106e1f814383ed3d868f86510c4b10bf3
X-Git-Newrev: 05dc49017ccdf1be2519460c736432b2a426c968
X-Patchwork-Hint: ignore
Message-Id: <20261019084421.E0205984B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: enable uClibc support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05dc49017ccdf1be2519460c736432b2a426c968
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

uClibc support was disabled in commit:
fb72418160417e9e872f626c356f898bff49cf48.
This problem is solved in 1.0.59. So in internal
Buildroot toolchains and external Bootlin toolchains.

Tested with aarch64 and external uClibc Bootlin toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 724f91123b..d3fe0dbec1 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -15,11 +15,11 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	# erlang needs host-erlang
 	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
 
-comment "erlang needs a glibc or musl toolchain w/ dynamic library, threads, wchar"
+comment "erlang needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_TOOLCHAIN_USES_UCLIBC
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
@@ -27,7 +27,6 @@ config BR2_PACKAGE_ERLANG
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
