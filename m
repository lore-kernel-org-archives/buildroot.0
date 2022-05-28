Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAFBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 08:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3788A84CCB;
	Sat, 28 May 2022 08:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChjFYBW7-6Cj; Sat, 28 May 2022 08:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B77184CC5;
	Sat, 28 May 2022 08:09:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24ACB1BF59E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ED0660C07
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dlx41HAzhEEy for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 08:09:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 056CE60AE4
 for <buildroot@buildroot.org>; Sat, 28 May 2022 08:09:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 180E7240003;
 Sat, 28 May 2022 08:09:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nurVf-002wow-T5; Sat, 28 May 2022 10:09:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220502220919.1313508-1-james.hilliard1@gmail.com>
Date: Sat, 28 May 2022 10:09:19 +0200
In-Reply-To: <20220502220919.1313508-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 2 May 2022 16:09:19 -0600")
Message-ID: <87wne6dqog.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/1] package/python-pillow: fix
 pkg-config search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Currently pillow doesn't correctly search pkg-config system paths
 > for some libraries which can prevent some libraries from being
 > properly detected/enabled in pillow.

 > This is due to pillow implementing custom header validation
 > checks which need system paths present to function correctly:
 > https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633

 > Removed custom BUILD_CMDS and INSTALL_TARGET_CMDS which were
 > causing python-pillow to be installed for the host, they are
 > not required, we just need to set build_ext at the start
 > of PYTHON_PILLOW_BUILD_OPTS instead.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v4 -> v5:
 >   - use backported upstream patch
 > Changes v3 -> v4:
 >   - pass BUILD_OPTS to INSTALL_TARGET_OPTS
 > Changes v2 -> v3:
 >   - actually remove MAX_CONCURRENCY env variable
 > Changes v1 -> v2:
 >   - remove unrelated MAX_CONCURRENCY env variable

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
