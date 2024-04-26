Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00805C4345F
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 06:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DB983579;
	Fri, 26 Apr 2024 06:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmiHT9-fCqPl; Fri, 26 Apr 2024 06:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3D683592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3D683592;
	Fri, 26 Apr 2024 06:32:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7A161BF35B
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99E3141ECD
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 06:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwpoT17XZtnC for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 06:32:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE79241E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE79241E18
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE79241E18
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 06:32:36 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id E5E6BBDEC34F;
 Fri, 26 Apr 2024 08:27:19 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Apr 2024 06:27:19 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Andrey Nechypurenko <andreynech@gmail.com>
In-Reply-To: <mailman.16000.1714065752.13795.buildroot@buildroot.org>
References: <mailman.16000.1714065752.13795.buildroot@buildroot.org>
Message-ID: <8f4c7132e2f8ed4101191c93dd1177ab@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1714112840; bh=2B/9IJGSCm9TEZUOKvSn4h+6/blq/iwyzIL5P2o8KlA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=PbJ2ci9d1Dges6VTYZkhmWby/YeuSPKwjzPKSxXNmiNKkrPhnV2k2VvGCgzyExW8C
 7PTB3JvElcJ19b1FRUeMb8suhI2zWYByVLg6kX+40YIJfd8r5Q23laqrGw3RPj2VVk
 Yqoa2rdJAhZdIPW/QyatFlivjqd37VJcb0Q4o0sE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=PbJ2ci9d
Subject: Re: [Buildroot] Growing rootfs.cpio after each make
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrey,

On 2024-04-25 17:22, Andrey Nechypurenko wrote:
> Hi Folks,
> Am I the only one with the problem mentioned below? :-)

Probably you are unique in that respect. The rootfs.cpio is deleted 
before re-creating it. Things that change with each call to make are:

   Target directory finalization
   The rootfs overlay files are rsynced into the target directory
   Post-build scripts are executed
   User and device tables are generated
   The cpio is created by cloning the target directory

> On Fri, 19 Apr 2024 at 13:34, Andrey Nechypurenko 
> <andreynech@gmail.com> wrote:
>> 
>> Hi Buildrooters,
>> 
>> I have BR2_TARGET_ROOTFS_CPIO enabled and just realized that every
>> time I run make in the build directory, the images/rootfs.cpio file is
>> growing. Even deleting the file before make still results in an ever
>> growing file.

You will have a size increase whenever you change package software 
versions and the resulting binary uses the full version string in its 
name. E.g. changing the kernel version will result in an additional 
directory in target/lib/modules.

If your image changes size by itself, maybe there is some process which 
leaves files behind in the target directory, for example a post-build 
script? In that case, check if file permissions allow unrestricted 
creation /deletion of files for your user id.

>> So I am wondering why it is happening and if there is any way to
>> prevent this without running make clean all or similar? Maybe some
>> kind of pre- or post-build scripts?
>> 
>> Thank you,
>> Andrey.

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
