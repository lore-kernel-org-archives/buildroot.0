Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9386C6FA82
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 23:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07FAB418D3;
	Thu,  8 Sep 2022 23:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07FAB418D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK40ZmdzUvZk; Thu,  8 Sep 2022 23:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB8C418CA;
	Thu,  8 Sep 2022 23:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB8C418CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6868D1BF370
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 23:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 424E382F87
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 23:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424E382F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05ywXBBckLWG for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 23:21:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B29A82F77
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B29A82F77
 for <buildroot@busybox.net>; Thu,  8 Sep 2022 23:21:21 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1oWQpi-00004x-47
 for buildroot@busybox.net; Fri, 09 Sep 2022 01:21:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 8 Sep 2022 23:21:13 -0000 (UTC)
Message-ID: <tfdtd9$17g0$1@ciao.gmane.io>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io> <20220901194825.GM68979@scaer>
 <ter3cg$lbs$1@ciao.gmane.io> <ter4s1$s24$1@ciao.gmane.io>
 <tera67$v9n$1@ciao.gmane.io>
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
> On 2022-09-01, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> The server doesn't need wchar support at all.
>
> I got gesftpserver's server to build without wchar support, and it
> works fine. But it's auto-selecting iconv. That makes the total rootfs
> size increase for the gesftpserver almost 1MB, and I can't justify
> that.

I looked at the iconv use, and it looks like it should be pretty easy
to make iconv a configurable option -- whether that would be accepted
upstream is another question.

But, I finally realized that my problem was triggered by an upgrade to
openssh's "scp" utility v8.8 which uses the SFTP protocol by default
instead of the SCP protocl. [If I wanted to use SFTP, I would have
typed "sftp" not "scp".]  It turns out that with openssh 8.8 "scp -O"
works fine with dropbear. Unfortunately there's no config file or
environment variables for scp like there is for ssh.

--
Grant



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
