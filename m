Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1ABC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 08:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18F73821DE;
	Sat, 25 Mar 2023 08:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F73821DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPbFS6PInTAh; Sat, 25 Mar 2023 08:08:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F6D821D4;
	Sat, 25 Mar 2023 08:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F6D821D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEC461BF388
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 08:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF18060A7B
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 08:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF18060A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkLgp5NHC_iV for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 08:08:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0319A6079B
 for <buildroot@uclibc.org>; Sat, 25 Mar 2023 08:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0319A6079B
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E08B4822E3; Sat, 25 Mar 2023 08:08:12 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 25 Mar 2023 08:08:12 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freemp@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15486-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15486] New: raspberrypi3: eth0 configuration by
 ifplugd.action script fails since 2023.02/busybox v1.36.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15486

            Bug ID: 15486
           Summary: raspberrypi3: eth0 configuration by ifplugd.action
                    script fails since 2023.02/busybox v1.36.0
           Product: buildroot
           Version: 2023.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: freemp@freenet.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Network interface setup via ifplugd.action script fails since 2023.02.

The script tries to configure the interface via DHCP first. If this fails it
applies some static settings.

/etc/ifplugd/ifplugd.action:
----------------------------
#!/bin/bash

if [ "$2" = 'up' ]; then
        ifup -v eth0 && ping -Ieth0 -c1 -W1 google.com && exit 0
        echo 'eth0 setup failed. applying static settings...'
        ifconfig eth0 192.168.0.1 netmask 255.255.255.0
elif [ "$2" = 'down' ]; then
        ifdown -f eth0
fi
----------------------------

/etc/network/interfaces:
------------------------
iface eth0 inet dhcp
------------------------

udhcpc runs with modified options:

CONFIG_FEATURE_UDHCPC_ARPING=n
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -O search"

Right after system startup, no network connection available yet, the network
cable is plugged in. DHCP setup actually succeeds but for some reason DNS does
not. This works smoothly in the 2022.11.x branch (busybox v1.35.0).

# journalctl -fu ifplugd
Dec 20 19:15:58 buildroot systemd[1]: Starting network cable plug detection
service...
Dec 20 19:15:58 buildroot systemd[1]: Started network cable plug detection
service.
Dec 20 19:15:58 buildroot ifplugd[203]: ifplugd 0.28 initializing.
Dec 20 19:15:58 buildroot ifplugd[203]: Using interface eth0/B8:28:EB:17:F7:B8
with driver <smsc95xx> (version: 5.10.92-v7)
Dec 20 19:15:59 buildroot ifplugd[203]: Using detection mode: SIOCETHTOOL
Dec 20 19:15:59 buildroot ifplugd[203]: Initialization complete, link beat not
detected.
Dec 20 19:16:26 buildroot ifplugd[203]: Link beat detected.
Dec 20 19:16:27 buildroot ifplugd[203]: Executing '/etc/ifplugd/ifplugd.action
eth0 up'.
Dec 20 19:16:27 buildroot ifplugd[203]: client: run-parts
/etc/network/if-pre-up.d
Dec 20 19:16:27 buildroot ifplugd[203]: client: ip link set eth0 up
Dec 20 19:16:27 buildroot ifplugd[203]: client: udhcpc -R -n -O search -p
/var/run/udhcpc.eth0.pid -i eth0
Dec 20 19:16:27 buildroot ifplugd[203]: client: udhcpc: started, v1.36.0
Dec 20 19:16:27 buildroot ifplugd[203]: client: udhcpc: broadcasting discover
Dec 20 19:16:28 buildroot ifplugd[203]: client: udhcpc: broadcasting select for
10.0.0.133, server 10.0.0.1
Dec 20 19:16:28 buildroot ifplugd[203]: client: udhcpc: lease of 10.0.0.111
obtained from 10.0.0.1, lease time 21600
Dec 20 19:16:28 buildroot ifplugd[203]: client: deleting routers
Dec 20 19:16:28 buildroot ifplugd[203]: client: adding dns 10.0.0.1
Dec 20 19:16:28 buildroot ifplugd[203]: client: run-parts /etc/network/if-up.d
Dec 20 19:16:28 buildroot ifplugd[203]: client: ping: bad address 'google.com'
Dec 20 19:16:28 buildroot ifplugd[203]: client: eth0 setup failed. applying
static settings...
Dec 20 19:16:28 buildroot ifplugd[203]: Program executed successfully.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
