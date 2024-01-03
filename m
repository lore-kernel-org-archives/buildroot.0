Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDCAC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 00:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 386EC40A62;
	Wed,  3 Jan 2024 00:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 386EC40A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpGcFF2avOkj; Wed,  3 Jan 2024 00:28:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E5E140A88;
	Wed,  3 Jan 2024 00:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5E140A88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA341BF977
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA8540A5F
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 00:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA8540A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFIKpl9bGcwH for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 00:28:30 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::703])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB39D40192
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 00:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB39D40192
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVdmOvqC28+ghDjDqneB2FVlSJWBeFMKKU4fsZ/aagQB3x8yK9SUM578FgHx5160rVCQVVgfiZs2Ji9bza8JXHtBne6vFTCDVk3iexjBMjf6CH+t1PLYw0xtjsqj1x4nx22Yr7qfiWgnmBwCZiyN72a8+VWMox7aPkwDBd0lD1VoNBWzcdXlf464Xed+eoKd76/Zsyz7RngZv1aUnLTyWPKrjw+Qv3mZWqBMXomowLunp7SdOkUaKwH1/TvD3imSAS9vsliH6p3Kb2L3Eg5EXcd3V1eA+ySZ2UnHVlIhAM2Y2ZmA929oLlIGoBHbYEAT0dssjJ72oZbNagXdgx06Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5MH5drcIMLqjvJty6BQiRHFiqvcnkO23nxT8H0946o=;
 b=heEgwDZpf5q0UVoilnNRYvXEcg1+auy9RUQwlzN10oWEYOTiWQgn3h16vA2DJYcQYzgdonevAgUX8UPu4mA/jbRWS2XjvgDQ2dP/o/rDc5dj5TK5gPdsW7ojlLSoUy+uqIVTxMk8CbJczgDnsYYaM5JG6CIr7UpjPr5Y773O4I5iPMy3ZL4SeXKkF3oIzQvnNh5G1/HZB20P5Qvwv44LwBVL4DVj+ME+VnQTmd7akUyz1bz6ghc9cEHuangxADAX9PCtI5EYAs/KK0YsQ3wXnnwlRz5qOX6fhneBJ8VsNrRndLpl9wBqdRHpPVZr9FsmWNTAalZaGQOuDK4t21HIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6346.namprd10.prod.outlook.com (2603:10b6:303:1ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 00:28:26 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::5a20:2f52:3e09:72b3%6]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 00:28:26 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:28:10 -0600
