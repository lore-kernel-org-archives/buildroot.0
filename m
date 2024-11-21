Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B8ED7877C
	for <buildroot@archiver.kernel.org>; Thu, 21 Nov 2024 15:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FFAD404E2;
	Thu, 21 Nov 2024 15:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4J2Gepxzk4O; Thu, 21 Nov 2024 15:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6006940545
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6006940545;
	Thu, 21 Nov 2024 15:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2356DB69
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0550084466
 for <buildroot@buildroot.org>; Thu, 21 Nov 2024 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXzxo_1baGw5 for <buildroot@buildroot.org>;
 Thu, 21 Nov 2024 15:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E1D384465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E1D384465
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E1D384465
 for <buildroot@busybox.net>; Thu, 21 Nov 2024 15:06:19 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1tE8l7-000A0s-KR
 for buildroot@busybox.net; Thu, 21 Nov 2024 16:06:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 21 Nov 2024 15:06:09 -0000 (UTC)
Message-ID: <vhni91$14ge$1@ciao.gmane.io>
References: <vhlf46$9b9$1@ciao.gmane.io> <vhlr9b$svh$1@ciao.gmane.io>
 <87ldxdrocv.fsf@dell.be.48ers.dk>
User-Agent: slrn/1.0.3 (Linux)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] Large number of duplicate files in sdk
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

On 2024-11-21, Peter Korsgaard <peter@korsgaard.com> wrote:
> > On 2024-11-20, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> >> When I do a "make sdk" (using 2024.02.6), the resulting tarball
> >> contains tons of duplicate files. [...]
>
> Some duplicates are expected, E.G. we have a number of packages that
> can be built for the host and the target (E.G. python3), so if your
> SDK has both host and target variant enabled then there will be some
> duplicated files.

Yes, that I expected. Those files need to be in both places. You can
save some space by hardlinking them, but you actually need two
"copies".  What surprised me was the duplication of the include and
library trees from the toolchain.

I would have thought that foo.h, libfoo.a, libfoo.so, and libfoo.so.1
would only need to be in one place (each). Does there need to be a
copy in both sysroot and opt/ext-toolchain?

Some effort was expended to avoid duplicating the toolchain binaries
themselves, but all of the other files are duplicated.

> So mainly the copy we do of the external toolchain into host/.

And I limited my custom "de-dupe" utility to that case: hard-linking
files that were conceptually "the same file" in duplicate trees. I
didn't link files within sysroot that happened to have identical
content or link files within opt/ext_toolchain because they had
identical content.

> I think we could be smarter about using hard links instead of
> actually copying files / perhaps use hardlink before creating the
> SDK tarball:

We're probably already further down this rabbit hole that it deserves,
but if an include/library file needs to be in sysroot, does it still
need to be in the opt/ext_toolchain directory also? Can we move the
file instead of copying/linking it? Are there some situations where
libfoo.so.1 is used from sysroot and other situations where it is used
from opt/ext-toolchain?  If yes, then moving the file won't work. Are
the two libfoo.so.1 files ever expected to differ? If not, then
linking seems to be the right answer instead of copying.

I tried using symlinks from sysroot to opt/ext-toolchain instead of
hardlinks, but I could not get that to work. I didn't persue that for
long, but it appeared that <something> was refusing to follow symlinks
for <some?> library files. The file was found in the expected
location, but it was the "wrong type": it was a symlink.

--
Grant


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
