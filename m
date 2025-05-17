Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C32C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 377FF60754;
	Sat, 17 May 2025 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv0o4Cdwh4tB; Sat, 17 May 2025 21:10:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6392460B6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6392460B6C;
	Sat, 17 May 2025 21:10:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 362E5E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26D8740900
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-whLNRnsPyo for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 233DF408FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233DF408FE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 233DF408FE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:10:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00D3043409;
 Sat, 17 May 2025 21:10:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGOnw-00FBs5-17;
 Sat, 17 May 2025 23:10:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
References: <20250404-dhrystone_gcc15-v1-1-23d36daa079f@rivosinc.com>
Date: Sat, 17 May 2025 23:10:48 +0200
In-Reply-To: <20250404-dhrystone_gcc15-v1-1-23d36daa079f@rivosinc.com>
 (Charlie Jenkins's message of "Fri, 04 Apr 2025 14:33:39 -0700")
Message-ID: <87tt5j2baf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdfhgeetkedttdffgeduleeiffduvedvteffgeeuteevieeigfefgfdtiedtudeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/dhrystone: Fix function definitions
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

>>>>> "Charlie" == Charlie Jenkins <charlie@rivosinc.com> writes:

 > GCC-15 requires function definitions to have proper arguments. Add them
 > to dhrystone.

 > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
 > ---
 > GCC-15 hasn't been released yet but I was starting to look at what needs
 > to be done to run Buildroot. Here's a patch to fix dhrystone.
 > ---
 >  .../0007-Fix-function-definitions-for-gcc15.patch  | 210 +++++++++++++++++++++
 >  1 file changed, 210 insertions(+)

 > diff --git a/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch b/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch
 > new file mode 100644
 > index 0000000000000000000000000000000000000000..6aa569b7b2e99464eda4008a058a65550a9dd4ca
 > --- /dev/null
 > +++ b/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch
 > @@ -0,0 +1,210 @@
 > +From b929daf9a5d61d8581e04b0a0c27252d3fe7b7a9 Mon Sep 17 00:00:00 2001
 > +From: Charlie Jenkins <charlie@rivosinc.com>
 > +Date: Fri, 4 Apr 2025 14:22:35 -0700
 > +Subject: [PATCH] Fix function definitions for gcc15
 > +
 > +Correct function declarations to contain args.
 > +
 > +Fixes:
 > +
 > +dhry_1.c:176:19: error: too many arguments to function 'Func_2'; expected 0, have 2
 > +  176 |     Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
 > +      |                   ^~~~~~  ~~~~~~~~~
 > +dhry_1.c:35:17: note: declared here
 > +   35 | Boolean         Func_2 ();
 > +      |                 ^~~~~~
 > +dhry_1.c:182:7: error: too many arguments to function 'Proc_7'; expected 0, have 3
 > +  182 |       Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
 > +      |       ^~~~~~  ~~~~~~~~~
 > +
 > +Upstream: dead

Given how upstream is indeed dead, I think it is easier/nicer to just
force -std=gnu99 mode when compiling to fix the GCC-15 issue.

I have sent a patch doing so here:

https://patchwork.ozlabs.org/project/buildroot/patch/20250517210922.3620220-1-peter@korsgaard.com/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
