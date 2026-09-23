Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B9C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1321F40F6E;
	Thu, 24 Sep 2026 18:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUuzM3lXFCP8; Thu, 24 Sep 2026 18:58:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D5E8140B88
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276305;
	b=q00kuWZ8PC8epbfhfaZbxOAJXqVFNgt98GR9twe14yvxzVFc+f5tJGCD+PMkvZoH9hOd
	 SPZ62bKlllKKUP62C/D8ME4Q4f22vAdnEq6HcV10ZVjmuMNV5hkZCuqdbmPlVoPRv3mM5
	 f2yGccal3dhjKC/B20eRdGQ8JHAEnOwgxaAzpnUetwRInrrmozgq2Nl4btFAD/qpeh2q/
	 n7YBJzThryhj+Npgue8KrwpwnK7kZF37RMK6v4Y3fbRnyWCg1quVollf7kf/BsXl3eXXz
	 zYnGEe25yxqGFoPS8w4uQdHI6La+d3y9DsWOJZd+ElOLBfcK6BxdtljNxasG97ImKhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276305;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rXpjpEdycWmrL5vdSwwaF4+RL+Z6Vi+eKOfT7E3bBxc=;
	b=n5LcQRfEwKv5kFzXcmgl684aRURhTrZamVIZVUZ45RzmuW1enNoSTWQOIfj7mbVZJiuC
	 GmRCcrqB15xQ5SRAHCPgErgg7y458DR6S9R9IMSE01rq+srR2CiPaG+WM7GU2nXjEisLO
	 w078BPgIVc6Iv1rBfOTJxXda6jmgMY5NSVOzSNaSt06h5I0VHQ2eelHZ80R8025kpJ/KQ
	 OXJ/G+YcO7akrLJbN3Y4qQ8BgLQHD4r1fHQ4OLc0gvnEHEEKz/iFBYjDzDgo/eF/yfkoh
	 6R8soYHPHkcdoYKwtrThWmwXWl1eUYqcK9mrMk+A9x9dUS9Pu4DoAeuFLNbeUE0CrVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276304;
	bh=rXpjpEdycWmrL5vdSwwaF4+RL+Z6Vi+eKOfT7E3bBxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lwwPBXFaRYAxdLxYWshTA1NcVUx1lrgYiZr9GXZ5EM6eAlutShS9T3z9td0dgFIAC
	 p45NTkMabZrtIW1alw3iuirUBngkfnQbb1W63Vq7P+2qlcsGboQxKP/KPnmyotkPvf
	 BkDL1tyWKrI299QZ8C/1pWOA5QrBy9wqCt5h47U0DwySP/5lRyN55tHAQ5PTonxDGo
	 7zOuQhfmDlWfLhCf901u0dgQ7uBgQwakJXBpwzqMDaCy/Qy85G9OSV1glrHfHUBN8H
	 g41HLjY9N5ZNTQUdC5kpp77d4g9V6ngpP0idxSd15RSnmBZAift0YELJeGL7CSsZ2A
	 dbHQwMJbCvfLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E8140B88;
	Thu, 24 Sep 2026 18:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2B1332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF1581218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEI9qLrj2k9e for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3CDC981219
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=nja/3eJ19LdE5n71INVs8afg4l01p75JZOJwJnCYobOdm9+bfpaUSVfKUpTHttLusmjd
 gpeV0M9UcsbLEnDoXJBwI6eC/Yb2hmTG29DP2417YHWqpbICWGWgjAimOqUzq3eEd+bbr
 Ut7lxjFcYF4Aki/IinQoswd6/S6EV2PvNMToQDZ+a5VuMzipOXqhC6rWx+AjElsDGB9vs
 syfdhPsvtJJre0Csd8YlATS+sspvXu/C/qUXs7glQeUOWab2N1lHjki6IMviwRwNF6rft
 tQPgMxhGbrDGO4XQGMlS8dgkrwogGm8Q+n8St3TYv/dCh8LBwrztQ4E0drkRbYCqMvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yNNYxGURGeVTS5fMMMkcJ4Mh5+ZN++MNWoVI7kC0A9E=;
 b=UFBvH5J1PRNvTkpEApIRHBtszgOWNo+nOG6bt/qfbEt3JYcOt+y1SWQ2UE8Ut9D6YCS9
 wyQ5KaDR7uGvBV2sx/hXG6zeCg77YsFYXodadFBAMHYGexqMxNQ4DbZHuk3uAX0nBSypT
 jqzAbBVQHzquwQIkw3cS5HZ0nfcGLjn2ZYw6aWMxL2klVB/Cxi5zpG4FWtzJ5i4a/0LLl
 UV24vYo/7UO1Dpu5jaRX4+7jHG4mJSKNnaOt1OoOmOFutBGucM3Oz81XB+Qh5XU4TR2wP
 /IkJuZrg1I8LpeS2CKJmgRYZFlbs7miTYv04n3odQ6MXLnvOZmFus5Pa9CFN2JqSh4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CDC981219
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C895F98383; Thu, 24 Sep 2026 18:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 16:54:18 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 0597fd1ac1ed817e6da77dba11a55e2075c9f925
X-Git-Newrev: f8c4315d4cd5e3e58b959728b278d61715744da2
X-Patchwork-Hint: ignore
Message-Id: <20260924185539.C895F98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/x11r7/xlib_libXfont2: security bump to version 2.0.9
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
Content-Type: multipart/mixed; boundary="===============0474636239354043080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0474636239354043080==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8c4315d4cd5e3e58b959728b278d61715744da2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes the following vulnerabilities:

- CVE-2026-59679: Font Server Client encoding Out-Of-Bounds Read/Write
- CVE-2026-44950: Font Server Client Cumulative Glyph Data Heap Buffer
  Overflow

For more details, see the advisory:
https://lists.x.org/archives/xorg-announce/2026-August/003734.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 21f18cd0124f994c736c034d79218a2c77735b31)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 86e972a0e8..d5813b3e24 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
-sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
-sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-August/003735.html
+sha256  f042a370666815e7b941e9b7019024755bd1c6c2954afbfa515af378251799e2  libXfont2-2.0.9.tar.xz
+sha512  ccd6d6abf6aa814a940d137813dba638f8259c3672abf00808d82df033c1026ae29d40c9068da4f112637338ad0d0fc15818a4afa9369a626c8f17e466b4fa72  libXfont2-2.0.9.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index a881a4c55b..e8db0004f8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.8
+XLIB_LIBXFONT2_VERSION = 2.0.9
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT

--===============0474636239354043080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0474636239354043080==--
