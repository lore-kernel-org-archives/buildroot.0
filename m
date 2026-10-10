Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14421CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA74940983;
	Sat, 10 Oct 2026 15:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vr1XZICJ6tv6; Sat, 10 Oct 2026 15:19:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E29B94089B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645551;
	b=Za3OrtIKjexNuAWiUhAWQZ3boIB/Yc2mJvgiHoCdhnprDRquIW6FwIzDNyS6NMAv2+fN
	 pCXzvcxS3xTteF9EncXS9As6WNzwH+ZK6596+O01y4/iJ1lcwemEKOPHQ4l4RTFSSZ5mT
	 lCZNQrcHcp/fV4ks1oiTXJPhnVWePd+NLxkYJCdU+yWPIMOfgepA5ioVdi22OKuoIUisN
	 cpvZ1M7bA1eHUG7ZRm83O0zBInBQN4y9WZBKAvkmytuWcZjKx5aqhkt3dTBUEnwoMPxfo
	 a1YCR39OdJG729WlvCpqG6tmt5ikkctLKwE+0xp4tcoguYNOE1J4nRHSfbCBnM6PoOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T1m+IhDpqk4LpD9n+k2NmTFFWJfG9p5s+YrMchMUSx8=;
	b=Bbc6XaPol2qDVEM+Ju7FprITrMq+sOsJm410qv5/DsfnbVlZzaOkGCljPys++PSOn8uS
	 o/ua3n0Fny2cwAiw9/iqlF7ohPvqeozDaASKqFKlG0ryftdg8giZjcWYI0/kLdUnlW4cN
	 NPz918dT90mGJS47UDF+ZlLde8x5Vkf87dfxOGihFUDlUkabCspvqTRzvB28MIaeaymeJ
	 mUVzSIgd10I8MN6FbLcU6Ej1lm1YDDSdaloqJUZdxQbYEehj0ELTaAwJJxKVRMvqN2Lv3
	 heF7EVfSMH5WcTDUgwI/wc/U/Nh2uqq2hS9Z4ObcbT5rdHjULZQShOlDf0GhcwNO5vA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645551;
	bh=T1m+IhDpqk4LpD9n+k2NmTFFWJfG9p5s+YrMchMUSx8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C2NaU2d+NJZ3PRx0Ja8mF5ZCCplWrnTXI6nKfwweYnZ72CV0quLL7IV6ztsS+nrWK
	 1GeI3XupRBSYKhoTfvBjx/FclePmCWkR77YSbiK+qlJdybzNGR1o4cUx73v/xWO1fK
	 QDwfK802/YAg/2cs1Q4+3T3AWoNFEZWMo0yk6mTWGroTz0nTB2+fvMafBIYqkd7Sxs
	 XQcvvVr2ieiQXY/Whe3Xa+3/Uc6Twl/BmISjhbKM0BBXN3MmkEsa2V06X4XfV0767t
	 bc9T9PTPKQUPW8cIae6uFUxkPi3EBSSIoRcrHjqV29Uv6f1BIItRwDxoANpG/k6M6I
	 GIbXG5ozCyuCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29B94089B;
	Sat, 10 Oct 2026 15:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 680DA317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EA6A81109
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACDcn9_b3dDb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 280168115C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=Q1Z1Ywe73Zwij1mVWiLULQhiSqlNkFZjAUdOQq75Ax4EsZUrs2F/Trq68dOGALmhUIGO
 I96RngOqSB1Gylnv2JMxJPBoW34oKA9edJQHzN9hJyQonS+JduyGrWuUHGrm6ws04eEtZ
 HTP+IUuWvkPzoMAAUSX+ZgRnCrBecb++scloEIggXqv+kxEWxJhYruYkoLSNKdiqm5UTi
 6CxNIAQbuw+my0BCvV6Zj3cjHOe7wMb6cAYy5hUcTJi9ExmY3/ko/34f4Vq4No1J2IciB
 /5Ruwl1W7lTvroN+/F7H/Cl+PWOiF9YiWy4Yi5FzRPOLaJ7izJVlRlar+l2msV8cRWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BfiOMZPjjHvdRDmGJSitN+yFX4UpGbLpc+A36MVFN54=;
 b=Gq7vDW/1vhL3BVvOpxbyW4m4sXltsMYmkaZ2xzwBktFG8RBrsQ1hhKxQZCZyMxHsMFyF
 QO0PmyUwXwURVnv8+yTgsC+EYGhSh70Rr695v83Plnqi/2QrLFcTg9LQjA2vvxBAkeZcb
 SK+GZp08wZvvHDuBCa+pW9AKQGLzYyvC7VXpCBCp5GHKqDTO9LWadk/Chjwtk0/L6hTV1
 /KSeuT5EY/6m2ZLwzTWg/9r1MWi3BLdBK/Dm2UKFXhJxuSBo9ctQZ5DjxUuGyCAyiCtbQ
 Pl5ZPO6+ks4EyiceHNDXgofJOg7Zaccg0cJlkYWEaWMZcoZHOzeA2XVIYqQttavSz4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 280168115C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E962D92237; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 763dcabf6d09605da81515562162ce7c595e85fd
X-Git-Newrev: 6a625034ca8b8924667246624fe5321c431e4047
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.E962D92237@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xkeyboard-config: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a625034ca8b8924667246624fe5321c431e4047
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:xkeyboard_config_project:xkeyboard-config:2.38:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2012-0064

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..9c8461b23e 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
+
 XKEYBOARD_CONFIG_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-gettext \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
