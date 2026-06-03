Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3954CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D81084633;
	Wed,  3 Jun 2026 20:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GDOz9Esc2eU; Wed,  3 Jun 2026 20:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CA4845F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780519230;
	bh=UPNbo4tZBRlQuImj6DZv3nxVJNWCvWen8EhJnxLTdJM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mw6ZcQzQoPC4cY/xEwboLyNX0ZJeJxEM7wdktXDNDrXoaqP1Y4XebB0u1qG43hQaa
	 Rt6EbAKE+EJfCZ4hgh9fSBiwV22yP3sGgJzrhfAX/bX89UzcmGiXEcRfl6e3gQI3W8
	 Ua+ockkLO7VSPuP8HwKqtLw7HmGKFOuF2WYKqLPe7kwDfJUu1d/+1gAzRQdXBdLJUA
	 dC82OTliAbeI8flR2KRFjjoLkuQZSLI0bAFVi+OaaD5qs/a/EcdLZ5z+QgmZwtwm85
	 RIyGkIMBufJ86imlbrYCJtMkBSbb1GvMb+cUdo7xaKYRN1F+JVDdt8UNiWSDK3PZ8h
	 /N9QHQDAaA6tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0CA4845F5;
	Wed,  3 Jun 2026 20:40:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2DAC2F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B371E42996
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 725wK0YJRIKs for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B9984298C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9984298C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B9984298C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:40:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 285070190; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 20:40:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUsNz-0000000ENkp-3YOn;
 Wed, 03 Jun 2026 22:40:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260603201439.3893380-2-ben.wolsieffer@hefring.com> (Ben
 Wolsieffer's message of "Wed, 3 Jun 2026 16:14:40 -0400")
References: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
Date: Wed, 03 Jun 2026 22:40:23 +0200
Message-ID: <87qzmnjr2g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NYIoOjJluuYHFne9jhG7G9cwd1bmDdax4+QBpffpIbZbzWaBxcp6OkSwNzsnztkYOUruFUQi6o3iKBoYupA7wjZ3cNw8F/XDQPy0AjQHl1jeX0A+8GV4J2gvHB7au8tmac7egvzYl7U0ULXhKwdkzYzBWMbdcYmogZkrYAXz7QoHVgYPzZDbZ85Im+m9XB1xVBO+H45ujvQV3AB+HmsC4+XyA37YoNgOhLylCtsxoulUfiqEPDEJH+NeNry4dDn0/nU+DzdbcgVIDHwWqcz9iP3ls3hJPz51aOKpqfz9tSCEnpZA+jeSC17ruZ80WQeGKAY5xICZlAT80K2O+7zrUQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=rD7McGtIJ1EcfFzH4ezLCRDK+SU0pf5U0uXpQD19iYQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=NYIoOjJl
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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

>>>>> "Ben" == Ben Wolsieffer <ben.wolsieffer@hefring.com> writes:

 > It is common to use dropbear as an SSH server while pulling in OpenSSH
 > sftp-server for SFTP support. Currently, this requires installing all of
 > sshd. Add a new BR2_PACKAGE_OPENSSH_SFTP_SERVER option to allow
 > installing just sftp-server. This is enabled by default by
 > BR2_PACKAGE_OPENSSH_SERVER to maintain backwards compatibility.

Out of interest, what advantage does this have over gesftpserver?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
