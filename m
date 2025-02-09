Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF91FC02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 10:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7594D833AF;
	Sun,  9 Feb 2025 10:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSN-MUNpoIwm; Sun,  9 Feb 2025 10:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA7483280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA7483280;
	Sun,  9 Feb 2025 10:13:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09654199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 025C983280
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrQ7FGJtTpHN for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 10:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 123D983231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123D983231
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 123D983231
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:13:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BCEB43210;
 Sun,  9 Feb 2025 10:13:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1th4Jj-003smy-2x;
 Sun, 09 Feb 2025 11:13:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
 <20250208142327.418271-3-romain.naour@smile.fr>
Date: Sun, 09 Feb 2025 11:13:35 +0100
In-Reply-To: <20250208142327.418271-3-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Sat, 8 Feb 2025 15:23:18 +0100")
Message-ID: <87y0yf77e8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefgeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeejueevieeiiefhtefhffekudfhkeffffejvdelleejjeetgfetveehieejkeejtdenucffohhmrghinhepshgrmhhplhgvpghphihthhhonhgprghtthhrshdrphihnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 02/11] support/testing/tests/package:
 sample_python_*
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > flake8 5.0.4 provided by Debian 12 (bookworm) now detect a missing
 > whitespace after 'assert' keyword:

 >   E275 missing whitespace after keyword

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

You seem to be missing something from the commit summary line, so I
added ": fix flake8 errors".

> ---
 >  support/testing/tests/package/sample_python_attrs.py      | 8 ++++----
 >  support/testing/tests/package/sample_python_colorzero.py  | 6 +++---
 >  support/testing/tests/package/sample_python_constantly.py | 6 +++---
 >  support/testing/tests/package/sample_python_gpiozero.py   | 2 +-
 >  support/testing/tests/package/sample_python_passlib.py    | 4 ++--
 >  support/testing/tests/package/sample_python_rpi_gpio.py   | 2 +-
 >  6 files changed, 14 insertions(+), 14 deletions(-)

 > diff --git a/support/testing/tests/package/sample_python_attrs.py b/support/testing/tests/package/sample_python_attrs.py
 > index f224944914..a5f63f9e40 100644
 > --- a/support/testing/tests/package/sample_python_attrs.py
 > +++ b/support/testing/tests/package/sample_python_attrs.py
 > @@ -8,8 +8,8 @@ class Obj(object):
 
 
 >  obj1 = Obj(2)
 > -assert(obj1.x == 2)
 > -assert(obj1.y == 1)
 > +assert (obj1.x == 2)
 > +assert (obj1.y == 1)
 >  obj2 = Obj(3, 4)
 > -assert(obj2.x == 3)
 > -assert(obj2.y == 4)
 > +assert (obj2.x == 3)
 > +assert (obj2.y == 4)

The extra paranthesises are not really needed, so I've dropped them for
clarity and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
