Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6FB8130D;
	Fri, 28 Jan 2022 11:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLn6ILkdKtA4; Fri, 28 Jan 2022 11:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9AC2812D6;
	Fri, 28 Jan 2022 11:33:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 460F31BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3260040167
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlI63NWazlr8 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:33:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B231B40462
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:33:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94E1960005;
 Fri, 28 Jan 2022 11:33:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDPVL-0001et-HW; Fri, 28 Jan 2022 12:33:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211220093311.1927043-1-fontaine.fabrice@gmail.com>
Date: Fri, 28 Jan 2022 12:33:23 +0100
In-Reply-To: <20211220093311.1927043-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Dec 2021 10:33:11 +0100")
Message-ID: <87czkc9jss.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-rtsp-server:
 fix introspection
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with introspection:
 > /home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler
 > gst/rtsp-server/GstRtspServer-1.0.gir --output
 > gst/rtsp-server/GstRtspServer-1.0.typelib
 > --includedir=/usr/share/gir-1.0
 > Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
 > error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
 > If the above error message is about missing .so libraries, then
 > setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
 > Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
