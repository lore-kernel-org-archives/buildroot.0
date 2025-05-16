Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BFBC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC2282C91;
	Fri, 16 May 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOf_ZW116zRw; Fri, 16 May 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E656F82EB6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E656F82EB6;
	Fri, 16 May 2025 21:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE6D1142
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 557BE404F3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ6GNJ60Tf8O for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:00:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EE4D400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE4D400FE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EE4D400FE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:00:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D3FE43B0D;
 Fri, 16 May 2025 21:00:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uG29y-00BrZD-1g;
 Fri, 16 May 2025 23:00:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20250511081145.468544-1-bernd@kuhls.net>
Date: Fri, 16 May 2025 23:00:02 +0200
In-Reply-To: <20250511081145.468544-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 11 May 2025 10:11:45 +0200")
Message-ID: <87v7q02rvx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfeefieeltdeileejudejudfgveehieffgfetheekjefffffhtddvhfevudeiheefnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhophgvnhhvphhnrdhnvghtpdhoiihlrggsshdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: needs autoreconf
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

 > Commit 72657c6f57dd0c2c14cf2033a1e6c77fdc83ee8f bumped openvpn to
 > 2.6.14. While the generated build scripts of the upstream tarball were
 > created using libtool 2.4.6 until openvpn version 2.6.13 now libtool
 > 2.5.4 is used which causes a build error:

 > microblazeel-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

 > src/plugins/down-root/.libs/openvpn-plugin-down-root.lai created by
 > libtool 2.5.4 contains "/usr/lib/libnl-3.la" in variable dependency_libs.

 > Fixes:
 > https://autobuild.buildroot.org/results/ac6/ac60d29fbcd9fb8ddb21b76b3b185e45e580c006/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  package/openvpn/openvpn.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
 > index ce916dba04..0ed1146a8f 100644
 > --- a/package/openvpn/openvpn.mk
 > +++ b/package/openvpn/openvpn.mk
 > @@ -9,6 +9,7 @@ OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 >  OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 >  OPENVPN_LICENSE = GPL-2.0
 >  OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
 > +OPENVPN_AUTORECONF = YES

I think a more generic fix for packages where the release tarball is
generated with libtool 2.5.x would be nicer than this specific /
indirect fix, so I have sent:

https://patchwork.ozlabs.org/project/buildroot/patch/20250516205547.2826778-1-peter@korsgaard.com/

And marked this patch as superseeded.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
