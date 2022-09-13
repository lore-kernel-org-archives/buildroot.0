Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7134FC6FA8A
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B8C403D0;
	Tue, 13 Sep 2022 14:18:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B8C403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-IM96xovdbX; Tue, 13 Sep 2022 14:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C41740353;
	Tue, 13 Sep 2022 14:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C41740353
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB67A1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A368340353
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A368340353
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCsDDNqD1jJQ for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:18:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564C040350
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 564C040350
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:18:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A247110000F;
 Tue, 13 Sep 2022 14:18:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oY6jv-003OOU-Bi; Tue, 13 Sep 2022 16:18:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <20220729091323.2933595-1-br015@umbiko.net>
 <20220729163718.58963-1-br015@umbiko.net>
Date: Tue, 13 Sep 2022 16:18:15 +0200
In-Reply-To: <20220729163718.58963-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Fri, 29 Jul 2022 18:37:18 +0200")
Message-ID: <87mtb3tl20.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/zziplib: create symlinks
 only if target is missing
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Symlink creation to base file names is only needed for versioned libraries. 
 > Modify CMake rules to prevent overwriting existing libraties with recursive
 > links.

 > Fixes the following autobuild failures:
 > http://autobuild.buildroot.net/results/dd1/dd1974dbc1a22a96a3cedb117417e66119821514/
 > http://autobuild.buildroot.net/results/df8/df8406402ccff7cec34ae5858b8da57d1a4ae9c1/
 > http://autobuild.buildroot.net/results/743/7433a2ad111e2f014c81f196d3d1e2f63dffa858/
 > http://autobuild.buildroot.net/results/79f/79f88e9ec14cda7d07cf689eee864791ba949892/
 > ...
 > http://autobuild.buildroot.net/results/892/8922efbbbfe79e8286a411acce4086b5c77c57c0/
 > http://autobuild.buildroot.net/results/dfa/dfa8ade3a4c1750e6dd58e652f60af2a44f80dd8/
 > http://autobuild.buildroot.net/results/9cd/9cd4147486f32d642513ba14efca3a02d5745ab9/

 > Regression test cases:
 > http://autobuild.buildroot.net/results/ba7/ba711034c0abe980f677e26de41739223e2f66e9/
 > http://autobuild.buildroot.net/results/032/032aaff121fb114f388c67dbca3ad2b02f670e38/
 > http://autobuild.buildroot.net/results/6c5/6c56b645a2b723920f07b98474452824fba5e2c1/

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 > ---
 > Changes v1 -> v2:
 >  - correct file name in generator expressions

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
