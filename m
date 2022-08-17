Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEEEC28B2B
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 12:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5381982446;
	Wed, 17 Aug 2022 12:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5381982446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTchDvGwLGyD; Wed, 17 Aug 2022 12:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779A183E32;
	Wed, 17 Aug 2022 12:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779A183E32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90BEC1BF599
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 12:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7946083E32
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 12:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7946083E32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAAERklm2XPl for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 12:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D14283380
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D14283380
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 12:47:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8B17240004;
 Wed, 17 Aug 2022 12:47:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oOISY-00CEf1-0N; Wed, 17 Aug 2022 14:47:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20210904153735.1760686-1-fontaine.fabrice@gmail.com>
 <98d28576-4f8e-92a6-02b9-d200d21644b4@mind.be>
Date: Wed, 17 Aug 2022 14:47:45 +0200
In-Reply-To: <98d28576-4f8e-92a6-02b9-d200d21644b4@mind.be> (Arnout
 Vandecappelle's message of "Mon, 25 Jul 2022 18:24:21 +0200")
Message-ID: <874jyb9gum.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/luasyslog: fix build when host
 root directory is /usr
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/09/2021 17:37, Fabrice Fontaine wrote:
 >> Fix the following build failure when host root directory is /usr which
 >> is raised since bump to version 2.2.0 in commit
 >> caa32ac237909999eb6e0bd3616ef4440190970a:
 >> /usr/bin/install -c -m 644 syslog.lua
 >> '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3/logging'
 >> libtool: install: /usr/bin/install -c .libs/lsyslog.so /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.so
 >> libtool: install: /usr/bin/install -c .libs/lsyslog.lai /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
 >> libtool: warning: remember to run 'libtool --finish /usr/lib/lua/5.3'
 >> /usr/bin/make  install-exec-hook
 >> make[3]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
 >> rm -f /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
 >> make[3]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
 >> make[2]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
 >> make[1]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
 >> luasyslog: installs files in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target//usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1
 >> This failure is raised because lua script directory is "found" and
 >> "fixed" to
 >> ${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
 >> because of the following test in ax_lua.m4:
 >> dnl Try to find a path with the prefix.
 >> _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
 >> AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
 >> [ dnl Fix the prefix.
 >> _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
 >> ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
 >> sed "s,^$_ax_strip_prefix,$LUA_PREFIX,"`
 >> ])
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 >  This one got a little bit snowed under...

 >  Applied to master, thanks.

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
