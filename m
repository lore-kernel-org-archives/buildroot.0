Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181CAC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20C840558;
	Sun, 13 Sep 2026 20:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dJ4yaOyywbf; Sun, 13 Sep 2026 20:40:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6829340592
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789332048;
	b=eKCvSfvIpB0QTyKcI7QWKAT6EjqZk8LfZkwabwE0QpxianmNjVZGsYpMalxnuROV5IJi
	 6nj33xRx6lushAekGcX7x1to02wFcw+4iQ53bpV417PpDyCq3A4T1j+xog81tVo7jXoBl
	 Scfny++CtU9MpNFC2ggv7UxcQqhuWqUmFxnzF+p5klO54M8Xm77pk2f73vGihzf8dQrUR
	 Ff4ibcswPhHTwf2kGS6pFPkZQwQe1YjboUd18hV0MJ2BPqDD0F26hvMFHoIt82tbiJMdE
	 1ydfpnsfi8P29Lr1LH3KeYfSDCzcOm6/iu8RhE+EgibELH6It2UkcZpJNfWU79i4yEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789332048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:User-Agent:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u4L4OC35Alvyr1wGFmY9897JpsmveWKwBNknu3qnqYc=;
	b=mxqJQMpXz+dlMh+R9QKNRo/y2v1CptGBAb8hdDe5nmV0/idxNHSwuiEtd23dmfTqdFil
	 GvqfFWLKwFtUlbnuQJGZlxY8v3tM4FHqp1kDyrC4aLgBtNyyWN1d4MS5ZGeE1ScxMZhtb
	 9tc+VWGx8/k/i2cLFcs7aknlGZesl1E5DEClte0xVvg3AFgy34t9tZ+nAfVP0FPyk0iFs
	 oyPPlmBsmJRQAz9PVanRh+r9Tp1QJOja6H9HSUSMSvC1H8H3sTrghMbDNOz9Tloqv1zGZ
	 5C+LcDeshFOcgoRpYcwfbYKCYIq5U5yG1WCHtT/+MIaQBFmEzS5JmbRDJyHZ1+3HoAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789332048;
	bh=u4L4OC35Alvyr1wGFmY9897JpsmveWKwBNknu3qnqYc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hvWLKU3ea5koDhIrl4jyPkZT89IAwi/uj2V2RQHvqzn3Dt50aIUyW5VxxpZAMmovg
	 l8114fyTzNEf0OEC68q2E3Mr/MYleg8L8PFYUde+cOB80+GkZzEVotMEijg7Up+fzu
	 XypltPmuu6zeoTTScPHg9YvCIKcBnC37otv784fs++v5YcsbeidUzPBldElAvfNHZu
	 +npr/HhcGLYWg9R0u661c+pjrhiKVJZdO4+kEU+pVf/colc93ZoL2QPp19sNaqPakV
	 ghnJo6cy2rHKgTyx41uJ7PnxZhisWrMWw/+Oumn3dFB3WODBoFl2xbdm1m+IWG18F6
	 kaGA2WVbMmMFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6829340592;
	Sun, 13 Sep 2026 20:40:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1344529B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC6780CDF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6i70-HdFFuH for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 20:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8BEF080CDE
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789332045;
 b=qlmh8zG8JwtztbVSpafYdI3quBVg+LKfLW7yP8xUPCDYZ0WlK7CldHsB/RjV+K8g2wD6
 eu1YjUF6CEbKQwX8YsyyL3sBiGZbktmc9TKxDaXh9hPS5PvNj0lrcKfX8P1V8vmj7hdfv
 CQn4SmE6qPs7LU2zkxiWLtA7TW8W+sDWde1SR5hX3m63j9pNPkKYsFo/1/DdKSk9YyREx
 uqWUdJg1Sfx2nhk0HhefCPq8YN0edhjLOTSMN4XrHm95J3edbYz+rEvQRB7vzbzYtOrdd
 /tz0g7hLtrllvlXM/tEIohTfHO9psWvIfQhbCtWYJLdW9Ia5UtIZF5vFFt9e80WIH0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789332045;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Subject:Date:Message-ID:User-Agent:MIME-Version:
 Content-Type;
 bh=a1PEuarj1HjKdfzbSqNI366r4MMMxceH2qQAI2er8OM=;
 b=JV/ScPQGD09P20Ws6RRMJc/KTVfpx39NsLF8lZjrseOPZaSLbPc4qhMOiRIwJZWNKJkx
 3L+G30OA9T3zJREKxFqZ60QskZNxyI5Iqr0WZUJ+wUrvQIt98p6a9t5I1oMiz9zVv0oXD
 aUOffJby2C2bsl3ytDyfl5Ehiu/Wd5wGOmL7mmIqwdUW5w7fZgCkshVavFBIfMj5bf6kZ
 60OeLzGWHRMSBVdsgYgAec6u3AR1d2ojtQd5EOq2X0SOKnN7E5FY1Zv9Pj8bvPl41FQFT
 N1iPo3S+Bq7TKu/exXLa16bJQRJB6BnleTEG7D0M/RJtb3vGTqElyNgnxX6AS6PHvtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=HYv56ORq; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=HYv56ORq
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BEF080CDE
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:40:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HYv56ORqXPw968H93M6oxjszafh6zYcK7HoHUwm8UyHPT3mctWMazi8M6j1WXelkJaUhS1tVA/0/yX4NanaxLsT5a13qBi/oTJ+ifycs99jWl5y3Pfgfvd5+Q3Wnbe+1dWHJQo0MRt5Tym/WSEdbzBo+liMONqbFPOgDgCNg2kB2L2b7VVGnmRAn2sdhEc7hYzbjfHzdp5uL8C4H1v+Pig9moWRYlzATSLOmp6hINPwLamzP2OPBl+6FZPCvlWLtDOlmUitIn+fH4xlDqVLxmvi+gOb9jmxB1AOVbC19PtZYFh6URl3BcEraSRjnYf+L9RXmEReebLIox91epjjeLg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=982VP6cyJ/gy//k2k95dUuPnAXHGLx7TzgGFviZ35jM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 996184432; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 13 Sep 2026 20:40:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x5r0C-0000000FZhZ-2c6x;
 Sun, 13 Sep 2026 22:40:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org, buildroot-lts-sponsors@buildroot.org,
 buildroot-users@buildroot.org
Date: Sun, 13 Sep 2026 22:40:40 +0200
Message-ID: <87a4pkx4tz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: [Buildroot] Request for testimonals from users for Buildroot 25y
 talk
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

Hi,

Buildroot turns 25! And to celebrate, we are doing a talk about the
history at the Embedded Linux Conference in Prague, October 9th:

https://osselceu2026.sched.com/event/2Ragq/buildroot-at-25-a-quarter-century-of-making-embedded-linux-easy-peter-korsgaard-barco?

For this talk it would be interesting to give some examples and
testimonals from companies or projects using Buildroot, E.G.:

- Name of company / project
- What product(s), ideally with a picture
- How long have you used Buildroot for this?
- Any additional notes or testimonals, why Buildroot?

Please reply to the list (or me directly if you prefer), then I will
collect the responses together and pick a selection for the talk.

Thanks in advance!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
