Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1626CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A3940871;
	Sat, 10 Oct 2026 14:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LsTStUtbbIE; Sat, 10 Oct 2026 14:04:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81A5540872
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791641097;
	b=sI5dZJTRAv6Ezl8tEhybBA5+8kQyzrgz91kHf5SJAt7e31txl4/7GQZq1AZma09LJnPj
	 ikz9FR1Q4NTwfgShbqsezYUlwFPRJvhtJkCf/jdikO/sJqd3PYCQh3noVcnE0kN8WpD1t
	 TYV9+WpxBBWs/xPlcTOikkV7oicyAKVjTug5WQiwc82EW7J7QpAUJjKfVd9Dg1g/O/m9Q
	 FXfhjecJRmOgGU7DRqw+pPvWL3Cup5YcrdM/F4HhX+stSbzGiSYA0gtaHm4rtt4sAmSsh
	 9uiMjwXKIuMmJ6+BhrcnuKDBOgKqEYct8Ibvd3z5F0jUhVUeUWEtXv3+eO9oIS1znKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791641097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tv81PQIiu3xhNR7h310cclnYOPiYIbkITlSK7WxJ1Gk=;
	b=Bq3Ehz3DCgvqsD+6RatJwgLQB19gYqrd0SPpV15jm29Pm8d/AlBbztGZgmVsf80WulcP
	 bvf5u2Br8Uiznwg6Zav89yek71Tx5aaR+0MdsZwHOWT0UY1q1GNhvXvmhVmAu0rU451jr
	 g0JCw3ChonqdQ2OP/HqQfodVOQhfSOwy+uRY2GoWb17Cf47G//7/dbnE2CzE+e0kJcBxJ
	 335/SUg7Lj+8ucbIUnquouUg8fn8s2ckyWen6ogYYkLple8xnNRVhdnjsJv+LB279bA2D
	 ui8nJvpjTXSGlBZ52ixvk9SS6q41iMnNUDbTSIfyTkYz0oCpAKYhpdkR86oVbDb1z+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791641097;
	bh=tv81PQIiu3xhNR7h310cclnYOPiYIbkITlSK7WxJ1Gk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iiylKunnsk7Sr+KQZJK2QBta6mX1JdmlQaaluoorO8eD3Sbb8SRKPuM1HRHDp2TAq
	 I4423RW74b4Juc1FrBAKgQIofM0wtZ0wr4WsqvLLrQkWv07B5OuQRNUH9Bl4I4TNwl
	 fAZKw/tvvDD64DPErVQ/fENN8KCxYekxikzFcMdCqTnbXgYh3s9901m7BK9Tt+jW+F
	 hVXtudWmOvZQZ1fgVI4qxt/FQwlAnA2KMKafaORfQleFxviY1xh2rTXUFhRBxubBYN
	 YMBKoIWza37/yD5cHHq+8WYda/Mg2eB1qV4sGPeZLmPr3CKMd6D3T64odQ1SLnEfHJ
	 H20Raf7zXX+Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A5540872;
	Sat, 10 Oct 2026 14:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BC9B105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C2D400AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NJ-zir0FHqy for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:04:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EB3B040004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791641095;
 b=XQL8+Af67dOX8YOLjK5gLwKBRyiJQFtVh7GNDeRXDjaG+lZBv1hYQa2inl/BznscHaOa
 mLXmmKjcMGJVzbqE42HrckWQyyDJOT7WkNBgHZVxN5ID00QPKE93g2wUTEoMJDGTSGdCI
 cH8XhGCmijN6Nw+oN8Ms+G6+7SDJsmPDR9U9G1mHvp4YeyqkUoJtQ2eNdmqoNW1KK+rNO
 bPCNsfmBREuFKEJHWDUPBZWJ1mc14/tS+rpQEHRRQOo63JlKb4L04feK7GsQlH2Xeanrv
 oRlGpBeRueJDyJUyuT+PEGrKfv3AipwzZrwITfBPDxs5oGuNFqaZ+Nekm6/pLFiaG/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791641095;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wuGhfXya+6nJAWOijt46VY9oOUCa6ygyumAtDKkXsDs=;
 b=ex+8rBznuCLvXOBX1pFI7TrCqA+CqygwVmlcHRYS8qTENgdT2ibW2N//0N7tyYNd+kCm
 kGy+HhR4cIxNYkl1bsTy6CkRGEETU2Fv//x+B5v7Yd5oWsGJ0oOlNcLGjlnR3yIXhBoLu
 FLfWdi1C75D1EgYKd3URYcwxZYs32u+fQU6yxP4NDizsNbTZ8xDZj36fVpaqnudCPcAfU
 tog8n9clkBHWL8WUuOUXXuJk9fgJVMAtYzEvh43D92raU43Z5os0p+O8ZkCxZmPipnxCX
 olN/+ULg78wb624nzJztVK4l3LLR7h47e48n3CpSPGNjG43OlSv9mpgHwdO/XLL7zrQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB3B040004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B81C791DDA; Sat, 10 Oct 2026 14:03:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:00:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67cb61bea5876227226603e58d3f74e5032b734d
X-Git-Newrev: d6f816facc4371a0bc4ae351e90584e585258864
X-Patchwork-Hint: ignore
Message-Id: <20261010140336.B81C791DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: add NO_NETWORK variable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6f816facc4371a0bc4ae351e90584e585258864
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

It is sometimes useful to be able to do an offline build, to make sure
the build works properly without network access, so this commit adds a
NO_NETWORK environment variable to our docker-run script, which for
example allows to do:

$ ./utils/docker-run make source
$ NO_NETWORK=1 ./utils/docker-run make

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 27c169db72..8cb15c9c48 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -21,7 +21,7 @@ declare -a docker_opts=(
     --user "$(id -u):$(id -g)"
     --workdir "$(pwd)"
     --security-opt label=disable
-    --network host
+    --network "$([ "${NO_NETWORK:-0}" -eq 1 ] && echo none || echo host)"
 )
 
 declare -a mountpoints=(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
