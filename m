Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754F4C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11A8640275;
	Tue, 16 Aug 2022 20:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A8640275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SmKzrKARl2fg; Tue, 16 Aug 2022 20:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EC5340139;
	Tue, 16 Aug 2022 20:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC5340139
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 106021BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB80F414E6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB80F414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yE9GWNOP39O7 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:06:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBAA404EC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DBAA404EC
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:06:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AEAF360002;
 Tue, 16 Aug 2022 20:06:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oO2pQ-009cZz-Cp; Tue, 16 Aug 2022 22:06:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220723213746.6015-1-fontaine.fabrice@gmail.com>
Date: Tue, 16 Aug 2022 22:06:20 +0200
In-Reply-To: <20220723213746.6015-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 23 Jul 2022 23:37:46 +0200")
Message-ID: <875yisc5s3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.9.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-2309: NULL Pointer Dereference allows attackers to cause a
 > denial of service (or application crash). This only applies when lxml is
 > used together with libxml2 2.9.10 through 2.9.14. libxml2 2.9.9 and
 > earlier are not affected. It allows triggering crashes through forged
 > input data, given a vulnerable code sequence in the application. The
 > vulnerability is caused by the iterwalk function (also used by the
 > canonicalize function). Such code shouldn't be in wide-spread use, given
 > that parsing + iterwalk would usually be replaced with the more
 > efficient iterparse function. However, an XML converter that serialises
 > to C14N would also be vulnerable, for example, and there are legitimate
 > use cases for this code sequence. If untrusted input is received (also
 > remotely) and processed via iterwalk function, a crash can be
 > triggered.

 > https://github.com/lxml/lxml/blob/lxml-4.9.1/CHANGES.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
