Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67649C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07C941940;
	Tue, 26 Apr 2022 21:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXfUdDV344VU; Tue, 26 Apr 2022 21:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7DC4193C;
	Tue, 26 Apr 2022 21:43:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3421BF59C
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6374B40543
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=centc.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7byY3BkEJFDS for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::708])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DD8140496
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocdFW48G7x33R0VT5G9u7FZhPx24KLQPQZO42l8tuGLUQFqYN8659cj+kyS2kEg3Pju4BQscMUP12sbMnDW8eNU8eyb0DcLZHz2oLBc8/8oPgPIk+qNShGNhCDvjX1fm0js7l7Ovoqu3Kc3In+SXl5HkChVuHXa7vYf038FbW8ZtSgYaCxM4nSe3Xa65s42WPhZKc5r5SBvIW5yor3UaED3rmsCVJsOHUuDkbWJWXIZK3O5Rx+9cnKqi7E46UiL7DfJeo4B6iPsfeu4zFvHEnthhfB2eTTVMvLaNQ3ftV9I+qs+aeTihhC/oVLqqqEnNzNwcSmI6SuqnZVsHEEpYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6t6dwDPH7y9OvbkQjAyoIq05xMZWVmrKuLmnvN+7Rqc=;
 b=UJAfmadlKRusWOdxY9nJopXcOTFzyg8DqltqO+x3yXtm31uZMBqClNicKGTfXfpWHxM7jmpd0K39c8aFtmJ0Bvs+i6JL22v3nWCaCaylaA09I5R9r6mQEVn/B+xlAAJD8TtvcigQgRS/6Vt7OSX2yoor3XWRU6eVnPmuiq+G9IG7EgNo6OJUcjCTbGPLqSDnmLox0BT9GUOcOE91RmCo3/17SMFehl12+h6+Ft+cuJCoxK1v0GPcpA8fcRbFZH5PjjViOskkCpTPro2oNLucEIVcmhol9vyTawMgDRLYwnD9tIBc+Zi3RBVnxJXg9ixRZFB4RKQ8yNvADfiaS9KcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phobosdpl.com; dmarc=pass action=none
 header.from=phobosdpl.com; dkim=pass header.d=phobosdpl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centc.onmicrosoft.com; 
 s=selector2-centc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6t6dwDPH7y9OvbkQjAyoIq05xMZWVmrKuLmnvN+7Rqc=;
 b=QyPkx78709VGvSvEyqJjlKZHQA8rEogubHia2W4n17+crUYjz0EWngDhdLyXl2+dqHjnfMOVdbL8xJv0LRLzfGZeUaRx4iQW9HFm0KSmH8M1P26zjBYXKbnCcoxU708+0yRi/rJLVm8cfNJ5BMbSMj7wwS1z5ze8/6HO3AayZhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phobosdpl.com;
