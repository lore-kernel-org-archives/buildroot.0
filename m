Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7099DE63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 22:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA4382323;
	Sun, 15 Feb 2026 22:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8_FKQUe4Wkc; Sun, 15 Feb 2026 22:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492438231A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771192861;
	bh=GvzUKyQzEb6i7x/pkaFIxO5l7nKGoF8ebAZhdEbtmx4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7iR5eHuQO/64BmGWwHV7ti7SaY2HbRNBkNLHveptNEC2YMuORkUF1aoIEhRu24Oi
	 NNS9Vdx0sCXGLaItJPMFxFNLYInzoM9CI2B1z8kwSr+irFkqseb38vc6W0LeRDe4do
	 uOdApcF1/enk7UMZsO94NW/z2tgsaPSENTDdGMPPMH8OQLeMyhuUdrYEg4m1X5vfLC
	 CVkzv5wmfkURZVjpWO8qHohDpcNN9M0pXqNj335WFZvT2JrtEGZMz0kq6qIMsNzl33
	 xQ5WqpBkaa6BQd8KD3UCLbsEmdmrQimQbE6TUY4ka4n70CcevWWOOK3LruiRR6C7MT
	 5pNr/eJsRWbiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492438231A;
	Sun, 15 Feb 2026 22:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB821EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B75E60782
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KbO3CABRNGEA for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 22:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D957860679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D957860679
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D957860679
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 22:00:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1457333069; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 22:00:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrkAQ-00000009bzu-0VRg;
 Sun, 15 Feb 2026 23:00:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, rafal.susz@gmail.com,
 vivien.didelot@gmail.com
Cc: buildroot@buildroot.org
In-Reply-To: <1b70a9ec-bc22-4f48-9fc6-71d3c6e4f5ab@grenoble.cnrs.fr> (Edgar
 Bonet's message of "Sun, 15 Feb 2026 17:11:57 +0100")
References: <20260215105358.2089856-1-peter@korsgaard.com>
 <20260215105358.2089856-3-peter@korsgaard.com>
 <1b70a9ec-bc22-4f48-9fc6-71d3c6e4f5ab@grenoble.cnrs.fr>
Date: Sun, 15 Feb 2026 23:00:38 +0100
Message-ID: <877bsdpszd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QJ/NusWUyBmLDXaLn8EcLl0gDj8qecushQ4fr4JrFw7MEiwROXWK1FLPUeGwfv9O2z9hmWZVHrEtOodmyPrRca+0NKV5wInelLE1+3d4JRCWsus1dzCEqkgyJUk1vcRGzv5imzz8gYMyH0yvrziLpsyz2DamK33UYZNcBFSFgYqNbnE1aAt4i2s2JjCbkH555JN+dl7TQ1y3Mid/0wfTit/zn74VU64Z7cm+JIXIQUw/7Z1ZOImYNjkqQPSn9qBb5Zl0SxD6jZhWR0I5uWyq8yRw9Bq2JmOxczYvp++xgNOBIS4nalh4Bvy+jxmIq0aBLc0tZ8oXTOLhpxkmztBH7A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=vWlYK9DkUTFCCR8RXWhSGDx5WDMeFatv3DyU1B/mKQU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QJ/NusWU
Subject: Re: [Buildroot] [PATCH 3/3] openblocks_a6_defconfig: specify Linux
 license file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Edgar" == Edgar Bonet <bonet@grenoble.cnrs.fr> writes:

 > Hello!
 > On 2026-02-15, Peter Korsgaard wrote:
 >> The used Linux kernel (4.14.336) does not contain the default license files
 >> as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
 >> Linux syscall note exception"), so specify the correct license file to fix:

 > Note that there are three other defconfigs with kernels older than 4.16:

 >   * s6lx9_microboard_defconfig (4.4.7)
 >   * ts4900_defconfig (4.12)
 >   * ts5500_defconfig (4.14)

True. I wonder if those defconfigs are still useful, given that they
haven't been updated in a very long time:

- s6lx9_microboard_defconfig: When it was added in 2012.05
- ts4900_defconfig: 2017.11, no DEVELOPERS entry
- ts5500_defconfig: 2018.05

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
