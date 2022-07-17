Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691AAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD8660F8C;
	Sun, 17 Jul 2022 17:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD8660F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVoof_mzLaLF; Sun, 17 Jul 2022 17:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B7AE60F86;
	Sun, 17 Jul 2022 17:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B7AE60F86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC211BF3CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F33C40538
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F33C40538
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSOKPZGzbaRy for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 17:23:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE8E40002
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FE8E40002
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 17:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WViABndTW9ylPjlrl1anKG8rTcyqpEF4lXK7NVhoHFcXY/j3JDyOCS6TOQ8fyD1c6FeJnO3De2gV71cM7s0CvGff7G+0VYS9hxT4mXvketLGF4RT5sv8okG21YOpY7X7lVoQIVgw2nu/vgcOLL2BZViajcYEN1vZyY4CRpn4DrpZMvY4Rvn5pCwARMND8E7+x6xWD6bDJMBF5rJa/MnEWr6+ftWAuaKiH7PwimuQLQLqq+qqog/02YqRUvjrOa21AZf41WjgYfQxAe6VOXVKSB0ZsUHX83vYR06dz0egclUu5nGiG3DYk3OeRwRSFeNkuq32/3CT9KY6xRssIhGSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=proNNvffUUpLngCYBVlo11faq8b2cP39Vg6UqCmEMoM=;
 b=foAK/Nh6ApB7IM8thqEx+7jgSeiplGy7dn7jHon68vlyOPWJXllqnCdzdrT4776hD8iJN/rhXH8Djgisg5uPCrdoqk4QsUvKIrnft21pd2IPQyAO4hxKEJtiQhyCqSFZKa+CRGhcHNMjQx36OyWdcw+6N87UirUOPzE5N3IVEZwEKz/9ghtMDTgztmhbsD0lxY3L6rNNqHpJJtyDIEn5HHNtC9xYmnhUyPEZAV2SgsfnSfS8Pihh43Zsq/xpBOk6Qdg/q0j7GQlNQ+htNQk4JNVEvH/AVP2qUv6SxQbUSIIzdpK9+uj62jYHltJw23rSbjOxx1rEd7aKewMP7jYd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by DM4PR17MB6160.namprd17.prod.outlook.com (2603:10b6:8:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Sun, 17 Jul
 2022 17:23:06 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::3493:363e:3674:fb0f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::3493:363e:3674:fb0f%7]) with mapi id 15.20.5438.023; Sun, 17 Jul 2022
 17:23:05 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 12:22:10 -0500
