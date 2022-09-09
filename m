Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DFBECAAD5
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 00:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A43D860ADE;
	Fri,  9 Sep 2022 00:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A43D860ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8POG-woiw4X0; Fri,  9 Sep 2022 00:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C71F60A9B;
	Fri,  9 Sep 2022 00:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C71F60A9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE0371C11A5
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 00:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE9960A9B
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 00:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE9960A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_UoAY6zOWp8 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 00:40:29 +0000 (UTC)
X-Greylist: delayed 00:33:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEF5D607B4
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0071.outbound.protection.office365.us [23.103.209.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEF5D607B4
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 00:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=d1rckr072WU8Wo6fpfRlL0A/UBQPiTPCocNPJfpKpa8WNFqavl+5Ox7/ixHWW71G/tD8c3LUg1OWiwZYVCtLsOXIFieK5T+rqFQTvgZWTphW0jLqQlBv0CDkwytgzg0jTrL8/K/iULc9tJVMV8+xbbdDIr4QtJA/UFMYbahvSO6yYcv59XNoxjzbw46YOFPzmxaBKWTunql+E6knY5k0CVqR9osE+dWFGn/VpcxEBbeTe3M/hTqsbVPbLvOKEa11KmyO1/k+U80rAxpV6zIGXll9NUNOuVjGYrZSrxYaPKvAY4blqVIrGEv1QDHGykcjxaQqyiVipI1hS0PUBdzfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPlrrvF5MXk1yGEYSUwtuCBCsMQFFFPqDCByB1qVFrI=;
 b=A4TxfIS6kRxzYBtbAR1Kt96ALztYOXh0np0/8D2gCSh33+fHaPrWZO8lEdDqrr1hUKepYg1zQQgfk4NlHN9NEbB6tS2TdaywC2t7avgz5EXcqC+BK7URQ8tDnWUwgS7+zioEfdLPrDnJRhhIzNlXC9nbdQGVCJAgi/pZQ/J/Rb0BqYNEQf/w68pKPJXw+m9rgW2XzGTvQYJXj9zIdf/pBN7Rpk+MEjnebuK4o9XB5O5HSlYL34KHLQVSZX88fFpa3J7kXoTydqf5N75JwHyHs9xW4KBVzKBZ6LF8AWZ3+BgyrKrisN+ZIyCuhEmekgh72/jLccwFeF7d8zR9z63t6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netacquire.com; dmarc=pass action=none
 header.from=netacquire.com; dkim=pass header.d=netacquire.com; arc=none
Received: from PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::11)
 by PH1P110MB1218.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 00:06:49 +0000
