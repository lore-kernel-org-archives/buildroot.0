Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA04D597A5
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4DC40390;
	Tue, 12 Nov 2024 20:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhP6RsD71EnP; Tue, 12 Nov 2024 20:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48E25402FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48E25402FD;
	Tue, 12 Nov 2024 20:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A16BF725
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FDBC80B3B
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jgKh15LPUFI for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 20:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3DC4280B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DC4280B98
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DC4280B98
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 20:45:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42FB8240004;
 Tue, 12 Nov 2024 20:45:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAxl3-00D3wU-1w;
 Tue, 12 Nov 2024 21:45:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <Zs1XglvC1GPvEr4K@waldemar-brodkorb.de>
 <20240827181730.44ba28f7@windsurf>
Date: Tue, 12 Nov 2024 21:45:05 +0100
In-Reply-To: <20240827181730.44ba28f7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 27 Aug 2024 18:17:30 +0200")
Message-ID: <87o72k89m6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/file: fix musl compile issue
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello,
 > On Tue, 27 Aug 2024 06:35:14 +0200
 > Waldemar Brodkorb <wbx@openadk.org> wrote:

 >> Since the update of musl to 1.2.5 in commit
 >> f7f03445cf320adbbc41270a806b38c911d3454a find no longer compiles.

 > Thanks a lot, but that explanation cannot be correct. The Gentoo issue
 > at https://bugs.gentoo.org/789336 is discussed since 2021, and the bug
 > report at https://bugs.astron.com/view.php?id=473 is from 2023... but
 > musl 1.2.5 was only tagged in February 2024.

 > In addition, if you look at:

 >   http://autobuild.buildroot.net/?reason=file%&libc=musl

 > (and click on "Next" to see the next results), you can see that the
 > issue has been occurring since 2022-01-25, with the first failure being:

 >   http://autobuild.buildroot.net/results/0ef/0ef268f01541c3ef40d5570a443fec9dbd61c62f/build-end.log

 > Is it the bump of file to version 5.41 in commit
 > d38b72bcd75392a88b5100839ac410859d0a6a79 that triggered the issue? This
 > change was committed on Jan 1, 2022, but the issue first occurred on
 > Jan 25, 2022. It feels a bit strange that it took 25 days for the issue
 > to show up in the autobuilders, with such a simple package with no
 > dependencies.

 > I also see no musl version bump around that time.

 > Conclusion: I don't know what started the breakage, but it's not the
 > bump to musl 1.2.5. In this kind of cases, I think it's fine to state
 > that the breakage has been occurring for as long as Jan 2022, which
 > provides enough information to allow us to know that the fix should be
 > backported to 2024.02.x.

 > Indeed, with your justification, we would have *NOT* backported the fix
 > to 2024.02.x, because 2024.02.x uses musl 1.2.4. Hopefully this
 > illustrates why the investigation of the root cause is an important
 > matter :-)

 > Thanks a lot!

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
