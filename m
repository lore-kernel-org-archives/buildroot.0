Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA06C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 08:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21F040993;
	Wed, 16 Mar 2022 08:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSOw3m2SujQX; Wed, 16 Mar 2022 08:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6550540138;
	Wed, 16 Mar 2022 08:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347111BF909
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 08:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313E640226
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 08:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="HTjXSxfe";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="NATWRbiS"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NqkXE9sVlxpU for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 08:19:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBFE840202
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 08:19:10 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30A2040A26;
 Wed, 16 Mar 2022 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1647418749; bh=pDgp8b9bXwEA8WcDoKjWKWbjei+LkSDPqHOG1FcjVyk=;
 h=From:To:CC:Subject:Date:From;
 b=HTjXSxfeoKQH6s1iPw41R88Jimu2dNFSog1vupBSbidGM9yhQTsPdn3SOYqJ/H2ST
 fJ8/38UA5C0LIUjE/tythZrL5J15gTtFJ74XqQyoe8ggebi5I3aMxeD3AbmcAFSCDq
 lkDIAdFt2/a7fXQ5SW2rQ1dZfssJmZ4YHyvDwzYEdAcoVoCH6LNcY6D0wsLy8RQBYG
 GQYgzPkNqGUwdY4QdGEPfFYIhKh8UF2ocyCG0aeHiU/GLF1/WpF6RVYtN0iV/XA3KI
 cEJ6iyYyV822hiUIV3yg6vyx+rbB9X4K0Whk6bsUV6qVNbRQ+EvdoQGhnNahNC57aE
 CU3lFwKbrg1qg==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9F667A005F;
 Wed, 16 Mar 2022 08:19:03 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 14B5C40030;
 Wed, 16 Mar 2022 08:18:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NATWRbiS";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW516EivezIwDNCmmO10akwK51hDRu+/B57PdGoIxRdRS0ZLSHvaG4h2XAWfRkXb2BUGcuiscIdAEiNnlg2MBwmhX2QqWI48IhVaUlB0Vw39IOmJzaRZIboY4rAJXRHfeRzUXjFFH44UMCpu/SiEh1xFQaFOY5q9DBw/lFf1RTbgb0qo+sabvr83DNMrJnM82GL6X8Wj+wna7StIixhtHpl33idntFL4sjS7zWhBUFVfKoQ1Q+Ou6S+Uc8jElXyN8fVAR9aA0kk8rSyNoXzd8+GkHAZZ+6gR0jbXf6JvHZc2Rw6VyDORPkcvn51iSkuAV/0GYe9n29CvYDtS19utDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJw2KW70eKwycfXtJ2iPABAkbR30q5OcaLAV1OXl6CY=;
 b=DEApuqLtKkFLN1TPAEx5gw7pXllONL1XFddkm2slmciIJsT//o8d//Klv9sbsjCWARYKTAnZils6sMnreAsthzco0q3j5t0X31c1D+W3EjOKNK/NzZ4ZwfV0Dg43bb8ybYsh8CHfrSQg1n3cLkGFJwDvzbZAZtTf/0jKPvgWaJqWjS1t1XzVTQuBBXdQP3/TR17aW60RaegF80k8G37maenIgzQpP4liOnlQeVxZOnpAOmW9AIykYIi0ASelowAmRLb7SZRsHouvCKmwB/9UObax1NTLICb+lAK+prjn5STT4DHVXA/ZToycgoqaneXwJV5lAI+lk474qefDEGEstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJw2KW70eKwycfXtJ2iPABAkbR30q5OcaLAV1OXl6CY=;
 b=NATWRbiSsR0aCLlX92xN1v8v1l2WAjBhoIvNRQrjAO20GJJhBIp1smgsdb+stl9ubl8XwGqrKFrnWoiLp8wwP0b+i4fPj4A1R+MTYYI0GMUDM1HrbOpBDVWzMJqKla5dUEU02VjGQJfQhlbJhbSlqAqrL95rzu5zQd+bFsRgdqY=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by SA0PR12MB4542.namprd12.prod.outlook.com
 (2603:10b6:806:73::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 08:18:57 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::a452:6b99:f026:be87]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::a452:6b99:f026:be87%7]) with mapi id 15.20.5061.029; Wed, 16 Mar 2022
 08:18:56 +0000