Message-Id: <20240103002810.1055951-4-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103002810.1055951-1-colin.foster@in-advantage.com>
References: <20240103002810.1055951-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: CH0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:610:e5::8) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 018b5f2f-13be-4a5c-e746-08dc0bf2e6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LpgZW5h5ta+XnI8SQxPuWygA2e/8sVAwzEscRvpdwip3OQJtvwgZ5ouEqedvalzg+7JBdl6UmWkANoogqnZ9GuT0eGvd/udTh5diqnWpKCvrfJMutHqeUDH9BFB245Yxo6wK9xMiQwJWpFP/SdC/+clBfX4GJIi+t6M7v/ijFN3zzS6bYbLf0HJGSobRjd3McrgWb5ACGUfTDb/KjKmRcImEF5akBvxpb98wub9GqQLKqnTgfx+VhKeLAS2u9JYnKaC3ZdXbQcBVbt7C0varJdbvUludsn2IosY2285XW2O4pg1Sw7lmzmwjb6keZy8tNbaoTBRd3gsmG4TCnMk0ozgtVIGNqCbgedigj4dyuBDcmqbzsDy507U65edLXt4U5IsKOSKedlzRRsGOZnJUFsbON4DxjVUIk4s46WPVDAmugJAQo2mFvqvqX6ZQ60xzD6fLCF6sk89vGOKZqEajUb8aEqiyCrjjMiqskYlUhjT3inkhTJe2KkaUlkq1ytw33jgoWivFZlLSy3ST6EXaJWRQFKbbmFKNdgiGahjvSugpPWMT5gLnHKD3CLD5PxVjpMnUX3CQQeoKxuxE8HyJgIRP7W2HQAg82NCMqUniHg2CKJBnuZ5K5GwMleoJRlC4NM+LA+4yRazYDule4LF2be7sGUHWnspAhhWRbNN6BAjUS4wgD9qG7LemIExNWRp2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6974.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39830400003)(346002)(136003)(366004)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(4326008)(2906002)(8676002)(8936002)(316002)(6916009)(66476007)(66556008)(66946007)(52116002)(54906003)(2616005)(44832011)(6512007)(26005)(1076003)(41300700001)(38100700002)(36756003)(86362001)(6506007)(6666004)(478600001)(6486002)(38350700005)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nwMa7xIODM+R9llplvY6tO2QIYORiKxzYtrG7siyBF712b+YoDcmMm/esV4A?=
 =?us-ascii?Q?+48Ikn/eS7N+F5ZLKh5x5hpyPpXdTjJfOG+WwZqv6tJUkI1IqKMDnHY3nKaO?=
 =?us-ascii?Q?Yuk6W9JHQKpSi8q9tXs4IMxeNGrOPxofwBMrPhMQKbTsXf1OGuNHGXJwx/rg?=
 =?us-ascii?Q?U9c+wCepEnPCcnN2tgO8aGudCDwuewO78IRz6t0J0gWjPCOfD/lRCmJM9U8L?=
 =?us-ascii?Q?Gyzext43MxsNPU/NCASmN/+LGXKhvSdfC7OWqgkYKAUFLdnoj3fnnucC2ESo?=
 =?us-ascii?Q?bllX/AUCbbiyM7mkXnimxe5AWiF45FZsgJ0lrYmJ1lkgCT5UPnOvSEH7ZmHN?=
 =?us-ascii?Q?BJk67Kdzj+nu7bh7Km6wf+6wVDIdnLbfceORFmrfJfwQpCMfDRWyTlDRL/vY?=
 =?us-ascii?Q?YZsme0Fklw4ARyctgR4iD5A2JS8Y9yniB+LiXGAgcoD5Mm4//w+axTxpaD3X?=
 =?us-ascii?Q?b4Ek3tNSSuljcNUID02d19j88PK0jQI080doM0IbzPfkGu/oY7hGKLhsn1lu?=
 =?us-ascii?Q?AdnyWnP9id7hCOh8Z9CzKsZOGWq4QsRWwJcx3zUEvOed8NvMEJx1VUkaVOKU?=
 =?us-ascii?Q?9N/PymApbsOduHEfkWvbuBa8KCQaVNRV+g+VB8ddE5B8y4iEUpildOvwS4UX?=
 =?us-ascii?Q?msvGMgsg08K+y2vDidoLBv3Bd4MXI7DYVO9mvzkHxYtDDglXpP1V/x8Eyh3t?=
 =?us-ascii?Q?Oeb9ymqd7CdveJq7QWjJo7jPfBLCNr+C/Gl1/EBdek6VTDgO+Imx3E7y8Rph?=
 =?us-ascii?Q?Op1BRx6WW2fdtOJorN2Bv++/Xt+6VHh3lbZNyzjohKNcYUpw2GfEtrkj6784?=
 =?us-ascii?Q?/EMp7djXVn6eyzkTMzjDq6p/SAV+PMqx0pP3yJyAH+3Rp8/X9fWfrT+AQrKB?=
 =?us-ascii?Q?AMc/H4k6wRNw0RTVoomlNgWpohB1wzKi97CBdgct8juEBRqjT09+vjCOuUP5?=
 =?us-ascii?Q?4xNJOqXsbYxtR25wryduXOkXAXrg70OdYFA5nefa9YqkArL3qUSDS5Uwr5iT?=
 =?us-ascii?Q?sER7XzvjrI6Jgq5HGW5V5ybmvQbTEbPuin7EP8rXYFZ+sP/F9v4+0aQ6jfom?=
 =?us-ascii?Q?w4nNg2taO8/aNOSHF+NSgZPrd8EeIxKs5TYpwlr0xcWHCRywv53gtMtmFgcF?=
 =?us-ascii?Q?m+McBpmJN69FdjaarMTx33KWb33suo+16XVfe8RkOhdMrvami7ikgfbB+OWD?=
 =?us-ascii?Q?s18aaLyoaN4NyFn2i5njMlFLwNoLRzi0z1z9V3eIMUIAF+1h3RWGv7OSx1b2?=
 =?us-ascii?Q?PgPpLzT+YD4MQECbPIGMGKli6dsUidDAGAhSY1LZYmaG22ovVcnXLY3nRz4+?=
 =?us-ascii?Q?GYI2IiCh32yDv5TNdzLAYjOooB2RtW3F8F+1I4HtsgxR9SzXve4Gvuek0XQZ?=
 =?us-ascii?Q?yOoaWa2a/grO6vSDw+cvxmPY+NSUbyipAB9t/k4G4I1Hm0qtNlGndq8m8Hd9?=
 =?us-ascii?Q?EMgk8iTjXnIWqFhZwUU5d0Q4z4kwMnP7CGO1kvEb0wYPTu/OT2cIZDoWrmo0?=
 =?us-ascii?Q?LmWNxn3k8oVcwiDKNxSMwfP02f5ldH0lqXeHB2afiWwR26Do94Fgr6vC2+ln?=
 =?us-ascii?Q?bRQhQH2r+FQhIbOXijyMogE87YsXJydVyAYLT35Lbpwa1ywQlBv42haM5Jz1?=
 =?us-ascii?Q?6Fvs2jaEPmlEKkTTrAJWlWM=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018b5f2f-13be-4a5c-e746-08dc0bf2e6a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 00:28:26.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYgk5abmc32d3eDqjAt0eFYCNWUT9jmDGW+UhPRzF++Fs3UHKM7Q7xqdzpWwqjdTgNs/wpHAjEsVcSx8KYJs3dWETgpp7G0oATufzbSKNHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5MH5drcIMLqjvJty6BQiRHFiqvcnkO23nxT8H0946o=;
 b=RZTjTamWxX+E7L2tUiwq9jbN9pXsnF/MtJyKXXIUtmcsA8MBTHa9VmrG/t/tfYyKpLOh7e7MvwQvjNZTuqZccDygRbFwVPxy6H95U7xL+FvKwTpMJjyvoe4V+TCMCb51tdjvm7nqSZVHNwRP/ate2jSMJX4jd3uoXdjCou0vQ/A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=RZTjTamW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: [Buildroot] [RFC v2 3/3] support/testing/run-tests: add ability to
 run tests from external
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_EXTERNAL variable can be used to keep customizations outside of
Buildroot. There was no support for writing tests in those external
environments.

When the BR2_EXTERNAL environment variable is used for running tests,
include the tests found in ${BR2_EXTERNAL}/support/testing.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---

v1 -> v2:
  * try / finally reformatting broken out into a separate patch
  * Multiple BR2_EXTERNAL support

---
 support/testing/run-tests | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index dedb487ffd..87ce91266f 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -48,6 +48,15 @@ def main():
     shutil.copytree(script_dir, temp_dir.name, dirs_exist_ok=True)
     test_dir = temp_dir.name
 
+    overlay_paths = os.getenv("BR2_EXTERNAL")
+    if overlay_paths:
+        for overlay_path in overlay_paths.split():
+            external_testing_path = overlay_path + "/support/testing"
+            if os.path.exists(external_testing_path):
+                shutil.copytree(external_testing_path,
+                                temp_dir.name,
+                                dirs_exist_ok=True)
+
     try:
         if args.stdout:
             BRConfigTest.logtofile = False
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
