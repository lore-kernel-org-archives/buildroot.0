Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEA7CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99232405DA;
	Sun, 11 Oct 2026 13:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF0HWECvcomv; Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A424F40580
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726161;
	b=G7/gncsKqJGQZwZYWt1mAWPBXx74WyE776/Dr+Rm8Qa71dKo5UScCaPDY7XGNrvnQqpq
	 4PM3BjeAo9qn5lYZc+Ts4tF0mkI2Dk0Ut6fAmadLiphjDJviRzJ15Yv/4A5vW/o99n5UE
	 MBkvGGOe+3mZFuqMJYunBnVaYZiuaB9VP3RVEQ5CAc2gHcmgBelMT5a41uZS/AvsgmUk1
	 tHKroDqTOzTRBA7cpOgG+3Qf68eoDkwWdtUEUjmw/EdQ53RPelPT859IxpG35tDQDiTQD
	 gaENYW/0aeSf+HCurW1dTdNTVu0L3ZoHWloitohAhJ0wTVte40ufKbXn6Du2rE9jyLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bFAajfdEo7f5oBlDOuNRABlQyDg0gAWD+FGrhKyMQ7U=;
	b=NIyJqZccdS1rWGbG5KGrfWlDAZ9IZdNi0Jpe+lQhYvSILcYbBejByDMp0ukeB+X6rJ5x
	 AxwqFVAUnCax2MwV1z7+Vu1I2K+p63oSz5lXuOO9DcNSZU6U2dkzJK45ozUYlq9j770zV
	 5zv1d4XofBgn0jOiBj2mfm3t/sZzY3z6tBQwGra1WYsK01r7Y+QaSADHDNYgrocMB7r6M
	 PZ2XtGIoGonp3foOEeXgy9kBqjVp+g7PZAgieEb6g/Hn/Z85UGtqBB2DY3CntBPVYQVfH
	 R+baVBdPH654PmpnP1SrMOrG+6SeB7U7zYoGG6RRYybudFtjUDIAYQCM6fB4SExd14A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726161;
	bh=bFAajfdEo7f5oBlDOuNRABlQyDg0gAWD+FGrhKyMQ7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HoE5L0/19pKmuFOM2KWtcrs4Fk+IDM+YwtYAbc9jKTVqD8ALkSILqJ4SQs7DuBcpM
	 1LurjYiWi/sfbgDKNENMSIKTJTzQB3jGP8+GgBwSMyoaRWEXTnAGgp4X/Azrz3BD0i
	 FBpJZAcv4LhQaBhZR0Ukz7bbQIVlqS9Wcek55VALSXA526Y4neLyqLVpXp+cZ4JrfG
	 IJw3VrSVRS4VaC8A9PAOGvwgBcOwL08KAXPQ8zJKs7id1kcz/ryVM9aCoZUUKsglXa
	 5QKEMhCo4DMUq1S5u75lsPAAQNj3px9cKr2D4iFWib+LDHtj1c7yrWLq8nQORSo5fF
	 SaZBxU2JNft0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A424F40580;
	Sun, 11 Oct 2026 13:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49D301A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BB1C80D1E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdN9psgAkFhB for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8CC1280D09
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726159;
 b=Yty4OKvU6z1HnjhBds9VxJnwFEUXOKpARVPyNs3VgElcMSYnORc7KgaFO6U0/8XUTFoL
 4MAC0sEnlr3ia2t21L4gpf5bgvdzDubNjmrvCAg56iFE1ay7R1CzJ8zDeD5bwMJLmFyqW
 OXddXGRCDBSinqkuMnCxPg48gHEWcDIkZ4tWvLMLxT4iJRYo1N6QbNBMQK1ugaJuZlhxa
 d2w0JkPgPXxCDunwVJme49bCRYAbNHC+nucCaemCsfPyI2e9x9p/YV2KetbUsCT95yZXi
 BGOMoIgw5r/9EkwyjCooNmPPRMT5bXn/ixbRr3XhVoUmRw0DltTQ1TBzekjjVA8qhJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IKrcesXHiFprYwc4mERPvtO/5Y3QvMPjJ5biabMud6o=;
 b=Xm68d5m0gMXnomELAv2wcLZh1sapFE+4yVh8lUpXkj3vErhzF0xC0kMWtQYYtQJbVe30
 SfDiFfZbDZiQDX8H1y18y1U0yWT0AEtK6CkzX5iWIEOfkHxXV+keSN51q8u/JD0Rd8sop
 eF8BHmOpXc4zK4Ks5t69Z1WficcRS50ce0yYtU3ErFMKYSlVmvbRbAF4dSMleafJcyHTk
 gElcaS+D9wgfIy6+0ywMwInqwgrcotE0KBfmeT9Hye1wctka1tM7XB162hSp6rn85pm+E
 Gt9t9evK3cBB3MLuJjCehusob9hnMNU/pq3C7luc7kWy7vvrAtdRjR2oKOrFckqdXDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC1280D09
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:42:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB69D947D9; Sun, 11 Oct 2026 13:41:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddd4788c1f1f047398aa028954381372b5ce47be
X-Git-Newrev: 68a0b32df9f62fe4ee0ea2cc0225029af5a2f05e
X-Patchwork-Hint: ignore
Message-Id: <20261011134120.AB69D947D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dunamai: new host package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68a0b32df9f62fe4ee0ea2cc0225029af5a2f05e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dunamai/python-dunamai.hash |  5 +++++
 package/python-dunamai/python-dunamai.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
new file mode 100644
index 0000000000..87a591ec1e
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dunamai/json
+md5  f9ab2ba10f2995f10abeeac80c9d0f60  dunamai-1.26.2.tar.gz
+sha256  84ea45eddf9bb4b40df7610b1b22a03137365e6257dbf9d7b72128fdccca564c  dunamai-1.26.2.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
new file mode 100644
index 0000000000..3051dd24a1
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-dunamai
+#
+################################################################################
+
+PYTHON_DUNAMAI_VERSION = 1.26.2
+PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/12/18/020d3b27a10450ddb11429f637404e8ea67ecf4d9fd999d4f1d553f25506
+PYTHON_DUNAMAI_SETUP_TYPE = poetry
+PYTHON_DUNAMAI_LICENSE = MIT
+PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
+HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-packaging
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
