Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FEC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 16:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B17E400DC;
	Wed,  8 Nov 2023 16:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B17E400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M67nrQewpOni; Wed,  8 Nov 2023 16:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34F67400A4;
	Wed,  8 Nov 2023 16:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F67400A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA11C1BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80EC24150E
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80EC24150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRIiKEmKKHz9 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 16:27:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EE5341365
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 16:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE5341365
Received: by mail.gandi.net (Postfix) with ESMTPSA id 757DA240010;
 Wed,  8 Nov 2023 16:27:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0lOq-000Qc3-2o;
 Wed, 08 Nov 2023 17:27:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231103174755.2118753-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 17:27:28 +0100
In-Reply-To: <20231103174755.2118753-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 3 Nov 2023 18:47:55 +0100")
Message-ID: <87wmusqkgf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: add host-pkgconf
 dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > apache uses pkgconfig to find dependencies such as lua, nhgttp2, openssl
 > and systemd.
 > For openssl, pkgconfig is used since version 2.1.1 and
 > https://github.com/apache/httpd/commit/0d4387dedc4ad83460bf52fc326c475c64133634
 > resulting in the following build failure since at least bump to version
 > 2.4.54 in commit 78e5a9c40e0754bbe840ef7b8da85efc28eb8b48:

 > ac_cv_path_PKGCONFIG=/usr/bin/pkg-config
 > [...]
 > configure:28669: checking for SSL_CTX_new
 > configure:28669:
 > /home/buildroot/autobuild/instance-1/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O3 -g0 -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -L/home/buildroot/autobuild/instance-1/output-1/host/armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/../../../../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
 > -L/usr/lib conftest.c -lssl -lcrypto -lpthread >&5
 > armeb-buildroot-linux-uclibcgnueabi-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d85c86ee1070582014c7b29b39f9a9f356988220
 >  - http://autobuild.buildroot.org/results/55d6bad8572138e200730d3a9f2dd1b9048fd95d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