X-SNPS-Relay: synopsys.com
To: Adrian Perez de Castro <aperez@igalia.com>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH] qt5: enable JS and WebKit for ARC
Thread-Index: AQHYOQzb6ZGS49hOTUuKseQYg7UpOg==
Date: Wed, 16 Mar 2022 08:18:55 +0000
Message-ID: <MWHPR1201MB0239E90D161F1AB3567CF72CA1119@MWHPR1201MB0239.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee6c4863-e9ec-4fde-797c-08da07259da9
x-ms-traffictypediagnostic: SA0PR12MB4542:EE_
x-microsoft-antispam-prvs: <SA0PR12MB4542B93926B14C2DC88BE777A1119@SA0PR12MB4542.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4nxCP6bvkaC6baZga4U6e20j0EdQbTQuYQn3iQNGa7wbyCHOWoA8aD3zP0glsxMIMm1FNFYCeScmZUSfAX0yoPcmEUulR9yWaiYcdgIp4Bs1uMxM/KmLJIgmbqvMALWkvxPM7+p3ahspvfysui9HACeM1Mdk37Ff5QnKvgqSW3r/JxfNTGugWryFugRb4h/cOcyMhRVNmdNjcQ5Ua8+iybDXqWEQYApI45qqJ1VIdGdoaWyBxqfDkrtjtJbuUSw2BOOfo/EpwuH2JsR1Bpo6wE5cTMjVvi8HwoGkTPdUoM6+0GWHbSOgAt9WkwU9a6S8sq7oldOjaIK573SmijlcYW2Zc4uOFMXxuc4TKc9WCwfG1CwV0mV6bsokGb09i1F2+MCh/iKStNdNxJlpqYYQYdk1yfY4t8HoTY5tbesvpz86SCCXnX3ORY+Om9HJNj7OqQFKQC5l1UY1slRHmd0C/PfXnHlZzpVrmCc87xc4iHTDqJLVibHxj32yhNyGksikgjS1XsOiqENfQnezeW8/u0DehxE0tJ4hBoOX3hnxOs6wqnOwRiyzoWJ7BYzSLLs5TFllUF+Bvq6TFAKvk7K18vOPylSscMWj8Du56xvq82AQk66RXqXjIKusX8ktk9/ZVruT7bfhXT/tcKCHJQ04TKwXcRvavoyx2IzZ14QP5wiDNPi+GbHRdQA8n+R0T6pWE7VOFY/s7/PABKyhCrhCYpKPknz6m2oN77RYjT7HzC9Relf3kMswfYRtR8Qe6qtBD5yX9B+jReLl/17Z/+euca6oYvK0lo+SU64RbByTJdw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(33656002)(4326008)(8676002)(71200400001)(110136005)(9686003)(53546011)(7696005)(83380400001)(91956017)(6506007)(122000001)(66946007)(52536014)(55016003)(76116006)(66446008)(66476007)(64756008)(5660300002)(86362001)(66556008)(8936002)(316002)(2906002)(966005)(54906003)(26005)(186003)(38070700005)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QjeOWICM3w3zN8Yy229rVwWK8VsWvftssP0LZwLUrLtbYyHx3wXDqEUlkm?=
 =?iso-8859-1?Q?foZrRy7fWlx3Xysn85BXkx85rQXr5ZUGTVjH0BYJ+0Os4M19Bv1xaGOAjr?=
 =?iso-8859-1?Q?PsJCE0ibuOVuxuIHOYz9+n1OzuLRpVJuDKdR447Bf+123gG2RJaq9JvXhN?=
 =?iso-8859-1?Q?tMqCFCHVkX+FTQ/Tk+p4plGGNPav3PCGZu+tZQwx4qho4oF0BUjLQrUi7v?=
 =?iso-8859-1?Q?cWdiQvzB3FSXNLwjAQPxvSdO40yQ2yy50GLbrtAgPxWFql17M35sbXnR7P?=
 =?iso-8859-1?Q?S6AlWQB2lB3/i7cHKG+/Pv/kOzoXIMz4okLhpnyFD0lbLTy15I5igHayb4?=
 =?iso-8859-1?Q?YdX/6STfYspHTsItr1fKSZdp+D55CyZCfKSpkSHyJd4Itm8+BJX9mIQykl?=
 =?iso-8859-1?Q?Fc2FS/NOC/iZ0MWYA+9JOs1yxCtPODoHHi1xNsJqq9uDKu9Czi8IlYgTPd?=
 =?iso-8859-1?Q?03Oga99nlHnhCwwChKluIvbVXAUF0dZed1Kwsm+9uUaP6dhOs3bFrr3ygp?=
 =?iso-8859-1?Q?5Ziy5/E21LdD0im8W16j7Ebo0oaS1Y5FX+SsjyN0/vM+wNCW3c2qtGmUra?=
 =?iso-8859-1?Q?djJ4hN3w2GltjKeOu6hOWwU1w+hW9eSPnMVsQ/xx1AsFU1KGDNE6vQZvQQ?=
 =?iso-8859-1?Q?bpijKYt/PCyC0l5DEKYd1morEagEhFueXYiIqbx8cIKjcM8lYjWZ0oOSP6?=
 =?iso-8859-1?Q?7cbpKzrld/5dFWLPMgQOj1oxj8We5E7smFzT/PyGfE9YwLLwdj9FXK3MYG?=
 =?iso-8859-1?Q?EJnLPpbP/je0zzbZQuhLmEh10aMQGB9SBMUPOXVrCM0DROm8se9WP8yPDr?=
 =?iso-8859-1?Q?lKDV8An2VU6EMY0vhjO/qPHASpwh1XDF6C2mKL5qw+FEyNbpqxLaZ4t0Si?=
 =?iso-8859-1?Q?xMV//dGet+JgYpfiNt+AN97DibWCJvgjEpF3pUyWcO8sWQz18R5rzXhVyw?=
 =?iso-8859-1?Q?wMVGuyWBkH+4c3i8gac6FZUf2ZzH4Gq2YIPyL29FEw5TJV0JLwHv0Hv9c6?=
 =?iso-8859-1?Q?Tuy4KvliC5VEjuqvf0COyNlschTR90mJ0DdrDXLN2As9a76p3WO0LihdWS?=
 =?iso-8859-1?Q?MWfM6bpxlxOx5Su5jX+oy0pZ1rqmprqdSWo+ersjr+jmNnmtb8EeLYLOgO?=
 =?iso-8859-1?Q?n2JFM79xJNcr/ky3JL7gIwX8U6CJNYuWOCy3gk644K53oZYAhgo3rRPUEr?=
 =?iso-8859-1?Q?JCeoiMuJD7sTr9qOZ37X6ZEg4edT2dQ9xmC6WSK/2xTA5eiX5O3Ba680Lv?=
 =?iso-8859-1?Q?/E2fPuADOY5czzExRAukFCR8EHcDPy+bCBHcxE6FCSNL40pECxM2//m3TG?=
 =?iso-8859-1?Q?K6wfTIfKuu1FSaZDOWnSKFcDaeMdr7TrmlNAJvmxN4fWvEA+1h65iECyAW?=
 =?iso-8859-1?Q?hJOObbTXl4SJAIDySXV9UNXsXZnsF2fGQHLjR5AKAZqgtpiGFKrcEms0/u?=
 =?iso-8859-1?Q?hvNUv9/UOfy/OSLpJktjfifzv4JSDLGKYtg+/Mn5xFxUB9XMeCTx5lkY5o?=
 =?iso-8859-1?Q?Tfuw5ZOB/g70/UDpn+/G+P?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6c4863-e9ec-4fde-797c-08da07259da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 08:18:55.8692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agv1fFfSW7D6K8++YK8ngowesYzdNl8CLQg5c1OooGNBHktgud92raIj606JHPH6kDV9/D7WpsYFWS3e0tojxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
