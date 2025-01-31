Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD974C02190
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C30440913;
	Fri, 31 Jan 2025 16:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twQlZ5KeHanK; Fri, 31 Jan 2025 16:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493034092C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493034092C;
	Fri, 31 Jan 2025 16:53:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4248A12C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F2BA60BE5
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UtgKYfp4lsR for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 16:53:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C38760BAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C38760BAD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C38760BAD
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F69E441D6;
 Fri, 31 Jan 2025 16:53:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tduGM-008SdG-31;
 Fri, 31 Jan 2025 17:53:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <b345d4f8d7c4dcb795ec6fcb9e4aaa5c5cd4553b.1737528518.git.yann.morin@orange.com>
Date: Fri, 31 Jan 2025 17:53:02 +0100
In-Reply-To: <b345d4f8d7c4dcb795ec6fcb9e4aaa5c5cd4553b.1737528518.git.yann.morin@orange.com>
 (yann morin's message of "Wed, 22 Jan 2025 07:48:38 +0100")
Message-ID: <87h65f3oy9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeihrghnnhdrmhhorhhinhesohhrrghnghgvrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/pkg-generic: store real version
 in legal manifest
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > The legal manifest currently stores the $(PKG)_VERSION variable.
 > However, that variable undergoes a set of changes so that it is
 > suitable for creating files and Makefile rules; that new value
 > is purely a technical, internal detail of how Buildroot handles
 > things.

 > In the legal manifest, we need access to the real value for the
 > version, as this is what will allow actual references to the
 > upstream package. If the version string is mangled, like slashes
 > replaced with underscores, this introduces ambiguities as to what
 > exactly the version is.

 > In Buildroot, there is no package, with a constant version, that
 > exhibits that issue; for those packages where it is possible to
 > set a custom git tree and version, like linux or uboot, such a
 > custom tree can have tags with a slash (not a colon or a space,
 > forbidden by git); packages in a br2-external can also use such
 > version strings as well.

 > The packages that do have such versions are not legion, but they
 > do exist. For example, Apache's ant buildsystem does use a slash
 > in their reelase tags, like rel/1.10.15:
 >     https://github.com/apache/ant/tags

 > Change the legal manifest to include the actual, original value
 > as was set in the .mk file.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

 > ---
 > Changes v1 -> v2:
 >   - add example where that could happen  (Luca)

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
