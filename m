Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE4BC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B77419DA;
	Fri, 16 May 2025 10:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HT6JEkz3vqHO; Fri, 16 May 2025 10:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FC2A41999
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC2A41999;
	Fri, 16 May 2025 10:59:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB4C1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F7341999
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWo_9IPmBrID for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97D86418D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D86418D6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97D86418D6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A46261C10F2; Fri, 16 May 2025 12:59:42 +0200 (CEST)
Message-ID: <f2f3d7ef-e413-4bec-87c9-d6659bae6feb@rnout.be>
Date: Fri, 16 May 2025 12:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250509212020.323351-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509212020.323351-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393182; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3CNgG17D7Z50HFxAYU45FPD25GtxHbMcUUkdkxapvSQ=;
 b=KjpO3fnhXqyUsN6CGLWvqjPLBzgWKrcxAJeWYuns0YbyeFcy2+eZudH64PxCBE1QSnlMFg
 a5kpyzQLBhhsYgEpNJAnpt5rOhYH1RE3kZCViU3vp2NgoTCmNhCSn3ge1r6yo9zLlst+/1
 XcbuJp34wW86MfhBsCGQwggB7oaCPiXDCdQcOMmTKUZLkkHtn7IyI1kxPIbk23lL3ELd7p
 ZyCXEdizgdi6IusRRpSl94wEkMTSBjrnvW43njM3HteLc86+/TUP/pP/9FMmQvl8tqjH1H
 tVpKxnyusbaYoDY/vd785VITCYEduw3eIHv5nf61s4RjlOPWiO4O7rJH4Qvmkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KjpO3fnh
Subject: Re: [Buildroot] [PATCH 1/2] package/netsnmp: backport patch fixing
 runtime with Linux >= 6.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2025 23:20, Thomas Petazzoni via buildroot wrote:
