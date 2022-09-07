Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC072C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 08:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3456581271;
	Wed,  7 Sep 2022 08:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3456581271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9dWIU63sxXu; Wed,  7 Sep 2022 08:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF5A81098;
	Wed,  7 Sep 2022 08:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF5A81098
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE9E1C115D
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 08:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79B10607CA
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 08:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B10607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ANMrYQVO0bl for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 08:38:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D4E605A0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80080.outbound.protection.outlook.com [40.107.8.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25D4E605A0
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 08:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyVrvDIqX6xu3cDIk8CP9zJndKafo8950SxGscOFdtX/6GtO5gDI1LflEJe+IaWJ3zy7N31mSWxzqiPt4U7sULgwwlU4DMCH3KBYzkFRvOPQlEZGcRpvRk1drgee57vh475gU6toWGexsZc25GL9PaOnDxF6YNzUqCmiBQsF7Co33sLGJdv3cFZ0yhMZeo7sWQlyBUxlQEEQwiI0YKPD/qNBpsbeg5d+BscFbdBUcIYdzUv522aHhx02zw1SUPU2m95XJ2pC4FSfsQnHWNZqm7dW/Ynm+l+G037CdGaDieS6ajAv9RH55YP6AujQ3qmNGcoXSFRGFvUNx+WW0tsqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf+5ntQscHeBd84o32oIzNyrGYc63rcgwedCx4R5ac0=;
 b=M0mmlo2rk61uOCRnKj6xwwp/16sUVRl+S7idXQRe1ya+Usbph/k6XBp9Sv+Bz1dRkeeJlqBdtDKdOjKPaqtL3UDCOGY1ke77QX3APENrMajFH9VAnuvGc6sGfKE7n3/dpV0VGj9zQIzTjzJERSVB2Z4KXjRDV/rG4az23UalMhPfcp6J5NXvznLakp7mHnh0aLkbvq/n3b3CWi1AKJf2HhKufq6QxWkEQotM4YWQMj9lGTxu/CWXJGe+edke45TSjBmVFPGlIkErPOvE1E+rVc8H+vXjhCjH39zebdOquL0Lcfe43CGVQY4Q97ZTEmndZ+nErvyMShKh7kblQ+pLiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0770.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:19a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 08:38:22 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 08:38:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH-next 1/1] package/dbus-cxx: bump to version 2.3.0
