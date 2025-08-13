Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12BCA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 09:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC34741340;
	Wed, 13 Aug 2025 09:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MU1Odei9KIS; Wed, 13 Aug 2025 09:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE0C4132D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE0C4132D;
	Wed, 13 Aug 2025 09:40:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5877F1B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55AAE60607
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRq4vtDyHSht for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 09:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::619;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8598E606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8598E606EE
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::619])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8598E606EE
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 09:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhZT/mF6Mizcw36lvvOnyDOfSdMrhVWP1iinhLxhrgq+WYyMkmu/5Yq4huOc2qv6nB5pomWG1rlY0rNJlamfj96ONXoTyu4KE8DEDnMD6kMzhqAbD9xzsOAZX3oDsrNlQT/VCUwb41o8d33HArGK7MQ+0LtmgfO+t6yIcujeGEZNrBrUgygcgvsw8fHpopYLgaqqivHvZJRNT9WnkcSrmm89D/Qte+ii9eXySkSqUAqDAtbKwOk2lnHxZyN/1K3F1azOM4Tjr+GZxsHMxQzgMbAbzczr1nCWkVyFC9dyq6GBq9+vco6zELJXlrf6uz7setNGEv6F6nN/aRwXF2dRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsfoUUazeDAIGFHbrVUSWSky9/d+8lkGqqLqFWi1pF4=;
 b=nboDsiSTSga+znuifG/5z6XWJaBCuS2f0zKMBuZiozwtQ9ntdN17LZfnbDCZe5PUYEgb8uOKvCAnCx1d7dvNGRUg8HJ+gg7FsGohwXGazozwWq2APL+43c0tYIL+BtPorVUxhULoxO6lwyoOpwZ6t5oj36Gx9S8gsI0BOgONP5V2f5dyaAF2lZ9WuLPivQDW91agniDsfU8idZW9jvyKxvt+zmT8FJfKmeCIx2ULNhxaQQh16MFTBHlMLuK1y7NFzzn600yCZCQCVUKBZyfBxJ9cPrGbAyXgxcMVRkH5u++2iZfT5wGwFukCCA8/UPpYtzK7UVJHHabBip3jA6K/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH1PR12MB9695.namprd12.prod.outlook.com (2603:10b6:610:2af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 09:40:27 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:40:27 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow apps for
 device family
Thread-Index: AQHcDC5rImx9aiqWN0OWo4Ty98gAUbRgTLOAgAAHLuA=
Date: Wed, 13 Aug 2025 09:40:27 +0000
Message-ID: <SA1PR12MB5615DA92C7A0C0111DA0594FF02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250813084354.2739722-1-neal.frager@amd.com>
 <20250813111329.7272240d@booty>
In-Reply-To: <20250813111329.7272240d@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T09:39:10.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH1PR12MB9695:EE_
x-ms-office365-filtering-correlation-id: c0d0e032-585e-4323-02e3-08ddda4d6fb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fbNqTMQxJyzYZBSQBSR6GgYOGGUTBs6mDebB9cSpwZRzOfxCtiJdwVCwGltp?=
 =?us-ascii?Q?gIRPK6G0JFn2hexf4I2Tki+d/+lV1KyvdJC/tp/BA/9XYGQNzTIXejcZlDho?=
 =?us-ascii?Q?famtH6ThhmN9eu+X14b4VUw8vkxpqrbadAqEqxO+q5OWU3dYI1DHW3JGo/iC?=
 =?us-ascii?Q?7US+VENdZGOIsSKlz2MMr/gnzP1HvIMVeRHXtalKHN5I/0HtOHBXlPij930z?=
 =?us-ascii?Q?H0alR+ZIIz7roXPF9LTXOwNFVmc1bCKR4uLHZgo8T367+r3MJedaiUfbOIx1?=
 =?us-ascii?Q?b+rLg1hSRHfTqOtCFZCcshVdzMWuiKlKm9oMZ+BWkdu1HerhTA87TyFuz3iC?=
 =?us-ascii?Q?3xZYwTnspISt22bX7Owd96fcZx4SGlKvQHaG19GPALszrPK2M9+QzbzFwcKR?=
 =?us-ascii?Q?eCm6G7k8ZwupGy4xp8S4V56ysd+Kye4NjoVYRabfCsG9jpY0eGiW3vXp403d?=
 =?us-ascii?Q?YYCytEapMwxMA+ttF89sHd2b893FaL48thYippSupfgaCJROe39iQuE5nh6m?=
 =?us-ascii?Q?qLosNQVVrnIMW8oC5c5HhIN/Rx63hX0QDNXuy04UKOHiI1YIau7ma9z7JqV2?=
 =?us-ascii?Q?8uE6uqmU3r4WSYa9IbqxpUCTXAI/nGVYRXwQU7rCnHncwaxSVIncUSYw+1VA?=
 =?us-ascii?Q?UCA8urSag7wwPbOMgysMIy0cLOF3BADLo4ZiNGZwFAlpp/s3avmKBEArNh3H?=
 =?us-ascii?Q?KOuFe9F6LfF983bi5RBwUe5DorlTrNFBh/zkkhieV0dxS4MOxRi0T4vlx7EK?=
 =?us-ascii?Q?eY6crHG02El83sGsoSaRG/zwiuZisL25fS38754j6a3rS3AUrB2xZVUUWWcM?=
 =?us-ascii?Q?Y54XbciKZCMU9cFmpu950eIUy8Owi4vcDKOjd/U590U2IeCoXFvR1bihmWCh?=
 =?us-ascii?Q?9inT7XhMLDBWYbHuu+5XCbj/MhSvoIPC1CbVBRvwUQrf9EByPoKbxpI4jL2J?=
 =?us-ascii?Q?Lb/iYwhH0/1DAZzKw44DMcw6QlKHq2XGuU/SmYyb9C8F8uFJ4t51LjZiPv+D?=
 =?us-ascii?Q?HSuKa8T8DUn9Zsv/WeVrE2c1bkgfP8vpbcmIeI31NzhmO0nBE0300M+BEpEn?=
 =?us-ascii?Q?N+LYgc1ulWh918hoXRjC62JLNd5M0NhmpQJxZUiEMNa/BAUX98SguOnlnrLO?=
 =?us-ascii?Q?J62gB0DofNPpZ/FACTHROfXoH8ErfudVEz3kPoLpIo4GyZKLAZ05/zcoOF3E?=
 =?us-ascii?Q?GBfy53CcVrm3vrJ/BYgFYBXLychZAifa0YV/lKEyr/2IMvxzzi9iEokQwmcp?=
 =?us-ascii?Q?rjiQccCL+FvEfHU1wumhP+NsT3MEzQQycDeK+EVqtQ8f96+AjqPPEVoM479X?=
 =?us-ascii?Q?VtkgtVAGIt1Yuub75JvG8qBjyit5WTJCxJikl+D8ujLTHn9n4JqaLVQ6LOZH?=
 =?us-ascii?Q?v1EFam/LSI6G/o1DVSBACK3i1jpqTiWijtrHM8mOB3IiknlKQ1AVZpTgILry?=
 =?us-ascii?Q?8QcdLHIMy40jfsBLIDgQqUQNvUN2BO1vWV5Gei7LrNGL+O22XPAjkt7F0bY4?=
 =?us-ascii?Q?FFiKHVux2DKr1OC2RU7CwOR541AI2P7fo+/K?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JbjTP6wg41PunY3c3FfqSZu02goe6rhrRT/okkckPEWDI0jC+5mYyDZUUVd4?=
 =?us-ascii?Q?XaYxXdGz0LkBJbXueMifxpJdpKKFWYy/m2Q7GhZ37zgt5mFrzXY1IL0NKY+X?=
 =?us-ascii?Q?6khFl1hjTAojwsp4J6tOKiLYH+XZCqR0PjnAtnZS7xWdQTDj1b0iHJQFqfih?=
 =?us-ascii?Q?++jfRze9dMqtRN8u6BLb1lIxvDJSIFuTYeB7XlwYeB/pD20kNa7xPt9A+EPu?=
 =?us-ascii?Q?I/QBI3HWfy+g4t5+6ylo0s4ieusvDTbSjqM9WjFRckTCcusdtymM8+YPCKm5?=
 =?us-ascii?Q?f/7TDrmX+r3eBhYVR7uLhv+WbBnQ9CjPtkqT/K3CKShMGZKEKp/5mf8Xa2uh?=
 =?us-ascii?Q?JuougYl0Tiw3yChRxbiAU7X1s2ww1R6zqCRs6D8ojSnmO0Ef/xd7lxDu5Uq+?=
 =?us-ascii?Q?+jtQv3u1Ef1xE1AaSR/VoA2ogRue4gTymwWSmPodCmUhyEa0ogpkBrcA68ps?=
 =?us-ascii?Q?JX4oGrqv+r7lO8ML06syecG3o+vdJe+XP6/nlbyeQmW0+7+L++51Y/yjWEGd?=
 =?us-ascii?Q?uAMqI2J65C5t3W3ti7dctw/Yctolw9afI/ibe/zB0kTdIzXYAm/hWK1Wqb/i?=
 =?us-ascii?Q?hHJQqORApCbqvrVdBA5LNwUoFInM97aa/mMrWEZEdtTbzGpRn26oWgAV+j3Q?=
 =?us-ascii?Q?7l0Zj2gxyHfjlL/nbklVa2NTicLxDgk7isJ29gK2gF3pRS78uSSubtgwA3zI?=
 =?us-ascii?Q?YcCjU9Mx2JWHEq3TfS2LGAe3ashwWvu1iVXBRA5PHbuXxOXOIHOGxBu5J7el?=
 =?us-ascii?Q?CWXl4gnVEvEdkSL25HC0KLgPZJqwDlfyjGBNesEN9Y89K6acJdupDPnT7m4E?=
 =?us-ascii?Q?/pICTg0NRc8Aj1E7NS4PgG5VhIYDWtEEzJZCWi2cNl29hgJOI+WgpMnifSV3?=
 =?us-ascii?Q?O5ry/36r6AVYIZamuMFagDFMy+uV45s/xBHr+y0omFpUA+qR1UdeMKBLESzB?=
 =?us-ascii?Q?0YhD8p/XRmoFlkm9/2HGaPArrDI3BjmTFCApMMY+1vKj9AZyY/3sQ4OnFJQv?=
 =?us-ascii?Q?ReewG1gWp3BDOE4fQwOmb44CUZgR+mYi6o3N42sH0W0ZNgHU0QiYg5Y1rYrv?=
 =?us-ascii?Q?U/n51Jp7paOGjDKAZyudtDzuN5an3rtpXPbQ65yTYSU4dHjprwAIQNv08t5N?=
 =?us-ascii?Q?n2Oix8G4FLNWrqkRcaNJbUtRsjOtJpJl9I7bZcXOBGu4F5nUCwfPY8iCc7vF?=
 =?us-ascii?Q?wv6yFugpwR0Oa+yeUEeeNZLq9vvBbYtBU718bWlxp8Q8KpRjTXbU7Sp3d+7+?=
 =?us-ascii?Q?ZO+FRYYymiQyRdynEolT0Cr33ssEpyh7QcZIINmYzT8vSr8FgaQDzbFHuv2/?=
 =?us-ascii?Q?gJcsGvLGlBhn1GdrUKadhuHcyPKgdgREpDGYufPbHkfhR0pJJwLxjbSBQ7bY?=
 =?us-ascii?Q?IocMQxSp+oicR1jeoRZFZJSi7955thLnV6DIV4G8XFq19DyJzkS94TBbQ9vN?=
 =?us-ascii?Q?YUlb9kqRdmROg1YI7vNmINh+mF0GzJ+BexH6+yQHGRI27m9CPSg345atbdg4?=
 =?us-ascii?Q?xs6wKPnBGGmZlHSRocJDd5CKpXnuYJDP6oARkiGFF9CpRxEF7XmGbytoNq7X?=
 =?us-ascii?Q?8lB8VyzzBGlb9M9cxfw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d0e032-585e-4323-02e3-08ddda4d6fb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 09:40:27.7293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIqQgUUpurt9dQqiAe/SIO7g4oFF5fys1zVktXhZE5G9C8TqqvuNK1oXbXHBjJx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsfoUUazeDAIGFHbrVUSWSky9/d+8lkGqqLqFWi1pF4=;
 b=HDZnGBrP530kgCM3kbY+xdkWR2cC5bAJ+w17NKSfRPATJibRSNFeXbEKMVhTNx+W91ut1zGyZue5KAidh++ZjLMkAZAnmqr/C2FRwHfOHx8Q1VCVGn6n04uinGVhjq3YrBuPYTX8Is/sOeUTVGmliUN6OECf3gsHCcsJALf+0lw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HDZnGBrP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Luca,

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.
>
> The versal_plm and versal_psmfw applications are specific to versal devices
> which are based on BR2_cortex_a72.
>
> The zynqmp_pmufw application is specific to zynqmp devices which are based on
> BR2_cortex_a53.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Replaced new family variant config option with an architecture cpu
>   dependency, so no new configs are needed.
> - Updated patch title and commit message accordingly.
> V2->V3:
> - Changed package dependency to only appear if the cpu is BR2_cortex_a53
>   or BR2_cortex_a72. This way, the xilinx-embeddedsw package will not
>   appear with zero application options if another BR2_aarch64 cpu is
>   selected.
> ---
>  boot/xilinx-embeddedsw/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index 0dd6433608..96e9ca2fb0 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -5,7 +5,7 @@ comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-b
>
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
>       bool "xilinx-embeddedsw"
> -     depends on BR2_aarch64
> +     depends on BR2_cortex_a53 || BR2_cortex_a72

> The same change should apply to the 'comment' line above, no?

> BTW the example I gave in v2 was touching the comment line and not the
> the menuconfig line, so each of us changed one place and forgot about
> the other one. :-)

Yes, of course! :)
I will fix this in v4.

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
