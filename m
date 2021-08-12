Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC637C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8BD60F00
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E8BD60F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2929B40224;
	Thu, 12 Aug 2021 21:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w_MoKsJReW1; Thu, 12 Aug 2021 21:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19E64026F;
	Thu, 12 Aug 2021 21:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFCE11BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EEAB401DA
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoc1kOwGnHOG for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97502401D3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:40:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8A4C420008;
 Thu, 12 Aug 2021 21:40:04 +0000 (UTC)
Date: Thu, 12 Aug 2021 23:40:03 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210812234003.1274e1c7@windsurf>
In-Reply-To: <20210810182216.426739-1-fontaine.fabrice@gmail.com>
References: <20210810182216.426739-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs std::future
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 10 Aug 2021 20:22:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> osm2pgsql needs std::future since its addition in commit
> 46c42042867e672eb21b386eb5e29747c30e80ca to avoid the following build
> failure:
> 
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.cpp:12:0:
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:218:24: error: field 'barrier' has incomplete type
>      std::promise<void> barrier;
>                         ^
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp: In constructor 'db_cmd_sync_t::db_cmd_sync_t(std::promise<void>&&)':
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:221:37: error: class 'db_cmd_sync_t' does not have any field named 'barrier'
>      : db_cmd_t(db_cmd_t::Cmd_sync), barrier(std::move(b))
>                                      ^
> In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/middle.hpp:18:0,
>                  from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/dependency-manager.cpp:11:
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp: In member function 'void thread_pool_t::check_for_exceptions()':
> /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp:49:19: error: invalid use of incomplete type 'class std::future<void>'
>              result.get();
>                    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/69528232ceba128a2e60aa778bb0943fdefc2ed1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/osm2pgsql/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