Received: from DM6PR17MB3515.namprd17.prod.outlook.com (2603:10b6:5:1de::16)
 by DM6PR17MB4010.namprd17.prod.outlook.com (2603:10b6:5:25d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Tue, 26 Apr
 2022 21:43:14 +0000
Received: from DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::d5d6:5b18:a221:14df]) by DM6PR17MB3515.namprd17.prod.outlook.com
 ([fe80::d5d6:5b18:a221:14df%6]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 21:43:14 +0000
Message-ID: <6e9f3387-0127-9da0-59d0-2e4123b6be68@phobosdpl.com>
Date: Tue, 26 Apr 2022 16:43:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Sen Hastings <sen@phobosdpl.com>
To: buildroot@buildroot.org
Content-Language: en-US
X-ClientProxiedBy: DS7PR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:8:54::12) To DM6PR17MB3515.namprd17.prod.outlook.com
 (2603:10b6:5:1de::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccda8bd4-bb72-4f9e-59c2-08da27cdc44f
X-MS-TrafficTypeDiagnostic: DM6PR17MB4010:EE_
X-Microsoft-Antispam-PRVS: <DM6PR17MB4010096E11DBA1E311BB0153BCFB9@DM6PR17MB4010.namprd17.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +I6JTTlXo6TUr28MJ52kOqf8tEy1lgtNkDsWpUJ6W5NLkiqOvHjMT3U07i30bC0HGf7vTC6cF3y/6COy5j4lfbIUGGZTiYeVKYwBdjQl7I81bkiMvPQwQ+OjEZRcZt3qNdCtFfvGHb9ChDChrZkmKSWdaSRHC3KZeH6LtvfiHF5kFdP9cUvPooDYjl9MikrX1Vf3hzEVNOogBl0EEDmKLLi0LzHH01dEQK905bmTwdbkXF6GhPQy00D1wRHdmIJQIhVvDv5iviI/X2BbHHrLmDBQvw5i2RLzHYyQLcpEeijVUDt/qDjRGftOwhLHpDamWmBKsw0lqFRN/Wnhtxg6Lg3Do7v+Xz3RQhBebwy4oJDEXgNB/+cdPVy2DN+i5Me1eTxKEwkp7OvD7S4/qP0O9Ou/jOe9X2efY8/zywxxdqE7VSff8zhrXsyJXIcLM+QEFs1e+Isy1mEhweSU+mBy0IPQQADjV0I9J7irLFZzCVcNjH0idZOJ282E1cMatd9KS2cQeuWpGQ0M2MJYe25Yey8GDOmnVt7lWQR/MAXA51FZKgU78zalxp+kmVJhtS/CcObaxjpCBP4wlpqeJ9W7Cb6cZov57a76SRNSs0wNndD5rOw4+uxzJYUvlHeJPnXW5AF/mOAQ9rgK7wjPpu+3+efpPzCXxe3072C7qUHv9FEPVB5bjy5DsZN1Sqf5HTwHHsxcWMg7hX0AFRnT7o9Srj4aiZLYKRBQONarfnbbj1Ca1BNJdG/YMfx4st1ZwO3W9PdyxcGJlpdgdHeLtNfxzVBjS7JnpSwQVwcVMuiUc90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR17MB3515.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(136003)(396003)(376002)(366004)(39830400003)(346002)(86362001)(31696002)(36756003)(6512007)(26005)(2906002)(966005)(6486002)(508600001)(6506007)(186003)(38350700002)(38100700002)(83380400001)(6916009)(31686004)(2616005)(66476007)(8676002)(4326008)(66556008)(5660300002)(8936002)(66946007)(316002)(52116002)(45980500001)(41080700001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFdqdEtTMlVYUHZSNFREa1psQndQMUE0L2dGTXVoQlZ2RmR4dGRwck1WY0o1?=
 =?utf-8?B?SU5aQzlxNzcrWGZUSEZoeW9oMUNsOHJIcUtnNzk1QUR2UlNRWVMvK0Q4aDc1?=
 =?utf-8?B?Q2ZWY2hyWXFKak9uYnNLbzkxUVdnS2ZzTWR4ZmIrQWNWa2dwMyt2ZDA1a3lv?=
 =?utf-8?B?WkNnaFJMYUIyWU94QWdwTG1YTG9qNjhyZHUray84Rm5LWWFuVjdrNkNML0c2?=
 =?utf-8?B?VllIVmlyTjlsakdNYVlGd0M0ZXk1Tys4MHpQQStVNkh6SDlLTlJLdlUrVW5s?=
 =?utf-8?B?QXdCTGordHpXb2hOMERlS3JHRFhLQjBHbUJwSElMSlBhNVd3TEQvalZRcGV4?=
 =?utf-8?B?V0k5RGR4L2IwUG90VVUwMGkzMDFPT08yZS95UVZubHRRWGM0Vk53ZjY2bTR2?=
 =?utf-8?B?ZEYzemNNWmFqNTNreFBkdTRJSlc3R3F0d2xXYUNsRlg3NDdKL2tOYm16VFZC?=
 =?utf-8?B?Y2RRVloySzNDcXRYQTBDbUNIdURzMHVTOXdDR0djVHRLL1dTZ3REeFFNMkFj?=
 =?utf-8?B?dVFtTkh6d2JlY0JEeW1qYVFMTXRWS09EaTdPYWdCcXprc3FXYjNpbXJ2WGtO?=
 =?utf-8?B?VU1lNVBUOVR2OGt6RTJaQ0FjWW5iTk9yenJPeGEwb0pzS21xSlgwcUkwQ0Uz?=
 =?utf-8?B?Tm9ldkVGVTZmcVJYa0VjdmJBZ2xLc09GTnhtY2NNVldBVnZUaFE5dUtpVVRk?=
 =?utf-8?B?alNMdk1jUktDcXgyQ0NSN3BORnNrcnpIVm1Uem14UURuYkxXM2gwZ1RISExw?=
 =?utf-8?B?WWMwOXdiYk9Oa3htcGxsQmRGUW9UTzRRbzkrdFpRaUFBdXRBQlFrUW1VMmQy?=
 =?utf-8?B?cFNhVGIyelpGUyt2UnE0cTF6MHd4R2dKMEwxc2dxWiszUUdseGFRMUhNMTFY?=
 =?utf-8?B?NlcxazRtZnVQRDBnRlpnN1ZNbjdPeUQySnpoZXlUbkJwaCtSZktzbzFSWDFT?=
 =?utf-8?B?U1A5SjVXdTRlbm1lWkZsWEJhYUtOa0NjNEhHd3hrN1cvbTVVb0VWQmtydEtZ?=
 =?utf-8?B?Wjkwd2pqYWY0NkZoWWV1YWl4aXlaVmhTVWRoU2V5SzNOQUFoWlAzL21wUDIy?=
 =?utf-8?B?MDVJVC9EMlhiTklQeXdJRWxvMnlGSzBhRDEvTmNuamMwMldzV0U1MHhxZHJK?=
 =?utf-8?B?cEs5R1dyVGVBUy9pV1RRVHBFdkZoRXhKbjhTU0ZnOVBnZlMrdDkxamdlZWY0?=
 =?utf-8?B?dVRpbVJmYmdwRGZXYjN4bHhyT25DbTRJWEZWamFBaHh6OVVaNVNPZTdmcGFD?=
 =?utf-8?B?ckNIUjdUN3hxeEdHV3BUY1BuVVRSeGR1WHFzam1IODVhUVRmTlM4RWZLUWVU?=
 =?utf-8?B?emlYcFhQWEFXSWVtSjNJOTVKWGJuWnNralhVK2k1NXV0NTVUTXowbEszTFdT?=
 =?utf-8?B?NWdYRk5sQ0FsbDlPOFFMNHI5cWtIU1ZaeTZSWXdIU3JwRGhwQUtNV1BWVW95?=
 =?utf-8?B?WWRabUZNanB2d05jaUUyamczeHE1NGpqSk5EYUtDWFRSYmFTN2VYTnNaWEJt?=
 =?utf-8?B?cHZ6S2RUcUR2ME1rS2VaZXpGTEE5bUd2Z0w3WkVxMDdkS0g2Q25RZXRmeWNa?=
 =?utf-8?B?OS9IcW5YSXhNM214VzJFZUlXVTNnMmVTVUxuQTN1Q3ZzbzEvM1V5ZTRiUzk0?=
 =?utf-8?B?YlFHSTZpQytOUStGeDd1SC9FN0RuZFN0ZG1Ha05zeUltUWdKeXAxYjNOeXUr?=
 =?utf-8?B?a2xQMG1iL3ZBaSt3YzcwajI0dzVTMnNpVE1aMXRXQ21CdGRnbm9nd3grdGto?=
 =?utf-8?B?R1J6NmJhUkxxN29BaTZMS09QcUliMWRLMDAvWkZkdnBWZndMWXdrZEdCbG1h?=
 =?utf-8?B?R2c0OHdLZUZrb0MrUzRUem1QbVZ6TlpIUlRtL01CNVEwSTdOVGRDcUwvcG9p?=
 =?utf-8?B?b0o5cE10amJVcFZYWVZxeEFXemwxd1FuSEZkUWRBN1ZWMm1ISG42QWluVW41?=
 =?utf-8?B?aXRtdjlVT0JkeGNtWmZETlBOU25BTzRpQmR1ZGk1bldEK2VoR1lnNFlTQnU3?=
 =?utf-8?B?anZ3aGFoQmdxVFo3eG5ObmU0RlJIT0F1MEpadzhGeGZnNjhVNWQ4blRjV1pw?=
 =?utf-8?B?eXZ0WVhVY3huQ0gxWWNQQkcxVys1M2tkMjJKS3l4MWMxYmcyam1yM2RmeXNo?=
 =?utf-8?B?TTZEMmxiSmFjUTN2UzhmSTM4ckZRbVZVdG14V3RKNldrL1dSbUlXQmY3K013?=
 =?utf-8?B?aklLRHJCUkFRWitmWFcrUGNDRUZhWHlkTzNiaHh4aUhQZXUwSjlHaFo3YmJP?=
 =?utf-8?B?ejh5Rjh5ZVczNGoyN3hlN2N5TEwxT0FGR2I3ZnAvcHhmMGtvYVhtcE4vaHhU?=
 =?utf-8?B?WlMrWklEeHBTcithdjlQRnRpU3hWNnlSVmtoZ09VLzFzRlVaSjBtQT09?=
X-OriginatorOrg: phobosdpl.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccda8bd4-bb72-4f9e-59c2-08da27cdc44f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR17MB3515.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 21:43:14.2441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 07b76dd5-c518-427b-a15a-2e07dfd0130a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r46grPtzQ8G92Zgwfam1MMIFce+KotBVTyIxEPm/PeiMJZCun78CAJq34fSJiuE7XZ8eYloxXl+ok46evT9mug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR17MB4010
Subject: [Buildroot] [PATCH 1/1] package/systemd: add setting for systemd
 default.target
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
Cc: nolange79@gmail.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds the option to set systemd's default.target in
the System Configuration subheading if systemd is
specified as the init system.

The argument for default.target is specified pre-build
as opposed to overriding the hardcoded "multi-user.target"
symlink with post-build scripts or a rootfs overlay

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
---
 package/systemd/systemd.mk |  2 +-
 system/Config.in           | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 58a1376b51..2ab5fe47ce 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -571,7 +571,7 @@ SYSTEMD_CONF_OPTS +=
-Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
 endif
  define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs multi-user.target \
+	ln -fs $(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET) \
 		$(TARGET_DIR)/usr/lib/systemd/system/default.target
 endef
 diff --git a/system/Config.in b/system/Config.in
index a4ffbfa18c..888c24ce81 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -154,6 +154,17 @@ source "$BR2_BASE_DIR/.br2-external.in.init"
  endchoice
 +config BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET
+	string "The default unit systemd starts at bootup"
+	default "multi-user.target"
+	depends on BR2_INIT_SYSTEMD
+	help
+	  Specify the name of the unit configuration file to be started
+	  at bootup by systemd. Should end in ".target".
+	  ex: multi-user.target
+
+	
https://www.freedesktop.org/software/systemd/man/systemd.special.html#default.target
+
 choice
 	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
-- 
2.35.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
