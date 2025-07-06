Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A8DC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 03:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F14080C5B;
	Sun,  6 Jul 2025 03:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYC2Qz7CUf8X; Sun,  6 Jul 2025 03:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F76380C70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F76380C70;
	Sun,  6 Jul 2025 03:52:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A1812E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8E8360679
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygUX5dsWCGUL for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 03:52:50 +0000 (UTC)
X-Greylist: delayed 906 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 06 Jul 2025 03:52:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE61E607CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE61E607CD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE61E607CD
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 03:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751773061; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BwGoHr8h2UX+zkCcawnk09bwqjuqlv/8Sd0HqE12CvGvPc4POe1hcboJEC11GAD0vPuQCWDn+g34UlvJslHJctHvgtIvSEYaosdy+uYNuZQ/shkLHwCMstjiZ3WMR1DRJ8lBSrj86s/2H2KLz/lEPJhX0ILb0rJpSrln0GP0c44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751773061;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=fLeZlxmTDbSfi2QEyG9rWBcugnAkQH3Ire15F+V8Ytk=; 
 b=PBXgEyPPMfcx521A9446LdRVyAo4A2lpOPS5nrnwU+G7y3vo7zngZeehIr3IKSGY/YwFOFeGXy6qF6XrOokzksfkq+xz2A8Aq+cKKP/ViQYkJKsNM/EkP+ndKSevya96u7CcJgZOd2U9uHqoaPAM5esWT4F0vStRA/as3pFr0yA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1751773059094727.0505615593551;
 Sat, 5 Jul 2025 20:37:39 -0700 (PDT)
Date: Sat, 05 Jul 2025 23:37:38 -0400
Message-Id: <DB4NQ16PKVED.2I7DATK1AFI76@matt-silva.com>
To: <buildroot@buildroot.org>
From: "Matthew Silva" <dev@matt-silva.com>
Mime-Version: 1.0
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
X-ZM-MESSAGEID: 1751762786782134400
X-ZM-MESSAGEID: 1751762808133134400
X-ZohoMail-Sender: Matthew Silva
X-ZM-MESSAGEID: 1751771207371134800
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1751773061; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=Content-Type:Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:From:From:Content-Transfer-Encoding:Mime-Version:Reply-To:Cc;
 bh=fLeZlxmTDbSfi2QEyG9rWBcugnAkQH3Ire15F+V8Ytk=;
 b=LzY8OEA045Ip9n7jyAQ38Izz5L7uUdqYS4RQUDFWoSewPTaiP+aIBxSniuz2JO4X
 3hKV/v0b82MpourEFV0cZZpY9koJR12AGbXL51BZo3Wehj5NWarqhbRvw53MkSFcks7
 7LBvJiKSjwpBqJxruGiD1hMOrX20sr/vlIsxErG8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=LzY8OEA0
Subject: [Buildroot] [Question] Difficulties with Autotools and nilfs-utils
 package
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

Hi all.

I am in the process of attempting to add partclone
(https://github.com/Thomas-Tsai/partclone) to buildroot; however, I'm
running into some issues with its dependency on the nilfs-utils package.

I add it as a dependency both in the Config.in and partclone.mk file but
when the autotools ./configure runs for partclone, it fails with an
error saying it is unable to find the "nilfs.h" header file.

Looking at the target /usr/include folder, the nilfs.h header is
installed there. However, it is not present in the sysroot /usr/include
folder.

Comparing this to the e2fsprogs dependency that partclone also has, the
required "ext2fs.h" header file gets installed in both the target AND
the sysroot /usr/include folders.

My understanding is that autotools is failing because it expects the
nilfs.h file to be in the sysroot. And it needs to be in the sysroot
because that is where the cross-compiler (x86_64-buildroot-linux-gnu in
this case) looks for files when building for the target. (Please correct
me if I am wrong on either of these).

I am unable to figure out why the nilfs-utils package will not install
its headers into the sysroot folder. I am not sure if it is a buildroot
setting or an autotools setting that would be the cause of this issue.

Curious if anyone has seen this before or knows what could be causing
this. Any guidance is appreciated.

Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
