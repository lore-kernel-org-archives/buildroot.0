Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E4BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77382613A7
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77382613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46F8A83F3B;
	Wed, 29 Sep 2021 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L3Iw3xcaIWk3; Wed, 29 Sep 2021 19:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A36BD83F34;
	Wed, 29 Sep 2021 19:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 761921BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6515E40730
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbFcjgzizfdK for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:48:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5819C4072E
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:48:25 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BFF2A240003;
 Wed, 29 Sep 2021 19:48:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mVfYy-0002Cb-Ph; Wed, 29 Sep 2021 21:48:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210918185816.14928-1-peter@korsgaard.com>
Date: Wed, 29 Sep 2021 21:48:20 +0200
In-Reply-To: <20210918185816.14928-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 18 Sep 2021 20:58:14 +0200")
Message-ID: <875yujmad7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libyang: security bump to version
 1.0.240
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Jan Kundrat <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-28902: In function read_yin_container() in libyang <= v1.0.225,
 >   it doesn't check whether the value of retval->ext[r] is NULL.  In some
 >   cases, it can be NULL, which leads to the operation of
 >   retval-> ext[r]->flags that results in a crash.

 > - CVE-2021-28903: A stack overflow in libyang <= v1.0.225 can cause a denial
 >   of service through function lyxml_parse_mem().  lyxml_parse_elem()
 >   function will be called recursively, which will consume stack space and
 >   lead to crash.

 > - CVE-2021-28904: In function ext_get_plugin() in libyang <= v1.0.225, it
 >   doesn't check whether the value of revision is NULL.  If revision is NULL,
 >   the operation of strcmp(revision, ext_plugins[u].revision) will lead to a
 >   crash.

 > - CVE-2021-28905: In function lys_node_free() in libyang <= v1.0.225, it
 >   asserts that the value of node->module can't be NULL.  But in some cases,
 >   node-> module can be null, which triggers a reachable assertion (CWE-617).

 > - CVE-2021-28906: In function read_yin_leaf() in libyang <= v1.0.225, it
 >   doesn't check whether the value of retval->ext[r] is NULL.  In some cases,
 >   it can be NULL, which leads to the operation of retval->ext[r]->flags that
 >   results in a crash.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
