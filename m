Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB95EC6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 04:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337C381B04;
	Tue, 25 Apr 2023 04:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337C381B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3AZElXKOFqv; Tue, 25 Apr 2023 04:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 577B8819F5;
	Tue, 25 Apr 2023 04:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577B8819F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABC931BF3E3
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 04:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7461A81699
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 04:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7461A81699
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yww-_0cucK00 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 04:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50261815CA
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn20828.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::828])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50261815CA
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 04:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpIq4V1Azdu4v+SLA/rv7snupl9G8U9AF/vsvt934TlWk5oZ+Mi5Cx5KPdEPsT6KLrN7iUvprkqWs/IAcmlsOo3wDioztzqlApttg1Y6LK8gVXDfYlxWdCuLF7f6155AgR6FBrlW+ClLsRqANvMLSZDVctbekXxJRZF8rotN5W/xZsKlvJ4ywoI4sBF24FDvXUtQaoC8VaG5RzD2MKqwmk5gghIpJ/KIwC70zeX0MWIbMIq1LQUyxswdHAliKnETK3DXlQTkhh5DD1Rw0ug1jMHkK1wydIPWd97+mohaYPVaWNvxm1vkUZTyYU8hS+4WledjDo8hpCCBl75ePTeXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5bWtZs2EklYy0osgF083EW5o7Lz0BIfXR7pwqilzlM=;
 b=bdZwRK4jzpaggKYNaQTptA05IWue18D5FKbmYHdzH+04u1wmrcQyr+pdVzcsm7EVk2d3DIZGR5fR4v/U472yHflIZPRL/leSCHPTfjZOzhxMUDqNUNMTk+4PhBuaW/k20d8IEJLPxX2Mf9/2ihafSWfyoY/watru9fApWCOaaJwAbQ2uUHEoLh1GBP/Yr2ZqgiA8ffQjnbxl+vogXXg0imed9QU3jhvM+USuVJhsd09bWaS77Fa9JnlEUkVRlGF3QnBYLYCGtZqFCf/EDgHSAPI/Uu7toNZAA5J70NGduHW1tQlv+vLckpPa7rmjm5C0ExTgsgQcJJjOXXITWMcI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by DS7P221MB0868.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:9c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.33; Tue, 25 Apr 2023 04:34:23 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6319.032; Tue, 25 Apr 2023
 04:34:23 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 00:33:52 -0400
Message-ID: <SN4P221MB068217338F33CAE73749100FA0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.1.windows.1
X-TMN: [jTaktgQGJqeZq9lt1ZgOOBUrimJtU5hL]
X-ClientProxiedBy: YQBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::29)
 To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230425043353.4492-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|DS7P221MB0868:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e74cf51-f5ab-4be1-d2a1-08db45465777
