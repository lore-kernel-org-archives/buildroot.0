Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EB5CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DA560B29;
	Fri, 16 Oct 2026 13:09:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdyvhAOaSyEG; Fri, 16 Oct 2026 13:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 00CB060E43
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156164;
	b=d3FbzGfoePpgZXEDk1XzPkd5bWTUtPzvUVTO0+keq0+ODyoH5LKnWycUkAkdppWSrWCK
	 jCu6FBsK39CX8/myBdAshghRFcGbsXKI8DcDBONZEZHlez/KzoTOlxXL5RPux2SWWr7cG
	 WkQtHrFrxHOqNGT7lpnttoHZqgh1JK2drPWsODBcSF0i01Ii5AcTQxgKilBOGta9mhkO1
	 wZFKRUV8DMvM38Hc1pLXLwVnzT4csYFmJ4JAKJbx+XziAOBzW2En+lSu1Gr8gmNloAhFk
	 39893r6/y8JmSpzyBr2L2nntlmutjczK4C/sZeW+yW9VdypIvCGAj+feNVu3sFpd6FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=X2pxERVi6zqxupAOTp9Vs1S8qDTEWoNL0233v0g5rrw=;
	b=eF3ijNz72XDFVYhUwodHB5bTTRVZgZ6VeGxZqXuwqP8KPdxFKoRJHXcmEf4d3KMUt9ob
	 RL05GH0hyBIuBm6/oefxzmj+KF1tVbgCJjg6GTqw6Yxt+W6CTyl9OWbgeCDOHTmTMd/lr
	 nCbpD41zU4KMXpkBNpaCV8crzr7s/ulJAAA6x3vCRMQam7h3Lbf5OES+6RuEW7Q444HK+
	 Ozj4Iuk567gCOPA1DCgnR5PnSgQWarjUhCajfKi27xSors+pBqASH9d7SqX9OxWuKQYNg
	 12bjgzA42jVxIlwKZtt5EM1u7FDMJBAzVFNtCkLx5FzU8UN3msnUt0KJ6P9+XedqESg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156164;
	bh=X2pxERVi6zqxupAOTp9Vs1S8qDTEWoNL0233v0g5rrw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UF0pawXn9/BuWM1TEN/Dq58TBgg1iM3bWYkiDrTMO3ICuHhu5hZVbF0VE6j4+M6qv
	 htS8tgN8SJO5SNHSqotK0nAZJARXQI5MBO9hTXMTOVKtUFBK0CNFHgGMoc0F7E1X9D
	 lx5YlyGIcFbapRisaBAGtH6hs+eJ+hFjpPw9QMOkWvbWaanpaPIU0O4p7YvpLD54EX
	 emVFtJ4rlkNIhBS/jIcpybKEMOcFtLh4azUgerWZ+8Eqsg1RZytUlPWskgIKJ75dwI
	 eGZmwQbH8Ge+bDv4RwPbEcmdAekEKwcBqq0ylg5x8rYxLKned7iNDkxn3LAGckSq7X
	 VxqTZAo0qH3zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CB060E43;
	Fri, 16 Oct 2026 13:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 019BA1F6E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4601814C0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvt1yNpwWCVx for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6865C814C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=nps3BoJkEVP4F5G8MDcfddVd5B3ChISxHDKWsPCrRuuXik+AL4NWh7d6DqG93s05vL71
 pA4QxrFeAc7ydtp9zrOMkFwQFJ5PfVL6CCEyxx6E73tucSus9eqhXdZCPx54D+22eTn6k
 CSB51Gxb/+38XJNIGkiaud8DHR0wDZqp3VMHiRVO21VwyK4t/JCob+GMFTKmPnK5XqBr1
 n1+G0T3TIRhSQlvnmhMkNcpriw7xHESwv/ourbVLn6cRUvd/1W4xfRspes025gZWeEAA3
 JTSZdPQgUbbEutH6ZkJTpQ868p5ClI+kYeVTFjLThlFYAArWbvRTeBAplKCssUNT54Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=goZk3mFuNktmc8ySMNs0fMS1yicoWSY0f6Oc+0WCMic=;
 b=hMzEdjzCfJStH+mCVqL/kKu/OrY361XOhySjCOVsEhqpEC3ALjSpFg67V0GTiN0DhtUX
 vBv500YJWOrm/1NUHDr5NG0k4QuXEox/sgrLPLXZi6tzFO+RJ9N+daQnB+JjWDh8vY4wq
 Q7stbPSko//kajXV0hNtI2LX4Kuu8yY1ShAd/H2aEvDFjQGksQV1FmCgvoXpR5GnySA6h
 Oa5AqU049CU1wEi191Rw++JbkyuOvj7mInkOGT+3ovCcFWh4oNyLIJZ+h0Ddng7oTwHAI
 4zX4v9sOG2qUUpq6qseodliF/KsjBhki2QYQ7m6GXCEb8OKwy4vrO1XMMBk2oM7/jMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6865C814C9
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5982E960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9ef7f8a225054bfd7ee4ffb8209df0e97b2fa78f
X-Git-Newrev: bc27f5fd2fa67e6161ba8dec403527c2ddfeca4c
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.5982E960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] utils/docker-run: add
 NO_NETWORK variable
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
Content-Type: multipart/mixed; boundary="===============0471101953297826995=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0471101953297826995==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc27f5fd2fa67e6161ba8dec403527c2ddfeca4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

It is sometimes useful to be able to do an offline build, to make sure
the build works properly without network access, so this commit adds a
NO_NETWORK environment variable to our docker-run script, which for
example allows to do:

$ ./utils/docker-run make source
$ NO_NETWORK=1 ./utils/docker-run make

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d6f816facc4371a0bc4ae351e90584e585258864)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============0471101953297826995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0471101953297826995==--
