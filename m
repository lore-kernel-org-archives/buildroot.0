Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34474CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E65DD816F7;
	Sat,  3 Oct 2026 13:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyma3DM8qfpw; Sat,  3 Oct 2026 13:57:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EBB46816DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035869;
	b=S3qTbyazkQvabAUzFEiM4hpH04LMMlfpYiCae65lgI/qyG2w7A51uANwQ7g8qZyMCHm+
	 4cotE/UsRmBqBg3W7aWF+mM8ApUpJb5tp+SoDw0h5TAfPagcZ1Tfdr9IUqyJBDB+RGTJ9
	 2VBU2IpLuzEF6uP+qzuQn9ymuIRmcT76Rm1Bkuqp0Mou3ySVxqBbHkY6ihHlRgCMykGp2
	 AZq1xtYsD8nTRFiNTX4CO+KOh1ZJZswpB14mqKV0POG5Pxhq1GiJlmw61XZkmimLgUivZ
	 X7cOUz53FGACTzaNPLAw5XIT75nTHwmvUx6F1DxBIfNArBPL6CAQhowFkmJ4ErcRqcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035869;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eC3pv9S/OCwJBqRbWuCD+J9uFi1IFh4P6pSqoKoczBc=;
	b=O5fN+bj+b45Jt2xw9FPiilx+zz8D8IfQN5uaj64iEaUnQD0FLfwhp81+VCoM/KcjYSN3
	 xtRDP8KSd8hQNyo8NrVweKPOUhTd0Nq274BN0nD0NenPuPyAjcm5fEcHR9SvRYE/YK0pc
	 ZZM/bT0ZzpguJrL8XbZnaDXVL4MSpHgAaO4SBo6eyiUKyG3H69Ibploc2lBGXmhbJj6zR
	 7n9l2PDiFmA5lt66/vVs9RGhaeXEq7LdY5+HRotU2LLIwjyNfIwEdixWGfTi3uK7orij6
	 XmAt9vEvROPx+43KyP4V7FfI7vYiVjisO8PC24salCoxpDclvixaucXxR8QWlo7zjtw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035869;
	bh=eC3pv9S/OCwJBqRbWuCD+J9uFi1IFh4P6pSqoKoczBc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FrOzzzpw9McejavoozBD1dvhkRQqeKcgSXpIOwCihRDIEmhuXL8IW9B+uEAaWJZ7V
	 E7UItio72LtYVlxYSj9kNBU2QNOjBI2I7Yv/Dv3f/MNCrtiLtZC1/95LWF1BBaqY1B
	 BsP3+zwIy5/GdozPUVvx4Nk6rG0P+sTPE2v37VwxijhFAX1Uy6mODlQlcvM9mD4EuW
	 Ctbr6XweR5tBkFz30yDfdy/HuF693Bft6jjWXSBtFVIhySt4VuLXr9RCJeCB/T5DLY
	 A0YGSHkEmDYwA6DcnujE/+wCTsbcMq5NXZK7hMHkxtqahqwtV2HwmHh2m2YGx9G3c8
	 Zdq544XrqDd0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB46816DF;
	Sat,  3 Oct 2026 13:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BAB7A11
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C388F414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icSyKmZX7fee for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 815F6414DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=sj7fA679q7nVI6qNBlfMbHRKsbuPS2hE+5CZwiPUs/IgwzMlbwzbXElcYw9u72Dtle8F
 2+MWXf2IA7Mw70shm9QeofNyj33NVZ5U/ZAP6vZpw8xbnZYe2yuJzp3sxbmaqZNnooNU4
 p32beFBPGtqcLTsXthVy9jqNCUZPPViP+ySMW2gTO6Ak6GXKpEZwN61T7uBqNKeE7x659
 TTnSPNGzS1FHuDAUnggcahzbSj0Lvxskgb4AjjbmfDiqcbZvjDTXoYWrXMzMk3PyADo2u
 GPB7zqe+KqkFEuv0Wyjt10yEx8XghGKz8r89UNJd3QZ7EnZ6TrZn8m6LnYbutxut7Ww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+H6NMEmUzrftTbLmW4nfgSy1O2lfasc0FyafYbmbpP8=;
 b=MSS/24d0PNOJJIeawHIHZoYqI38zma0oNn6AZTrvMuzP1zOiCExiAC9trXrysPowS4Xi
 2d8Q7UCpa45c2TGpLlEov1dEK5k7/2FBEZ3bPCWU/NduzHBIfA8L0b9xkt64UYgZFC0aH
 KwaSYKJw9/J9YjNYloMGfL42YfJxBMgugCLfpJ3w4RCtteBbMJ8nhpn6q0IRktfoO1oab
 vzNhElzTC4I57p5fSSwTV14CLtXOIczyXUKswBQ0PjEOsUi0Kt4RrLKqg6SWN+QBwknrN
 zq4icWn29wMtBSbI3OM/a+wzj9N3r/OyfbSjw0QaomOZI4Z9T4y0+J9iVCX+w4qULJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 815F6414DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC7D788731; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1fb56c12502e66637c3e174a8f85b9296bf12b2
X-Git-Newrev: 07c4b03cd4a50806aa0e09ab090173075bef9343
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.CC7D788731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 17.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07c4b03cd4a50806aa0e09ab090173075bef9343
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 448aa69e19..63ead47a25 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  eca5d5bbef505b977ea84d6799f8fa89  websockets-16.0.tar.gz
-sha256  5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5  websockets-16.0.tar.gz
+md5  1d11b405b284374774d43bb70a6faf92  websockets-17.1.tar.gz
+sha256  acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a  websockets-17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index b7b8d26e2b..35d1b9f824 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 16.0
+PYTHON_WEBSOCKETS_VERSION = 17.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/18/72/fba934cb3dff7a85d811820efffcd141ddd52b5a2a01637f64551373ff4d
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