> This issue has been reported in
> https://gitlab.com/buildroot.org/buildroot/-/issues/110, where netsnmp
> would not work on Linux >= 6.7 systems due to an issue in parsing
> /proc/net/snmp. We simply backport a fix that's upstream, but not yet
> in any stable release.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/issues/110
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...-compatibility-parsing-proc-net-snmp.patch | 125 ++++++++++++++++++
>   1 file changed, 125 insertions(+)
>   create mode 100644 package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
> 
> diff --git a/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch b/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
> new file mode 100644
> index 0000000000..0c15543c0f
> --- /dev/null
> +++ b/package/netsnmp/0002-Add-Linux-6.7-compatibility-parsing-proc-net-snmp.patch
> @@ -0,0 +1,125 @@
> +From 8350fd9e9c8bd97f587809265516f61aa7fe8aa0 Mon Sep 17 00:00:00 2001
> +From: Philippe Troin <phil+github-commits@fifi.org>
> +Date: Sat, 3 Feb 2024 10:30:30 -0800
> +Subject: [PATCH] Add Linux 6.7 compatibility parsing /proc/net/snmp
> +
> +Linux 6.7 adds a new OutTransmits field to Ip in /proc/net/snmp.
> +This breaks the hard-coded assumptions about the Ip line length.
> +Add compatibility to parse Linux 6.7 Ip header while keep support
> +for previous versions.
> +
> +Upstream: https://github.com/net-snmp/net-snmp/commit/49d60ba57f4b462df7dc5fd5b38b4425dab0982c
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + .../ip-mib/data_access/systemstats_linux.c    | 46 +++++++++++++++----
> + 1 file changed, 37 insertions(+), 9 deletions(-)
> +
> +diff --git a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> +index a0fbdd9ffa..8eb40742b4 100644
> +--- a/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> ++++ b/agent/mibgroup/ip-mib/data_access/systemstats_linux.c
> +@@ -36,7 +36,7 @@ netsnmp_access_systemstats_arch_init(void)
> + }
> +
> + /*
> +-  /proc/net/snmp
> ++  /proc/net/snmp - Linux 6.6 and lower
> +
> +   Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates
> +   Ip: 2 64 7083534 0 0 0 0 0 6860233 6548963 0 0 1 286623 63322 1 259920 0 0
> +@@ -49,6 +49,26 @@ netsnmp_access_systemstats_arch_init(void)
> +
> +   Udp: InDatagrams NoPorts InErrors OutDatagrams
> +   Udp: 1491094 122 0 1466178
> ++*
> ++  /proc/net/snmp - Linux 6.7 and higher
> ++
> ++  Ip: Forwarding DefaultTTL InReceives InHdrErrors InAddrErrors ForwDatagrams InUnknownProtos InDiscards InDelivers OutRequests OutDiscards OutNoRoutes ReasmTimeout ReasmReqds ReasmOKs ReasmFails FragOKs FragFails FragCreates OutTransmits
> ++  Ip: 1 64 50859058 496 0 37470604 0 0 20472980 7515791 1756 0 0 7264 3632 0 3548 0 7096 44961424
> ++
> ++  Icmp: InMsgs InErrors InCsumErrors InDestUnreachs InTimeExcds InParmProbs InSrcQuenchs InRedirects InEchos InEchoReps InTimestamps InTimestampReps InAddrMasks InAddrMaskReps OutMsgs OutErrors OutRateLimitGlobal OutRateLimitHost OutDestUnreachs OutTimeExcds OutParmProbs OutSrcQuenchs OutRedirects OutEchos OutEchoReps OutTimestamps OutTimestampReps OutAddrMasks OutAddrMaskReps
> ++  Icmp: 114447 2655 0 17589 0 0 0 0 66905 29953 0 0 0 0 143956 0 0 572 16610 484 0 0 0 59957 66905 0 0 0 0
> ++
> ++  IcmpMsg: InType0 InType3 InType8 OutType0 OutType3 OutType8 OutType11
> ++  IcmpMsg: 29953 17589 66905 66905 16610 59957 484
> ++
> ++  Tcp: RtoAlgorithm RtoMin RtoMax MaxConn ActiveOpens PassiveOpens AttemptFails EstabResets CurrEstab InSegs OutSegs RetransSegs InErrs OutRsts InCsumErrors
> ++  Tcp: 1 200 120000 -1 17744 13525 307 3783 6 18093137 9277788 3499 8 7442 0
> ++
> ++  Udp: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
> ++  Udp: 2257832 1422 0 2252835 0 0 0 84 0
> ++
> ++  UdpLite: InDatagrams NoPorts InErrors OutDatagrams RcvbufErrors SndbufErrors InCsumErrors IgnoredMulti MemErrors
> ++  UdpLite: 0 0 0 0 0 0 0 0 0
> + */
> +
> +
> +@@ -101,10 +121,10 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
> +     FILE           *devin;
> +     char            line[1024];
> +     netsnmp_systemstats_entry *entry = NULL;
> +-    int             scan_count;
> ++    int             scan_count, expected_scan_count;
> +     char           *stats, *start = line;
> +     int             len;
> +-    unsigned long long scan_vals[19];
> ++    unsigned long long scan_vals[20];
> +
> +     DEBUGMSGTL(("access:systemstats:container:arch", "load v4 (flags %x)\n",
> +                 load_flags));
> +@@ -126,10 +146,17 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
> +      */
> +     NETSNMP_IGNORE_RESULT(fgets(line, sizeof(line), devin));
> +     len = strlen(line);
> +-    if (224 != len) {
> ++    switch (len) {
> ++    case 224:
> ++	expected_scan_count = 19;
> ++	break;
> ++    case 237:
> ++	expected_scan_count = 20;
> ++	break;
> ++    default:
> +         fclose(devin);
> +         snmp_log(LOG_ERR, "systemstats_linux: unexpected header length in /proc/net/snmp."
> +-                 " %d != 224\n", len);
> ++                 " %d not in { 224, 237 } \n", len);
> +         return -4;
> +     }
> +
> +@@ -178,20 +205,20 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
> +         memset(scan_vals, 0x0, sizeof(scan_vals));
> +         scan_count = sscanf(stats,
> +                             "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu"
> +-                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu",
> ++                            "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
> +                             &scan_vals[0],&scan_vals[1],&scan_vals[2],
> +                             &scan_vals[3],&scan_vals[4],&scan_vals[5],
> +                             &scan_vals[6],&scan_vals[7],&scan_vals[8],
> +                             &scan_vals[9],&scan_vals[10],&scan_vals[11],
> +                             &scan_vals[12],&scan_vals[13],&scan_vals[14],
> +                             &scan_vals[15],&scan_vals[16],&scan_vals[17],
> +-                            &scan_vals[18]);
> ++                            &scan_vals[18],&scan_vals[19]);
> +         DEBUGMSGTL(("access:systemstats", "  read %d values\n", scan_count));
> +
> +-        if(scan_count != 19) {
> ++        if(scan_count != expected_scan_count) {
> +             snmp_log(LOG_ERR,
> +                      "error scanning systemstats data (expected %d, got %d)\n",
> +-                     19, scan_count);
> ++                     expected_scan_count, scan_count);
> +             netsnmp_access_systemstats_entry_free(entry);
> +             return -4;
> +         }
> +@@ -223,6 +250,7 @@ _systemstats_v4(netsnmp_container* container, u_int load_flags)
> +         entry->stats.HCOutFragFails.high = scan_vals[17] >> 32;
> +         entry->stats.HCOutFragCreates.low = scan_vals[18] & 0xffffffff;
> +         entry->stats.HCOutFragCreates.high = scan_vals[18] >> 32;
> ++        /* entry->stats. = scan_vals[19]; / * OutTransmits */
> +
> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_HCINRECEIVES] = 1;
> +         entry->stats.columnAvail[IPSYSTEMSTATSTABLE_INHDRERRORS] = 1;
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
