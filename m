Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406E3C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B2FB60E94;
	Fri, 18 Sep 2026 13:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYPpGt7zZFEn; Fri, 18 Sep 2026 13:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 26E9E60E7B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736857;
	b=f94XxAEWwhUgNHxx8/91aBAEI1d9BcR6YlvYYvLrrElJJAUCK8xx5+kXDWi9O1jhdKTJ
	 rTj22yUsDtXXDyXO82iCweQIhdl6qvnPO1LYz0mfQt4buhNGNYZ166+QTA9lmXJ6P78LW
	 cg78f5F/JS/Vv93wtnDc04VyyGFyZUnPCrZCSB/xfMN8IT9Lrt9aka/zWYzef0gVyeP7b
	 8aBpMJNs7Pxq7lNGxAiOQfuDD6k8xXxSkpXI0ToyLQcNPAASgA9dNQp8vT1MiPaZZGQZi
	 75oGuapAT8Y6PZManEky5AXpC1Yn1TKcxSRh9xXiO0+y3KY7U67gp5XtTPiHfN9uVKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K6YMNCwSxWWRhbxgNGN3DV+tPy2FWA5hnSN25gCbIr8=;
	b=ez9UnY8sCAYyAkCwLW9yvMCD9bbisx/9SgJzzxz/3UXGt5CKFJD1E2kTulHbV083Au1z
	 nWwQGW0Jdfd3jSnh3owegUr+kR6CxqtJH5FYYcauAnJ97nhskK08YHgR5HOkJXifwNq8d
	 mIV2W4dmLg+97w9+HNbv4yumVNEvVMS3oABDX31zEa6E7hWGWRa9ZaCHRYz/0oe2gZmz8
	 zixs20lmM9sfpsV7+2t5SplHg+YAzylJ4FSL/9oJsa8pfVXzY0oMuoHaFRJ5NIp/Q+d4J
	 qXw1vlt5rhDtn4H7B/CD1dzdFa4RMQqHkNEd9/+ob5NZS/j1CCre+ltldesQTcDLWlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736857;
	bh=K6YMNCwSxWWRhbxgNGN3DV+tPy2FWA5hnSN25gCbIr8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HCB+P8Mm8BN5buM/2qRm+l8a3qr0C+Y/ui3YnfG17uZrabEh8BNyGLWZidzGh6Yra
	 894RAfxSW0AcOE731FpXRrexeqLkdbpgm2z5KyVl6rzaJuBXKrJqD8e9SfiBkrJVuZ
	 v2hkH/CD8RLa6nZZi/HajFGbBp0CBP/rarTVXgOQScgQcyLXInVOZAW5/p57v0XH8s
	 pcuuu+dKziolxpn80GHdxte6ypLik7N230chwVLuTuU9ZLbnp29fjwhr6/cQQgZdqR
	 eDAixUHCAHxMxN2p44RJMpCcwbswHCUZgu2/1aY42Aku+CJYLNC57F/+WvHkRn5kJw
	 7ifuAqVsX+UXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E9E60E7B;
	Fri, 18 Sep 2026 13:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C1F7A29
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8695760DA1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opxNO2ABOb9Z for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2059460E1E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=Ph5SqSNWMnVxS5I5C1SW1F7K/xhtxlkGoPTvhJGQHMDGq8fy18YttWl8eqaxeBrWOjM3
 08r+k1nsSlB9mh7otgio8+R9JB/gl4RIe1jgPqAxQ0AM0Yv7Cz5A7QBtvy5tZ8PqFv/1H
 M4XquhyOuZCcK9WCrnpxao8gjRS81GVdSk5DpqsK2rXAtyREANH6OXM8IiD8TMEBQIX5G
 5Ey3lhkhgw5jD/tXto25bEvIfIpSVmYdSkRRCMx58TSJ2/2J7EzacpKC1akoIfJzIoOgQ
 Ck6Jh8m2OZ0BwIKlZclOFv2+ScwbsNjTvaNsXLKfibK1g/PvGdgzfdYFnV1bwKSlRMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/mlzkVgHb6sA7g/rL3DFGYKz1UX2MRM7KtG9cjBELpM=;
 b=Z8h694kIDLfJ3Wve5toAGn8SRN6ga1ge7Es2hDdIhqTJZg2QDZK3nBaaZZPOCz8BQOiM
 RJCpsSClD1uYnGizfMK8mziHBUBKPmTzWTslK/POiTd1BSPc1ws3Z9d/ByDxqpcsJCA9q
 Fq/C9sfzrJkFzrvlSAm/h4Q66X2UXjDz2cVpvIzc1ApLtXtkUlV6BKLqAQUyU+yvrvmT4
 FGIWWUxuPZ336UzNMit9ubF1c5ab6rWL8AvsgNJj7SMXpFZktXD/hmZ7+dbCARRw+78m+
 OTvIdXqXGfW06H0e4WRImjY4d2x8Qz5mxhyKnzgy9OxTb8pWrIx5fH+z4wF9wSDPJOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2059460E1E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD63397696; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:58:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c27bc6f3d049728d646957ecb31289491d925735
X-Git-Newrev: d31f1dca9d0750ac0a2733a99ef8b7242fb0c4ce
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.CD63397696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-grpcio-reflection: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d31f1dca9d0750ac0a2733a99ef8b7242fb0c4ce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION selects
BR2_PACKAGE_PYTHON_PROTOBUF, but forgot to replicate "depends on
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS".

Fixes: 3217fedcb8c8006809c1a3d214c97597677a07fd ("package/python-grpcio-reflection: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 74dab034953e4546b63c9c280428e59fb144488b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-grpcio-reflection/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index a0ca35c286..1e35c82a9d 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
