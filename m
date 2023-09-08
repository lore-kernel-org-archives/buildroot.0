Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8BBEEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7DAD40250;
	Fri,  8 Sep 2023 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7DAD40250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qIu668cIqFL; Fri,  8 Sep 2023 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76359402B5;
	Fri,  8 Sep 2023 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76359402B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E91CD1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19C340A5B
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19C340A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLL_HSHB6lr7 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:32:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52D6440220
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D6440220
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6521AE0002;
 Fri,  8 Sep 2023 20:32:40 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:32:39 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230908223239.06963447@windsurf>
In-Reply-To: <20230906200929.291410-1-dalang@gmx.at>
References: <20230906200929.291410-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694205160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItZP6fkQ1GQ/bVhEON2tIsxOn0tjWyFhcC8cbFR/rD4=;
 b=H5+c9+9nfBFR0lKMnk87hbn0vlbLmiGbksECbhzYgNqEZDPal+dRZyC3o6QZHK6Hlufr5k
 mHo7THMd0CxhMs1h3Fl4UNJEVIaSw/T5biuguraKht5QuhAHJLh6yQelOPw3rMPnJFHf7G
 lYmYxJMQIuP/t43Wa4KPg2ZdaYKxcrfl7VRqsHGEMKB380U7iqAf2W86sGZx9NC6d/93b1
 l3JRdgIQVm3dXIwceDv5luI7x98H0yW45C5zZJIQqNHcKoQpjsE9d3pdGYVhYTGDQZgMpi
 DeO2kCQ8xw1XAKQZeiliOJgucGB0w45p9BBLyezg5f0/IoTu4KgJ7+ZVBQaC/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H5+c9+9n
Subject: Re: [Buildroot] [PATCH] package/libssh: ignore CVE-2023-3603
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Daniel,

On Wed,  6 Sep 2023 22:09:27 +0200
Daniel Lang <dalang@gmx.at> wrote:

> The affected code isn't present in any release, see [0].
> 
> [0]: https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Here the NVD database tells us that the following CPE identifier is
affected:

  cpe:2.3:a:libssh:libssh:-:*:*:*:*:*:*:*

So the version field is not '*', but '-', and I think our pkg-stats
script doesn't do the right thing when handling '-'. I remember asking
the NVD maintainers about this, and they replied:

    The '-' in the URI 'cpe:2.3:a:ntp:ntp:-:*:*:*:*:*:*:*' is used
    because the affected version was not specified. We need to use the
    '-' when the affected version is not specified otherwise, using the
    '*' will incorrectly call all versions of NTP as vulnerable.


    The '*' is the wildcard, while the '-' is used to represent
    unspecified versions, a placeholder to an update, as explained
    earlier.

I believe right now pkg-stats handles '-' like '*', but I'm not sure
it's the right thing to do. But the answer from NVD didn't really help
because "unspecified versions" doesn't mean much.

Another thing that would be good to do in pkg-stats is warn if there is
a CVE listed in <pkg>_IGNORE_CVES, but this CVE in fact does not
affects the package. This would allow us to catch mistakes, but also
cases where a CVE was added to the ignore list, but no longer needs to
be in that list because the NVD data has been updated/improved.

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
