Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3819FCA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 18:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC25240CE3;
	Fri, 15 Aug 2025 18:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R4H6k43uaQF; Fri, 15 Aug 2025 18:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1166340CF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1166340CF7;
	Fri, 15 Aug 2025 18:32:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADAE7196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 945BF41224
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FeeGFDEJckQ for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 18:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DB4C4091E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB4C4091E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DB4C4091E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:32:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87E5A439A7;
 Fri, 15 Aug 2025 18:32:48 +0000 (UTC)
Date: Fri, 15 Aug 2025 20:32:47 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20250815203247.14ecd5f5@windsurf>
In-Reply-To: <154C2C5A-1097-4AD1-A36A-2921CF6264FA@benettiengineering.com>
References: <20250815171954.19b3ea36@windsurf>
 <154C2C5A-1097-4AD1-A36A-2921CF6264FA@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddtfffhvdegueeludeugfelheeifeeuueejjeevhfetueejteejtedvudffhfffnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755282768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEZ7GmaJBSl9Po/HyCDXwYduBogO0b6JBz+JSoH4Ouc=;
 b=n06sLM8oJeKldtUZgWGOWPic1/sE0EvYI4a1JR0QWhfIYUaipdyh1tlYo4HEmmVXxWHBFM
 2qEXRfihU48y20j557Knm6vNlOP3hSyaEITEil9w8ELZ4FDBmqciwR5ag/2sj4xHkCLzrE
 hdQnPWeDFCI1mbPVqXfM41vhOSZ+QsEhcQwp2fp6alyQ/pay2RRSwXh760/KO8sah7X01l
 ylNxs/sOLlAwqsLZvPtaLS6D9RHPyXGATBi+andNxfX2He7tu+JnU5ebF3qHqCesfkx+6/
 zqZ5O7Cj0u59SPfSW4Qn/g98ECb2lV2wYgaaKuO6uKw3PSjClqIUDAowtmRVkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n06sLM8o
Subject: Re: [Buildroot] [PATCH v2] package/libtracefs: fix build failure
 due to missing NPTL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 15 Aug 2025 18:41:02 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> I see. So what about the Fixes: tag pointing the the commit that introduced the issue the same way Linux does?

We already sometimes do that, see for example commit
ab470fbc8eb1053548c3d33e807db84fd5af1445, which has:

    Fixes: 51b27bad915c95499877c8bf9a16a221c904bf82

> The only remaining problem is then how do I point to Autobuilder failure URL?

Two Fixes: tags won't be a problem.

Or the commit introducing the problem can simply be mentioned in the
commit log, like d28ae8b00b7aa5018ec24809ecc393e7420bc292, which goes
like this:

    package/ustream-ssl: fix build w/ mbedtls v3.6
    
    Since the mbedtls bump to v3.6 [1] the ustream-ssl package is failling
    on the autobuilder with the following error:

    [...]

    [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1

    Fixes: https://autobuild.buildroot.org/results/c20/c20dac7cbe5def2c6036d2e1d06de0bfea68b57c

What is important is that the information is available, to facilitate
the effort of the LTS maintainers.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