Message-Id: <20220717172210.381711-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::19) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73a89643-3fce-429a-e490-08da681902c5
X-MS-TrafficTypeDiagnostic: DM4PR17MB6160:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/sZ2AQGADbt/Yqsh6zJ5aN4Ap8+dfXBzjVF6/lMv1MRs4VrUxV3Q92WCZBGDeQkl8s6kIqn4JlRztrCaA6a9A1vTNpeZ9yYfmMZpr47/JCnR+g/VF4rcaPKhQUOymlHCmfoRqfuHhWpw0FSWn4bYHwaVOBwXuk207kquLEyEWRTb+kbNXFqsDq2fU6wIUp/bD9ijri/0w4bwgXT7TPO3278rJkr3uWtIIgpT1PwAPYetfJzvFI+ChET5BQXSNgO21fFOELfxxS2Y86Kf39YQeiFtGiYZTy0+tO9SQATvFbQSszyM/KHIOcenks0txGq59eCgDD+GcLChXJ0EsoU5Hpx7G78J6cNJh/Vv6Ep8Szj65bIsFltzV9rIhG/2Iq6eoOzERV/BDQ2NMSW8TXu/cGftWWRJ7pulMAUam98BdGtP0J4UYLdtLqIKNddUdzM2cQ6Bnc4zytf4i3x/tCEywYQUmg3EOZabmqbodc33edn64ClPPGGA0xH1ENiXYauV0dWVYawvA6eWCpNF4Htikz6BiNb6uRXuBorx0+kJdbaKmA9AIl5dIPusiw3fhsjdwV8a2GJCLaSxHaSknOG28UuyQiDPcjfnaXGLv7/1Q36hJoApjPSH+IvyZYjr9GVBzbblu4jkmpKtV9lDz5B6YrPeL5TV/hyOC3TQpXNmQtE7kFb4khmQBGkx0GSH0ap/zHj/G9DjmXABNn2uNOCoX0fmgJAEgRLeE2B16+AtIbV3HtoyoBqooeHqSrWoHH0qwn+0cKUf6ExkAekcjuxykWLfM7nKJYBnWtOGvX0+By4ZDu0rL3s9UaAfzA+vNaD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39830400003)(346002)(376002)(366004)(136003)(316002)(5660300002)(4744005)(66946007)(38350700002)(8676002)(86362001)(41300700001)(2906002)(38100700002)(6916009)(186003)(66476007)(66556008)(107886003)(1076003)(4326008)(478600001)(2616005)(6512007)(26005)(8936002)(6506007)(52116002)(6666004)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l9cvcFjY6ANCcnsIYkjCHpq0CYq/GHfF2+0zL99uE56Ssidx7DtnXr13K/GQ?=
 =?us-ascii?Q?gYvQcyxmv5uDG5FyxcnQz6bVMHn4HjjF0HyX35d+9y9E5BC+zgIAjx+mrhP6?=
 =?us-ascii?Q?N5kjXxcudkB7nZL78LAIRly4fOG26fpmx7R/w0iDYVZ0unO2AHNyJCfoEip7?=
 =?us-ascii?Q?gAzQKN+M15Knq//UsJHfq2gbUhUyIscUze6Si10nT+8vzFaWpir1H/RRdd/r?=
 =?us-ascii?Q?OjF/Uq5sl3kONNE9KVPFh98IJhGJosOLgGQSvwtYDp/YkGFcRf1NdVVDsIYN?=
 =?us-ascii?Q?mlWd2s64V+/8I3BcY3316UhqCNk/5xN+uc4Ko6rBLsxhX7Ai46mZHf/awCr/?=
 =?us-ascii?Q?KT9YkoPIBE4tS7gQmazYheFMkmoBeeZDX00IR8eFnF6sjwmaraCYkelgJi1e?=
 =?us-ascii?Q?A4LhemxUHGqsAAb3y310T4Z61hRaBJa75WHcoFKwj+F/jmPzRyDazAXDcnuc?=
 =?us-ascii?Q?VGyhKls3MLfd053wFJ2WoTBf/L65olW3SK6OWkMOhEYtztBSdbuJ07IVoUSo?=
 =?us-ascii?Q?QrXHbTgeBLIyXm4vTPxZxuR8vv/GywT78VeUafDEBtfOQjxtN+qZ+76OZuQD?=
 =?us-ascii?Q?M/rYBcm34hQyMc+02uFwKi2j6HW1E8NO/Ll+bnNsL9qQx1uTE5F3p0QUAqao?=
 =?us-ascii?Q?wdNNmV/tEtHjdINER2YGUCYXYEo8HbV8Di5FtJ5Z72608Q3PCDoySVt5aJTL?=
 =?us-ascii?Q?REJhmo0nK46Jbkcace0PaGsfy1e1onfgPwoYmQ+nlbW8qzvvZmn1qN9mHgWB?=
 =?us-ascii?Q?bRRkB77IbEgH9MP35x9V7Wh+iHvv0ngu7EGbEQilTznJfwqj9IzcIqcnfYlL?=
 =?us-ascii?Q?8gH+OXpvHeKLAvOc2cFLrP9I6heTtTvmcJq1+ReHyTubmkvicEaCfU7/dqiw?=
 =?us-ascii?Q?67qW3txEvbwWWuuC33VPckYtEMvQaOufdtuzMJJf7Hfth6SrH6qXV2W48YAn?=
 =?us-ascii?Q?UgkClRBaSeQaC2EfbwJG8PFaYe5i2lw7pX0k34sQieQzWbm9rZgvJJmnmfFD?=
 =?us-ascii?Q?JmMR6UDubTpQHjgreeuLC4K1IUUIr9cCtPZizdVsEou5HAAuTM4UwnJJAZJM?=
 =?us-ascii?Q?z8xCFg+5oD7KrTVzd6XH+6AJVagU7KLJhNn13Ogz9kY7wxonpIKyvbx7lM0o?=
 =?us-ascii?Q?jvZBEzdqTe6Qmy51GhZEPy+rxEG1ycC6moUJacRJnIDKH0KzH2qC6nHk2uSv?=
 =?us-ascii?Q?A2fzCGK039cjR8LY+PV3JM236sYJXbosQq989QQB2YD9a4fiugyik7904bvy?=
 =?us-ascii?Q?eCuo4TMxZ/2FAuHo3snEEspZ2ZjDEoZfjFvE1ULTPnTy1CWoPz60it78wHEj?=
 =?us-ascii?Q?WNPdGzTkqF6JBkmvQBzjGT2YaA3pzNxFKftxaDvm4Da5OPqi6hUxthLJvHrP?=
 =?us-ascii?Q?2KHIzgHelOKyJioHLwIrNE1rtiTVCfKfABjXGAm9IqLwJewFfXhvFv/QfuAj?=
 =?us-ascii?Q?TkyfEa6QGDl8uaFSoQNkUXtVAjZInxrUFwhMDb9CZ2f7Ddn0kX+Tazu85D+F?=
 =?us-ascii?Q?3EZHnePYPv0Wo+EWLZcC0d2bZibrIBc4l8UcF1iHfY/ft77H2BKA77z7JAIi?=
 =?us-ascii?Q?i8x87YrbSfQJDEIVDosofo3OflX/wtj78DvbObF3?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a89643-3fce-429a-e490-08da681902c5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2022 17:23:05.8059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBe5baz9rU/wfM2BFBxLZPbxMXLSt5bIOlHR8nhz7/pNZGWF7TODCjd8LU+XmVfZV/LdVu60OPCvN03tFBsI0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR17MB6160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=proNNvffUUpLngCYBVlo11faq8b2cP39Vg6UqCmEMoM=;
 b=OVsEZcE8J+w68PGedVGcUYMaMhT1+i4GYiyzFCYmi8JmPaBmuvc4pESIxBnofi02tkdkmMNGmE0jF8hGxx15mWdSY/HBtsTQ0lRisa/f4gbyX5aJPqTlCqsQFGiSOzbmr6x9Aoxc9wA52tmXQUrFEv18l5iXWpeel5NAW5GDYS0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=OVsEZcE8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add myself for systemd and
 pkg-stats
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c3c24ff7a..a004a72a38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2565,6 +2565,10 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sen Hastings <sen@phobosdpl.com>
+F:	package/systemd
+F:	support/scripts/pkg-stats
+
 N:	Sergey Bobrenok <bobrofon@gmail.com>
 F:	package/sdbus-cpp/
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
