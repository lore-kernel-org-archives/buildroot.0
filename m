Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1CC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE9B810CD;
	Fri,  4 Sep 2026 16:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B8QHandrJP_Y; Fri,  4 Sep 2026 16:22:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB3B5810D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538968;
	b=dkQ/WTjFPpjPHvU5LQYljcwg6PvTRFfVEQbiJR629c2L1G999TWp0702GbkKxuI/+bcX
	 hNxI6WrbOkm7aQe6j61N9g2qP3CzXA6/TdApJdqmAlrFuMkfWz0qrFuLdT2s5t9rIvjmn
	 5HgxCFMDWT3zzb9dqaT9l51HAJKk+YVKmsp+yr8jFgblYS61vhKaL0kpvXi/PCAS8k9pA
	 2AWrjNjEzJZwEIlbVEkxDYlYKNKfcXiqL9qEz/FjQ2E0cvxSVBggyAWtmFbimJQYsZYwA
	 pzLUGFxQ2+g/dm3xxy17MC22rZaWtW1IYBOEPXRR8ZSrQt5JoFuMZP4Iz5faC9G7INQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538968;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YO7VKpRDfDr09aFJkLFq+jWa+06eU5m7wQ5DVk4rlBA=;
	b=OG3FZJ93FqxkSP/QRkKogUxDqvBuewnkvEYpu2EvwKrrzzSRVzIuGOMer2ERJjHD/1Iq
	 QiYk8ulI5vzV+8DmU6kfyXHdb2vDqqZFJ44us3Kzfo5ViM6VAzQAhBCa438HkwCZL4Ii5
	 yqOMKQv2Q5xQ3hz097ET5oIR2IWvYGhky+gwo+JH0W98olEy8YY5L5T1eWxbdT8kfcW2Y
	 BaRzIG3KdOPKWeRvHHLHOmVuMmZNOAtFnqP2okemkS5834A2/IsLHkdx7D2F7P4wBPS6i
	 Y4ndl0yf4xI2Y4wWvCxLNpuIwoKJruyOUuYTHSsPbJMoJzqPpD3o1BVH6Es4kC0rvjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538968;
	bh=YO7VKpRDfDr09aFJkLFq+jWa+06eU5m7wQ5DVk4rlBA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BQF+T1pTIOgaFTEfMGBL9AT7NhtarlW3Z7FEZi/4ZMqYpvD6h40+aQUcSIQEGb2Yy
	 o2qT2rQk2ulXMgUiVnF7gFC80ugyYSUekbdsSoDiBVxQKCny3GEB8rTsZibmiA/mDJ
	 HMGOvYUl4r7jl6BNDYbo8OPyrDhJqYAYqGTaAMJ6vWwfjSNauyUn9bF+Gv7+5B+uAb
	 NjOrspzW7PAgUI+UFbch2EtqwPF+QXYc/HgqzPV/3m67rSg2CSRfX6oVqTdGfiEZ7L
	 CW84MQY4DqA3W45I5BJwksGRROqsQpew97nzZf/55j3W1jWKozbJe5dixWuUIo3elW
	 W8UJ5VZby2vPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB3B5810D4;
	Fri,  4 Sep 2026 16:22:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 384DD3891
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2980580E09
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTkjdlftIoMX for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 89ABF80F6F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=h/rBrtAKf++kTMYETgbgAfrA/HnxLKDkql2cz51drrg5Ud6qvRDGVNs3ScZcRFo7aM2Z
 SuC84jCQRpJ5G0T6zpMEtrzXWMWYeFvvgAnGaojCjlmWfGeNsHjYLV3GJGRM2UwTnIdFK
 p0GwhIjmVtWPA5llqERnY1/suHA0tQEpdYqSZ4QUbSat+q3hINB/y8U3c70JyQtFc9FF3
 WOtt5AlTfJ20QAPFd0Fhwr22KZgGhLzJiseiA8RDPygrwdHbWocp/AOzu+2xgUjJEJLZs
 sP3lVD7uoRNrQH7N62iVWbaET8j/ZSe1UDlBB2pTiScQLPiA0Vx31lHs4F7dirzSMMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9Prez5TRMA6DtIIw6SPwm2W+AjwyM8jGnuDgQZt3abA=;
 b=J4JvKGUO8wfJwLUIXd9kszg1QAefoOy7APvB/wluCY8MDJTk0XtuUpX7obbJxBIF3WQT
 o8QGSu4zwvKLOD9qlEqt+78itGKes5r/bY9ril0NUbNWYNWAjxrk8pd0zXTV1U1CaiCg6
 vlzyHtV8J1/8M7xSHKA6U+2lPFpteI84Tc2j2wa5tNf0/KT+EjEbKZss3EgpWBJJKRUev
 kZ493N2h0dTcOuskywBGNn9uk2KEUNncBNif8V/BA9UcU4+vFCKdDuBhAWlTSE7h6qjp+
 aPeYZeman+YTWM5sQFk26Jr7ZU0o7WDO5NzFz6eSZt3Bl4wA5rHqrYTFZsaUgFuxwjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89ABF80F6F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F01CA94CC4; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 18:18:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db652bbabaa710f2f917b204065d33858a57023c
X-Git-Newrev: 5f2687795595c9af579312c1d504373ece56f43f
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.F01CA94CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Merge branch 'next'
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f2687795595c9af579312c1d504373ece56f43f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
