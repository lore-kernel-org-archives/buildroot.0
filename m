Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A836CCF9F8
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EAD140A24;
	Wed, 12 Nov 2025 07:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NMJEQ2P5x5s; Wed, 12 Nov 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AD440A29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71AD440A29;
	Wed, 12 Nov 2025 07:55:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50847FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FF578156B
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eZ64CiHHp_J for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 305B181517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 305B181517
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 305B181517
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:55:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 908480192; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 07:55:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJ5hW-00GnxF-22;
 Wed, 12 Nov 2025 08:55:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20251111114645.978645-1-ju.o@free.fr>
Date: Wed, 12 Nov 2025 08:55:34 +0100
In-Reply-To: <20251111114645.978645-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Tue, 11 Nov 2025 12:46:45 +0100")
Message-ID: <87346jvg5l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TQSs3ymUZAQXfzQSOOtjTt/BE27NtMs+yxsYWsTUiMoiehvikKAfIWDANNmFVtY+h11t1wOlrk4PLBuE/+8KRdovm52tHYDRDLcthqGcW3xpI53pobxXqJ1VWz9yOZiywkZb27ho76R0Y3xt7Jtzv7TcW9DiJmVmVk81ITlM8M0fIFxP1Sub2Aap98NLg+DjEHzf1rtStX98noe2Wb/yfwPFtVnv7ItLrJkfJWOze9A0wRwUGLDVq7zyZxQLeQRz9Xe21baXt0NnVaXD/6/hZK/+EuK7YgeYyjphFcXWF6jcpvRydqHh4ksDWZ4hYRv9DoRIMsvmMFP3RncOfF0pIQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=OTUm9hC5l3DEOxV8X00E30/9xkLR9KcTRc7j5upB1Cg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=TQSs3ymU
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump version
 to 10.11.15
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For release notes since 10.11.11:
 > https://mariadb.com/docs/release-notes/community-server/10.11/10.11.12
 > https://mariadb.com/docs/release-notes/community-server/10.11/10.11.13
 > https://mariadb.com/docs/release-notes/community-server/10.11/10.11.14
 > https://mariadb.com/docs/release-notes/community-server/10.11/10.11.15

 > Note: the version 10.11.12 is documented as fixing the following CVEs:
 > https://www.cve.org/CVERecord?id=CVE-2025-30693
 > https://www.cve.org/CVERecord?id=CVE-2025-30722
 > https://www.cve.org/CVERecord?id=CVE-2023-52969
 > https://www.cve.org/CVERecord?id=CVE-2023-52970
 > https://www.cve.org/CVERecord?id=CVE-2023-52971

 > Also, since Buildroot commit [1] "package/libxml2: bump version to
 > 2.15.1", MariaDB is failing to build. This new maintenance release
 > fixes this issue.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/11943845663
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/12026402485

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a67cff491a173c88187ce76e0d3cdccdb48371fc

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/12044712660

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
