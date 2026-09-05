Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B188AC624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBC160639;
	Sat,  5 Sep 2026 17:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFshIb24xgbu; Sat,  5 Sep 2026 17:07:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6ED9460D56
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628041;
	b=r72ZoNgcI6hQmxeNK+VY2MG8m3yMZ5EuGSowwqNffdWEtWISrPcmZn1VVPOGe0w+Ej+f
	 Zs9/B0R2zz02zF40Pf0vSqurSYPmEadWtv6bQ41n4VGezQI/u6gnQw664P+usPAqmYxr+
	 uoC1G5lh5hWO0SHJ2FhhWeTJVXjrIYIuYiwrDHgDbE0zt/V6ql/ABvPLOKL3ok7APxz3N
	 IZzNIrl+dwk33VTbtCuoLFAW7Ntk3wkmSnugryNdGYD4OT77729EFOurjoPlEVTsRR6ts
	 bkJYVeNz6RLNG+OHHtjNwHkh1bhbWt+8+ANWL5lPlHxxbD26Z02S5Nt0cZmBPXUlrkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FGXVF6XHJeZr9ceuSE4Z3rIpX1wWpEMmur/Y4MNZBT4=;
	b=obnAwj3NafHkhjzk660/Vgx9T64BSiiQ2Hs2JbtBW+16gyfNENY2V2lTlHaH+GjhfeRC
	 qshluWwyLmABLtkdPqnCIlYDL8nJYdkytfv5LGwiBsKzXrhKr7rzYY32tEbVWc0Ppfv+g
	 hhYoPny9Egk1GWae/sBLqMQvxahJmUrXri05KOYvwD292vJd4fDDl7l+WYhzK0SAHdS6g
	 dx7JFIaKIsQYzXLBHikJi7+7SjfMP1il6QkeK2YU803aXM2P8gtBO4oSpyAVdE0Wbynuu
	 VTBUAm8uf8hkIOSlMxoGQRWdnHJTErnW01QipwghCxtrBJJ3FwfCMBs+8hp8AIrDEfQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628041;
	bh=FGXVF6XHJeZr9ceuSE4Z3rIpX1wWpEMmur/Y4MNZBT4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=avFZMo+SXAbCoVb9h1mVe0bivl7TGICQSH+QgQp7ocndonY1BEE8EwBseUk86qjK0
	 uutZqTBYmhHMHtgzyb0rxGovUKYO0H8ie4BqEeJ/uPZX8axTBOoqTJUhRZNrlBSApE
	 yLDkEjAtSCZcJhVjVjpvnzbHU41L8h3ztlFWIX/EafMy/1ua/Yj5Diwvq4JOmJJBFn
	 ekszcjRgLmJK14G3ocnTyjIg8hRK3DjgKePAAwv69JviVGPioZMudiub9nh9Dqz4Fz
	 MtsjTrZRI9c5VNbHShoiCsn2gaIsa9OCC7S0biQ1IuFOzXvAmO8+l8IFFQ3DSH/jdc
	 NRy6HMWF2V4jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED9460D56;
	Sat,  5 Sep 2026 17:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCFF136A
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3227140049
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJB5pkS5kXt3 for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 09E1740067
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628025;
 b=h9XiCB/hVdpDRIt36jK+2bm2WZp8FcPOfzass8Nm70RUhoKjM0f8iLuywiwdVlyalj81
 XK1PudDmv1d8+TZRoDYbJydTXnzbQ4zyjYzdH8mVMP/sj+oSlsPB3UYDCK91WFWlPAT9b
 70taW/cpDOF65oYJJb1RFcg600fMJVAiG+0swu1RvfPnNhRx7b1STns+RDYG57/K/X2Vs
 E1J/oBnJ5j7HZyO+cFrvd3bpxPVovw0DQ4nTyVDutLyDhwrzz3/PKv7BebYkX2dCzqYvF
 PUvtXxtrkpj6eJSrXUKdESMr5wj9Ebq/1x5wqNGM6J0VZ3gWSXSd76XfTRVCDNJI14w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628025;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4sEqa18g3HxaopSGApsp01QkEqK78ymHN7J7+vLHLt8=;
 b=Crmuz2Fd4n0tGDG7YIkDrOGXIPdphDPsRLrOU7BPXtYfFW/qdIOx4SQZyEHYDRMS9IeC
 vmHLdStr5YS/pUNff3fwo7JntdtBFKzFprp8sAVBW5aDOXPdc4du5Q5/7Q7K7of/FaPCv
 zLinIb4tNeRbKBNH0rWRfOgDK5HJjf5BavnNIDGbbM/GJ73aEzHM+18RrjbLq2xX7s15G
 PvXS7GJTDSdxAzRKDsCDitEG91ZpU1X76WKIM8oUzEevfLufMv/hSZL6Vhi3V006zEejr
 G7SwbjDONc/Ftpy1eCuSUIA3ZjTCuuWAwX4ay3Vc7dvIzLNSxfq+YtBK6+KQukkdSTg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09E1740067
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D471895260; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:27:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409f7867a7490da38e160391f2800caac805f157
X-Git-Newrev: bdfdd430ae1957e309602e3360775c486a17e4b3
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.D471895260@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-datafile: bump to version 0.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdfdd430ae1957e309602e3360775c486a17e4b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 2e993bc887..cff5284d07 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  13cb4816f459e71c525f256dbf197a516deb0f6b9ad98a9a0dc0aafe0d415194  datafile-0.10-1.src.rock
+sha256  0556de934ce7352611f90f6d90a1a71abd3de2e42aa0323047c7ccb44751e5c6  datafile-0.11-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 943ed9b8bc..a5e59c2a0e 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.10-1
+LUA_DATAFILE_VERSION = 0.11-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