Received: from PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d05d:d865:a732:2771]) by PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
 ([fe80::d05d:d865:a732:2771%6]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 00:06:49 +0000
From: David Hauck <davidh@netacquire.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Failures Building 'nodejs' (2022.02.x and master)
Thread-Index: AdjD3CkAb846+dO4QBWLeeLZYl/a7Q==
Date: Fri, 9 Sep 2022 00:06:49 +0000
Message-ID: <PH1P110MB10689157C947A98D559469BAA4439@PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1068:EE_|PH1P110MB1218:EE_
x-ms-office365-filtering-correlation-id: edcc90a7-1cda-4a13-1b32-08da91f73105
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NExufqr0rubxASOPgSBAPZE480IxKUjT2D2Xf1LRcYqT5/AQQ9da1RNvKYX/Aq54/KVA5a3ROLXmqfCebF+4zR8EogMi53b4i6J8ecF5Iuv6TD3hkfFKFSAmqk5zV+RUUmthfMTQemuBdhZki344nLQyqwCjpWtUXymKxMSCYDpKhJmmXCJiCGKxaFuD4gvvALV2LIl9vjAlMbUabVqJZ/YI48+/dKH+ZBiwDI8txV2mAbw9VU/RLwY2ycagX03OlXN+9NakZZIBjT3aXLPAvB395FfTl4BHgkYIJsh0UgDzWz2upKbw9LbjO0Z+1rUHVxZ4Lk0gEA3e8CBSFFabPCh/mXD/nshArFp++nS/Zk0m8g6600FJZ4Ya523XDoxOBrUnuh91aroygMKp9ymqiaUjhUv8ozfjv3YITQgq+APXeWHfj5aWPLKa/y0NfDxcf93RE/IECJ7kjwGAGhfiHQTnjgiGXE21W2UajFlNHnjjS9LedeeeSsB43kURuXOGv5KR9R/YdhQYiVegMapW21v820sHoTK9vqFTm8sQxCJ2sMt6A/8rYfdT1GF/doCvQ2SAX/0+npUos9FR4lBMdSqBjjrv2FK4Pq4X/kIoKaZkkamaXN75ZaRqPwo3C2Hj2T2/D9nMOztbdhn2uDxDcCTlo0ZcvL2z8WWyKNA0KETfMjQowYgECG7GzAmVN4BasoLfc9NVo4YNzal7ykD943mo+JVhj8W4ujJ2EKdbMs0ES4y4lQ8D29qdMk6zNLLuX0xNB6WbW7Chhts0fVwPs2F2p8lWfDjlpYMe5SuKYW0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(39830400003)(84970400001)(76116006)(38070700005)(86362001)(64756008)(66946007)(66476007)(8676002)(66556008)(38100700002)(33656002)(66446008)(30864003)(8936002)(52536014)(2906002)(5660300002)(6916009)(41320700001)(41300700001)(966005)(26005)(71200400001)(55016003)(83380400001)(122000001)(9686003)(6506007)(7696005)(508600001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5ieQHPc/bGbMxXktB0Bo2ESCMGns3o0WaTUD20ID3w/XEbWompGmZXcc7MZQ?=
 =?us-ascii?Q?xff+TT+o+t7VSJpM53w8ukCCh2uR8ZKfUjzP0nIDKuqz5qfPWg7ZHLCjURZ4?=
 =?us-ascii?Q?SRD0CgWrr3DYTZP4uk5cqZGAxMS0IyrEICBwD3TS4uNmF2+lEKnFg6LS2kRt?=
 =?us-ascii?Q?JrFimVEXbZQyHZpSXXCE0ZAh6MkIpOjOPDdh4tvsqpraqbKVVnTCLqLw+Q/L?=
 =?us-ascii?Q?+2SkU6nr4GkR+CdbvLJ7B2q7AkMWSNNTPhPCHF3lqRkn5JWw6niivssC8FOx?=
 =?us-ascii?Q?wmNiaOp6Krq917C7sk9knBXJpJuvUZCWsYSbI9+0hqIPldA8bBJjFXxhAlXM?=
 =?us-ascii?Q?6WsEaFPDbkwc2YfwQD0JneTh0LiSmbODutHPchaVOzOiXWullk1OOnbX/oSg?=
 =?us-ascii?Q?Evy/1pOI3AlgaIB+l3F/BGvlL/rLrB43PW6hB6ANW/vGxOrsqRFaLuvIr+k7?=
 =?us-ascii?Q?e9S7JGYNR9QOwmtShEYlZAcqLLP7mmXE5CG7ZW4dLpI6KxqOcrgGQk9/fhIW?=
 =?us-ascii?Q?gXloFO4hf83bSkndlu2RdC0uVn0wlvEPctn/I7/0/ApWEHmSwzdMq58LvWkD?=
 =?us-ascii?Q?liwyJMgqe9Eq5oOpdgZm/DgVcDDXAbymgZac16kI/QWZhTezwOrHGKl9CMkT?=
 =?us-ascii?Q?eUNo3igedtwMiSJNOvOBAKQkDamy1qcE3gETMBdssRfCCv4NRFmGqqcv99sc?=
 =?us-ascii?Q?u/3Tx6MImaGEf1DYbbCWHHzFu1FXrZu9uGmbAYsfrxjPjrb2O6QpDNM9z5Su?=
 =?us-ascii?Q?uNdn66S0F5otw5pkCXGmWrPi1rq5fQrIv7fqn+0/0hmGL8xtMY2L2UcGRgfK?=
 =?us-ascii?Q?tZNU2hUjYM2ABBdBIJDyFErQ3IgYK5SU9GBeKlBlVFs0WWX27SoGoKJMZhEW?=
 =?us-ascii?Q?T31mHX+XB+EQA0HT0HFmpJw760qY0NW2s/e11Fa0307A/FiW16M1DQXf8Wlu?=
 =?us-ascii?Q?rl1wiOLb+m2Lovv8S3DL4LO6Uq4VcNp8q2zRmDzYygREBMf6zOecQgwkY4VI?=
 =?us-ascii?Q?8zfI0ZR6DzoBB5rq4XdQAdbElZBSjmdxitV/nVWUr3bHzw2mn976rvyqe64v?=
 =?us-ascii?Q?T5E6bYk6Jn24Wxf1e0zrc7wmgS1xvbs10q5is647pzJGIP7qmvYEEiZcFpKk?=
 =?us-ascii?Q?40gQF1GS/EX3gCaZ3mSQ3ESyzqGyxFGDtDOrYGrvhinJqTNz23n9oi6GLTz4?=
 =?us-ascii?Q?JBpvUnBXJvVgsdbrbzTZKWa9sSR331rv0TCY60Jb+2fgMydSmbH7lnYuY2JT?=
 =?us-ascii?Q?tI8y3t85EXrnvBMbK+AxG2Ue9kYTOpU3grFm37jTPpYc1DidSXm/xsAbWVoj?=
 =?us-ascii?Q?mHry9kxIM+arpbRUdhUnES4l3+o3IpfOLpgaET0IJHhabq6MmGOJou+wNIXb?=
 =?us-ascii?Q?C4nLmsW9f8tIRR9D9wUcqnFbUL1pv0wusThvqwa9Ou3YdtKIGeEhc+8jyJmn?=
 =?us-ascii?Q?HDlkUw3ZDm9h0a9ayBNEiBSV3Kwybl7YSD6kyj/sQMxzFCNd/mAy+cq8rzaD?=
 =?us-ascii?Q?r+YojPl0oLZVzgs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: netacquire.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edcc90a7-1cda-4a13-1b32-08da91f73105
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 00:06:49.1401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ec65e18e-ede2-4ced-bdab-49355e3f602d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netacquire.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPlrrvF5MXk1yGEYSUwtuCBCsMQFFFPqDCByB1qVFrI=;
 b=3zonuEfeuCko16YJ75IsNj2Cm+AePzOv9ys1DuKuEPV45AbfZqXWTCsIgOwbofdieeey+FD1FJDHNocj4zEiLMtA9IWj7dHrtoZntKfQtQPsvgbSMR/Ae2qzTNo4i+JhVTJmbjhmnItzkfvJcON2ez2pHRiKg02QQdGK7khdWf1PxYj0VYmVqBAd421z69EUp7J2hfTgT95mReAOUAFxKDCHZVlt/zCaKmjWMfDmek47Fx+0efucmheEnY80SG7ftlXExBpj35GxQlnylM3rjzqVl3IubfYIMK+qX3Z4oYknVksL+fYyOZAvq1qq8jju3XGgRJe1D19yiKVRlIQOyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=netacquire.com header.i=@netacquire.com
 header.a=rsa-sha256 header.s=selector1 header.b=3zonuEfe
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netacquire.com;
Subject: [Buildroot] Failures Building 'nodejs' (2022.02.x and master)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Anyone know whether 'nodejs' should be buildable from (the tip of) 2022.02.x starting with 'pc_x86_64_efi_defconfig' on 64-bit Ubuntu 18.04 (w/GCC 8)? I do see this https://bugs.buildroot.org/show_bug.cgi?id=14366, which appears to be what I'm seeing (although I'm x86_64 target and host).

The suggested patch (adding the LD_LIBRARY_PATH hint) allows the build to continue past the qemu wrapper invocations for the bytecode_builtins_list_generator, but fails when the qemu wrapper is being used to run the torque utility:
...
  LD_LIBRARY_PATH=/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/lib.host:/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/lib.target:$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd ../tools/v8_gypfiles; mkdir -p /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/src/wasm /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/src/builtins /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/src/ic /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/test/torque /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/src/objects /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output
 -root/torque-generated /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated/../../deps/v8/third_party/v8/builtins; "/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/v8-qemu-wrapper" "/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/torque" ../../deps/v8/src/builtins/array-copywithin.tq ../../deps/v8/src/builtins/array-every.tq ../../deps/v8/src/builtins/array-filter.tq ../../deps/v8/src/builtins/array-find.tq ../../deps/v8/src/builtins/array-findindex.tq ../../deps/v8/src/builtins/array-foreach.tq ../../deps/v8/src/builtins/array-from.tq ../../deps/v8/src/builtins/array-isarray.tq ../../deps/v8/src/builtins/array-join.tq ../../deps/v8/src/builtins/array-lastindexof.tq ../../deps/v8/src/builtins/array-map.tq ../../deps/v8/src/builtins/array-of.tq ../../deps/v8/src/builtins/array-reduce-right.tq ../../deps/v8/src/builtins/array-reduce.tq ../../deps/v8/src/builtins/array-reverse.tq ../../deps/v8/src
 /builtins/array-shift.tq ../../deps/v8/src/builtins/array-slice.tq ../../deps/v8/src/builtins/array-some.tq ../../deps/v8/src/builtins/array-splice.tq ../../deps/v8/src/builtins/array-unshift.tq ../../deps/v8/src/builtins/array.tq ../../deps/v8/src/builtins/base.tq ../../deps/v8/src/builtins/bigint.tq ../../deps/v8/src/builtins/boolean.tq ../../deps/v8/src/builtins/builtins-string.tq ../../deps/v8/src/builtins/collections.tq ../../deps/v8/src/builtins/cast.tq ../../deps/v8/src/builtins/convert.tq ../../deps/v8/src/builtins/console.tq ../../deps/v8/src/builtins/data-view.tq ../../deps/v8/src/builtins/finalization-registry.tq ../../deps/v8/src/builtins/frames.tq ../../deps/v8/src/builtins/frame-arguments.tq ../../deps/v8/src/builtins/growable-fixed-array.tq ../../deps/v8/src/builtins/ic-callable.tq ../../deps/v8/src/builtins/ic.tq ../../deps/v8/src/builtins/internal-coverage.tq ../../deps/v8/src/builtins/iterator.tq ../../deps/v8/src/builtins/math.tq ../../deps/v8/src/builtins/number.
 tq ../../deps/v8/src/builtins/object-fromentries.tq ../../deps/v8/src/builtins/object.tq ../../deps/v8/src/builtins/promise-abstract-operations.tq ../../deps/v8/src/builtins/promise-all.tq ../../deps/v8/src/builtins/promise-all-element-closure.tq ../../deps/v8/src/builtins/promise-any.tq ../../deps/v8/src/builtins/promise-constructor.tq ../../deps/v8/src/builtins/promise-finally.tq ../../deps/v8/src/builtins/promise-misc.tq ../../deps/v8/src/builtins/promise-race.tq ../../deps/v8/src/builtins/promise-reaction-job.tq ../../deps/v8/src/builtins/promise-resolve.tq ../../deps/v8/src/builtins/promise-then.tq ../../deps/v8/src/builtins/promise-jobs.tq ../../deps/v8/src/builtins/proxy-constructor.tq ../../deps/v8/src/builtins/proxy-delete-property.tq ../../deps/v8/src/builtins/proxy-get-property.tq ../../deps/v8/src/builtins/proxy-get-prototype-of.tq ../../deps/v8/src/builtins/proxy-has-property.tq ../../deps/v8/src/builtins/proxy-is-extensible.tq ../../deps/v8/src/builtins/proxy-prevent-e
 xtensions.tq ../../deps/v8/src/builtins/proxy-revocable.tq ../../deps/v8/src/builtins/proxy-revoke.tq ../../deps/v8/src/builtins/proxy-set-property.tq ../../deps/v8/src/builtins/proxy-set-prototype-of.tq ../../deps/v8/src/builtins/proxy.tq ../../deps/v8/src/builtins/reflect.tq ../../deps/v8/src/builtins/regexp-exec.tq ../../deps/v8/src/builtins/regexp-match-all.tq ../../deps/v8/src/builtins/regexp-match.tq ../../deps/v8/src/builtins/regexp-replace.tq ../../deps/v8/src/builtins/regexp-search.tq ../../deps/v8/src/builtins/regexp-source.tq ../../deps/v8/src/builtins/regexp-split.tq ../../deps/v8/src/builtins/regexp-test.tq ../../deps/v8/src/builtins/regexp.tq ../../deps/v8/src/builtins/string-endswith.tq ../../deps/v8/src/builtins/string-html.tq ../../deps/v8/src/builtins/string-iterator.tq ../../deps/v8/src/builtins/string-pad.tq ../../deps/v8/src/builtins/string-repeat.tq ../../deps/v8/src/builtins/string-replaceall.tq ../../deps/v8/src/builtins/string-slice.tq ../../deps/v8/src/buil
 tins/string-startswith.tq ../../deps/v8/src/builtins/string-substring.tq ../../deps/v8/src/builtins/string-substr.tq ../../deps/v8/src/builtins/symbol.tq ../../deps/v8/src/builtins/torque-internal.tq ../../deps/v8/src/builtins/typed-array-createtypedarray.tq ../../deps/v8/src/builtins/typed-array-every.tq ../../deps/v8/src/builtins/typed-array-filter.tq ../../deps/v8/src/builtins/typed-array-find.tq ../../deps/v8/src/builtins/typed-array-findindex.tq ../../deps/v8/src/builtins/typed-array-foreach.tq ../../deps/v8/src/builtins/typed-array-from.tq ../../deps/v8/src/builtins/typed-array-of.tq ../../deps/v8/src/builtins/typed-array-reduce.tq ../../deps/v8/src/builtins/typed-array-reduceright.tq ../../deps/v8/src/builtins/typed-array-set.tq ../../deps/v8/src/builtins/typed-array-slice.tq ../../deps/v8/src/builtins/typed-array-some.tq ../../deps/v8/src/builtins/typed-array-sort.tq ../../deps/v8/src/builtins/typed-array-subarray.tq ../../deps/v8/src/builtins/typed-array.tq ../../deps/v8/sr
 c/builtins/wasm.tq ../../deps/v8/src/ic/handler-configuration.tq ../../deps/v8/src/objects/allocation-site.tq ../../deps/v8/src/objects/api-callbacks.tq ../../deps/v8/src/objects/arguments.tq ../../deps/v8/src/objects/cell.tq ../../deps/v8/src/objects/code.tq ../../deps/v8/src/objects/contexts.tq ../../deps/v8/src/objects/data-handler.tq ../../deps/v8/src/objects/debug-objects.tq ../../deps/v8/src/objects/descriptor-array.tq ../../deps/v8/src/objects/embedder-data-array.tq ../../deps/v8/src/objects/feedback-cell.tq ../../deps/v8/src/objects/feedback-vector.tq ../../deps/v8/src/objects/fixed-array.tq ../../deps/v8/src/objects/foreign.tq ../../deps/v8/src/objects/free-space.tq ../../deps/v8/src/objects/heap-number.tq ../../deps/v8/src/objects/heap-object.tq ../../deps/v8/src/objects/js-aggregate-error.tq ../../deps/v8/src/objects/js-array-buffer.tq ../../deps/v8/src/objects/js-array.tq ../../deps/v8/src/objects/js-collection-iterator.tq ../../deps/v8/src/objects/js-collection.tq ../..
 /deps/v8/src/objects/js-generator.tq ../../deps/v8/src/objects/js-objects.tq ../../deps/v8/src/objects/js-promise.tq ../../deps/v8/src/objects/js-proxy.tq ../../deps/v8/src/objects/js-regexp-string-iterator.tq ../../deps/v8/src/objects/js-regexp.tq ../../deps/v8/src/objects/js-weak-refs.tq ../../deps/v8/src/objects/literal-objects.tq ../../deps/v8/src/objects/map.tq ../../deps/v8/src/objects/microtask.tq ../../deps/v8/src/objects/module.tq ../../deps/v8/src/objects/name.tq ../../deps/v8/src/objects/oddball.tq ../../deps/v8/src/objects/ordered-hash-table.tq ../../deps/v8/src/objects/primitive-heap-object.tq ../../deps/v8/src/objects/promise.tq ../../deps/v8/src/objects/property-array.tq ../../deps/v8/src/objects/property-cell.tq ../../deps/v8/src/objects/property-descriptor-object.tq ../../deps/v8/src/objects/prototype-info.tq ../../deps/v8/src/objects/regexp-match-info.tq ../../deps/v8/src/objects/scope-info.tq ../../deps/v8/src/objects/script.tq ../../deps/v8/src/objects/shared-fun
 ction-info.tq ../../deps/v8/src/objects/source-text-module.tq ../../deps/v8/src/objects/stack-frame-info.tq ../../deps/v8/src/objects/string.tq ../../deps/v8/src/objects/struct.tq ../../deps/v8/src/objects/synthetic-module.tq ../../deps/v8/src/objects/template-objects.tq ../../deps/v8/src/objects/template.tq ../../deps/v8/src/wasm/wasm-objects.tq ../../deps/v8/test/torque/test-torque.tq ../../deps/v8/third_party/v8/builtins/array-sort.tq -o "/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/obj/gen/torque-output-root/torque-generated" -v8-root ../../deps/v8
/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/torque: /usr/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.26' not found (required by /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/torque)
tools/v8_gypfiles/run_torque.target.mk:16: recipe for target 'c3ecb30faf0f184434aaa0176146d6b664a4542c.intermediate' failed
make[3]: *** [c3ecb30faf0f184434aaa0176146d6b664a4542c.intermediate] Error 1
make[3]: *** Waiting for unfinished jobs....
/home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/torque: /usr/lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.26' not found (required by /home/david/src/buildroot/64bit/build/nodejs-14.20.0/out/Release/torque)
tools/v8_gypfiles/run_torque.host.mk:16: recipe for target '90acbe09a58b5c96577a64f8c7bb0e33eea2c066.intermediate' failed
make[3]: *** [90acbe09a58b5c96577a64f8c7bb0e33eea2c066.intermediate] Error 1
rm af79912cde57010aeebc2836906a42feeb51c281.intermediate c3ecb30faf0f184434aaa0176146d6b664a4542c.intermediate 90acbe09a58b5c96577a64f8c7bb0e33eea2c066.intermediate 51c742273025e04a8acfae79bd4d29cebccbaf14.intermediate
Makefile:109: recipe for target 'node' failed
make[2]: *** [node] Error 2

An earlier attempt with 'master' (next) with the same config on the same platform also failed, ala https://bugs.buildroot.org/show_bug.cgi?id=14936:
...
ninja: Entering directory `out/Release'
ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1271: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

Makefile:127: recipe for target 'node' failed
make[2]: *** [node] Error 1
package/pkg-generic.mk:290: recipe for target '/home/david/src/buildroot/64bit/build/nodejs-16.16.0/.stamp_built' failed
make[1]: *** [/home/david/src/buildroot/64bit/build/nodejs-16.16.0/.stamp_built] Error 2

Curious whether there was any promising activity on either of these two issues?

-David
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
