Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802FBC88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4C780CFE;
	Sun, 13 Sep 2026 19:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-F8tucAdNTx; Sun, 13 Sep 2026 19:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D8A580CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328062;
	b=sTjiaczJO5pZI1+sZlhGyilazvTGaa8HqxEVir4n/WrhRzmq6NrRTBO/39YxsLxTvcte
	 MKUEDWhMon4apjRBmM1aA1F5vr5VPmyhi6SheL5Oh2W7E/OCkkDvM5muAuipZxs1LfBKS
	 TIq66RmbC7Uk5gelEnWxw0VWkuzGeTx/hk1t9rZxPk1LgIcBAVy7MUpbEIpUgSN+g6a98
	 /3uojV7q8AaCEiF54+OQI4x8B1lDz4dj4fuL8J0GyLTC759KdcQGH3Bj1H9ZrsWh7w+Bu
	 199kLOsTrD9I8YvzmeDXHWBSMo37FAPuiaq2v0Nt7g15E8gyncczREYpCoRSMhWWCgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YhUpKZCRvOjH5yukUs8tEAJZkhuCO29x9oJH12rs6wY=;
	b=iuKrdQMd3IVKwRfvXF4KX/in+zJV9PhHIAcGW7hb7Lz1w81XF7qnwumysatE3APTdiWf
	 zrqDlGd8kjvrGzPaAoz4mobhbXgTKhURBnCfbRHv0V0wk8Z004dpDUEK5BPHg2+VNeAzw
	 zdcjmBlRojHjEdjZil+jW0eU4P2BMvbiaqe+J6fQ+WojNfBwk8Uw9zY134FRU85Rf4w+N
	 H/U7GYDYWnns91edD3Sd1VQ03SPQ7gE92tMem/viLLoTuaNZyY0xWya2Oer4S7TWKKcaO
	 zoTbaeiNGa8bGkmEJSYmN+woO1EmgH3TP8+LO5eVbmWdDlGNqDlZ1COMsZag/uwUl8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328062;
	bh=YhUpKZCRvOjH5yukUs8tEAJZkhuCO29x9oJH12rs6wY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FEQP3Ho5QqtozRqJdkElSBSVubCfyMa4fg4JP2ogF/BpCvIlnILJOCSAmHGuuC4jx
	 7rX7Nd9ZOhQ2W7kGzki7k+LR6TYLq3C8NBxWXaTtB23/+Emb9Q6TMnDCGoVtYBOf1U
	 Ess1mG4HjN7kJuNrbHXGhPjxPW+BOuMCT68RS6gZv7kpJXgrgRJdpgd9wafcFGKCG0
	 ABl3o/gKLI08UQc/UCP9Qj2+GCB561SpjYnN3fJ3GfUFavv19ykmjkqmpirWPa3V9U
	 ZXin2OmywJhofLavh2Vs8BTD8I6D2smraPnonm5FPR0x5GMc9OMwOQIOARecZ301Hd
	 vZGLUwazCkFvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D8A580CEE;
	Sun, 13 Sep 2026 19:34:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A39B224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37836405A9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4AoNU9CfBes for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B56D40533
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=SZ7p1e7qMkbEUyekWX76/MaKl0NKZOPj51S6SffFoI/MOFjhi5Pg6lCMeVEU81eq0R7i
 tjeEe1eieMiisbyIr7pp9HQLFZSi9mdMMfnATUIQyZ01qs0hHjteyrkU0ICnYmsg6Naod
 GJ978m+3pe4wYR02/hzta1D+lMjcU5+TccToW+bLnKjgK1SlFDtocNarZLlGMRkpjLjnL
 hq+fSQc9edr+qemdqGADIfmqLxnzdplTeG0JIfJX3+U7+L4mX8csJevyLK69XVxzzjkMS
 vmGXpi/y8NWECBgspH4WluCf7oUMjjxO1+lBXluAagP3I0PoHOQEE0mKwfnWXk30W5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=04JFpZw+0NpQLRyxa7kCwGxeWDp/aYxXmifXU9VC6C8=;
 b=s8YLEAAJXCZJNG1kZH/cmOCmRMSehWqLF+XQWCqlSg4CGXxf17QPJijNpeLbvGmLZ8+N
 J0rhPuWCUxKaOorm0kIFyt705bN8j0Opb+24hpYWj+AZ46QKwY9abpoHfc4rF4SYChxeJ
 xFhC091Yh3p9p7qITEDObgHZoj7GymYYxjNbUXU4i+6mDrnNNvK8GzhSUZgSdJiq7OL+z
 YjQSaU3kLZwy/WX7uEeNmVv1kfH5Aj0gIVnS3OctF/4jpAGnwoA3DmrieO4TMPKp94RxO
 P/6+/jxj8YQEA9cpKDr7QtyydYvvESbdEsBcyF0RMXIID9ykeds/XHW1lkqObmZopdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B56D40533
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E6BC95C6F; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43558e103b50bfaad42f8d265ad971479de42af8
X-Git-Newrev: aff091c39dd49c418edc406879c03dd2eb0cdf8f
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.3E6BC95C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseview: add missing 'select
 BR2_PACKAGE_QT5GUI'
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aff091c39dd49c418edc406879c03dd2eb0cdf8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_PULSEVIEW selects BR2_PACKAGE_QT5BASE_PNG and
BR2_PACKAGE_QT5BASE_WIDGETS, which both depend on
BR2_PACKAGE_QT5BASE_GUI. It ends working because we also select
BR2_PACKAGE_QT5SVG, which selects BR2_PACKAGE_QT5BASE_GUI, so there is
no bug, but it's bit inconsistent to select sub-options that have a
"depends on" without selecting the option they depend on.

This not a bug fix, it has no functional implication.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pulseview/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index b1f9dc25d7..b9dbd88c28 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_LIBSIGROKCXX
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
