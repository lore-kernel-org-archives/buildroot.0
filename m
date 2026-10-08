Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4F9CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 969CD4094C;
	Sat, 10 Oct 2026 09:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMO4zR_ZBwBY; Sat, 10 Oct 2026 09:22:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC80E40958
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624125;
	b=JxfvyJviHneSsQPx3f7gOVjWpsUeY7Em4e7q5aflqFJ+r38HBG4mJk/Gscl4jXMlo/YC
	 1nBC9Y6okVnB1n2aNVoPR0jKZO659qag1a2xJ+181biS7V39TG3SsUIbPDkS1ymcClek9
	 LbZWttoW6Y3FUgcBpBLXaOHyEmSwp0QkLO22iBip5NpqTxt4aOKGZQ66HIzdKhSiXjzBk
	 NGQ+ZRKATSX3R6MGfHqbsNS+IQ3hZGzmzIaBEfD1jgnI/ArWaC8kAv2poZ2rh0tqP2mxK
	 qaEiYLqWz3qCz+szO47rPp12hJRHy71ozLJ2X+l4+dds7YqUy3Z9kxZa0/iqubxAPuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=urlsmx9TwZ6nj7gSxkARXsw9FUvQYZqxAttX65XRzho=;
	b=QwyKMk40XPajQb6llbKPG8PfVSH2fYYXy2cJpdHDJwE4ZCQulEoSOyIlrXf6vtUtUfFn
	 0YRYBCJcFlw942RZPOmL4W6hyJG5q4mAFCR3f1JIglojHB6a1Zx9NrS7xTC6CGiP6+B9m
	 l0J2w2GsdA1I21jjFuqz33GrL0wmjg8gJfntn6RUxsgwt/pjtlMYhAedMb79FMKPaxcvv
	 EkX3AYBJiXO7KoQRrJe7JusHMKQHZt3O6q5gDaBcp/aQ+KHPYO415SYLkKN4kyAmK2ggg
	 yx3ENV0oYDo843HdmLDE2134HwULsi5M/1p8yWM7MnLGBQlNi+kp/qJ7OCP8uWfiUvA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624125;
	bh=urlsmx9TwZ6nj7gSxkARXsw9FUvQYZqxAttX65XRzho=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qEaSiIY9OtgX4Cjb7PJtbrMD+D4E1r9i+a3pNLxobfw1R14nORgMtLTWZdij3YwtZ
	 3w5Q4392VppTjoPGUdhxy2tA4h8rYf8APJyrA0FRiOHckmZSz8PSzNBGCxqmU4+w3G
	 qchkRJrfMcvOIhicY0JI1DvDpqfmCjRRUobPM6TwjmwzZ7Ghn06OLv++A38h4MYIbY
	 bFpPgiiKFFMcsCixT2HThXzjn9Ld+W6qb69JflnKZrTxImaFSC22qUAPrbtWYFBmaS
	 qskEPGJWKmSdBIElagky45sJcxAE3lAwgp1WR8l7EXuw1h/2g5juLznV9Noc/DBkdi
	 o2JxOi6zah3Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC80E40958;
	Sat, 10 Oct 2026 09:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBC5DE2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 513EB60727
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DDRkzy6vOeN for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 355F5607B2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=lwnreUGXs5GnnQ1Xp5k5xxGCdeZ6GaSOUgaid9A4yvv+GulG8nZGkCOj3EtC5rZXNJjy
 sKRm8O/FxUfgTzo2DX8Z3fDjSYuRrRcoA41SURGwO+7UO9vRJKUHRoSw4gtmuvf4tomvX
 1GF5BuOtsZ1QzQ2wyxpCpVJH+qX5iERndNi2FVRdT+4HGt0vOZq242B/eQeZn7oSBX+at
 H3a5tH6VdbH9XuXP0vXjSxNfkBep/ydcJoP/XQcn4fJBo1OfMWT0K1hRNJkTjlrUToElG
 oqtS5sRB9dhbeG5g4qQJgeuSEro9I4Y+dEK5fK/NsVvkC5h7tf3Ru1nN3kTaEOvNpOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kyo0L1Ah64Q5rnOBu3+mitFKAZQUDVhCXCWsfHeX18c=;
 b=ZZGRPhv3qA7ITu3htONA7RtR+1ZWi/aij1bzkbYm4TtXmp5s0vxvNQLyf2QzmigFoHzP
 Xars+jEQg7RPSjv8HQ0j0jKEv90s6q3N1OcEWikWnoHZqB6X4wujtoAdmYxbKhr1imzU7
 IXMsDOzeqZAHhBAMo8KL+PmQtPVaZkhcjdr5VU43xMaZAOtBVWVJTij+AB7l5TzkkPzrh
 ZvCtAaTI9HqwfcHxTkaF5ff5deqhCFvVHt7LNmvOZyjDenwLFOIPs1RGwqrsu0xZs4InZ
 wNMZvTVmtgR/2csqXB3jeqf5SYYrL2FlED761YWJylhexG4ezKATE8+Y8soJ050AHog==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 355F5607B2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F42B8F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:07:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 385c25f4b0badc277b6f2fe8a2ea108098a49360
X-Git-Newrev: f25fc6742f64368c8f03fa1a8ef7b3105c959d9a
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.1F42B8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-twisted:
 security bump version to 26.4.0
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
Content-Type: multipart/mixed; boundary="===============3276720314757400308=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3276720314757400308==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f25fc6742f64368c8f03fa1a8ef7b3105c959d9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/twisted/twisted/blob/twisted-26.4.0/NEWS.rst

Fixes CVE-2026-42304.

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/ac504cc8088734e0bcb8c9b372d52534bf9252e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e325baa39cc45b350ce142e1e209a134a1d62355)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index f3cf53bcaa..beb1c7f3b5 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
-sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
+md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
+sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
+sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8db5d3750c..09198d2afc 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 25.5.0
+PYTHON_TWISTED_VERSION = 26.4.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE

--===============3276720314757400308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3276720314757400308==--
