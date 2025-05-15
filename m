Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C114EC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6535A61354;
	Fri, 16 May 2025 11:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbfA55L2f_LV; Fri, 16 May 2025 11:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C2C261349
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2C261349;
	Fri, 16 May 2025 11:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D3E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70D9F40AF1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNdOldg4W70u for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7E0402A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D7E0402A7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B3DF86A10; Fri, 16 May 2025 11:21:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 17:05:58 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 476163fc7e3ccbf312ed7b23c8bfb613c41cd00a
X-Git-Newrev: 212e493ea0650d1a0834bc04f6b530057c9c2dc6
X-Patchwork-Hint: ignore
Message-Id: <20250516112155.3B3DF86A10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/netsnmp: backport
 patch fixing runtime with Linux >= 6.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=212e493ea0650d1a0834bc04f6b530057c9c2dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This issue has been reported in
https://gitlab.com/buildroot.org/buildroot/-/issues/110, where netsnmp
would not work on Linux >= 6.7 systems due to an issue in parsing
/proc/net/snmp. We simply backport a fix that's upstream, but not yet
in any stable release.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/issues/110

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit af674f3ecf44d45f92c35af8508077aa138e13f8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...x-6.7-compatibility-parsing-proc-net-snmp.patch | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch b/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
new file mode 100644
index 0000000000..0c15543c0f
--- /dev/null
+++ b/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
@@ -0,0 +1,125 @@
+From 8350fd9e9c8bd97f587809265516f61aa7fe8aa0 Mon Sep 17 00:00:00 2001
+From: Philippe Troin <phil+github-commits@fifi.org>
+Date: Sat, 3 Feb 2024 10:30:30 -0800
+Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
+
+Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
+This breaks the hard-coded assumptions about the Ip line length.
+Add compatibility to parse Linux 6.7 Ip header while keep support
+for previous versions.
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
+ 1 file changed, 37 insertions(+), 9 deletions(-)
+
+diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+index a0fbdd9ffa..8eb40742b4 100644
+--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
+@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
+ }
+ 
+ /*
+-  /proc/net/snmp
++  /proc/net/snmp - Linux 6.6 and lower
+ 
+   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates
+   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 259920 0 0
+@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
+   
+   Udp: InDatagrams NoPorts InErrors OutDatagrams
+   Udp: 1491094 122 0 1466178
++*
++  /proc/net/snmp - Linux 6.7 and higher
++
++  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates OutTransmits
++  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264 3632 0 3548 0 7096 44961424
++
++  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutAddrMaskReps
++  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572 16610 484 0 0 0 59957 66905 0 0 0 0
++
++  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
++  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
++
++  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts InCsumErrors
++  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8 7442 0
++
++  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
++  Udp: 2257832 1422 0 2252835 0 0 0 84 0
++
++  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
++  UdpLite: 0 0 0 0 0 0 0 0 0
+ */
+ 
+ 
+@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+     FILE           *devin;
+     char            line[1024];
+     netsnmp_systemstats_entry *entry = NULL;
+-    int             scan_count;
++    int             scan_count, expected_scan_count;
+     char           *stats, *start = line;
+     int             len;
+-    unsigned long long scan_vals[19];
++    unsigned long long scan_vals[20];
+ 
+     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags %x)\n",
+                 load_flags));
+@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+      */
+     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
+     len = strlen(line);
+-    if (224 != len) {
++    switch (len) {
++    case 224:
++	expected_scan_count = 19;
++	break;
++    case 237:
++	expected_scan_count = 20;
++	break;
++    default:
+         fclose(devin);
+         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length in /proc/net/snmp."
+-                 " %d != 224\n", len);
++                 " %d not in { 224, 237 } \n", len);
+         return -4;
+     }
+ 
+@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+         memset(scan_vals, 0x0, sizeof(scan_vals));
+         scan_count = sscanf(stats,
+                             "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
+-                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu",
++                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
+                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
+                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
+                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
+                             &scan_vals[9],&scan_vals[10],&scan_vals[11],
+                             &scan_vals[12],&scan_vals[13],&scan_vals[14],
+                             &scan_vals[15],&scan_vals[16],&scan_vals[17],
+-                            &scan_vals[18]);
++                            &scan_vals[18],&scan_vals[19]);
+         DEBUGMSGTL(("access:systemstats", "  read %d values\n", scan_count));
+ 
+-        if(scan_count != 19) {
++        if(scan_count != expected_scan_count) {
+             snmp_log(LOG_ERR,
+                      "error scanning systemstats data (expected %d, got %d)\n",
+-                     19, scan_count);
++                     expected_scan_count, scan_count);
+             netsnmp_access_systemstats_entry_free(entry);
+             return -4;
+         }
+@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
+         entry->stats.HCOutFragFails.high = scan_vals[17] >> 32;
+         entry->stats.HCOutFragCreates.low = scan_vals[18] & 0xffffffff;
+         entry->stats.HCOutFragCreates.high = scan_vals[18] >> 32;
++        /* entry->stats. = scan_vals[19]; / * OutTransmits */
+ 
+         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] = 1;
+         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] = 1;
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
