Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E67C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A7CE817AE;
	Sat, 17 May 2025 20:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reb50ox4VM00; Sat, 17 May 2025 20:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B45811DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B45811DB;
	Sat, 17 May 2025 20:32:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00365201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA83460733
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C2Nhq1X6IVb for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EAC460703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EAC460703
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAC460703
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:32:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41CA7441B3;
 Sat, 17 May 2025 20:32:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGODB-00ElQc-2a;
 Sat, 17 May 2025 22:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org
References: <20250417190544.1075310-1-lancethepants@gmail.com>
Date: Sat, 17 May 2025 22:32:49 +0200
In-Reply-To: <20250417190544.1075310-1-lancethepants@gmail.com> (Lance
 Fredrickson's message of "Thu, 17 Apr 2025 13:05:43 -0600")
Message-ID: <87msbb3rm6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefgfehfeelvdffgfeludejfeeivdejiefgffetveehkefgjeefvefhieehheejkeenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlrghntggvthhhvghprghnthhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcurl: Also specify the CA bundle
 location
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

>>>>> "Lance" == Lance Fredrickson <lancethepants@gmail.com> writes:

 > From: Lance Fredrickson <lancethepants@gmail.com>
 > Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Why? What does that change?

> ---
 >  package/libcurl/libcurl.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
 > index 2066ba0388..509feeab64 100644
 > --- a/package/libcurl/libcurl.mk
 > +++ b/package/libcurl/libcurl.mk
 > @@ -67,7 +67,8 @@ endif
 >  ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 >  LIBCURL_DEPENDENCIES += openssl
 >  LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
 > -	--with-ca-path=/etc/ssl/certs
 > +	--with-ca-path=/etc/ssl/certs \
 > +	--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
 >  else
 >  LIBCURL_CONF_OPTS += --without-openssl
 >  endif
 > -- 

 > 2.39.5

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
