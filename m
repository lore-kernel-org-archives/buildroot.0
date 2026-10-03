Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF1CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A36F81491;
	Sat,  3 Oct 2026 13:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-l8TlLNWsVS; Sat,  3 Oct 2026 13:57:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7CF0781457
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035823;
	b=BaTlpr9cIskJ5I35k+FL7cEq2zFzTwflR7sRSXqL6GoCc133tHODhAbyZkkE/+y95Jq0
	 hTKgx05GWAuSGvQmSdh68tgXqZqoCMnbs27le9MjkDaDQ+ZPtEQIJUnuCE6mz+IJTF77F
	 8n+xhJuYQIjbo7fC+7/vEiQRivOkCgZhzOwYwm1V+deKRHOYtj9dHRIKwBJUzciD5M7v+
	 2vGt0KBXcSZBTjPcnqKNffB0ceHE9zWwA1L71taZRkagXTOmksF7UEFm6C1qXarQtt9LP
	 oJir5BsQSoT39Mz4N5dSP3gssjR7Eg3lBgtmpRRi7PE0Sc+IJPV4wmuH3jXFXC3Q/VQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=afclL/+ahhQu7vTrwU1tQ2qyNK6Po2KGGiRVHQihRUc=;
	b=WdKRAkP62fiLkSM6TpD9vySCZRIfyetJeWudLTEukuoB4WOXaY1T27nN5PTxCPAbnHcx
	 TEjbDkDY4gLliuKXC59JnCxQUsdamYHhzqXByPs5gYsZCRoOAccMrydhNNrakO8YIo97i
	 Rg7GC/robejZNKUjS25Yk00BmuMQRN9EFcGPMtrLuC3T7xxAXa+TKmtE2UAfgr/c6Qfh+
	 q0TSmcZTGAcFlES7iQc43fI+aVgcgAGlkAlh9eLlJOdcKjxL+B1nX8VZe1UgDEdmYC4f0
	 TYaVJZpHJKD6Q64ToHYNub1rFWEgHooxqi9ya8VdgoM65GcrKKrL0IdpBvIDw+lU0Dg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035823;
	bh=afclL/+ahhQu7vTrwU1tQ2qyNK6Po2KGGiRVHQihRUc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FfdiLwVPmjGKqvHbo9mh4zV4Uu5Yf9Qx7VSjLu3mdJfvJwHgR6u/kVPvkzgln9T1m
	 lLtQeErEuS/pOfxkbkeMobTISnfKx/jnRO4VFFApwgfRjNShWa8BNoIrduikjzbX9M
	 O32KmK4PVQ73KE3ddSK+0TGIODMRlAsU50zvAmkPyWoWABsuoMKILlpBrxW4B4DZQx
	 RQoLBQ+RirUtd5MQzjg8Uf5k9PlgoWNkK+ESNKMjnINnpjcKjx45jjwJFn0qXFJj4g
	 Unwtd1L7P5JXlQ5S24pETz+PHEhnxvmM2G9t0gWgBhEGt8IJhJMefJTqX+MCDtw/qe
	 AOptZlNEfECMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF0781457;
	Sat,  3 Oct 2026 13:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2A0A179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7CB160675
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gS9BwzqJ-kNP for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 178C260684
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=l0db+YxvKN0XtPXOknIwG3VB7CnLx9A3fcieXI9sn06mLt8kq8zk7++5nqeyuajKuvWi
 cwG0OYR30o1gnPhd23dp2PDGa6wTCraQ+FImWFjoRu21iDCY43Hoz5YGMzv0dGImT9hdq
 jC8QNi0tHQlxC3avIKzR1C1JbF0+fUzg/dq7VIee3UUQ8/aV4d1eHyjAiEnMZ8IU0TjR3
 ekog7JfsHqj2oKJC1PxYPuIQijADTVniwQr5zpmpmNGiPFZ0+Y2ogILiNHyTXjnGhbKiS
 aYCQbkXD1kGZHgZXU9uxxdmB2KB1gs8PM41JFeHnKDhBtx4+ZWqPSEUQRJxmX7CJu5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WIV1RW/slhsWMZb1NemfGB1lSLDFhaYiLaKSpu/yh+c=;
 b=AN95QLffdVdNUYrGEXll9YrLjqWnKKku+gbr+8we9yh7IvLh4pvIzo0xsHESwerxmAM7
 iitef928mm2fJIZ74Te5y4P7ZaBz9vQnJ1TSnURTd6zWvaQ583kiiFaNWu0gdx1/DTTZd
 nclJjty4xMO9W3VSpWIxKu59Z+RR+mp4knVmFoW4pqGuv3/7GZTSlqVKz5gCBXJOubYiL
 Sd/rxZ63ZjVTuHtgPDdXk8xmmcquNi9/iAAwu5dIpN0u6VZmgmmicsD6q5L82qAEjb/+D
 0s9chDA5ozPdKM6wE7XhceaBjGqafapwmsE0NAnBrYNP0c9LGlb5pMoPNW1QeVY98sw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 178C260684
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 433E88A320; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e606573180597b875161f07dbaf420103a705c9b
X-Git-Newrev: c3ea0f9c7480a1504a64d5f7674ddcc4b11e3397
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.433E88A320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-asyncclick: bump to version
 8.4.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3ea0f9c7480a1504a64d5f7674ddcc4b11e3397
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-asyncclick/python-asyncclick.hash | 4 ++--
 package/python-asyncclick/python-asyncclick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 15e8b1fb02..a161f38d86 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  9087d387a981ed313cbea4a4b54a13f3  asyncclick-8.3.0.7.tar.gz
-sha256  8a80d8ac613098ee6a9a8f0248f60c66c273e22402cf3f115ed7f071acfc71d3  asyncclick-8.3.0.7.tar.gz
+md5  d952fbc29b67314d31651cf10a3c01af  asyncclick-8.4.2.1.tar.gz
+sha256  8f259376ae8d4fcd91961c8ad3e85e9b63c9cf181a122201c7dfed3d7f6024b8  asyncclick-8.4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 32d1eedfa2..deb4b431bc 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.3.0.7
+PYTHON_ASYNCCLICK_VERSION = 8.4.2.1
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/f9/ca/25e426d16bd0e91c1c9259112cecd17b2c2c239bdd8e5dba430f3bd5e3ef
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/fd/b2/2c90a32d9b9cf1a4a90ed39cc1177890d146f3f89ae375b061d72110659a
 PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
 PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
