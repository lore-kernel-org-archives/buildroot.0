Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A887AC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FFB581F84;
	Tue, 15 Apr 2025 20:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smNkcrdkfmSO; Tue, 15 Apr 2025 20:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDB1782C3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB1782C3E;
	Tue, 15 Apr 2025 20:30:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A0C445
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA74B61087
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FMtu85uN1Sn for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:30:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E589610E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E589610E8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E589610E8
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:30:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABD884326A;
 Tue, 15 Apr 2025 20:30:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1u4mvg-009dWX-0E;
 Tue, 15 Apr 2025 22:30:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
References: <20250415200047.2256467-1-peter@korsgaard.com>
 <20250415200047.2256467-2-peter@korsgaard.com>
 <Z_6-cAmygof3BN5v@landeda>
Date: Tue, 15 Apr 2025 22:30:48 +0200
In-Reply-To: <Z_6-cAmygof3BN5v@landeda> (Yann E. MORIN's message of "Tue, 15
 Apr 2025 22:15:44 +0200")
Message-ID: <87y0w1416v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefgleevffevhedtveegfeejieduudeltdffheeggfelkeetkeetuddthfelieeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] Revert "package/libopenssl do not build
 in parallel"
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Pter, All,
 > On 2025-04-15 22:00 +0200, Peter Korsgaard spake thusly:
 >> This reverts commit 27ab880ebb9a3efdec15733841f7b88063604247.

 > I don't think this really is a "revert". Reverting a commit is for when
 > that commit was wrong when it was applied. But here, the commit was not
 > wrong, so it should not be "reverted". Even if the change is technically
 > undone, that's semantically a different thing. But oh well... ;-)

Well, it reverted the workaround?


 >> With the (proposed) fix from the openssl developers added as
 >> 0004-Serialize-install-process-to-avoid-multiple-make-dep.patch, the
 >> workaround can now be dropped so openssl can again be built and installed in
 >> parallel, significantly speeding up builds.

 > Yes, that was a shame that we had to lose parallelism...

I agree, especially since openssl takes so long to build. I have a
defconfig at $WORK where openssl is the package taking longest to
build. This defconfig builds both libopenssl and host-libopenssl, and
together they take over 25% of the build time.


 > Note that I also hit a hihly-parallel highly-loaded build (not install)
 > issue that is still not fixed. Alas, that one is also very, very
 > difficult to hit. We can probably ignore it until I get bitten again and
 > get more traces to inspect...

OK. I have so far not been able to trigger that here.


 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
