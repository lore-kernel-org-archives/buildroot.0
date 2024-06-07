Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8651EC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098EF84C5B;
	Fri,  7 Jun 2024 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyPzO6fubv0E; Fri,  7 Jun 2024 20:23:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D3F84C64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D3F84C64;
	Fri,  7 Jun 2024 20:23:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF9F1BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D6B460889
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuQ-hY1n4G-z for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A7926080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7926080A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A7926080A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:23:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48528240002;
 Fri,  7 Jun 2024 20:23:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFg7N-00F04T-2M;
 Fri, 07 Jun 2024 22:23:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240408202030.365656-1-fontaine.fabrice@gmail.com>
Date: Fri, 07 Jun 2024 22:23:21 +0200
In-Reply-To: <20240408202030.365656-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 8 Apr 2024 22:20:30 +0200")
Message-ID: <87bk4ccxja.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: really use system fmt
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

 > Commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f wrongly used WITH_FMT
 > instead of WITH_LIBFMT resulting in the following build failure:

 > [  0%] Creating directories for 'libfmt'
 > [  0%] Performing download step (download, verify and extract) for 'libfmt'
 > make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
 > make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
 > -- Downloading...
 >    dst='/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6/extra/libfmt/src/8.0.1.zip'
 >    timeout='none'
 >    inactivity timeout='none'
 > -- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
 > CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
 >   Each download failed!

 >     error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
 >           status_code: 1
 >           status_string: "Unsupported protocol"
 >           log:
 >           --- LOG BEGIN ---
 >           Protocol "https" not supported or disabled in libcurl

 >   Closing connection

 >           --- LOG END ---

 > Fixes: 821f9dee8112dc02fe58d60273d0dfdabbc46d1f
 >  - http://autobuild.buildroot.org/results/fbe3bc347a83a810ffbbbff93a45994963712bee

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