Subject: Re: [Buildroot] [PATCH] qt5: enable JS and WebKit for ARC
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Adrian,
 
> On Tue, 15 Mar 2022 22:47:10 +0100 Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> > On 09/03/2022 14:28, Alexey Brodkin via buildroot wrote:
> > > This patch adds support of ARC architecture in Qt's JS core and Webkit.
> > > The change itself is quite straight-forward:
> > >
> > >   1. Enable JS core for ARC
> > >   2. Make sure so-called "large memory model" is used,
> > >      i.e. relocations with long jumps are being generated for global
> > >      symbols, as otherwise insanely huge libqt5webkit.so fails to link
> > >      because some symbols might be more than 32 MiB away from each other.
> > >   3. Make the original WebKit build system aware of yet another CPU
> > >      architecture with explicitly disabled JIT in JS core for ARC.
> > >

[snip]

> > > +From 8da574cf8f30f69e47f76705aa2eb07000540aeb Mon Sep 17 00:00:00 2001
> > > +From: Alexey Brodkin <abrodkin@synopsys.com>
> > > +Date: Mon, 21 Feb 2022 18:28:00 +0300
> > > +Subject: [PATCH] Add support for ARC processors
> > > +
> > > +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> >
> >   Upstream status of this patch?
> 
> I may have missed it, but as far as I know there has not been any activity in
> WebKit's Bugzilla regarding ARC support.

Correct, ARC changes for WebKit were never submitted upstream.

And even though I realize how that would benefit us in a long run,
given my primarily goal is in Qt's WebKit (which is one on downstream projects
for upstream WebKit) I'm not sure how much time it will take for that change to
become a part of Qt we build in Buildroot ;)

Yet, I'll try to do that soonish now ;)

> While I am do now much about ARC, the
> changes do not look particularly low-level, so feel free to add me in CC in
> the relevant Bugzilla issues and I can try to help get them reviewed -- make
> sure to take a look at the contribution guide if you haven't already:
> 
>   https://webkit.org/contributing-code/

Thanks for the offer, will keep that in mind!

And thanks for taking care, Arnout!

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
