Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BFEC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8DA83C73;
	Fri, 25 Aug 2023 16:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8DA83C73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHJJthRaHTVO; Fri, 25 Aug 2023 16:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB0BD832E7;
	Fri, 25 Aug 2023 16:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0BD832E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE441BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 024B041EA0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024B041EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FWwhRDbj9JC for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:11:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A1D441C3A
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1D441C3A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95B45C0002;
 Fri, 25 Aug 2023 16:11:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZZPb-002yqg-PK; Fri, 25 Aug 2023 18:11:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
Date: Fri, 25 Aug 2023 18:11:51 +0200
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 9 Jun 2023 01:28:43 +0200")
Message-ID: <87sf879k54.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 01/17] package/python-iptables: fix
 _find_library()
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > While the commit [1] already fixed some runtime issue with
 > uClibc toolchain, the same test TestPythonPy3Iptables fail
 > with Glibc toolchain.

 >   xtables_version = 12
 >   if xtables_version:
 >       _searchlib = "libxtables.so.%s" % (xtables_version,)
 >   else:
 >       _searchlib = "xtables"
 >   _lib_xtables, xtables_version = find_library(_searchlib)

 >   _lib_xtables and xtables_version are null with glibc

 > The implementation of find_library() rely on the custom
 > _find_library() that try to use the IPTABLES_LIBDIR
 > environment variable (that does not exist in the context
 > of Buildroot).

 > Within the scope of buildroot we can determine what
 > IPTABLES_LIBDIR should be at build time and replace the
 > calls to os.environ.get('IPTABLES_LIBDIR', None) with
 > the correct value.

 > [1] d341ec035067120b456f669a826e26eb594c0237

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > I don't know why TestPythonPy3Iptables pass succesfully
 > with a uClibc toolchain but not with a glibc toolchain.
 > The current python code searching for xtables, modules
 > and libraries seems fragile...

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
