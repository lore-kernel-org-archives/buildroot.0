Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DDDC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BA860898;
	Tue,  1 Apr 2025 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDa_foCpJSvm; Tue,  1 Apr 2025 19:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B245161135
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B245161135;
	Tue,  1 Apr 2025 19:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2FF017F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B94EA41952
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVzb5K8wsufp for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:51:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3E6940F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3E6940F68
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3E6940F68
 for <buildroot@uclibc.org>; Tue,  1 Apr 2025 19:51:06 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tzhdV-0003yI-P8
 for buildroot@uclibc.org; Tue, 01 Apr 2025 21:51:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 1 Apr 2025 19:50:57 -0000 (UTC)
Message-ID: <vshg31$ei0$1@ciao.gmane.io>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: [Buildroot] Is there a working version of opkg?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Does anybody know of a working verison of opkg?  I've tried 0.6.2 and
0.7.0, and both versions have a file-locking bug. The basic 'opkg'
utility appears to fork off multiple children (WHY?!?!?) which then
collide with each other when trying to lock /var/log/opkg.lock.

It can be plainly seen using strace, but to make it a little more
obvious, I added fprintf() calls to opkg_lock/unlock:

    # opkg install --force-reinstall --force-downgrade <foo>.opk
    
    PID 843 PPID 696 opkg_lock()
    Installing <foo> on apps.
    beginning preinst...
    PID 846 PPID 844 opkg_lock()
    error: opkg_lock: Could not lock /var/run/opkg.lock: Resource temporarily unavailable.
    error: opkg_cmd_exec: Command failed to capture privilege lock: Resource temporarily unavailable.
    ending preinst.....
    Configuring web-server.
    beginning postinst...
    starting /apps/webserver...
    ending postinst...
    PID 843 PPID 696 opkg_unlock()

If found some old threads discussing the addition of waits/retries
when acquiring that lock but that "solution" was apparently rejected
in favor of just leaving it broken.

--
Grant

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
