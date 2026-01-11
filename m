Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AF8D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFB558125E;
	Sun, 11 Jan 2026 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2m4G-SQcbhgW; Sun, 11 Jan 2026 17:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F798100A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152137;
	bh=41GhWZhxfS1fwKK/wQI4qnwPTop+LfubBX7Vg5M9jdE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fl0vQfXu/Cp0NlMdiVcvVhjxWsc0VklWAZCEdex3AoKP8BLH1/biIWr2jiXjtsudd
	 hekUtYaH2Umu56nyWWiSDkc0M4uh+06Ui5mJDdmiILzMwBMK+PiyPHDj+z+qAcaBgf
	 XYIm/JELREIVjH42uVFR/xGrJidtYA3hzH3feo5HQCz15LcMaW6vmX5zfxGPVs/yxH
	 j2Yu0vlUIQTU+HMi9kP9uV997t75hElX8eFCIJRsOp7IzOMP4ZK92dQnvFZcruMO6X
	 9ki6PgSnCv9CScn3glyDfT1oWerxvbenxmVy483TlPM3toYxg6NfOeuixROZ6R8W2k
	 oDLc+jRzlJ7ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F798100A;
	Sun, 11 Jan 2026 17:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0302C18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E868E4018D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkNTwoB_O9pf for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8E4140137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E4140137
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8E4140137
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:22:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -215998613; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:22:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vez8h-00000006snO-21XK;
 Sun, 11 Jan 2026 18:22:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260110180754.2248793-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 19:07:54 +0100")
References: <20260110180754.2248793-1-bernd@kuhls.net>
Date: Sun, 11 Jan 2026 18:22:07 +0100
Message-ID: <87o6n0yshs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Y/trKFOPNM2CGwgmRQK57/1YgKjZO1NXk1iRjOX6TdUOr6ZAuJJXN83r819jdCmOWRCPcslV/UroTb2F2OvXB7guE7JMi/Anw4bgqVKyOuwk7kBJNA6EN1JZaai/uqravjYTF2m/ag/Kw3u8iiNISVXsf+z1ATx06jAis8gFOxSMn06NEv6BeTNdxP9/BvxG9nrC2rqYc17e6lt2IoTANWbPXsqDEwrkx1u+oGkAwQEorTxIn3FY3tpi6m7aLMWKEH6pO4/EDpZHWMZ3d3jZd6QFxUnpLyL9x/tsFj5o3RgHgoO8RXFdEFqfa/sloAkf0JLB0d3zeVDmCCDH/IKO1A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=hs94HVc23w2rxPcl3qicyB1aVd5M57t3ry+sGuD3/3g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Y/trKFOP
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: bump version to
 3.8.5
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

 > https://github.com/libarchive/libarchive/releases/tag/v3.8.5
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed after extending the commit message to make it clear that this
fixes a regression in 3.8.4 (which has been backported to the stable
branches), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
