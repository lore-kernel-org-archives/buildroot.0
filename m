Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF221CA5FFF
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E953540767;
	Tue,  6 Oct 2026 19:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ-MqM7NJXeN; Tue,  6 Oct 2026 19:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D46C340778
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314905;
	b=dizCM9vmX7ZFKqK5Rl0qNUQ/J/0hUBvpf5jkr1tEJnXIHLpxAgmjt35xBp19Cc+raMSY
	 /qLjtLHPbeLKvFTE4jSYKfYZdajf4X6IAac+x6/91+3zcSpa7TbncofBalsnRt4ogKEHt
	 D8DpESzlahM2KUYKOkI3fbnAyAPfOqSwgcFNeL+BZsmmPhDSi/AInI6p3BckzkKjp8ImG
	 Wu9j5hqI6R4u/ONYH2aZDCTUUum6VNwJcrS4ns4dNd+AFFc/nR3jvGpTnNpGI+noedFrF
	 L7fvpC3DG53kNuk598KR44FtPA2vxUGtUmSfyLkYwFnmzzsC3fhijMu8KygDFPwX9nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/DQP5TEHnSNy4THKklHh3R03GPwOhwpy2bcy9yC//aU=;
	b=NGn4iJF+VmcmQ+1F2fnRvjxLpwjczz9uBqomO8NOVeley6h7WZKgOqS7oPgpjfqG8OL0
	 8DzSnsx7EgHE30Yh/pBdWSXrmBfiTzc7Ygj0f1+pyxSDWdNU9wZj9KjbkOj9cSrupFn8U
	 ME5IOXb4OQmbsAkALqVUer+OfcTQOEu61D6Rmm9j1g/765hY2ycSUWe82//X6eus0Chjr
	 7SWzki7skqXO7IPKDXE2yIQ8WkPCPiNCbtQC5LUdKyN+z2e+MAqBVOF0ixmo3401CFfIl
	 nNkRZ0tCplSoyRzpVTUHl5IZ+XhANt42OTHvQkyqX39K1+eajpmzp2s2C2++yGQGSrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314904;
	bh=/DQP5TEHnSNy4THKklHh3R03GPwOhwpy2bcy9yC//aU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XAzX0CBRDB4/5WopuAJPIAXufraawLm7OESW9gBkFV8va7zDLIxH7cKq7EtBLos47
	 IkbZtfiYkyMpEOxjg1Cl3L1QKLTND5zt7amVtlyUH1tKZOlm9CT2Q+HiLT8PejCiyl
	 Ls9BuBBm2Y0YtUarKLxpg5NS1UeUKHeP5RsfJxYfJS+qVpGyk7Rip80boiCEqlkAhH
	 jaQK6l6UkJUuMNfFcF3qPyQrehc5StC9rizwkrQ5EmcmgWxsX7jdPIwaNHlvTQcb5R
	 EMhIAwv/qRaMsmDec9uwTZirsFsicfNzPUaHQQdD6JEnHhbmEl4hIhtgVmJ3EPQovG
	 H3gQ/I2/ECpQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46C340778;
	Tue,  6 Oct 2026 19:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCA2317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCAB80EC2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2QPApbEu7H3 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:25:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 849EB80EA8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314736;
 b=eOWP40nfXsfRBkZXS8kXlpPacnyUK6muVoieFEyd+qdfbzBMn2P1cn6rnsBosWlXrv/r
 3g9aHAlETFIM9uzNiWsnecruYUl2cVmC3B0yjZXJB+uydBnpr4uYlWy5LsSHXy1zMHCop
 XUHFTrUigBNbgPbkWxVIEQ36d/BH2IecRO9IN+S4afEPRR7OVbh9tyR5dh3XxDb5vkGcU
 eQd/Ozk7oxZNzcFKTqx55Wr6iFb66UJ/p66Gpy7lhNeRkBwv0JsiROPxdvn6BzWqtbhJm
 bXViO5jk5ZAz2fRzG90HerF0OoaQLQDbN0Ur+ey9Uj3TQAM7pJ1Ha/DVsQa+4m4l/zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314736;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TUvF/ZMdiTk7Ub8LcO57Tbuil/6KWHbiCEtaT1AgyPs=;
 b=Z+sqFlIQko0dgprch68+nYKhxWHLwkcq5xjKQPjwRwH/vK1GNlqkoBH/jLJT+PFHcl2Z
 9g5P98ZsrssLzbB1ZF3WGHgkGT44xUpuV9DfhSrrMODXqyxXZsilEe6IMABE7Mo5OApcU
 HZhmMEX8a56l0cQ4sRgI/RIgRwlTMvwIBndumlGu2KAH6+q+iQcCyvgCdndPCkwNq15wA
 lBZcDE/9mITGdVye9diXEIPmXHHvczhe5HvjneA81EzNd3r1//2bbwZr1kyAG5S8c3f00
 t6mvc8TxsxizTL9pWlcOdy84iPrRSV1nZK0VdZoPbfvrQgYI0g1BbUXQG+3H6ik3d7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 849EB80EA8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:25:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345F38DA2E; Tue,  6 Oct 2026 19:24:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 21:20:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6262b9c5bdd50dac61aa68dd980c4e585c2ff60a
X-Git-Newrev: 5263a5f220444bd0f3b59ff12c9762e6d89565ed
X-Patchwork-Hint: ignore
Message-Id: <20261006192420.345F38DA2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.10.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5263a5f220444bd0f3b59ff12c9762e6d89565ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.10.2/00-RELEASENOTES

No CVE number are mentioned in these notes, however it states:
"Update urgency: `SECURITY`: There are security fixes in the release"

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c3239337d6..e0dc5fc521 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
+sha256  b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3  redis-8.10.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 30142bc0e5..8b03f79cd9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.1
+REDIS_VERSION = 8.10.2
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
