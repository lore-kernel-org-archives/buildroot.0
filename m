Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD7EC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 07:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36E39408E5;
	Sat, 17 May 2025 07:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMB0iqebcJKD; Sat, 17 May 2025 07:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B0541259
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B0541259;
	Sat, 17 May 2025 07:11:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9FB5223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F98541259
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbHlfRuXsEWq for <buildroot@buildroot.org>;
 Sat, 17 May 2025 07:11:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 837AA408E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837AA408E5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 837AA408E5
 for <buildroot@buildroot.org>; Sat, 17 May 2025 07:11:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63EC43A80;
 Sat, 17 May 2025 07:11:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGBhk-00CGgJ-0f;
 Sat, 17 May 2025 09:11:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Felicitas Pojtinger <felicitas@pojtinger.com>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <87cyc8c1gi.fsf@dell.be.48ers.dk>
 <20250516225859.1280601-3-felicitas@pojtinger.com>
Date: Sat, 17 May 2025 09:11:32 +0200
In-Reply-To: <20250516225859.1280601-3-felicitas@pojtinger.com> (Felicitas
 Pojtinger's message of "Fri, 16 May 2025 15:58:21 -0700")
Message-ID: <87a57bhftn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehfvghlihgtihhtrghssehpohhjthhinhhgvghrrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnsegrphgvr
 hhtuhhrvgdruhhspdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/5] package/go: fix builds on GCC 15
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

>>>>> "Felicitas" == Felicitas Pojtinger <felicitas@pojtinger.com> writes:

 > Signed-off-by: Felicitas Pojtinger <felicitas@pojtinger.com>
 > ---
 >  package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
 > index 3e4ee574329..3d536a35596 100644
 > --- a/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
 > +++ b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
 > @@ -17,12 +17,13 @@ HOST_GO_BOOTSTRAP_STAGE1_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE1_VERSION
 
 >  # The go build system is not compatible with ccache, so use
 >  # HOSTCC_NOCCACHE. See https://github.com/golang/go/issues/11685.
 > +# CFLAGS and GO_CCFLAGS have no effect, so overwrite CC directly.
 >  HOST_GO_BOOTSTRAP_STAGE1_MAKE_ENV = \
 >  	GOOS=linux \
 >  	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_STAGE1_ROOT)" \
 >  	GOROOT="$(@D)" \
 >  	GOBIN="$(@D)/bin" \
 > -	CC=$(HOSTCC_NOCCACHE) \
 > +	CC="$(HOSTCC_NOCCACHE) -std=gnu17" \

Does it have to be gnu17 specifically or could we use gnu99? We do
support older HOSTCC versions that do not support gnu17.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
