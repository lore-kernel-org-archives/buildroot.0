Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4067EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 07:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15864282A;
	Fri, 27 May 2022 07:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGoqSiSnM2gu; Fri, 27 May 2022 07:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7C74281A;
	Fri, 27 May 2022 07:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B67D1BF35C
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C7D60BE3
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 07:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb6ZYWCp03GD for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 07:52:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 645C560B53
 for <buildroot@buildroot.org>; Fri, 27 May 2022 07:52:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D935524000F;
 Fri, 27 May 2022 07:52:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuUmE-001Buu-0I; Fri, 27 May 2022 09:52:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220424200014.1336771-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 09:52:53 +0200
In-Reply-To: <20220424200014.1336771-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Apr 2022 22:00:13 +0200")
Message-ID: <87y1yno1ii.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libselinux: fix host build
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
Cc: Antoine Tenart <atenart@kernel.org>, Matt Weber <matthew.weber@collins.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The following build failure is raised since commit
 > 1745fcde740057951dcc5429f3bfabd103b764a1 because
 > $(HOST_PKG_PYTHON_DISTUTILS_ENV) contains $(HOST_CONFIGURE_OPTS) and so
 > will override LDFLAGS passed by libselinux.mk:

 > /usr/bin/gcc -O2 -I/nvmedata/autobuild/instance-11/output-1/host/include -I../include -D_GNU_SOURCE  -DNO_ANDROID_BACKEND  -L/nvmedata/autobuild/instance-11/output-1/host/lib -Wl,-rpath,/nvmedata/autobuild/instance-11/output-1/host/lib -shared -o libselinux.so.1 avc.lo avc_internal.lo avc_sidtab.lo booleans.lo callbacks.lo canonicalize_context.lo checkAccess.lo check_context.lo checkreqprot.lo compute_av.lo compute_create.lo compute_member.lo compute_relabel.lo compute_user.lo context.lo deny_unknown.lo disable.lo enabled.lo fgetfilecon.lo freecon.lo freeconary.lo fsetfilecon.lo get_context_list.lo get_default_type.lo get_initial_context.lo getenforce.lo getfilecon.lo getpeercon.lo init.lo is_customizable_type.lo label.lo label_db.lo label_file.lo label_media.lo label_support.lo label_x.lo lgetfilecon.lo load_policy.lo lsetfilecon.lo mapping.lo matchmediacon.lo matchpathcon.lo policyvers.lo procattr.lo query_user_context.lo regex.lo reject_unknown.lo selinux_check_securetty_contex
 t.l
 >  o selinux_config.lo selinux_restorecon.lo sestatus.lo setenforce.lo setexecfilecon.lo setfilecon.lo setrans_client.lo seusers.lo sha1.lo stringrep.lo validatetrans.lo   -ldl -Wl,-soname,libselinux.so.1,--version-script=libselinux.map,-z,defs,-z,relro
 > /usr/bin/ld: regex.lo: in function `regex_writef':
 > regex.c:(.text+0x7c): undefined reference to `pcre_fullinfo'

 > To fix this build failure, instead of moving LDFLAGS after
 > $(HOST_PKG_PYTHON_DISTUTILS_ENV), drop LDFLAGS and add host-pkgconf
 > dependency to retrieve pcre dependencies as pkg-config is supported
 > since version 3.2 and
 > https://github.com/SELinuxProject/selinux/commit/74093beab0c605641ec413be81e31e6b2f55d8d4

 > Dropping LDFLAGS will also drop -lpthread which doesn't seem to raise
 > any build failures with test-pkg:

 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: SKIPPED
 >                             sourcery-arm [6/6]: SKIPPED

 > Apply the same update to the target variant for consistancy.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d16995f0decef9c9bf58cab4fa30f7daab6918fb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
