Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E23CCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03CA883753;
	Fri, 29 May 2026 18:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUTOo1FUQHjm; Fri, 29 May 2026 18:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5395837B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080636;
	bh=2V3sGajwpiFTq2i2cTg00vA/oI02KPcR0KQJSmmoA4s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=AuaOp4iqGWXsmVSkEPo9U0MjAysZmmFFq45i6VQyz5dl4fU6smUzDvnZ7tcwk4R2C
	 zZYi4DHQnFrNjTKuX+6j6Xnz6CrxsQkGBOVV7jFDwEGTkiRTsFUYQ0Sczka6mK4EUa
	 Jlo/Wh1XHFK3Go01jszcPLt8HMR98POR/kkAoxlj1EbdQdnYMjxCQv9qz1orcxGJCp
	 tw90Ex5wITPuVn0VBU6RycOpOIXHxVL0awrGwuyWk2nA6eSJ55HoeVMgOfUHf4zzi2
	 SDP1ofTjcURCLJeDuYv1wJ7i5RKLUTMX7vtoaICickQrf9RrBOKp8H3ERaAwV30fsN
	 5EUDLDinTDwkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5395837B9;
	Fri, 29 May 2026 18:50:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 213C6D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F78140449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKVbd_d3G8v2 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::1;
 helo=ph8pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B65C44220B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B65C44220B
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B65C44220B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFA3wPAT5eFo2iX+yK0GakPwl25vjctphoi80rqAACHQh73O8nRGc3ZxlR+bCg9mDxFl7S4XwY8n1pmPCpwH0u/jSBf5PSHCt8VVmxG6MPZvumiTDRoFOnpXIlzjlxydAg+QoVRDU1+l2veA8yxpy516tdiq0YyT8BCkJ6UQxqPK9Zh65KyaM+D+22QQvrW8G4xRXASazpnjsLcJNy8ZR3H22oHjgVVv6qtZbAkPx4Ghjz3B3co0b9cA/l/+dz2NuQnQD20uJmlaD8nT91hx0C3SFKMkBVEmg6859/q3d1zhfBD24X0WU9FqIAM7zPUVuzT1ULW6L2+aRdoZnl4RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7/qfDzKqjqdsh6sH/KnNjJcc+HfpdI5jSAriebDrEk=;
 b=Fg0bg5vt2FUWGHwmZxYkNh79Ok0GROmTXwPAKcYIFZhFkPk+qrJYYPCaCiMy0p7p0CkegC4R6VQEZTsIxy8SgxiY6eglACR9l5tSIhXU7s8Vqx3/+PPLXWQujW75uXaBG9DGcnX9OgxjxNRyUHMtLJr0ZoIUyCDidHysp9r0ZYtTJlep756/ytEDN08HtklpeKritWK43L+TF1qZv29pfvX8D2qddYw90nTl3aUAGZ2SaYna59mveX4R1Bm9/fa61IWcbDs/QnWV8Td+ju85BgKck6ab56fzC55iHWxJR1iVv8A0AWGQTEzELai4Y1lKbx6728BYpYBgt7aDzOGFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from SJ0PR13CA0222.namprd13.prod.outlook.com (2603:10b6:a03:2c1::17)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 18:50:25 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::38) by SJ0PR13CA0222.outlook.office365.com
 (2603:10b6:a03:2c1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Fri, 29
 May 2026 18:50:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 18:50:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 13:50:24 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 13:50:23 -0500
To: <buildroot@buildroot.org>
Date: Fri, 29 May 2026 19:50:16 +0100
Message-ID: <20260529185016.3294747-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bd1745-c207-442a-ec76-08debdb3250a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|18002099003|13003099007|56012099006|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: AjAJFzB+WYp+YbQLryX/zjZ5Yo1Q8yKsFdlT+ONrNQbGNIJaXGU2nsKpXAj5DRsVz1Q7k2DBP3+ju86sluJajdf5mc3UnctQUSyiqyi7mLZ2am5QM2Pnad3M2mMdwetR874S9Bvew7AI6bn+n9LrLOCyo8uuBgJmdesVIIoE2uoft0N8Hudw7L2KLbjY4alfu2PsEvEl7tQ9F7+ed/Vsr3YsbKCrGxLZQ/YQsWQ4Mn4a/EUU1q4wvDIo1jMPAZYcFJDLpTCNon51KH5u8ozv4RPMAVvggFVgyT6Eg83ahKnG6uIfjumTNGH2W5tbAVlfRtpvvYAfx534BE8gGf8jylEj/XZU/DWXMI1QFX29gmEGNy5vBQH2+lEfxoihQ/tA+3Q8oRGNnGd3Pe5+NqgFke0hY7nWclc0WoVRF2PNa60GtPWsi2chaMctPLe+Je51XQi+DoHZCB2oB8TBIhDTyCw8aOojjA4zdigC5fUaJvZdEqJbvH+EsNGm4mWHfPYBnGb1+KO4T8c1GoVNQNgGoG6uCODz+FK+ITXPiz2v2ZmlwBJyjoPz4NsjqFT2pwWv+A0WsBx/2o1lUmersyEnSGechImlfVVnQj+xMhwz3N8azqiKnakeQ6MRiRigxuTbvDP2I/B1v5MsO3rgZOJBRobwJlG5+OKd1b19GQ4uSOiuhSKZJrxrSvwl7h8egf6S7E162dfYoIvoHBlhgSPvb/zsiQUZ+zcc+txELT7pwfDablah6P0d0V70Hk613pnZELO75F8/2dF2r4RW3+dudFYMxgRZGVHgNsAj2RquPR4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(18002099003)(13003099007)(56012099006)(11063799006)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DRob5q25YtdZTxaergv7rBcSizYs2pAiuAp4hNt5UJUl3ZoOXCyvpS4IJMPr5zEXyL8aocBO0NLlmK4Iie/aYPDB0Oht37EeA60efTEY1AVOFNM3TGgltK3zjNh+5scE4ddO3FXhwenQi00cDAOjtb8T3zBQNe/6pYBl6JvS4ccLBdTMiHMfW0nX1DBWURHq1Ae99DjYn1wqhGbOJ3C+L/Jf9Ehno0WC9zMMdtH0hhSe7jVzTRetwjZU+xSIgLOLuHit/tc5N8nx8nIx94Wn6wOlDxwjKCGk+oCKlnrTrTGWjjXUhx/gvWYLPp7nFW375mMh3HfxMcRPbkSFrKwiFwvea4WJmLS4NgqD6ylAhTQS5H+R9P0YMKcvyD27ade+d9qwBaNogS0dyIrPwLysIXe0n8vg4TmXz7h0VLK0Viu21NYQdASzB3mze0y7Hf8R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 18:50:25.0686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bd1745-c207-442a-ec76-08debdb3250a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7/qfDzKqjqdsh6sH/KnNjJcc+HfpdI5jSAriebDrEk=;
 b=IWDEG9aXBga/AL9PicUhtvjGyhlJiavP8dMxCaKbD/qWR7kBauETN07ircLe1Y5aMy8Ug1oNIx2oqMOePiXUWCb2fFCvvYfJVjvCZKGB18JCoGNyf5+tgMjKgKNU4v1J5/SwPBsDZ1ntiPBi5tgFwyZAIGYKuppiodLcDPDjsUY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IWDEG9aX
Subject: [Buildroot] [PATCH v2 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 yann.morin@orange.com, brandon.maier@collins.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump gcc-bare-metal to gcc 16.1.0.

0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch is already included in
gcc 16.1.0, so this patch can be removed.

See here for changes:
https://gcc.gnu.org/gcc-16/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
- remove 0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch as it is already
  included with gcc 16.1.0
---
 ...dy-Make-it-buildable-by-C-11-to-C-26.patch | 263 ------------------
 package/gcc-bare-metal/gcc-bare-metal.hash    |   2 +-
 package/gcc-bare-metal/gcc-bare-metal.mk      |   2 +-
 3 files changed, 2 insertions(+), 265 deletions(-)
 delete mode 100644 package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch

diff --git a/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch b/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
deleted file mode 100644
index 7d6116a9c5..0000000000
--- a/package/gcc-bare-metal/0001-libcody-Make-it-buildable-by-C-11-to-C-26.patch
+++ /dev/null
@@ -1,263 +0,0 @@
-From 1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 21 Nov 2025 16:25:58 +0100
-Subject: [PATCH] libcody: Make it buildable by C++11 to C++26
-
-The following builds with -std=c++11 and c++14 and c++17 and c++20 and c++23
-and c++26.
-
-I see the u8 string literals are mixed e.g. with strerror, so in
--fexec-charset=IBM1047 there will still be garbage, so am not 100% sure if
-the u8 literals everywhere are worth it either.
-
-2025-11-21  Jakub Jelinek  <jakub@redhat.com>
-
-	* cody.hh (S2C): For __cpp_char8_t >= 201811 use char8_t instead of
-	char in argument type.
-	(MessageBuffer::Space): Revert 2025-11-15 change.
-	(MessageBuffer::Append): For __cpp_char8_t >= 201811 add overload
-	with char8_t const * type of first argument.
-	(Packet::Packet): Similarly for first argument.
-	* client.cc (CommunicationError, Client::ProcessResponse,
-	Client::Connect, ConnectResponse, PathnameResponse, OKResponse,
-	IncludeTranslateResponse): Cast u8 string literals to (const char *)
-	where needed.
-	* server.cc (Server::ProcessRequests, ConnectRequest): Likewise.
-
-(cherry picked from commit 07a767c7a50d1daae8ef7d4aba73fe53ad40c0b7)
-
-Upstream: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1f0224e8ddb3d3d0bf4c7a11769b193a4df5cc37
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libcody/client.cc | 36 +++++++++++++++++++-----------------
- libcody/cody.hh   | 22 ++++++++++++++++++++++
- libcody/server.cc | 28 ++++++++++++++--------------
- 3 files changed, 55 insertions(+), 31 deletions(-)
-
-diff --git a/libcody/client.cc b/libcody/client.cc
-index ae69d190cb77..147fecdbe500 100644
---- a/libcody/client.cc
-+++ b/libcody/client.cc
-@@ -97,7 +97,7 @@ int Client::CommunicateWithServer ()
- 
- static Packet CommunicationError (int err)
- {
--  std::string e {u8"communication error:"};
-+  std::string e {(const char *) u8"communication error:"};
-   e.append (strerror (err));
- 
-   return Packet (Client::PC_ERROR, std::move (e));
-@@ -110,33 +110,34 @@ Packet Client::ProcessResponse (std::vector<std::string> &words,
-     {
-       if (e == EINVAL)
- 	{
--	  std::string msg (u8"malformed string '");
-+	  std::string msg ((const char *) u8"malformed string '");
- 	  msg.append (words[0]);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  return Packet (Client::PC_ERROR, std::move (msg));
- 	}
-       else
--	return Packet (Client::PC_ERROR, u8"missing response");
-+	return Packet (Client::PC_ERROR, (const char *) u8"missing response");
-     }
- 
-   Assert (!words.empty ());
--  if (words[0] == u8"ERROR")
-+  if (words[0] == (const char *) u8"ERROR")
-     return Packet (Client::PC_ERROR,
--		   words.size () == 2 ? words[1]: u8"malformed error response");
-+		   words.size () == 2 ? words[1]
-+		   : (const char *) u8"malformed error response");
- 
-   if (isLast && !read.IsAtEnd ())
-     return Packet (Client::PC_ERROR,
--		   std::string (u8"unexpected extra response"));
-+		   std::string ((const char *) u8"unexpected extra response"));
- 
-   Assert (code < Detail::RC_HWM);
-   Packet result (responseTable[code] (words));
-   result.SetRequest (code);
-   if (result.GetCode () == Client::PC_ERROR && result.GetString ().empty ())
-     {
--      std::string msg {u8"malformed response '"};
-+      std::string msg {(const char *) u8"malformed response '"};
- 
-       read.LexedLine (msg);
--      msg.append (u8"'");
-+      msg.append ((const char *) u8"'");
-       result.GetString () = std::move (msg);
-     }
-   else if (result.GetCode () == Client::PC_CONNECT)
-@@ -199,7 +200,7 @@ Packet Client::Connect (char const *agent, char const *ident,
- 			  size_t alen, size_t ilen)
- {
-   write.BeginLine ();
--  write.AppendWord (u8"HELLO");
-+  write.AppendWord ((const char *) u8"HELLO");
-   write.AppendInteger (Version);
-   write.AppendWord (agent, true, alen);
-   write.AppendWord (ident, true, ilen);
-@@ -211,7 +212,8 @@ Packet Client::Connect (char const *agent, char const *ident,
- // HELLO $version $agent [$flags]
- Packet ConnectResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"HELLO" && (words.size () == 3 || words.size () == 4))
-+  if (words[0] == (const char *) u8"HELLO"
-+      && (words.size () == 3 || words.size () == 4))
-     {
-       char *eptr;
-       unsigned long val = strtoul (words[1].c_str (), &eptr, 10);
-@@ -247,7 +249,7 @@ Packet Client::ModuleRepo ()
- // PATHNAME $dir | ERROR
- Packet PathnameResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"PATHNAME" && words.size () == 2)
-+  if (words[0] == (const char *) u8"PATHNAME" && words.size () == 2)
-     return Packet (Client::PC_PATHNAME, std::move (words[1]));
- 
-   return Packet (Client::PC_ERROR, u8"");
-@@ -256,7 +258,7 @@ Packet PathnameResponse (std::vector<std::string> &words)
- // OK or ERROR
- Packet OKResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"OK")
-+  if (words[0] == (const char *) u8"OK")
-     return Packet (Client::PC_OK);
-   else
-     return Packet (Client::PC_ERROR,
-@@ -319,11 +321,11 @@ Packet Client::IncludeTranslate (char const *include, Flags flags, size_t ilen)
- // PATHNAME $cmifile
- Packet IncludeTranslateResponse (std::vector<std::string> &words)
- {
--  if (words[0] == u8"BOOL" && words.size () == 2)
-+  if (words[0] == (const char *) u8"BOOL" && words.size () == 2)
-     {
--      if (words[1] == u8"FALSE")
--	return Packet (Client::PC_BOOL, 0);
--      else if (words[1] == u8"TRUE")
-+      if (words[1] == (const char *) u8"FALSE")
-+	return Packet (Client::PC_BOOL);
-+      else if (words[1] == (const char *) u8"TRUE")
- 	return Packet (Client::PC_BOOL, 1);
-       else
- 	return Packet (Client::PC_ERROR, u8"");
-diff --git a/libcody/cody.hh b/libcody/cody.hh
-index 789ce9e70b75..93bce93aa94d 100644
---- a/libcody/cody.hh
-+++ b/libcody/cody.hh
-@@ -47,12 +47,21 @@ namespace Detail  {
- 
- // C++11 doesn't have utf8 character literals :(
- 
-+#if __cpp_char8_t >= 201811
-+template<unsigned I>
-+constexpr char S2C (char8_t const (&s)[I])
-+{
-+  static_assert (I == 2, "only single octet strings may be converted");
-+  return s[0];
-+}
-+#else
- template<unsigned I>
- constexpr char S2C (char const (&s)[I])
- {
-   static_assert (I == 2, "only single octet strings may be converted");
-   return s[0];
- }
-+#endif
- 
- /// Internal buffering class.  Used to concatenate outgoing messages
- /// and Lex incoming ones.
-@@ -123,6 +132,13 @@ public:
-       Space ();
-     Append (str, maybe_quote, len);
-   }
-+#if __cpp_char8_t >= 201811
-+  void AppendWord (char8_t const *str, bool maybe_quote = false,
-+		   size_t len = ~size_t (0))
-+  {
-+    AppendWord ((const char *) str, maybe_quote, len);
-+  }
-+#endif
-   /// Add a word as with AppendWord
-   /// @param str the string to append
-   /// @param maybe_quote string might need quoting, as for Append
-@@ -264,6 +280,12 @@ public:
-     : string (s), cat (STRING), code (c)
-   {
-   }
-+#if __cpp_char8_t >= 201811
-+  Packet (unsigned c, const char8_t *s)
-+    : string ((const char *) s), cat (STRING), code (c)
-+  {
-+  }
-+#endif
-   Packet (unsigned c, std::vector<std::string> &&v)
-     : vector (std::move (v)), cat (VECTOR), code (c)
-   {
-diff --git a/libcody/server.cc b/libcody/server.cc
-index e2fa069bb933..c18469fae843 100644
---- a/libcody/server.cc
-+++ b/libcody/server.cc
-@@ -36,12 +36,12 @@ static RequestPair
-   const requestTable[Detail::RC_HWM] =
-   {
-     // Same order as enum RequestCode
--    RequestPair {u8"HELLO", nullptr},
--    RequestPair {u8"MODULE-REPO", ModuleRepoRequest},
--    RequestPair {u8"MODULE-EXPORT", ModuleExportRequest},
--    RequestPair {u8"MODULE-IMPORT", ModuleImportRequest},
--    RequestPair {u8"MODULE-COMPILED", ModuleCompiledRequest},
--    RequestPair {u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-+    RequestPair {(const char *) u8"HELLO", nullptr},
-+    RequestPair {(const char *) u8"MODULE-REPO", ModuleRepoRequest},
-+    RequestPair {(const char *) u8"MODULE-EXPORT", ModuleExportRequest},
-+    RequestPair {(const char *) u8"MODULE-IMPORT", ModuleImportRequest},
-+    RequestPair {(const char *) u8"MODULE-COMPILED", ModuleCompiledRequest},
-+    RequestPair {(const char *) u8"INCLUDE-TRANSLATE", IncludeTranslateRequest},
-   };
- }
- 
-@@ -135,21 +135,21 @@ void Server::ProcessRequests (void)
- 	  std::string msg;
- 
- 	  if (err > 0)
--	    msg = u8"error processing '";
-+	    msg = (const char *) u8"error processing '";
- 	  else if (ix >= Detail::RC_HWM)
--	    msg = u8"unrecognized '";
-+	    msg = (const char *) u8"unrecognized '";
- 	  else if (IsConnected () && ix == Detail::RC_CONNECT)
--	    msg = u8"already connected '";
-+	    msg = (const char *) u8"already connected '";
- 	  else if (!IsConnected () && ix != Detail::RC_CONNECT)
--	    msg = u8"not connected '";
-+	    msg = (const char *) u8"not connected '";
- 	  else
--	    msg = u8"malformed '";
-+	    msg = (const char *) u8"malformed '";
- 
- 	  read.LexedLine (msg);
--	  msg.append (u8"'");
-+	  msg.append ((const char *) u8"'");
- 	  if (err > 0)
- 	    {
--	      msg.append (u8" ");
-+	      msg.append ((const char *) u8" ");
- 	      msg.append (strerror (err));
- 	    }
- 	  resolver->ErrorResponse (this, std::move (msg));
-@@ -176,7 +176,7 @@ Resolver *ConnectRequest (Server *s, Resolver *r,
-     return nullptr;
- 
-   if (words.size () == 3)
--    words.emplace_back (u8"");
-+    words.emplace_back ((const char *) u8"");
-   unsigned version = ParseUnsigned (words[1]);
-   if (version == ~0u)
-     return nullptr;
--- 
-2.43.7
-
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
index 19678dec30..6104962a22 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.hash
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -1,5 +1,5 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
-sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 6c2c8a5e26..d4f011c2fa 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 15.2.0
+GCC_BARE_METAL_VERSION = 16.1.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