X-MS-Exchange-SLBlob-MailProps: 5R4zPSLKzf6wwOsP5elaoHFH6K5GWe0sXy85D/miHX435uWUzR0PzgH7jjxdGBSE7b4Y+wqa5c4tWscvAEWR994J9Sl8LbRDaOJyXezPBOB7ehP/trGtv/NfpZ+/QmA3NbLYm5qYNyXONCYaekhmRQJ8SMrG3R2o4u+tkuskmoxRPbje2Rt2NrMHu1ZTF5Py++/gSeRv5SCYFijGjx/W/0huFAe+FTft6DxhMkg/fqERncAk74PM3llCwM2CTa8gll9WmDxsD3UXGpwZVg23cIqeeH9e2mq3Y7CjRkVRABTjcuKDr81k+zCxXdQbUNd63KNt9LbtdFVgGRIe/S8OcRquNr/5s/B9/7KJEFjAD5bOa/CEC2EjWre28+nZ8x5uJJAigT5l4HKxBDL35W4cKzi04z53v1vvakPaQV4vMFwEv6G/lrzobQulEWCGxEiBquLQPoxADh473OWJRTa1b8//R7z6ScD9qOJbx+IPDIc+iSzkhawJw8sN4BWIeQp6DHsoULO5sjX5FPCv/Nh3iaA+q3FBEBk5RKZpzxqb3ijWKTWCL1uZ15BBkbpHkuCqk0lmeLwnwP2k34X2FTSLdnSazyimDcDqxtdNmvtLiH9y83EwXUAZrm/JCYCSps8xr8spy7SM6MBl8YwThuFkKXopKIKCRIanpR4MWSzwJOJ0zuRDbrM43TDuLbQn0blPk8x3Odh6tIgc8zjP7/aThyWaNvVxxDplHBh06wHy8MO3FoA26BKdUudXa7/7ZFJY+0ZyCWLyoy7iBS/duHVmsixWFA/E88ZmTPG7yqXv+kv4WjyVtnI0ge+L770UKzgmcnsHnu0qcrWljLzfd34su9asniVYHq7E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgQcCUecu7VhK4w1/bZz7VwzqShNTXdM+N901A69353w0gz7+WlFpelLBoQfk0Gg3HYn6RKphEjD0OMcOKwFzhekSnz3vmSRksExmh5PlHBTIzMMpYIjI0pPg3cwDdpeGhYQRb1tXRNTwv8VFKYIPOIdR9Bt80u7GHZ6xBu3hPccBX2WqLSKyRHJ1AxgwJ1JyI3/7rEusoqUiL4btF4y+utZppXES+2NOeRlGnO7CapAucMeOQ0D5KjXRjn5xX89kqtJKMWiEw73k671rFmdGJrPeAMeYviq1tUaRfLn5iNNuBVP4ktA3+Z1y3xfo4JWjo+bUJuByHv2iw/4PaTSEMcKT2fIE5OXGRa8RQmsWaQdshqoMsypFxbRi7Azss8OE3VbLTUb+qN6O6oAzgzV46od8+dab/nrQdH9UJ9fzjfGro5GmHxX/4gmg75NHDfVfGqbCp2vXHsHcjd9XSEsiDFZNzCynbLuLBln77ODrHb6MXIFainpbGeupo376p04wIU/B2i4Zz6t4sourobjpes7WcnbwBZhxTaJiJouYr2rHLQhZefYu2Qw9OSk0PkmC6Beqy5ep/2F3HCzX0oTeEswIrdOVWAs0gsV9WcK5CC/w+UQGk19X2gh7wEL3qpp+4BzeR9SEl6e6TB9pfr7oQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?etsSvLgd+becJv3mXFm1+nQRcMDR60/48eakx9zc4b1g7QbAIekTip1E+/Kf?=
 =?us-ascii?Q?wI+kkpJXC2TwIRJwu31ZE83ShSO4ND+TMmG3vaUBfN5Ylv0ed1FuSK0T3Miu?=
 =?us-ascii?Q?JcwAMzYwbY81cemOgovBqrbUipzhPojy6cRtqPTx2QHgSCDDrd6lYnWDH84+?=
 =?us-ascii?Q?a2EH8qeDJiZEvzzPsAEzDO8LjKs51pUtZYspHikwLKuhnTXQ5yQTEvoz9pC3?=
 =?us-ascii?Q?Pvi/sA0JkHzfYh5lY2JrrD5MX6mq2nCQlHVP+LUdHC3exFw2Y1pWR6qLLy7D?=
 =?us-ascii?Q?i3XrjEoSwCBsFelSN0bBMjFm5VLoR3tN3r1Uu0EFkkcxsa/9yq+3yhSyWiSR?=
 =?us-ascii?Q?ekItTjpi2hRlEoHrGmgZhier4SdsQSWjgxV+STu1x4bb5/J+sDw3r4wiP9vd?=
 =?us-ascii?Q?gDWcHKEo9qfIpz08ZRLKasbUZhQf0L0FuHezOjjXeWwCb28Scu2sT9K/XWRB?=
 =?us-ascii?Q?GSXMnv1NoXmsQn+0OhohPAilbhyunbb+5SbmWI1DGox819F6OfrTdUJkbRyK?=
 =?us-ascii?Q?/So9SlAnPEMRY55oPqll6AyPEFjpMm4TPSfXCsTpsn1QsPmfTbFIWAiTx7MU?=
 =?us-ascii?Q?Ch35LWex8GSwnpQkCFr2nnXwZI7ht0Y3YofcBhvNcZW0WHkCobc+4oLEqLa5?=
 =?us-ascii?Q?2QQijb3uOCRv6YqkgGWR3AoaE/AXDkAwjZGHYrJQDWuT8s/1BMKxYOOBGfKR?=
 =?us-ascii?Q?+hJ4GcBZscO0faC+Y0WDqFDS2P0ALX3a2M0X/me5n6x118jiPFSabfAy6wpX?=
 =?us-ascii?Q?+puLSPRKov6R5+hWGBO2K5QSxP12K3LTvwX27hPQus8qIWV4iSGgKZIC1igc?=
 =?us-ascii?Q?31yOokIS6l4FqSrY6dPDVwIyNibtC7BM5NQhsb+s4N6kWDajbutOP8gqt6mG?=
 =?us-ascii?Q?dg1xQvdM7uor3SkM0x9pdq5bifCQir7fyg6A9YWDxJKgc4OhB1QOQI87EQAo?=
 =?us-ascii?Q?Tn7Hxn7kEdaoALINbVL2bz04HlAvR/nGRqMGI2x0SUPBHKg2npp2Z75y1Sja?=
 =?us-ascii?Q?lyFGzWxEysGaoCeNFvEIgERnGx39xG5P4TE/acrvai3eyaZp3uilnkcKIBJC?=
 =?us-ascii?Q?sTzdK+sazXNyv2G1tn6unJnWXD/CXbmMQqsyWbhUDermFv79aIiQvNBWoTQL?=
 =?us-ascii?Q?y9d6YXKSgl/y1vhsjV+Wb5D5jbHJmyl3J3jj5fuT9qZ3927vjZBsXYkAd537?=
 =?us-ascii?Q?fEnsSXMWSOcSCJA7ZpHaPnvRVGJVnVFUZrm9sm0ceY9LOuGTvVnWgdaQw8w?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e74cf51-f5ab-4be1-d2a1-08db45465777
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 04:34:23.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7P221MB0868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5bWtZs2EklYy0osgF083EW5o7Lz0BIfXR7pwqilzlM=;
 b=fCWNJFNXhl6d9NTxavAWJc4JQPwwSp5EwR7YNEurGPTzly5nsZQvQ/bz7iYX4IA1FH2zSgcWFsNQ6D0i5is1o6icmkY1KTGl7mhJ+AUisBBcLksxerzi+y7Y4zrxLFZBqZTQJDJv3HhrpCeMyV6Fsw0Hp8vvI8KL7ZOOyixhgml4/Fe6A/+1PT3PWE0G6DRiPhTDQ1d1KVbyXYdw7vJy2mS3sC/qxiq1rjZG0sleAirG8wx+fZvzCwjaoIc9229AofVHFdKblXrPqGV4sdM+fISSDI1VABbOaD2Zdsl3+73v4L7TcE6OFMtZX8lhMxgrjR09yCHGEfQnegf0VSawZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=fCWNJFNX
