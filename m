Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3625C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 17:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A9081220;
	Fri,  6 Jun 2025 17:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaTGveela-ZW; Fri,  6 Jun 2025 17:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E65811E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E65811E5;
	Fri,  6 Jun 2025 17:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B86D3255
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA63160A96
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NwojyXy-hCm for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 17:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 214C260723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214C260723
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214C260723
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 17:28:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88B0E43B29;
 Fri,  6 Jun 2025 17:28:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uNarN-005RnQ-2q;
 Fri, 06 Jun 2025 19:28:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <e5b537b303b5e57c90925196afa558503f6f6072.1749201612.git.baruch@tkos.co.il>
Date: Fri, 06 Jun 2025 19:28:05 +0200
In-Reply-To: <e5b537b303b5e57c90925196afa558503f6f6072.1749201612.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 6 Jun 2025 12:20:12
 +0300")
Message-ID: <87qzzweq56.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsrghruhgthhesthhkohhsrdgtohdrihhl
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build with HTTPS-RR
 disabled
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

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Experimental HTTPS-RR support is disabled by default. curl version 8.14
 > added configure check for double resolver, threaded and c-ares, when
 > HTTPS-RR is disabled, failing configuration.

 > Add option to enable HTTPS-RR. When not set, disable the threaded
 > resolver if c-ares is enabled.

 > Fixes:
 > https://autobuild.buildroot.org/results/45e5cd39fddee64f38cf4601877826ff7433a26b/
 > https://autobuild.buildroot.org/results/9e9c8b28c476544a1a5cb4f62666525225e15aca/
 > https://autobuild.buildroot.org/results/ea44b98214c3c8d744815e2a866fbf8776291829/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/libcurl/Config.in  | 5 +++++
 >  package/libcurl/libcurl.mk | 9 +++++++++
 >  2 files changed, 14 insertions(+)

 > diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
 > index 0e52bc69c286..3612166f8eac 100644
 > --- a/package/libcurl/Config.in
 > +++ b/package/libcurl/Config.in
 > @@ -36,6 +36,11 @@ config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
 >  	help
 >  	  Enable support for websockets.
 
 > +config BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT
 > +	bool "HTTPS-RR support"
 > +	help
 > +	  Enable support for HTTPS-RR.
 > +
 >  config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 >  	bool "enable extra protocols and features"
 >  	default y
 > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
 > index 8501910ac5d2..1c2f6ce919aa 100644
 > --- a/package/libcurl/libcurl.mk
 > +++ b/package/libcurl/libcurl.mk
 > @@ -170,6 +170,15 @@ else
 >  LIBCURL_CONF_OPTS += --disable-websockets
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_LIBCURL_HTTPSRR_SUPPORT),y)
 > +LIBCURL_CONF_OPTS += --enable-httpsrr
 > +else
 > +LIBCURL_CONF_OPTS += --disable-httpsrr
 > +ifeq ($(BR2_PACKAGE_C_ARES),y)
 > +LIBCURL_CONF_OPTS += --disable-threaded-resolver

We already handle enable/disable threaded resolver above, so it is a bit
odd to pass both --enable-threaded-resolver AND
--disable-threaded-resolver.

Given that the HTTPS-RR support is experimental, maybe a simpler patch
would be to do:

# ares cannot be used with the threaded resolver
ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
LIBCURL_CONF_OPTS += --enable-threaded-resolver
else
LIBCURL_CONF_OPTS += --disable-threaded-resolver
endif


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
