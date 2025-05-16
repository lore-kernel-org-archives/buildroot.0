Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E597C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B83406E2;
	Fri, 16 May 2025 21:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id en-VKqcXndR3; Fri, 16 May 2025 21:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C7AC40524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C7AC40524;
	Fri, 16 May 2025 21:46:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A877D1137
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3D3280E6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbU_5CqZGy_H for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:46:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 899C481113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 899C481113
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 899C481113
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:46:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B45E41CFD;
 Fri, 16 May 2025 21:46:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uG2tE-00Btpp-2T;
 Fri, 16 May 2025 23:46:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20250516211429.763211-1-arnout@rnout.be>
Date: Fri, 16 May 2025 23:46:48 +0200
In-Reply-To: <20250516211429.763211-1-arnout@rnout.be> (Arnout Vandecappelle
 via buildroot's message of "Fri, 16 May 2025 23:14:29 +0200")
Message-ID: <87frh42ppz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepjeekleefueeiheethfejgfeugeekgffhfeehheeludfhteeuveegudeuveffieehnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdphhhtthhpshgrtggtvghsshdrrghspdhgihhthhhoshhtihhnghdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsv
 gdprhgtphhtthhopehsthgvfhgrnhdrnhhitghklhesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] docs/manual/adding-packages-tips.adoc: add
 section about private repositories
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
Cc: stefan.nickl@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > Buildroot packaging pretty much assumes that the sources it downloads
 > are publicly available. In general, however, Buildroot is also used to
 > download sources from private repositories. Nowadays, that mostly means
 > from a github or gitlab instance.

 > Although git-over-ssh can be used for that, this poses a problem for CI,
 > because the CI runners integrated with github and gitlab only have
 > access to the repository itself, not to other private repositories. And
 > creating ssh keypairs for CI runners is tricky.

 > Therefore, document how standard tools can be used to make private
 > repositories available both to developers and to CI. There are quite a
 > few alternative approaches possible, but they're more complicated or
 > less generically applicable.

 > Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
 > ---
 >  docs/manual/adding-packages-tips.adoc | 75 +++++++++++++++++++++++++++
 >  1 file changed, 75 insertions(+)

 > diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
 > index 85400c0f31f..91888898a84 100644
 > --- a/docs/manual/adding-packages-tips.adoc
 > +++ b/docs/manual/adding-packages-tips.adoc
 > @@ -253,3 +253,78 @@ FOO_SOURCE = foo-$(FOO_VERSION).tar.bz2
 >  If there is a specific tarball uploaded by the upstream developers in
 >  +https://gitlab.com/<project>/releases/+, do not use this macro, but
 >  rather use directly the link to the tarball.
 > +
 > +[[accessing-private-repos]]
 > +==== Accessing a private repository for a package
 > +
 > +If you want to create a package in a br2-external tree and its source
 > +is in a private repository (e.g. on gitlab, github, bitbucket, ...),
 > +you have to write it in a way that it is buildable both by developers
 > +and in CI. This poses a challenge, because you need to authenticate in
 > +order to access it.
 > +
 > +There are several ways you can approach this. The following two are the
 > +most practical ones.
 > +
 > +===== Using ssh and +insteadOf+
 > +
 > +Configure your private packages to use ssh.
 > +
 > +----
 > +FOO_SITE = git@githosting.com:/<group>/<package>.git
 > +----
 > +
 > +Developers already have an ssh key installed so they can access it
 > +this way. The only limitation is that if they build in docker, they
 > +have to make sure the ssh key is accessible from within the container.
 > +Either mount the ssh directory into the countainer by passing the
 > +options +-v ~/.ssh:<homedir>/.ssh+, or load the private key into
 > +ssh-agent and pass +--mount type=bind,source=$SSH_AUTH_SOCK,target=/ssh-agent
 > +--env SSH_AUTH_SOCK=/ssh-agent+
 > +
 > +CI builders typically will not have an ssh key that allows
 > +access to other repositories. For those, you'll need to generate an
 > +access token. Then you configure git to replace the ssh access with https
 > +access. As a preparation step in CI, run the following command.
 > +
 > +----
 > +git config --global url."https://<token>:x-oauth-basic@githosting.com/".insteadOf "https://githosting.com/"

The example above used git@githosting.com, so this should presumably use
...insteadOf git@githosting.com:

Otherwise it looks good, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
