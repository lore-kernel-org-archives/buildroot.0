Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78669C19F2D
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 15:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DADBF41C28;
	Wed,  3 Aug 2022 15:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DADBF41C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87NDd6bKm6Aq; Wed,  3 Aug 2022 15:33:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEEF141085;
	Wed,  3 Aug 2022 15:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEEF141085
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5941BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F59B41B54
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 15:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F59B41B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEdUdMYM5AOv for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 15:33:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC687401BB
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2137.outbound.protection.outlook.com [40.107.95.137])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC687401BB
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 15:33:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMGYlB5/wcQef44MLSUTLuIHY2z2RqtG/XBOjnl5IL19nxOByukx9bWTbnG96gED6JyhTjIN/J7ZQANlyJ+zFJKkFUa+nj2hqdqG/Xn9XLFjc/Z5WbxLSMqdrJqEdnPcDcd+IAKZJYlMCH6ScWDYoJSH6OddcBFEahOi543GfR3ea8x1ZY0X0HRxF+Prj5Eq4bHp/tTldr0Ee8oj4LV+Ta8eN30yuC32ZE1dVJwcelPXvGEma3FVq8NaYu96yjezQGbBZQMV5fKvMdUO6ZwEfzM+ZEbxmr6M2opLDCHASMzAkAJS96i528QgKqvUEVBFxlN7/eU10M9lF/r8sb3Q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBG1a6u8D7TXx20m7iskr+/nebNJY485qdAU43Coo0Q=;
 b=MYZo4kUmsgL5GnIuBVZbMt4OzEM3im9YHMCvOpKVRFsq1YD6TDJumnTVoQT/hr3QOdgWcuUWK5TZA7wSsO7z59SHxuO23rjl4HgvXwtPDGn/nnschafVYUDMGD3TEYhsaePcKHIvops2QQxIXVqcWjHKxEqNdy1eMH9D1rK0nTVlt44PbzcSU2wv4U4toBD9nVfA6RycZ8RhOfv9HZPb8OvYfm1nWFv2vk/awqZSrumG/qPCh2EsnLa5V4UuejFvVFLsps0FX5Nzzg99uEHVG3CNnPkva5jxNNmrhzBo2CXmirW4jviU6pQx3EELEJIgrJd33fSogmoYgpsZ/J0C2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by BY5PR17MB4066.namprd17.prod.outlook.com (2603:10b6:a03:21d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 15:33:43 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::4941:8376:dc1a:c03f%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 15:33:42 +0000
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 10:33:24 -0500
Message-Id: <20220803153324.814454-1-sen@phobosdpl.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SA0PR11CA0144.namprd11.prod.outlook.com
 (2603:10b6:806:131::29) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6634f94-c23d-4771-0a42-08da75658bc2
X-MS-TrafficTypeDiagnostic: BY5PR17MB4066:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DSNm9f53N5VhK5edXTE6Run0USqksd46JIghPkp6BB8A/8fQ2nr0So2CwCC3+7cfuWodcZvjGWYlI8hRKMU1CnILKek2XeSFVACTs0PbNdutkVSBXgq0HK4dWDCjKH2uJs3Y1uz8OntsAdWA09MVX0qCxAv4Rh5ULYM2zt75RZMXNlqluXUJNDbqfab8aPMxLkOizN/RXf4G2wFyDkLmYkBxtGTzLwv240Q53Ik6J+XkkiWo/NBMeNTeyg8idxwzREydPDj6PAhcGSMSEPq3GvJVbwMvreQht/kmebY8J33WGfXdi4lBPyrzsdMvsn+hF43IjepGzuc5PRH6WZRrxXuyAexY0HRBobzV95tcD704PcyVmnsBNsxU++0MtEWVMv3cmDuePeA026YfRrFUlyg/gZwVbYLDdiYOjn9vKuj2LE0xmgZkoU+ARQK+K76lnsWllp2oSpSVt90NLMvAT9Va8fsqKIdtHDcbDa8edv1gO58LSIN9L9+M8kQZz6sbrdOJ0k4hnF7BQPYzvZJ7YiYH195ggPaOWkC9BYOXkTAfgCaEgIz2XsULD4boLrBqFOWSk+JI405fQOJokGCLA2sPsbHiITm30HtvZXvSIqsN6f/qvqM/Wo0HggURYmgJtmWmeMiJnVvwQgyaZI9C9Kd1KhsPXsImZHbcwezN2fVXJgk2clBPFsyRsfU8xKIvBg9wmzgrTUXCZhW7kg0xkRE33ZiGf+wKrwZkLIDaEBpthX+Q7RJDS8oFBzSQT6PNmZuxAkjU1xJl9cFaMp9sbMwL07EluPXihZyB9beyOLs2YongJNKaGvK8XRiye2Uh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(396003)(39830400003)(346002)(2906002)(36756003)(8676002)(86362001)(107886003)(66476007)(66946007)(66556008)(478600001)(83380400001)(52116002)(6512007)(6506007)(1076003)(8936002)(5660300002)(186003)(316002)(4326008)(26005)(2616005)(6486002)(6666004)(38100700002)(38350700002)(41300700001)(6916009)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KrMwMWgfLDwdx7WlmWl+g5PFk6iNO0Ub5Z5puwmlnux+wrpMQrvW9qv87MrF?=
 =?us-ascii?Q?iqCbKmY9upuHAFMQO76b+PglInqHzfwklqhEtBOZIubnSbSJc2YVJ0xv3jU8?=
 =?us-ascii?Q?duEXGjU1Tr05/4nCuucGAnVp0f6RLgKb71SI1bZjynrtmVQ1Gb93mc8L7vyb?=
 =?us-ascii?Q?vlG2YvQzBaYSgymrI0JP+c20iI4QACELG2oru7iXzFghU8iXrezrc/2ufsN3?=
 =?us-ascii?Q?XjhWn51ir/HWUoCYNL2qd0nmy1apDVDV4O6uJ8UgOWQzQWUty2Z34vrbvKIX?=
 =?us-ascii?Q?irIxYFthWnVHZaLGI17UVTdOxlQPOJ6gt/3LO0QE3QX89IkemjFQzTwC/bCW?=
 =?us-ascii?Q?dCq5d9Bud9MnsxWJos0ECgKLGwLj4ux2fDgzVj/lnmDy/OWVNgNwJcC8Q6hM?=
 =?us-ascii?Q?yllvWD9hKPugngIqOzK/aiNrCQfdQEUiAuo33C7E8JvzgdsdTge5ALxnAhFt?=
 =?us-ascii?Q?jGqNflWYV37mcQsK49CO3rHXtJiieAOEqJR4dXG4uuoYZ2ake47ziCV1znZR?=
 =?us-ascii?Q?mzAGCuV0HVXJlvJQvca0vwnug2YuIfQlICFYfXvYr0/ajP//aGuMkFOAK6sx?=
 =?us-ascii?Q?eOeM15pDlvDuhxCLdjfrgl/FI4D3830OVU4z6J3bf2JL+V1uZ11QulD0+Me1?=
 =?us-ascii?Q?RLOtIQfNRRHiyR/oZPR4gz83mKjd/d3esz4gvnAtcD1UUmkMGir67MC7+x+k?=
 =?us-ascii?Q?MrFR/wLyossnIHnEC+glZOYU+PL//6npTzQAK0MR8s8VXBYc0jV83I6UZNRi?=
 =?us-ascii?Q?GrNr8UW2TKGhU59bftLBMUS93APLFauOhExMdOO8UdiLOq6am1IB79aIYH11?=
 =?us-ascii?Q?hmM/wltzRDDSaEypJtEqLeCJPlCiUBKehzfjSFcZWaPD216bvaeXSoZf8264?=
 =?us-ascii?Q?y/KuC7GkeVwy6dQb5iOFRI/PuZhfs2AzUWuC1QMnfI/A47UxDoYjAw9a4n55?=
 =?us-ascii?Q?KMXWHUaqRQsrEARvS9P+Zo81bEUava4BKcX5wcX+4RAijDNlda/bQn+WwDLR?=
 =?us-ascii?Q?zBBDsUv1G8vvR74CTESdrw+t6crwkw+SOM4OuOPfXJXOMcM8pomYBtx//pKd?=
 =?us-ascii?Q?od9hnwShd5f4Mk+Ze6WNmN04oR1ENHLWr9F9xPA2dRat7GW96XM1GZN1RJ9r?=
 =?us-ascii?Q?V8/X3y98kzYHcWiIj94ztb84wNFbApBpGV9BBLPGYiim6byFv5WM0rsgoRpk?=
 =?us-ascii?Q?WIkmePNO8vb9/1t/DmVv8EZMYqLQ41wV2703iCbGjpTeftpqsj8fI8b1k7G9?=
 =?us-ascii?Q?KdvTlMkLUk/wEZ1OxnD5RkxbKZOvk0sV777ZRQ0D9OW7otY7Y3Dw1lhO5g0i?=
 =?us-ascii?Q?yiPl8LDqwU9MpferqBeKD/W2XTrNCyyA0sCA1RytcfwxPx4SZHMbng+6aWTJ?=
 =?us-ascii?Q?L7/pOh4TNZgqiY5f7kbLoZtHlynDxntDFU491j8XjfOeOt436/DWADzBkU+P?=
 =?us-ascii?Q?IbxgKVnhEhx3K4MbsK5pN9Y3FWqcjXWRJHBssPMczbH+4Iu5YEsRvcbn0dzg?=
 =?us-ascii?Q?zne59r0/FnLxcXW3hWeJKnI3WYIHETaiWVEt5r5UTOi1OiNlIs+I6vINabaC?=
 =?us-ascii?Q?b1w3cLLAFWxnczzR9FHT9iBbLawIIYsUyfV5BXa/?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6634f94-c23d-4771-0a42-08da75658bc2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 15:33:42.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjnWay9x1Jod3F2YD1SY7rcWMz+s1yMeOlfdAL3/p4lk3TzCsLyZkY/4m4/Q0fUGmdRF+ldM4fOcUIvETCzgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR17MB4066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBG1a6u8D7TXx20m7iskr+/nebNJY485qdAU43Coo0Q=;
 b=Ims4gcmyi04jLzeevJeGi3JvihIgNBHk41WU9zjCmMarK5zWd29SwtuNftNYhh1voeiMgNxLiRvNujxnPuURphsKRPD1DtTOARPUsPIWezFMCWNxJtaMDEVYj2F0XM2aTst+PSIfoqKjnn+CakNW8zyU894di4MT6eQL/wZzKNo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
 header.i=@centc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-centc-onmicrosoft-com header.b=Ims4gcmy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add linebreak
 opportunity in CPE ID
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

This adds an optional linebreak at the vendor attribute in the CPE ID.

It should be noted this is purely for formatting/layout purposes
and does not actually insert any additional characters
(newline or otherwise) into the rendered text.

This means that even though the text renders across two lines,
copy-pasting will still yield one line of text.

example: https://sen-h.github.io/pkg-stats/c245575.html

see also: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 91d42206ca..d32abd7225 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1102,7 +1102,9 @@ def dump_html_pkg(f, pkg):
         div_class.append("cpe-unknown")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
     if pkg.cpeid:
-        f.write("  <code>%s</code>\n" % pkg.cpeid)
+        cpeid_begin = ":".join(pkg.cpeid.split(":")[0:4]) + ":"
+        cpeid_formatted = pkg.cpeid.replace(cpeid_begin, cpeid_begin + "<wbr>")
+        f.write("  <code>%s</code>\n" % cpeid_formatted)
     if not pkg.is_status_ok("cpe"):
         if pkg.is_actual_package and pkg.current_version:
             if pkg.cpeid:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
