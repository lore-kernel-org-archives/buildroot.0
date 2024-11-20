Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF322D63939
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 13:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5678D48925;
	Wed, 20 Nov 2024 13:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcfYaqq1WG9w; Wed, 20 Nov 2024 13:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ECF7489A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECF7489A8;
	Wed, 20 Nov 2024 13:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8594970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 13:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51E740003
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 13:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 911TOGdipEmQ for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 13:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7F9040137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F9040137
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7F9040137
 for <buildroot@uclibc.org>; Wed, 20 Nov 2024 13:25:38 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tDki7-0002rC-U6
 for buildroot@uclibc.org; Wed, 20 Nov 2024 14:25:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Nov 2024 13:25:29 -0000 (UTC)
Message-ID: <vhko09$a5m$1@ciao.gmane.io>
References: <mailman.17954.1732090118.1448558.buildroot@buildroot.org>
 <eb63a9dac0a90b6aa67315f285039615__24185.6297756144$1732095375$gmane$org@umbiko.net>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] downloads: removing git repos and offline builds
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

On 2024-11-20, Andreas Ziegler <br015@umbiko.net> wrote:
> On 2024-11-19 16:12, Grant Edwards wrote:
>
>> [...] A question has come up with opkg-utils.  It downloads a
>> source tarball and clones a git repository:
>> [...] 
>> Actually, I'm not entirely sure whether it downloaded that tarball or
>> created it from the git repository -- I now suspect the latter.
>
> The order is git repository -> tarball -> build directory.  The git
> repository will be reused or recreated if either the package version
> changes or the tarball is removed. I use this behaviour occasionally
> to 'fake' package versions.

Thanks for confirming that.

>> [....] Requiring offline builds for production firmware can't be
>> that unusual.
>> 
>> Is just removing the git repo and archiving the tarball how people
>> usually deal with this situation?
>
> Any objections to just using a line in .gitignore?
>
>    downloads/*/git

Not really, that should work fine. I initially decided to remove it
just to be sure whether or not it actually needed to be there to do a
build.

--
Grant



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
