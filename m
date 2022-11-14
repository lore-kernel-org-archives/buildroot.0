Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 16:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF4E402C5;
	Mon, 14 Nov 2022 16:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF4E402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VHWUqp9XhDj; Mon, 14 Nov 2022 16:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BBF9402D1;
	Mon, 14 Nov 2022 16:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BBF9402D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FEE51BF32B
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E77580B98
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 16:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E77580B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ymlUdmak70sQ for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 16:33:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB99080AD8
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB99080AD8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 16:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVKmqqRHraodNDzUyMW3JGFQ6v8Ts6Ajap4iWX4BpizwyR9g8LAsE74dOGFT6a48KxImw7Kzq2gq3ezIy5iwfv8T1UBodkFnkCp6y1biZsik8pd6cl+KJVpzSzfFrvGxDuzgPgo5UQ4n8DvwJ8ZmY13W+RTHCUf4QJDySNvVr8PF1quRQEr+IA/fCAl6qZ7Dpm5oFgCoDlAVmZ79mbN99ExT9BJ5roAoHFdvAvamFbm9S0KIl6EsyaiOUEX3cDt43ILZHJq5lotE9pXoePi0e88L1zPPsWFLjx+cNMLVG+F6qprip0xQv8HTArzkzphja7F4gQsFJZv0LPu2Pn5ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcX8p3gz+hy5zOX2Zk3sWB8Qhe8wwN2JZRwsR7QRlik=;
 b=YqyMLJ5ybtlkfsJhLXtlXepq5cEPnWCJibXTJoLPEO054yEIulSlFlWad42ws4bhRxQ8UKI3qyE5+/J0zofgkoVCukz6bSnEI1RiXZRxCEyvcav/M0xbJew/lzNKsw55ooebfHID8KkT6Mpi2lf9jve9fVOhsQuIS7FQKDiEP7Vj5dqpf3NNROBJbs+uX1I5emr8SlfX6FiUIemBPNme24HUcxPUnFe5XqZ66qsY28R5d/7Mn1lJ+FKPqBE1lr7uLmxiCH3n1RWPs6JKvbfpo4Hfo6EGqokR8u3QiXgABqwuh0OShOGWq7zdzuL/l6hfHBJYNoGcdVslyX0VyOPzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB6970.eurprd04.prod.outlook.com (2603:10a6:10:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 16:33:26 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 16:33:26 +0000
Message-ID: <2402c85e-2016-29f9-d468-590603c3e641@theobroma-systems.com>
Date: Mon, 14 Nov 2022 17:33:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Victor Dumas <dumasv.dev@gmail.com>, buildroot@buildroot.org
References: <20221019124017.427199-1-dumasv.dev@gmail.com>
 <20221020115512.483686-1-dumasv.dev@gmail.com>
In-Reply-To: <20221020115512.483686-1-dumasv.dev@gmail.com>
X-ClientProxiedBy: FR3P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 1790a408-bc85-4075-1401-08dac65df477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGwfGZVmpKd2W6AgoLEuBew5jQJWruAlS7OFYilDqyyudhsGeoW85klZNVOB1wZqZq4l53Dw0BBYl2Ksssv8Ypeu2qMgB+nSUk0xqhuz62q8GLxh8hoqes7+yCSt3OPFrdC7HrT7L0yV65SI9wP9ObGKTvAe6RCqsbYOenYwsr1Vt0ze4P6Ys1QCIAaR1/a125O0zCFL5I4jIp0K69xHY0eUkeT2IWaBZpRxGT+UZ7l9Fo8aMOYSHrdmm2V1Ss4WebfSBKdPVz9Pri0j4djJw7uF6j0x7pcpmsy8FlRhKQ9Dbts0cFJo9ZGWu9Hq0cGAFeNMpsj503qlr/i2iwgYCM6jN2NRyoGf6tixZzzUkq5oib3xEjAQmUahrO634f9q7f7L87+6iOrG5hH0e+1tn6M/5JNMFayl0PQ+MvOwzPKnUmNF8qdDEirxSfaBFKAasKzehDpiXrm1xN2ijIhZp8/JW7Nujz74ZF3qmaGPAfG3WmrXl5VweIk6t5mgA2+9hlRLYQUnKfR2l/0FLo6f5ha6QlAzjYCriAMJCYtQCLnHH8FPutdlPorJTrzzaQY9HVgWDEk9ARGDdNX2zkdudo11WkqLWshwy3TAblu6pmp48y3FwruR4UVBjJK5rSCGJaaE+/bLFf5s5D6Dz2M3xr2g5gXbPyuaTt/LXPH7qcj0c8ENde8APqCguK3JNoFBwRUuIC84rmXaewObKbCbbciSSDYAhQSdLcahX3WCxtbux/wMPtWcB8EIggjX8Ev9cvhWI/knDoYCkw+clsvPz7U67r6tYs6d18r4Ppt8Fhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8536.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(376002)(366004)(346002)(136003)(396003)(451199015)(83380400001)(2616005)(186003)(38100700002)(2906002)(8936002)(44832011)(6486002)(478600001)(6512007)(26005)(5660300002)(6506007)(41300700001)(8676002)(53546011)(66476007)(66556008)(66946007)(316002)(31686004)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGFOQ0dwRVl4YmxJamNuanlEbFA0YVJJdTQrK1ROVXlDS1NPeGFNajVEL1pM?=
 =?utf-8?B?bit5VFhzNVdJYTQ1eWUwM01LNnB5bDcvTys0NzR2WU5OZ0YxUFhKU2NsZnVH?=
 =?utf-8?B?SHlrWUxNUnQyU2ZMTWxxUjByZzR1VGR4Q2N6anMzOTZVVnZmZXIyNVNqdVF4?=
 =?utf-8?B?RG5nSmlpQlNZZGZWV3JRZEp5RXRiL2F1elJKMm9TdW9tU1NENVcvRHlUMHQ0?=
 =?utf-8?B?Nmkza0JqSkZKODZjbWFuQVNBSEhUNVhIWERaR29nK1I0QjAxZHlzVEFaS3hU?=
 =?utf-8?B?SmhlZFkyeG92d0w4Z0E1QVh0NG51MytDWUxPMnpzckVhS3dELzJQZDh2ZVZH?=
 =?utf-8?B?N3lGWmxpR2pGYTdvQ0gwbHZEeWMvQlEvbG9vajRsSlFUN1ZISW03QmxtUzQw?=
 =?utf-8?B?L0Z0N0ZCVGFZV1ZJbW9MNEZYR0JXSDNwamZFOGpQODBVL251L3NIaDRkT3dO?=
 =?utf-8?B?UnhiTDMvY3AyQ1oxRlFnSVQ1M3hPc29hZ244RlF4WHNlM09HdnNYOEZzVW5R?=
 =?utf-8?B?aWprdFErV1Jtdkg1OW55bE1SZHE0Vy85YXgrc2hiQ2NmSExueFJldWZHK3FE?=
 =?utf-8?B?Wnp5OGtUVDdJM09YTXRpU3pZOVJJdkxWakZsQThQeEJwRThaam5hRkNXWlpy?=
 =?utf-8?B?Y282dFJIUG0wZ0JlYVF2a2J1OEI0L3F4dzlncXNDdWNicUZyNGV0bGZ5OVh1?=
 =?utf-8?B?SVdYbE8yUGc4cWtTak5OQVZUVkRLdGFzanJHa3UxRW91Y01JNllPMldVcmxi?=
 =?utf-8?B?R3FUOHBuQzY1OFl6MXdEeTdRZHVlUXhkSHR2NGlua3J2T0VZU1c1VEdCRFRx?=
 =?utf-8?B?QllxNkxjN1RpalAvUzJ0NUlvOFZIakF4VzdHT0hzd2RoK3hIRmtWMmM0YWd4?=
 =?utf-8?B?L242c0p3eFF6cmJ0SjZFOXNJWWtIZmZMb3ExNWhkR3R2UEZWZ3ZKb05Qalkx?=
 =?utf-8?B?UGZHbCtGVkYrRWYzZTZKY0JQN0hTVHA0dFNQTkVqNmpnSjV3bW55c2UzWjhG?=
 =?utf-8?B?NWliVTlVRGoxdXcyUENjMWNsYytheS92QnowOSttQWVuQ1g0ZWduYjdOWXd2?=
 =?utf-8?B?YVNyeExKTGRsTitFdlQ4NnNic21uMEJMeXJYdEVnT0xJbkdLN2Y4ejE4TUd0?=
 =?utf-8?B?VktjY0lodEN2eDlFOTNCWkI4Y0J0aVVWOW5FNUNCaHo1OElhazF0bHNTSjB6?=
 =?utf-8?B?UnhNY2FLV3laN1ZsM0oyN0V3VjVMODV0c1dENG02K0FmZm5zVUI3bXhTWGNV?=
 =?utf-8?B?YUsvd1RpYytWSjBJa21EdzVUeGtac0UzZUxlM3g3RWVOcks0ekptVDROVmlY?=
 =?utf-8?B?ZVhJYTIzaDV6WjJyYnZ4aERWZm5PeGxzdU5Oem5Jam9iVlRzcm9oV2RwOXpY?=
 =?utf-8?B?TS81RmpXSDl6bDlvTlplSlU0cVBEY2hkZVkyZEhXLzhFemFtQW1udDdybW1O?=
 =?utf-8?B?aVhsVVliMWo4NDB6TWNnRU9sQnluc2Zsa001d0xsY3NlU1phalNFRml5MXBP?=
 =?utf-8?B?a29ySVFmRC9ENjlaVGg3QlNGTG1JWUozOWhQTzZDamZNMHNYVW9INjZnbVl3?=
 =?utf-8?B?aVFNUm5QTk1vbk1FSFdMTzd2RU5aOFpRcmFiaFV0UHgwd1l3eUtyTlJMbENx?=
 =?utf-8?B?OFJBVC9GRHFuZHBJVldtRXBjQnpKeU0vTmFjaytBZDc2RnRFS2lEWS9TNXQz?=
 =?utf-8?B?bGZTTTd5RHZWTXZFcDBRTVk4L3Z6MjgvNWNNWkNxSnhDTHNKT2JvU2dUYlpE?=
 =?utf-8?B?R3lKZUxaRThwRlJvV0ZVaUZ1Sml3eW9qSm1VSURITGNOZ2tDU2xxcC9YSTFs?=
 =?utf-8?B?TVJqdmMzUEdyY1hJYlJLZi9Za3l2MTdqN2xZemZ3eC84UHZ6c1lFR1ZIYmRs?=
 =?utf-8?B?UWsrK2ZNLy9HT25wTy9LREJldnlkTXMxL1dEdHdpVnB2NFdEbmJwUDJKbVRu?=
 =?utf-8?B?ZmxSRENieHJINDQzTTczWVpuMktLZlVJTzVTTmpGOVRJRlI1Z3l4VVI3NlZn?=
 =?utf-8?B?aHgwNzFOaDEwNEpEMlg3MjVIS2NlWTYrek1KbWtMUmEwaml1YXh2VWJpUGVp?=
 =?utf-8?B?MisrY21oM1A0Z2ZRZXQwbDBNMVUzaGZkaGt4Y3JmT250WldlRFZRWHpOa05O?=
 =?utf-8?B?TWhWc0t4bTZuajRZdUp1QWZsRWZBUHpodWlnUWhSUnovdk5lbHAyNjcrZWcw?=
 =?utf-8?Q?ehUzR4x+N/d/jePZOgbagjg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1790a408-bc85-4075-1401-08dac65df477
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 16:33:26.2986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M/Wj/CZvD4yCuoqKupvVkSyzZwQgVgV1XCpClx+uujKqmWmNNdJdKmEm6gV6L0NzXWaPlKJz58Xc/5jGG92F51QP8nG+OQ/LalHCcA/HSCQ+0rh1DyW+MBOnFHm9mml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6970
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theobroma-systems.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcX8p3gz+hy5zOX2Zk3sWB8Qhe8wwN2JZRwsR7QRlik=;
 b=b8yHH0qZVcK3UPm3Krxnav8WxBpK9GncybPNCa42rANT16yPeIqonFAeyIAQF4u9L2jaY8kzEPYBRTt4aW40AY0LJkuasU7ZjCmCKiALwPLrrUx/mGAZ0ubk9VRxk5TW1twooy2KecRpNxXK9cOXsfCESh7muMC9/kykjM6bpBcqxbP/wVdDRKa53835R69PaBALQvmdZs1lXCTVChWr8CsaVytacfVq1dT8r6qTcT1vBSm+4vw40MyKRG5+aCLKB+XNThz8gsRtVC0MPkyZ9yiu20/200J5GAxSzR9jvIhk6g2QzXGn49Hi5fk8on9n1sWrHLVS/0MbC8DsJ6Cp5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=theobroma-systems.com header.i=@theobroma-systems.com
 header.a=rsa-sha256 header.s=selector1 header.b=b8yHH0qZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Subject: Re: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Victor,

On 10/20/22 13:55, Victor Dumas wrote:
> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized
> This significantly reduces the amount of time it takes to fix all the paths.
> On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core machine
> 
> Signed-off-by: Victor Dumas <dumasv.dev@gmail.com>
> ---
>   support/scripts/fix-rpath | 66 ++++++++++++++++++++++-----------------
>   1 file changed, 38 insertions(+), 28 deletions(-)
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 3e67e770e5..cef7a48e76 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -58,6 +58,38 @@ HOST_EXCLUDEPATHS="/share/terminfo"
>   STAGING_EXCLUDEPATHS="/usr/include /usr/share/terminfo"
>   TARGET_EXCLUDEPATHS="/lib/firmware"
>   
> +patch_file() {
> +    PATCHELF="${1}"
> +    rootdir="${2}"
> +    sanitize_extra_args="${3}"
> +    file="${4}"
> +
> +    # check if it's an ELF file
> +    rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> +    if test $? -ne 0 ; then
> +        return 0
> +    fi
> +
> +    # make files writable if necessary
> +    changed=$(chmod -c u+w "${file}")
> +
> +    # With per-package directory support, most RPATH of host
> +    # binaries will point to per-package directories. This won't
> +    # work with the --make-rpath-relative ${rootdir} invocation as
> +    # the per-package host directory is not within ${rootdir}. So,
> +    # we rewrite all RPATHs pointing to per-package directories so
> +    # that they point to the global host directry.
> +    changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> +    if test "${rpath}" != "${changed_rpath}" ; then
> +        ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> +    fi
> +
> +    # call patchelf to sanitize the rpath
> +    ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> +    # restore the original permission
> +    test "${changed}" != "" && chmod u-w "${file}"
> +}
> +
>   main() {
>       local rootdir
>       local tree="${1}"
> @@ -123,34 +155,12 @@ main() {
>               ;;
>       esac
>   
> -    find_args+=( "-type" "f" "-print" )
> -
> -    while read file ; do
> -        # check if it's an ELF file
> -        rpath=$(${PATCHELF} --print-rpath "${file}" 2>&1)
> -        if test $? -ne 0 ; then
> -            continue
> -        fi
> -
> -        # make files writable if necessary
> -        changed=$(chmod -c u+w "${file}")
> -
> -        # With per-package directory support, most RPATH of host
> -        # binaries will point to per-package directories. This won't
> -        # work with the --make-rpath-relative ${rootdir} invocation as
> -        # the per-package host directory is not within ${rootdir}. So,
> -        # we rewrite all RPATHs pointing to per-package directories so
> -        # that they point to the global host directry.
> -        changed_rpath=$(echo ${rpath} | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")
> -        if test "${rpath}" != "${changed_rpath}" ; then
> -            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"
> -        fi
> -
> -        # call patchelf to sanitize the rpath
> -        ${PATCHELF} --make-rpath-relative "${rootdir}" ${sanitize_extra_args[@]} "${file}"
> -        # restore the original permission
> -        test "${changed}" != "" && chmod u-w "${file}"
> -    done < <(find "${rootdir}" ${find_args[@]})
> +    find_args+=( "-type" "f" "-print0" )
> +
> +    export -f patch_file
> +    # Limit the number of cores used
> +    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
> +    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}
>   

I think we should use PARALLEL_JOBS here to comply with the 
user-requested BR2_JLEVEL (the variable is assigned at the top of 
package/Makefile.in). It is used for all packages and also rootfs 
compression algorithms, so it would make sense to me to have this 
fix-rpath script respect it too.

I assume in order to pass this makefile option to the script, we'll need 
to add PARALLEL_JOBS=$(PARALLEL_JOBS) in front of each fix-rpath script? 
Similar to what's been done for PER_PACKAGE_DIR in Makefile.

I can suggest the following (to apply on top of the current patch and 
squash if that works for you):
```
diff --git a/Makefile b/Makefile
index 7c1c07a2e4..c171aa94de 100644
--- a/Makefile
+++ b/Makefile
@@ -593,8 +593,8 @@ world: target-post-image
  .PHONY: prepare-sdk
  prepare-sdk: world
  	@$(call MESSAGE,"Rendering the SDK relocatable")
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath 
host
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath 
staging
+	PARALLEL_JOBS=$(PARALLEL_JOBS) PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) 
$(TOPDIR)/support/scripts/fix-rpath host
+	PARALLEL_JOBS=$(PARALLEL_JOBS) PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) 
$(TOPDIR)/support/scripts/fix-rpath staging
  	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh 
$(HOST_DIR)/relocate-sdk.sh
  	mkdir -p $(HOST_DIR)/share/buildroot
  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
@@ -764,7 +764,7 @@ endif
  	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc

  	@$(call MESSAGE,"Sanitizing RPATH in target tree")
-	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath 
target
+	PARALLEL_JOBS=$(PARALLEL_JOBS) PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) 
$(TOPDIR)/support/scripts/fix-rpath target

  # For a merged /usr, ensure that /lib, /bin and /sbin and their /usr
  # counterparts are appropriately setup as symlinks ones to the others.
diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index cef7a48e76..6160efd461 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -158,9 +158,7 @@ main() {
      find_args+=( "-type" "f" "-print0" )

      export -f patch_file
-    # Limit the number of cores used
-    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
-    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {} 
bash -c "patch_file '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' 
$@" _ {}
+    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${PARALLEL_JOBS} 
-I {} bash -c "patch_file '${PATCHELF}' '${rootdir}' 
'${sanitize_extra_args}' $@" _ {}

      # Restore patched patchelf utility
      test "${tree}" = "host" && mv "${PATCHELF}.__to_be_patched" 
"${PATCHELF}"

```

I tested on a slow-ish laptop (Intel(R) Core(TM) i7-10510U CPU @ 1.80GHz 
4c/8t) with:
make raspberrypi4_defconfig
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
time make target-finalize
# apply patch + diff above
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
time make target-finalize

Before:
make target-finalize  8.23s user 3.52s system 91% cpu 12.851 total
After:
make target-finalize  9.25s user 4.81s system 158% cpu 8.892 total

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