Thread-Index: AQHYwpUCltx1m5pzUUOKNYLv8tDeDw==
Date: Wed, 7 Sep 2022 08:38:22 +0000
Message-ID: <VI1P190MB0493696F52BC73BAD412C26D9F419@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0770:EE_
x-ms-office365-filtering-correlation-id: eb8362f4-2c65-4462-2a12-08da90ac52c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlLpwkn7TJ69BD1Bsrx7dEV3D/8rx4RWDJ3B6f7Py3CKZRjfkEhY3qzmYqPOEjemaQlA/P2fcwpIiLF+fP/zut2Xi00BTuDZ00Yiof7rZbB8BtLnLVSD8CAVfS07B/KNBJ9JlIhbSctuw9wosBUP1w0EOtZFhQWB2vJiTevtT/Pre9KXZl6HQSn/QTrLdOZuN9jztH0pLLv2TuOcG9yHwthv8h75VkpJkLikk4rOPZsg99io2p/vl937QWECBYC+rymhPO92HKpf9vucXOBxVrCmPkpEFxJ89ayDYVDbVVb2W5xBc4MJSIsQVDFD+5MdwY+uODO3hufdXPAuGF9X92sxlz9L8D2V/Rw2aWqeoDlONv2Xcr0Q+NS+uREUAQxZJAxYLRY0PoCF4m8NFRaC2hee7W1Te7StMeFvo50BAUbWQS8jr9MC39f9KvufIV3QPxWOccGqvbfr1sC/o0wDoiHcX462htGEw6NeoaLqnPPQZKX3JeuTnZdNgxJnYiFk3hSWU/YTcuM3HZjvQnhwvZQVd12cJ9319kWT6AMpI8unf1mCoAWgMiy0K+uexS08vlz4pFZzomfUWkbeiqW+flPNvBLJXFPKLmwxhGETeHdN2QFikcZ6fL0j9N3uFEM7ENGM/jXX36xNaHJgaC39K8pifMUI5ArwYUzkJk7zJ/DvFHqIRlXzuIlbTQ1GG4/3F6h0Ugux08opp+Gg1Raq/fZrFOnAMOSg2TeMDYLpDWxcE7MwM9G4kCdI2L6+2duOmkHyunwL4BG+FB4CotZsug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(8936002)(41300700001)(33656002)(26005)(9686003)(2906002)(52536014)(86362001)(6506007)(7696005)(55016003)(38100700002)(5660300002)(122000001)(38070700005)(186003)(83380400001)(64756008)(6916009)(8676002)(66556008)(478600001)(76116006)(66476007)(66946007)(66446008)(71200400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3rUz1opVWBISVTOoAIoI83MZnkopWzcmgUsqQ/q0ck5UZoeZyme2mwsiFS?=
 =?iso-8859-1?Q?kWxTl2Wu6YYMCxiYj7Bwnsfq9bGKimDPfBDu6kPbtm/rJHnSunSyXo200D?=
 =?iso-8859-1?Q?t9MBrSxeKLcsn8O05daP0B7rXJ+SAt73mT2Xhv42BIpQmYQRTTsLelCpSG?=
 =?iso-8859-1?Q?8SZcT3RcweMmRcpKjYOlQcTUS28HFaflEUPc0FWAXJrKkSclBykJQfDfcl?=
 =?iso-8859-1?Q?fVzFj4nzfh0+5a1N3MNPbntY6kcOhAXux/ret9ZQuQg+jTepIbMvgGumMN?=
 =?iso-8859-1?Q?iqBV0fZLkQROAy7n6u4O22uZ42EIVdoxV/MwoTfygGE1p0Wm+nU/BQsMMF?=
 =?iso-8859-1?Q?PAsZWDuz5jeZRHVnxK0FyNTZ5XSuZenGKiptjbYbowbP5A5edjnVzX1wx/?=
 =?iso-8859-1?Q?sXICtO0SMnCv2mv1vpo02Vxeg43Em7xmuaSA9EjbMXyjGBNc8KrEyykLd6?=
 =?iso-8859-1?Q?eh2PUz0cpHF+bph7/vplhs9dCpD3twaqjcy3gPI12Bh70Gr2UhC8PAeMpf?=
 =?iso-8859-1?Q?dYOpPvFIKd9TQNbQyE7pK+aXxECDB8QHf7W+3OWPXqhkzA6RMFo7r5vX2i?=
 =?iso-8859-1?Q?zfkJRTXr1WC/jFCQ4U0tLdlF1mKUZW/JgGAdrx39gIZNHQXPZqU8tkP7xK?=
 =?iso-8859-1?Q?EUvX39zPg+nzqEMdKzxZy9IZ5lCNwxuHFPSiXiISFTX3Bhx3mcxmQcDvF4?=
 =?iso-8859-1?Q?F2P4i6YXJWqrOaiSXiAa0e3A5AcGMV2KlEWiABNPy8Pe544gFSBVd8Fee+?=
 =?iso-8859-1?Q?YausC/4bF3dx7ryQV2Ki8+pNIQhsk3edx+jQBWlpM9DHvGu640OQU1qCxF?=
 =?iso-8859-1?Q?Ek7EgI9+Pwq+mGlZhJeoeJUn6Yum/sa17C2/0KC0yfiBbElxszKnzHKN1E?=
 =?iso-8859-1?Q?d4ApT19gdXn0agr0gu4XqrajTAcOZC+GZg0DXYa6Hcw5MVYb/NbrZagJzh?=
 =?iso-8859-1?Q?BW29PwXHV/6glPws5rQarWciHrT+bNqy8mLvfX7oxspW8occZD7yypISN4?=
 =?iso-8859-1?Q?NPId3TTj6JoFXt2iYr7IiiNqJmilgPrbWyL6DyXqxBRWqCG6ckI3TAf+NZ?=
 =?iso-8859-1?Q?BJImhcqbSe/Oob5DAx3rcDGOY8ZuYOK7bTxMox3SmolQAPNGMrbNq4pcO5?=
 =?iso-8859-1?Q?2kQjSRJak2vEvgK+jHupOoXgcQeZDpzjUhNa2E+LuXZtVge37yDwywxMpn?=
 =?iso-8859-1?Q?x/sPhCmmlbLxs0xqnK7cnC+av3JlIuVANpExaGU1vUOUl/F45ozM9DG5UF?=
 =?iso-8859-1?Q?h3MRHuBJnwVpPhNskwhoK8t8UqOAQskqhqOQpqsBmfBLwmJYOmFVq0sLb/?=
 =?iso-8859-1?Q?8Q3hYml6KC8P+nHai5CX4NUIKiivFXmGsZF08fPU+VHq2plzQxPVuYRGOl?=
 =?iso-8859-1?Q?NJcbF54WSyB6a55SaieiJfpTYAM/XCo6dA9UeBvulNDQt/A141ltEZSUx9?=
 =?iso-8859-1?Q?NvgiYqo/LkMR44zMLRVCQXl9Va+95+kXiWAUVCtzllKw36fajd8HqiFNV5?=
 =?iso-8859-1?Q?p1GIkgLhRNP4fLzMW88HMS5z+z7ix49qQQInm7jXDP3tGckOo962Eioy37?=
 =?iso-8859-1?Q?2O2n41oFI3IrfhT2ZuPJA+MswN+EaP/CWA5ctF1svBvvU0NBJY4Ch2Lzu4?=
 =?iso-8859-1?Q?0eyMLr3cmP1Gw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8362f4-2c65-4462-2a12-08da90ac52c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 08:38:22.3658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsNB4IxWSp1X9891UGggsZRMEy6fnZrVfouac+8JF4RK+hzCMC4mWBhdmJHefG3SIUO97ySAnFePY5Tr+HGesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0770
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf+5ntQscHeBd84o32oIzNyrGYc63rcgwedCx4R5ac0=;
 b=PdBI24jSg2+pfJRgsvmRLKpaY2Qk6uSUTBAqPS6OEB3IDpsQRu05BD0bfy5X/ib7H0/HUVaBZXcY6mm8wXRBORqSJdjpWQUOMQF2U4Z0GoyswEGo5GRyWRYah1BJPm1gqjJ+ltZkx5GJMmrMhXb798aJlY0daS3emWQH+qbgqDc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=PdBI24jS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH-next 1/1] package/dbus-cxx: bump to version 2.3.0
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 5b3a6188fc..acb059b91d 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  55b2541b9c3f3fa705e51e12e6971f66826ebc7185071e0cd1bb6ec9e5adf47f  dbus-cxx-2.2.0.tar.gz
+sha256  45663b6dbc289f133dfdcd8b8de771de3a2d54588954c2eec3f97888b03bd8ad  dbus-cxx-2.3.0.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index c0bcff1c67..43556195c7 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.2.0
+DBUS_CXX_VERSION = 2.3.0
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
