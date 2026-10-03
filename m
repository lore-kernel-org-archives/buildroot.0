Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C559CA5FF1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E8A6104F;
	Sat,  3 Oct 2026 15:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76ZmkIX0lZNi; Sat,  3 Oct 2026 15:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 10CA461054
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043025;
	b=D7rQ+SnGuLSabEq0++YVSAReVMPLyd6ZGbrDLfxxv3uKMABZ0LtleXOh7q0x71ETbMEk
	 wEtQRB8o5B/oYYW05llUA93Y1GzrIvUCXedlcefRmWmzCr20ECOXzBofQ95TYcES/ICrS
	 UZO0jPwWcD3cpolhIZHJ+SpxkJgkkJhzLOKPH/1p+SjwjfIOlb4y8QCZVVkEG7ROZ75rW
	 1X+1CSFcVT7gAmaC9M8AeGyp38Gg6kbYeRNiSz+aJybZln6Om7O5egX8d6SQO1xOesXcj
	 Bk8PDyPkMlanxhn4lzDTQ1JxNEQ1ToJ01e00uTlp5mQcUlo9kEVwevEi8Sgc6namn6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZTs+yACOuOoyJVnBWCLq/qn52xHiHvbVjSq+tTZ7EZ8=;
	b=BPbE7jpBxtLt1VnLLMzLA6DvxtKu535m4WhnpxVl0lfAVeaplVmhrVXdXtNKIH1zSqc+
	 8GGOpyOKxnLpzTr4pBiXjKBVEx1+b7kkwPjxg2Gr0lMkfmvRwb9ArqiQHQZSADSe+lSna
	 h/Mpy/MPYXE7LJqMFvoRdjGTLkTEc8OSBj1LU5LjvJxvlOEAfIHIZrBCgvsU3szXEy5sX
	 b2a2Xbh8LLqoecwANuwDzxq39Qb7MQo0kr8z01yZq0q5gGUfCW4ZIogYG3dRSs5iuTgrH
	 hdYkzJLgkUWfG5F+0yuA9xjCjXoYMt9Eb0MFtTQ0sR0PBs870cFXHbTbw32ez30tlzQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043025;
	bh=ZTs+yACOuOoyJVnBWCLq/qn52xHiHvbVjSq+tTZ7EZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rEIIM1LTrmwie266BZfeihn0GrYadOsexqF2ZERF+qGDxE5iOFjIZDfdzPtLVFqxY
	 tB8vTCbTeLMg4IcOHTt8z8c5FySYPP5D61EQZeI00EfVw1uDg3bePMuYLYgH9zOExv
	 PKbsp7NiYOqczM+TYYzX4eYaSWaYq2pHrYulSzZAvZtex+XvWvU3VcD12Q8VXogal4
	 TwUYSnwrkCj3JRZBPWR7hmxvIqfFB6PsFANPmiR6uHUFqcTpOlfZtRHeXTW/Sq4rej
	 TsH2xsmw0aCC0VmAxdu6wWkicJ6dIrTcp6rUmWtRp4ACj0JODYp7wl1Eo++d1vRPbT
	 bmnMBHrgtmVYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10CA461054;
	Sat,  3 Oct 2026 15:57:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB79335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C2566066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooBzNF9UN1kY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0863C60689
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=jM9Y4g03aWChQNjDlZEvj3r0HrOVKVagK+V6dnndXnNnlW1Tuqg68kY+sjmIAcbqVwNp
 rFXQccHliyumu1FQqwX5XjqiYqC7Q9lah50OvkHn1DCT0WE2E5MWFgqK1228wpDbvaL92
 Md4G5XFgMUMwS42VJFFGqRqhBOFzaDSr2f4afxMYUv6FCAyx1QPrtRbd70uf5LQTnXW+/
 STjjzSNDm1eIAORn/2GUCqX4NDxw+egut+Rsqep3Zso47IR2y0iTwJT6nXxlpvF4DFQJh
 1X/yj58al8pZl46Yc8n/DSAvBc/Xt9ObvVDRhEiy1xP167UNKgjfZcMUPWU5ksuUvUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9/Y0KV6wElf8V/A2K47xewfWPHqPSg5oOIqzuymS3UU=;
 b=Ki3M91wRPcFA1B8ynqJDtM0tCWbfksg4wKnxY0SPnnxW74CcY1L2ntGgVnKpBDeZEPWn
 5ENeEvEaAZQx0fh2N3iHVS3q4gEwwbgQmMHxXq29YJWAd8cHfSX3+bx9ZMO+miATEc/xE
 jH648NXlccpK9m8zPPV+FwZU07n0tI9bMARf3oJq9UpeFzxjrChgKtq6WBkIzMjs0RvRp
 Ev2r7QyjeXg6vuk1VrDgg6ggQm6tr/Wym6sOH230CgUjgfwuKErflI7Qmi8t6oiDeuzTJ
 kq5J/PSyMx2axOLJDa8tsJXMN40S4jmM+Xqegd6WkM7clq0qZY1FftRG47YinS3YUrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0863C60689
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 497C38A39C; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43c6cc430226224db3e8eaca374931f6337627c6
X-Git-Newrev: 7e5ce8011ce9a204a4c221bf32ef09acde11faca
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.497C38A39C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dtschema: bump version to
 2026.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e5ce8011ce9a204a4c221bf32ef09acde11faca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 77da1aa801..5acbcf0e05 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  7ab2a44de9a5c91fe5fda9f45c1dcb4d  dtschema-2026.4.tar.gz
-sha256  10cd0ffe239f8d88913390ac5d8213fae382e87a20643b21c65714ded82a4460  dtschema-2026.4.tar.gz
+md5  5409d40ee24f16fdda2814c63ecb9a4f  dtschema-2026.9.tar.gz
+sha256  d50aa00414f09b7aadc776afabe623915b8f94e59d6eddef80920d6505cba671  dtschema-2026.9.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index d61592004a..6f6b0e6b18 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2026.4
+PYTHON_DTSCHEMA_VERSION = 2026.9
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f8/f0/3990f821c088a6107ce1ca1906fd123aebf3c2a0a4c82cb41d7d52664bc3
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/25/61/0ec805ea47bc1411bcecc65d2f9fcb129455c0f859624fdc06c4a22f8579
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
