Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA71C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2D1608B9;
	Sat, 17 May 2025 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_6emSbsf2KP; Sat, 17 May 2025 20:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED33D60903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED33D60903;
	Sat, 17 May 2025 20:51:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8329DE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69669608B9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nL66Bm8jD4st for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A57F60903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A57F60903
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A57F60903
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:51:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C007742E7E;
 Sat, 17 May 2025 20:51:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGOUv-00FAIQ-0Z;
 Sat, 17 May 2025 22:51:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: buildroot@buildroot.org
References: <20250408-fix_e2fsprogs-v1-1-cc814171907a@rivosinc.com>
Date: Sat, 17 May 2025 22:51:09 +0200
In-Reply-To: <20250408-fix_e2fsprogs-v1-1-cc814171907a@rivosinc.com> (Charlie
 Jenkins's message of "Tue, 08 Apr 2025 17:03:05 -0700")
Message-ID: <87zffb2c76.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: Don't build docs for host
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

 > texinfo isn't provided for the host in buildroot, but e2fsprogs always
 > attempts to build the documentation. The error that gets printed is as
 > follows:

 > /usr/bin/install: cannot stat 'libext2fs.info*': No such file or directory
 > make[3]: [Makefile:363: install-doc-libs] Error 1 (ignored)

 > This error is ignored but it is unnecessary.

 > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

This is presumably not unique to the host version? Given that this is
intentional behaviour from upstream (hence the "ignored"), I don't think
it makes sense to add the extra complexity.

If you would like to get rid of the warning then please work with
upstream to handle it in a cleaner way (E.G. with a configure flag to
disable docs).

> ---
 >  package/e2fsprogs/e2fsprogs.mk | 6 ++++++
 >  1 file changed, 6 insertions(+)

 > diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
 > index 7f33b256c2626430a4578a9d8ffd8258df364a43..ad65d5189e75808af011ec87f0bee9d252f53767 100644
 > --- a/package/e2fsprogs/e2fsprogs.mk
 > +++ b/package/e2fsprogs/e2fsprogs.mk
 > @@ -56,6 +56,12 @@ E2FSPROGS_CONF_OPTS = \
 >  	--disable-rpath \
 >  	--enable-symlink-install
 
 > +# docs will fail to build for the host because buildroot doesn't provide texinfo
 > +define HOST_E2FSPROGS_REMOVE_DOCS
 > +	rm -rf $(@D)/doc
 > +endef
 > +HOST_E2FSPROGS_PRE_INSTALL_HOOKS += HOST_E2FSPROGS_REMOVE_DOCS
 > +
 >  ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
 >  E2FSPROGS_CONF_OPTS += --enable-fuse2fs
 >  E2FSPROGS_DEPENDENCIES += libfuse

 > ---
 > base-commit: af094ed137d6967afb6270b69c516a22eb9d8091
 > change-id: 20250407-fix_e2fsprogs-68470f22d8cd
 > -- 

 > - Charlie

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
