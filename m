Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FAED4417E
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 16:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E8885367;
	Tue, 19 Nov 2024 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQJT5TyaXXIX; Tue, 19 Nov 2024 16:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BBE85361
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BBE85361;
	Tue, 19 Nov 2024 16:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6327B27EB
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 16:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 406204022A
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 16:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_rBChiqaB02 for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 16:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E1CF40146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E1CF40146
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E1CF40146
 for <buildroot@uclibc.org>; Tue, 19 Nov 2024 16:12:16 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tDQpl-0002JY-GT
 for buildroot@uclibc.org; Tue, 19 Nov 2024 17:12:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 19 Nov 2024 16:12:05 -0000 (UTC)
Message-ID: <vhidcl$8c5$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] downloads: removing git repos and offline builds
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

I've been using buildroot for many years and have always been able to
archive (previously in SVN, now in Git/LFS) the contents of the
downloads directory so that production firmware can be built offline
using nothing but files checked out from SVN/Git.  A question has come
up with opkg-utils.  It downloads a source tarball and clones a git
repository:

    $ ls -l downloads/opkg-utils/
    total 48
    drwxr-xr-x 4 grante grante  4096 Nov 19 09:25 git
    -rw-r--r-- 1 grante grante   512 Nov 19 09:25 git.readme
    -rw-r--r-- 1 grante grante 36872 Nov 19 09:25 opkg-utils-0.6.2-br1.tar.gz

Actually, I'm not entirely sure whether it downloaded that tarball or
created it from the git repository -- I now suspect the latter.

In either case, I can't archive a git repository.

It _appears_ that removing the git repo and leaving the tar.gz file is
sufficient for doing a build, and if that tarball is present buildroot
won't need to access the upstream git repository (thus allowing
offline builds using the arhcived tarball).

Requiring offline builds for production firmware can't be that unusual.

Is just removing the git repo and archiving the tarball how people
usually deal with this situation?

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
