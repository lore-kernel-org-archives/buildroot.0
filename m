Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9CAC0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 16:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B2CA81277;
	Fri, 31 Jan 2025 16:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yn7TcMIzOOtH; Fri, 31 Jan 2025 16:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438AF81289
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 438AF81289;
	Fri, 31 Jan 2025 16:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB19D12C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE1681277
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GwYlo8vUo9O for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 16:47:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D061E8132C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D061E8132C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D061E8132C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:47:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 757FB4439E;
 Fri, 31 Jan 2025 16:47:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tduAf-008SD8-2d;
 Fri, 31 Jan 2025 17:47:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
Cc: <buildroot@buildroot.org>,  Julien Olivain <ju.o@free.fr>
References: <cover.1737357470.git.yann.morin@orange.com>
 <1f3b48c849c42f36b11d9b2ee3da8a7e812e9f47.1737357470.git.yann.morin@orange.com>
Date: Fri, 31 Jan 2025 17:47:09 +0100
In-Reply-To: <1f3b48c849c42f36b11d9b2ee3da8a7e812e9f47.1737357470.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 20 Jan 2025 08:17:55 +0100")
Message-ID: <87plk33p82.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefueevfeetfeehueffgfeludegfeefffduveeljeejtdduudejvefhgfevledvieenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohephigrnhhnrdhmohhrihhnsehorhgrnhhgvgdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] support/testing/utils: fix
 get-developers test without a tty
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
 > get-developers will check its stdin to decide whether it is a tty or
 > not, and behave differently whether it is or not. So, when we run the
 > tests, we need an actual tty.

 > However, when running in a CI pipeline, like on Gitlab-CI, there is no
 > tty available on stdin.

 > Fake one. We don't need anything too fancy, so just a slave pty will
 > suffice.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671800
 > Fixes: d10d22221f93 (utils/get-developers: read patch from stdin when
 > it's not a tty)

 > Reported-by: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
