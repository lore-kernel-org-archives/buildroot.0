Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02150C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E43A41C10;
	Wed, 25 May 2022 13:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56R_Qr5sd11I; Wed, 25 May 2022 13:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC444190E;
	Wed, 25 May 2022 13:33:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC0B11BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AB3884285
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg368eWLrCyi for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:33:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::621])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3F9484284
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxeAogCyVbI7IOw6w9fQmZXoX9esb0fiMAGo9VjMneeTJQ6WlJo9AhwJYeE2TyokCeSiWrTpUAZPpM3vkNMciml9BH97zO2lcPQiF66BcBQ01p0LlLLr+lFG/x9SohA60cvGuUeNAnzTLNFzxFLFaEgBf3HtjAb+wKVlURYUK+nxWn+UiYdhCaM6BQvEf2x35p7RuBFs5PmjcqiPTPTuP9PftvF7JYxkyH8pf3aCIkqWBeDQnWETdwRr/4eEoq4q/ZMB2c1MyAIhTQNIYEOrcuXVa44+zX0dLVrLbzx/SqPbEds3sIF1v6kejzTmDeOpVVeLixYltLgKrTqASPLdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTDhn0QU3RCH53NHxb2fW3nDQ29GsaOPACOQw1wm6Ks=;
 b=npuAGGIZz6Y1vubmfrGa0qWA4BS8FUCZqNfNuIgIL/o/cmw/kUqdOpPxLTgCO2mnCJmojp92JHvUi+H2GsckD+5MePcgyd8W9roarPhs/CZUQxGMwC5im9OXmaOJZlTTDnXP3WODkNIi6hhNaAKhcaZ6nvQ1Ax262eyODVpr8bcgCdkh9ybYZPQvGvwE9Z5F+KfwXwqyhJZSbzcErM8SLLSvBmLAuNnt1SahoKpa3WNthkVWbeQgeD/cGAYloN0L2kMM4wC5lhMy+oGaTP2cSDh7WSoMV4LbrX4gtfEphUl1vBRbiwz+b4ri8i1y7Pkl8V7EJI+jsPKX+Q3v38mUqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTDhn0QU3RCH53NHxb2fW3nDQ29GsaOPACOQw1wm6Ks=;
 b=XQfXQL8n5o4fQIjZTw1PyEkEfMpV8sJ3e+n11oKwA4Az/ZTpieok0spZuKzBpY/1D9lAbzlzRIc0UAMzY1E06xcA59a2/z2a9tT6qStlkTv67NzwTSnU9OY3o87dKgJ7UiM9M1MimAHIYNHFxPrgvsBGQekIEDhxfbBxh1Y4/9g=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MWHPR02MB2686.namprd02.prod.outlook.com (2603:10b6:300:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Wed, 25 May
 2022 13:33:29 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 13:33:29 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Neal Frager <neal.frager@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
Thread-Index: AQHYbd4O2Ejc8kIdTU6twGCobUN0xK0vTyKAgAA2mQCAABXqcA==
Date: Wed, 25 May 2022 13:33:29 +0000
Message-ID: <SJ0PR02MB7758166614E50F1528FADE3BD7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220525085717.GC301044@scaer>
 <1325638a-c5a9-3795-d282-c0a6accee081@lucaceresoli.net>
In-Reply-To: <1325638a-c5a9-3795-d282-c0a6accee081@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c1c4be8-2005-496d-5c53-08da3e532780
x-ms-traffictypediagnostic: MWHPR02MB2686:EE_
x-microsoft-antispam-prvs: <MWHPR02MB268666D42A0FA233776FD708D7D69@MWHPR02MB2686.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jFUrV4qVz/v8hwHoVlZFGgiv84+DDw4GdqLG756cGTRah78s9T+K+Vv9VsVp+8bHp3iS4K/djrH5XjjyLB+oeTwa9O9C7CyytWq83vZ7Kae4KL7D9uhZ3SEFbqOXtG2UArnUd2CgtRimF7HQ6UKvQoAOKbGHaY9u7o/rsOWNpWcL6LGB94EsWSRZgZnpXkBrLoQ/YhOYp9x4E6YBVdqjXge5amxOqsGSvmpQx6+WmNwyxlR0R1Y3ibz/PsMB2j6lBsCqEk2OyPOM3gsIaVHZDYEcaVBj2raZk6R8mkS/1EMfPTYuTBmHXhDLzit9gQjefpe5GMQsCg9nuWCkYfkFDS6awij4hMq5XOg25bY5DQdNDB9/X8QUHv183ShjqL40uHXhv4imDO15assLwSKbzXa069yp4E+uI3dxrP3yjcNby4ifP3jBqPLs+oMFnHht/akVB14BSz/PF2zJ/e0+xHFh7sp49DGymkYD9yWkfjcwpsw2w8QsV0svThbdOuhCABrMH8DJRh0QF3lUl00tfM71lNUK4XEN6VPinvIq8EjCaxPsylaIaojXJQZsynMIr8mkkCkE9IeE1MDHUgUgTXXU3hu2ZJffeLwgWU5G89tx98iwOB6RVCZE0ThQBKE7s6H/2h3lUaKmgiKaj8ig3o1SqYqa7bv43Q8JnlJxGPuIUdVfR9jMeejv8Bj0+edNb3HDb9IvhGyDUqyohPwAwaQupMgJ44iIapdsiGsMA40=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(54906003)(2906002)(55016003)(7696005)(38070700005)(6506007)(316002)(86362001)(122000001)(76116006)(186003)(66446008)(66946007)(64756008)(66476007)(26005)(71200400001)(110136005)(66556008)(9686003)(8676002)(33656002)(508600001)(52536014)(5660300002)(8936002)(4326008)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STlhcW9GM3BuVzBEWlZKdzQ3UkNWSnBBU3hON2xCcjBJTGswclJCcTNYMHhx?=
 =?utf-8?B?dE8xOERBSFZhdzQ5Mmt3VmRabkt4Tmdya0NXZVJicXJUVk4zNDlRVjk3VExI?=
 =?utf-8?B?dWRRSU0vV296ajBvUndHNExqSlR4NEo1WFR3K08zaXZVak5CWnFOWDFka2tl?=
 =?utf-8?B?Ym5GSFNpR3g3dncra1ZpbWl0c0duNGI5aGpreWpLY0llQ1JXTGVSUmRvQS9K?=
 =?utf-8?B?dTRnTFhEYnkva1NrbkFaQkJnY0drd3BTejNRRTZtTjVKMGJCRE5mYm5vZytU?=
 =?utf-8?B?VGpFclNGaTFvN3VuUTZuRWtFNWRrME1FVTJQbnF0ai9kNFRocUd1RktoZDBM?=
 =?utf-8?B?RitzbnV6MjdjWkVGc0NqZzZJTC9UamlnS3VYTEpESTNsSW1mL29leklqd0dR?=
 =?utf-8?B?T3hrUG5UZkFmU3FYNGVmYXlBMUdkbEhSVGxwN2VrRWUxNmVTU2pyUTZwWjZE?=
 =?utf-8?B?dVcvckwycXMyZDN5WDZSZThGci9SNWJZQmVIdVFnVmlJbGZSUHA4NFRQNFo0?=
 =?utf-8?B?WmtscE8rdm1jYmdhSGM3ODMrL0ZTQnF6U1NpQ09YNTRYV04zWU93N2dDa3R2?=
 =?utf-8?B?VEpRTjVRdmJTZ0xyMnRURlBPdm91ekFGcVB5d2dpbCtpUHk5b3lxdjNjbTdY?=
 =?utf-8?B?YkFrUC9tVlJ3ZjdNMHZDUVJEeVg2eEpkOTFVRVpJRjJaRkxJTVZTTDBUNFcy?=
 =?utf-8?B?eUZnYlV6blhEQnJTQUtxRHBScGJnTGwvVUtEQ21HclVZcFd4WkhXYlNON3gy?=
 =?utf-8?B?RVdxTGdNQm1tdklIUDF2L0k5YmlSRWIwalBwRVFNQW9pZXJ6azNJQmFuWXdQ?=
 =?utf-8?B?aHBtSDk1RklpRm1TaVppK0kwU3lJWk9TOXgyZjhUakRPM1NSVVpkNDJPUEw1?=
 =?utf-8?B?T1dMbW1iZFJhUXJjYWFqemhmODJKeHl1K280NThkUVlXRWtPNjhCR3dQYXFj?=
 =?utf-8?B?K3Vaa3FPMlE0cnRFWHNDSmpqT0FxblBtUHUydC95SmpReXFFVEJ6bG1QcDRs?=
 =?utf-8?B?VDBJZ2RXemFpUjNoM1RpUnVjWTg5NEwxaC9ObkNCcXZzY0Y5RHNhNjg2eHZH?=
 =?utf-8?B?Slk4c1o4Lzg3YytrSWpUcU9DWmZwdmVEQ2Rob0xDTU9RTW8wazRqd0lRK2JJ?=
 =?utf-8?B?bXJucDRsUVpkUGRMUkdzUFB4VWlyeFRwRVdZcnpuMHEvSHdBajBESkdwa1Nh?=
 =?utf-8?B?cmpOK0htNGtBak1yaTR2dytxNXd6SGVhNEduTkxzMjhPRWNheVVtRkQzcjg5?=
 =?utf-8?B?T3ZqY2FBejlKY29oWGpMWk1kaXlJSjJ2eXpSL1JnWmhvY1lKWERjRXhlaVJR?=
 =?utf-8?B?RGZhQ3hNK3Q1ZVhNTGthQnV2Q0V6NG1MMVIyOFJ6MmhOdVQycjlPR0RGMm52?=
 =?utf-8?B?NkRNNkRKL0sxd3BQNDVtVzdMSGtNV1FNZ3J5emh5TjV4cDBvalJvME5oZ1NP?=
 =?utf-8?B?N05qSVpZc1hmVkJ4NWovVWRrTkgzU0doWXgrZFlrOUJ5VDl4REd6amF1OFpB?=
 =?utf-8?B?dW1lY3V0aTFhZEx2V0lPLzEvc1RldVUyTFV6UEJVUXRsY1JjNVA5UFNSYjdi?=
 =?utf-8?B?emVzek45L1hkUG5LcnFpb0RER3RFY01oNVNscll0YnE2ZTFXRFlsbzdvVW52?=
 =?utf-8?B?elBKQ2NiRHl4UXUxSGtuTkNiNjlWVms5ZGN2UG1ZYlBNRGdvQmVaTHlZSUpL?=
 =?utf-8?B?UEJFTHFFeHJhYVR4SGJiSlYxcjVMSXZRL0Y1WWhLcklDZUFKdzB1V1M0emlF?=
 =?utf-8?B?OFM5QjFkVnlGRk5OY0E1VGFFREtLNTlIOFcwTk8rM0hwdXpWaFBxK2dURGFC?=
 =?utf-8?B?Y0RVUUFyMk80clFDNjBlQUxPUEgzKzRWNXZzQ3IrNkFzS0tkRTBDOW9VOStZ?=
 =?utf-8?B?bldkMExqQmRGNmJycWxNWjZzc0JDemgvcHYxcEQ4TER2RU5WUXJJM0pmOWpo?=
 =?utf-8?B?SzJ2Vks5Vlkra0ljZ2xwWDIwV2NDWU50T2VXc3ZxbTNsQzdQMlNxdW4xbTJK?=
 =?utf-8?B?WUJCbFlkNUpRRkEwcmljam9yc1J0bzFJRVZDQVJBUlhIQjlYV2F5V09jQ3ll?=
 =?utf-8?B?TUxVUCtuY01TaC96TnN4VGVnV1ZzTDJnR3ZiblVsdUFzU2J5V056eWsrbVVO?=
 =?utf-8?B?eXoxSXMvMlRQa2lOdnE4bXY2Rys3NG9xb1AvVkV3Ti80dUxyYnc2c1RieGpa?=
 =?utf-8?B?UGFteERpbFFvRjVsU0Z0YXVEeWxJdzJpck83U0hzVFhmUWdlV1ByV09nVGxX?=
 =?utf-8?B?Uk5NcXFpYzJsbEE2SGxwbXhFY1k3RmlmY1NUREdTNjlhaVZXNFZvYm5rMDBa?=
 =?utf-8?B?SEtqNFdZZ3czZTJ0T242SnJGUE5teE1sRm5nY2duZUhuYVArSE9uUT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1c4be8-2005-496d-5c53-08da3e532780
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 13:33:29.1809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wc5gpuEUBUKDJvQPI5PN04G2gtX5nEzYlg+3RIbffTaB1buBp2t35mSxZuBfmHyT5g97/VzFhaR0xUwts7NSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2686
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

>     FILE="${BOARD_DIR}/extlinux.conf"
>     if test -f "$FILE"; then
>         install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"

> Right, but use "${FILE}" after -D.

I just want to make sure I am not missing something.  I have changed the script to the following:

if test -f "${FILE}"; then
         install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"

Is there another -D I need to add somewhere?

>     else
>         mkdir -p "${BINARIES_DIR}"
>         cat <<-__HEADER_EOF >"${BINARIES_DIR}/extlinux.conf"
>     TAB>label linux
>     TAB>  kernel /Image
>     TAB>  devicetree /system.dtb
>     TAB>  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
>     TAB>__HEADER_EOF
>     fi
>
> Note: the <<- rediretion removes leading TABs, so it is allows a nicer 
> indentation (so, replace TAB> above with an actual TAB, of course).

> It's amazing how I always have some more shell trick to learn from Yann! :-D

Yes, I am learning a lot too!

> Also, please always evaluate variables using curly braces and quote the
> expansion, like so:   "${foo}"   (in the here-document, quotes are not
> needed, of course).
>
> Eventualy, at the end of this series, the script will always be used 
> for boards that do not already have an extlinux.conf, the condition 
> can be dropped in a final patch, to just only keep the else part of 
> the condition, don't you think?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
