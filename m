Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C32C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9D1D40BD6;
	Fri, 18 Sep 2026 13:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgYOyPG-y8XY; Fri, 18 Sep 2026 13:07:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 17CBB40C87
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736832;
	b=l2AXLrIMsqz3v61Zp4Q7CwOHWXZMGSh8GNhmhc0nyZ03FeGGjsXfcDl+NQWBvp4xeqPo
	 mPObeg7rx1Xyt34FUBKklXYdvPMG17HFjT56lF5jJP3uvsrZXcPKfTsg2L9Npcc74GbSn
	 q0Dv05WXnqqkpOyNeFcoesz5XahWSB0CY0olxaUN9RRUPI+zkockMJ56ThrHCXLaboI+7
	 FfDOBKvcLKeYI2thZo0l9cMqub2qS1W+ZWlu2ideopkriIpQL8/ScKP6RhIghkkVivC2m
	 JXQd8ELHcT+dOPeuI4mFL9WS/Rx9PXaTvUkYisDqtK+zXNsKSDOB5UuUBKmKmpmfYsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Bw6+vPPtARmm38lbi9wpjldbnA0+blwmRYa2A0pqSI4=;
	b=OxsrzkX+SQuTqLzazfRQ93zZlNEbJxviCvjD+MgwtU1u+sUdvPXxkD1drjEKS96z3pO0
	 19tCTO/RXWaR0R6kJIBia4XvDDqPrZo8NBAhH4EwSgefSdW+aeAaM+g+wz+dkUT78O/Nd
	 0jPzAFKvNJm4n44/vGV0iQ+CUpowguZGetxJ4YCFLUJHmddMYvw9VTw0OEmbVob3zhfIF
	 xGu4TpIIL7iLf634S8zQuvwxisme8zWGhBn0qKTAaiiFmIT4UXB41jLHyIqx4N0Il5wDI
	 Xg6x9U7/us3KlUpmURd6sfX1I8eHfs2pxQyj+XO2H0oaPOWPH2QArTX7sQw5KoRGajg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736832;
	bh=Bw6+vPPtARmm38lbi9wpjldbnA0+blwmRYa2A0pqSI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nCb3UVLHTu1xEz8VPFaRWUlLL3rC4GLHE008wVnLTO+tBQ02nG/4rHuYK2dd+9Pei
	 tE3NNUYSKWsy94S/9S9o+a6ihVAG8kYmBi38mOW8yteOyGFKK2j5vFnA1/73lYTA+T
	 cZn6fzOUK0pzA07CwMl49SJ36ArPIhXf977naeJ7jk5cdgNOVqgL5RTLugMg60Un+b
	 RaOiLmAxs0m5soX8uvYoRubvL8wBeev2wBfbnpi8EePhc4f2eEuXEJnXwhZirhKPKq
	 sxNWBgNJVWXHRHr7cqS5xfOopyY0WspJWlvXuRtgN1nyauq2m94ipRZsJ8JpZuxDkK
	 Z3sl608ktshqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CBB40C87;
	Fri, 18 Sep 2026 13:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4A2643A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B24AB60E25
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0gsJ3WQrLAx for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7B6C60DF9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=NrGqI+U/zUBqCmMDbwOTZov3JX9E2oSa3/+rzSTbA2ndhAFzSuett6o3gRTuXD++Wgsw
 1B24e29SFajHEr+LfrIq8vg08svvdNORFNWZQbCTMoUuPHQQpokHWiyYMQl4zUp42fCg9
 igqwU8iRoDkuaI7FzbSyc4c2A38HJnG911aupjDTi6Bkm7/+HPQ9zZX5Fog6Tl0GRny1Z
 ONqkMwQfj/xCU1/fHG/rUTU9tJspHHiOEtVcfPYkHEGxna6qfclOWgl5bfoxbv19FfXfe
 WUhvpIFv6gqCyTERKw2nyQB2SilUn1Hv6Bc7QtLwgl58nob0gSwiwA/Ef8swKnkR0Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dlsX0JbckLAwQ0AhIBfn3EdQk2XZE49oaqRXtM6hFBU=;
 b=cXGmEkjXt8+SkvkydFRXA9yk/yJPQBetpXdMUKZhSsCxkPA/Ai592vT5kB0Hq2NPCEgi
 oTgDidwxkl4XrTxhqFNeyrNlnNel4KPZQQb/IVAlosvuduvahGzKh/9XiX7PNDSP1ufjA
 YS/ZnzAS3vOa9E2AqLH9xx2R3DwgXdPFbzU7rUgyTQc89LyKuyCTvSbdFcndzetlu9cFr
 OtsPHyIxAepUiMQGD2mTGHMorgGjrbWyDY6YUjdxgAK4MuDKu5TLi8b4Op5hepiQmzkzq
 vovmSlB1WcJEzxSZ01E6P5pxoXGwLmWXF7j7D1gmGNFTLF7SXhnxegNTgiEtHpA5sdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B6C60DF9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80B4697696; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:50:19 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1b3642b460a5e2e8768ce9dc1a18e65d71a039b7
X-Git-Newrev: fa5faf8c3a7fdc1b74046fe17b8d60e90946e1bd
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.80B4697696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/apache: renumber
 patches
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa5faf8c3a7fdc1b74046fe17b8d60e90946e1bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 99bfbef093f41f20dff305dea83c7763c8b34a1b removed patch
0002 but forgot to renumber the remaining patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c9fbf7efe606d9c34533871d925fc0d16364e7a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ch => 0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch} | 0
 ...ch => 0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
similarity index 100%
rename from package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
rename to package/apache/0002-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
diff --git a/package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch b/package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
similarity index 100%
rename from package/apache/0004-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
rename to package/apache/0003-ap_log_error-Include-ap_config_auto.h-to-define-_GNU.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
