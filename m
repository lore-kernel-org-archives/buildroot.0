Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24439CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF9C81162;
	Sat, 10 Oct 2026 15:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjEpxuTxluD9; Sat, 10 Oct 2026 15:31:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1944981132
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646295;
	b=oyfrAXjfz0UGSDukeqgbptKur6nmoNgOLrtCPMvsFowv8Z7cM72q3fy2hR+nimZ/Xld3
	 nAb3o2bq6RUIUvwS8M322z5AA7SGqYGx0DJCH6xo3uQDQWv7CFqTHx8fuqDBhHBIIpnnb
	 XsrvUWy5iPNr+GJ+3Wwj2HnwiopJoiwE4k8J9JYNzCP8MiRLnNwaNSj0icG8GtxU9aRK0
	 hnwdylLJpHqKsKkzh+woL4TNb0iBacgri35/E57ielZkICZBY4B1e7H4W5qVyAy1NF+nT
	 qb7xp3vQN6kF+1jeGa6d+yCwHj0DXgYAZqOWaiwvP23WbrejucOuflZtq1X81HjR6uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZHhOEVDgE7OzWfzs3HuKVKfk7Pa4Xfmqfr03MR3Glw4=;
	b=OGtcK9rtuj1qXwm80l+8unrOhzD5nfERoKvQfn0QHEsjT53BnL79LAwe/lLjYrfJKVEq
	 qLg9tj/pR930I6z2sPSpU3wjPMwfQdrXPGznkUd6WqLgv6B/MqayoaRrcViIUofRm/snN
	 M2y0rxK6/v6iM+0N/+UyCLBLDaNzcBQ8QKNcIRlNJ71GLdRzQpigZ8OIWzKg/QwaaRZJI
	 UbGEaQOBzlMw9EzVF0gATL/u8k8o/1Ov6JpwLBkS4WaIFQ7MBZY4irgRUrZqRTLZkff/a
	 x00idqpe215/b2dZBzZoiQCkjKS5V1hkJ/KA9EJ7nrrKnlQDo2ySHkiPbSBl1Q8e5cQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646295;
	bh=ZHhOEVDgE7OzWfzs3HuKVKfk7Pa4Xfmqfr03MR3Glw4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oDy3kMqbUqp1Ej2LoviKV3Bggnw0UBfWnnMl64y02+ZCswjKovavs2mfYnnAB6qBw
	 u1ec6VlBJ+gYAPTugZyf0j3RHQvWFZKsM/t+jS679C/raTSr0qDDdum/ELrByYHriy
	 xSX91GBl/XdC2qbGI2h6kroHHJttbb73jWVTwB1syAEHd/uB9WvEz1Br2MJuG+qK0V
	 +08cFlgCn33L7WUK4ctCFTqn3Xu8teckmnsglZJY6Gh1XvPyUw+hhg51g0BGrQnhCr
	 CHAXzv3kKiSDyUr5QQCX3ImQBBQqrT3HLfhFpwiJdcLatpLQvvAYg2k0H7V8pLUk45
	 v8kIYnHF11rxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1944981132;
	Sat, 10 Oct 2026 15:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE243356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC3F9407ED
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twwE39uuRdu3 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BF7D407D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646293;
 b=sE9M8Xuls+j5EA1WbREBHt+yOFzmFg7eDkIO7fT7zBhuoxl76dziqLFWwSp8Otcqx6ZT
 c9xl/mtinySuRitw8gxdZEu2Rq0vVnQtU+zMJT3V8zTcqmlDK21tugSulOj6umE3Egyai
 GGWqcjFchd8Os63Eu0VRBIe+pu/7axx77Nreum4UAIDeZks9oiLW1A2AnSBARNeQJ3yFV
 jvMginx5iO+94GrA5ZEby8dXNAHlQIvMSIl4lZpAoY5Wd25a5Dg2I1tq0CN42WigRw3ss
 s9YcdVcL24j2Q/OND0a3MeBnzVTeeMeqvxZgQmNtQv6nknhvjfNGsvLPfpRheZPq2Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646293;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CA9fjUMGosp2I49cYNhUiH+GRHRbloEIZRznOeg3/dE=;
 b=Y4hG6tTjNH2Jzq6CYteaYo7UQkuIx4D/NrsAVuhZ00oFqlzMutj89RbenJVJ0gtkkvPI
 ZwuRE+K2GB9KBJSmm8NiZD9noRsNevAFbdx9YpLON2wKj0LEiI0xrkaEzMZ3beMgFDIHg
 EoN8ol2TIkLRk1dJBvsv/t6KcNIwYgM2DDru8PsUBL+8QrYyfo5h2QHJqE9O5bYYWALZI
 5idmwoa5jgbwGwA1VbtrZlYQ2zOG7kRRrmTVUCTSJohlLhqgYvyp4i28TOpgF8ymrO+Rw
 p3vPYBIREj0nhZdKYm3K6DdXSlNORD3MmZ5KQ1E1lY+uMsfbZODWuArktSGabyjq5EA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF7D407D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:31:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B965692285; Sat, 10 Oct 2026 15:30:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cec5f7af80a564b8862aee71e3cf516b325e41f0
X-Git-Newrev: ade0757d7f26314b421719e12e3f51b04d53fb3f
X-Patchwork-Hint: ignore
Message-Id: <20261010153014.B965692285@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: drop RAWNAME
 variable
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ade0757d7f26314b421719e12e3f51b04d53fb3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This was added in commit 7a41cbf938 ("package: fix patching procedure for
host packages") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_RAWNAME, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 09d6e5b20b..f8ffaa21c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
