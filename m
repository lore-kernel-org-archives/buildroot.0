Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC2DCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6FB06121C;
	Fri, 16 Oct 2026 13:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id eO7GEl-1h8KI; Fri, 16 Oct 2026 13:12:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E98076120A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156336;
	b=G1hMyX3CP5jaukQK5QuvHTrTR4TxI+QEospihx8RITI708eroUeetzMoGiBmSHUcrh4V
	 v/LZ/YSZKzbUKe1UCoPynH4Xg7xt5+XA0AE4C9Lh75V5V/1F9l+0yTrKhTDpahNYPsjYd
	 vwP00Z4SFqrH42Wica+q3C3+bvOjK3z3ALgloJ/mrftOcT6Qrcw7/ex9v9E+jdtCpOOxT
	 XEuVJDvvUe5UknAYZxHmvjWF+6qY3z/SHiF4g0U5WbNKmM2k5Bx1ZBvW9mRLIW1Hw7WRO
	 EfU28Y011pQccCXxWCYBHPIRZsIW9oaxC1WRLx8YTqyZ5LF2ZXD5JFvlVSsjjDcpBaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=atRUB8GN+MdW0ln2IC9daAKQt3CgN4mBK90a04EHC0M=;
	b=b2HNLdyqvysziyooIyBdF5/fPMM2EywLUi7fRC6+EFOJWJxQNudvt85woyO/C8a6QA9j
	 iQZ2KRDTGlZlew8EMfevy76HplGqQf3thz5ysT9fPfbMnfkfVadW8GzHVwQR447P262oG
	 Ydipn865NhyUOwnF5RZZYa4YfrlJLpyPAt1r4l0y6F8N3SMdZdy6pmm95C24FfxvGGnnG
	 0CFI1XPM7AgGkEH/Xkbj1J7dUnSKo0Gnabn7zIFA2y5sUAhVrP5SdlWO2H70ZljuK77RM
	 9jbVt6bmnZfOF4DCICyOaPEMgAxhVdVD8stcj5LVKxPQOxfWivDmd8PLNTX1j63gPmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156336;
	bh=atRUB8GN+MdW0ln2IC9daAKQt3CgN4mBK90a04EHC0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JvGekuYHM26ZuHh+3K9SrdIV4deiJJIrMugF6jKcvaVrUOoqwe+MJdcrNJcjIA2Sc
	 RHrTbkMi7/e5VmXrTB3GjQ2gIMkUbvNpvvHup97boYIUVoa30d9NnHDywEs2aicO3A
	 b21YeaUAQnWcWSTk49VY6NxviTKpGrRKeWPJxLvMS40KZzxnnh0QqB351Oz+au8T/c
	 x2UDqhBm3vZKjyu32OesQtxFNTKM70/7uM9Pd8RnufmEyZgobuoANajJmV5EQckeaT
	 /LNQSE51FKqM7rCFuhpRWBLOHZat9WpEiwn2pR2vHyi8igzyxFmwiLZrvo/7mqUhdq
	 i1fDi5L/0Qx9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E98076120A;
	Fri, 16 Oct 2026 13:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 380FA105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A25B60E9F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1dPutm2ciUH for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 163E160F1A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=YfeG8Hom6ut+s8tBjmeclRgVtCUNJ00mXnMMwNpU13A1J/PMRMLPoBw3636caYTKXjAB
 a2A/zCU4P1OppnqZqBKBBsYZZgik4p/D/YFrGiui5w4SAcKvYvHg7DuO4wxjBusy+E2zn
 7vBo2sZfAskImrPDpI6c9optFkNwAQq9rqpxvAzsCbgEfKmjm35K1fQuThZMzB4Q2NyKU
 g+SESEmqdCHvc00GPvxPGsyZhNzCmo4u5N45BGf7S541l/68V3Z7/UQg2U+axTJEbn2lB
 VCl3ovPgT/khGu3CmX1SHtGa+SK51nFIMMBdQkvWZMEvN7zGdvK07jt5WOXyFAxs2Eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3gmap4kTMvrMtbWznivwMEactUn8XbJCWzT/X1KWu4E=;
 b=SBhUlBzcIW7WOTMGMEgmSOEzbnp5HzxApMAukgUXr1Y9aA1XCb++UiIQsqdEEeVnNdyB
 ukF5atUEMtZ5ZmXDtRavIdX5rRiGDUZs91Bhu31x+uq6ChO6FxEi+TbV4a8vJiY0tlO0s
 uOfzKMI7BT/EbSDHwuHEw901b8Oq28ivT71VD1TOel7kYt7Er6N2TWzDt189AX0xmQqom
 +DRB/7K3VPbE6a+0TPSbgihPmlEKxhkLr/J3IAtS1ZYfo/LUWTvC/A24HZSvrbPyvBJ3B
 SEJjcWI9ZnzszRWcgsEzQScpTjRwfYrBEs1vWv+vxoICXpqwHWU71c+d5JYB8c2txlg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 163E160F1A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06FDB960DD; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:20:52 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6f10f8173711820b16145a5cc8d0e5029799a4fb
X-Git-Newrev: 737f6f0222f8b8920dd51b5d2719373bc360ae58
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.06FDB960DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openssh: security
 bump version to 10.6p1
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
Content-Type: multipart/mixed; boundary="===============6800339501741910967=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6800339501741910967==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/737f6f0222f8b8920dd51b5d2719373bc360ae58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

- bump version to 10.6p1 (for details see [1])

[1] https://www.openssh.org/txt/release-10.6

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f51bf05d245a73d61d9a419f44de40de8c1d7424)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index aa84d011f8..a53ae817a4 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.5
-sha256  d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11  openssh-10.5p1.tar.gz
+# From https://www.openssh.com/txt/release-10.6 (base64 encoded)
+sha256  a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44c5d6ee767d5f39  openssh-10.6p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f2e1f235c0..6808db9962 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.5
+OPENSSH_VERSION_MAJOR = 10.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)

--===============6800339501741910967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6800339501741910967==--
