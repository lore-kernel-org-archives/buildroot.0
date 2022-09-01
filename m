Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B9FECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 662D34055D;
	Thu,  1 Sep 2022 20:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662D34055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtWU39FqM6hz; Thu,  1 Sep 2022 20:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 706624052D;
	Thu,  1 Sep 2022 20:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706624052D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B85991BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D1E18278F
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1E18278F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72uaqc88zzsP for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0980282786
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0980282786
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 20:32:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1oTqrA-0007f2-Sb
 for buildroot@busybox.net; Thu, 01 Sep 2022 22:32:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 1 Sep 2022 20:32:01 -0000 (UTC)
Message-ID: <ter4s1$s24$1@ciao.gmane.io>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io> <20220901194825.GM68979@scaer>
 <ter3cg$lbs$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-09-01, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> There's no way I can justify rebuilding the toolchain with uClibc
> wchar support enabled for gesftpserver when nothing else in my system
> needs wchar support. I'll have to figure out a new test/development
> workflow that doesn't use "scp" to copy files onto the target.

It looks like the only place wchar support is used is in a couple
spots in sftpclient in the interactive output handling where somebody
is trying to keep things pretty by checking how many display columns
will be occupied by a filename before it's printed using
printf(). [For example in the output of the the "ls" command built in
to the client, it tries to figure out how many columns of filenames to
print, and how to pad them to keep things aligned.]

The server doesn't need wchar support at all.

So the easiest option for me is probably to change the .mk file to
just build/install the server and not the client. I suppose the proper
thing to do would be to change the Config.in file so that building the
client is optional and wchar support is only required when the client
is built.

Or I could patch the client so that if libc doesn't have wchar
support, it assumes that number_of_columns(filename) ==
strlen(filename). People without wchar support who use UTF8 filenames
would have to tolerate columns that don't line up in the output from
the "ls" command.






_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
