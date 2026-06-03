Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A992DCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604B861B46;
	Wed,  3 Jun 2026 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fy2g8mxc_TMx; Wed,  3 Jun 2026 20:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9448661B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780519443;
	bh=m00Rt1SgWlTxZxa5srcJkwq0thBYTjHNlToS7p5iizw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ky3P04FuPJE2DrTY8v0yoSyxRtyVaig/lxrx3uys8USYaGkFfDXyFhM3VEw45wF7m
	 tQDJc7xUd7hhYR1FC42CDKVWki37oZxR/o9cdMoDFp4oU+8joSf33SVm/UsukWURm0
	 ptFRjoYiX13rOnC1z40y/fuW5UIPSqkm5rEM9EiB8IrhJAslXUL7mD4xdUaDM3qKpy
	 DJAlhIjZJ1X/IbKRDkl3iLpTIJkg14ik0DwZ/oZeX9fusRL/VuNHZALBodK46KPNIQ
	 Rgv8x44XqW6ODhlNQBi0Zt2Kn1X2n705AofMdDLtUe6Gag0nKgF5Z7mQvVM6uptFAH
	 +rTK5cLE98wPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9448661B42;
	Wed,  3 Jun 2026 20:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCFE192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71F6561B42
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1xx5u9SdrgL for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07EDD61B41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EDD61B41
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07EDD61B41
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:44:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 8842160;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 20:43:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUsRN-0000000EOFS-3IlI;
 Wed, 03 Jun 2026 22:43:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260603135119.3481791-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 3 Jun 2026 15:51:19 +0200")
References: <20260603135119.3481791-1-bernd@kuhls.net>
Date: Wed, 03 Jun 2026 22:43:53 +0200
Message-ID: <87mrxbjqwm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=V6mH4ALhKKVvVRNPMFK/bTYMIksxoMOyYZIbkeoIyivySVFcMa41Jv29Ehf0TrHHVw1BEFiOHFeamiE0vV6KFspKJcIS9L9Jehrwd0G/UKaL8tCmye6jG5Irz/A5Vm9RMUpS3cvjMzKw5gllA6kuw54+vRzuvCGf3oAdK3uotKTAGaL5CniVsJL+1hcwyd8BNwAS4dkAjCXY9cvO9ORA197c3oAMWNDOd58ROZ9sPxyBe5mVvqKgMNVvE49jjCZb+2QqHqJ+15yW97mKrik6Iwv+QyBPcCoS0onXRarjohJ0TdbJtXkCF9EhzN0sND1O5UKMuEBnP6kpv245+fb2Xg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=PefhNIBlWlDZF1ZVpygKW01lwKY9TUprT3rc81nKVQA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=V6mH4ALh
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.7
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes of this bugfix release:
 > https://discourse.llvm.org/t/llvm-22-1-7-released/90961

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines stopped after reaching the 3h timeout:
 > https://gitlab.com/bkuhls/buildroot/-/commits/2473c919145c6371ad8d51c0c44f4578b54ff998

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