Subject: [Buildroot] [PATCH] package/libcurl: drop override of
 LD_LIBRARY_PATH
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A previous commit [1] (libcurl 7.19.2) configured `LD_LIBRARY_PATH` to
prevent cross-compiling errors when target == host; however, such an
override is no longer needed [2][3] (libcurl 7.37, 7.74) and causes
build errors in some environments. Dropping the override.

Fixes:
- https://bugs.busybox.net/show_bug.cgi?id=15181

[1]: a51ce3194923430fc229fc2ad98b12795b5a1876
[2]: https://github.com/curl/curl/commit/e48a821ed580cd2897b3e1b0bc88ca9245ac234c
[3]: https://github.com/curl/curl/commit/6f3369bbcf9d0ebdaa5d141f8ca446448c24494c

Signed-off-by: James Knight <james.d.knight@live.com>
---
When using `./utils/test-pkg` with the original implementation and the
following configuration:

    BR2_PACKAGE_LIBCURL=y
    BR2_PACKAGE_LIBCURL_CURL=y
    BR2_PACKAGE_LIBCURL_OPENSSL=y
    BR2_PACKAGE_OPENSSL=y

The `libcurl` package never seems to pass the configuration stage on an
Arch development environment. For example:

    configure: OPT_OPENSSL: ~/br-test-pkg/bootlin-armv5-uclibc/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr
    configure: OPENSSL_ENABLED: 
    configure: error: --with-openssl was given but OpenSSL could not be detected
    make: *** [package/pkg-generic.mk:283: ~/br-test-pkg/bootlin-armv5-uclibc/build/libcurl-7.88.1/.stamp_configured] Error 1

or:

    configure: OPT_OPENSSL: ~/br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr
    configure: OPENSSL_ENABLED: 
    configure: error: --with-openssl was given but OpenSSL could not be detected
    make: *** [package/pkg-generic.mk:283: ~/br-test-pkg/bootlin-x86-64-musl/build/libcurl-7.88.1/.stamp_configured] Error 1

With the change applied in this proposed patch, the default toolchain
configurations used by test-pkg all pass:

    $ ./utils/test-pkg -c libcurl.config -p libcurl
                        bootlin-armv5-uclibc [1/6]: OK
                         bootlin-armv7-glibc [2/6]: OK
                       bootlin-armv7m-uclibc [3/6]: OK
                         bootlin-x86-64-musl [4/6]: OK
                          br-arm-full-static [5/6]: OK
                                sourcery-arm [6/6]: OK
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1a1594a45e23a01fa259d0d377ef60d200309c91..dd715c1bb67202897f8a51243591676921fde24b 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -56,11 +56,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
-# native stuff during the rest of configure when target == host.
-# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
-# are found first.
-LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else
-- 
2.39.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
