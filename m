Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21EAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15ECA40A96;
	Mon, 28 Mar 2022 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X4WZDpe6sbIw; Mon, 28 Mar 2022 21:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D998740242;
	Mon, 28 Mar 2022 21:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 346791BF366
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 21:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56EBB81A39
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 21:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="Ny0QJecI";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="zQUtwu7e"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T30cfwox_bwB for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 21:04:38 +0000 (UTC)
X-Greylist: delayed 00:35:12 by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60A7C813A0
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 21:04:38 +0000 (UTC)
Received: from pps.filterd (m0072139.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 22SKBch8015961; Mon, 28 Mar 2022 20:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=S8HSTBF9L0nSS47a4bOJJb1ndlmFo1jx8tR4xyl7Ix4=;
 b=Ny0QJecIhSIBP+OxqmwTzoaGb/qBYyWDy6l+GXABO2d3zoKeKrQNCBWFMluQ4fhbbHYJ
 KatmWBeUqwQGiVSIDQWfGOxZsO2xX4cMNee1qvKdwAnfUELNSrcZ0tKB8/6yCt/pEOWe
 6awsM34VtJPjmYCN8KEmiZE7iesFZfsqmvj9p9d/Z7ygVg6zc417SwpJ9lIFwk4g1mb/
 bPpx6vDAAqjhhLJpMswKr/c3KwYpZmfVT1gB6s+QdRNBpaa4Ab8WXTfZ8+Nw91LYSsPV
 Cm6cBP/Kpz7lnHwh9JP+euT3q/IzN2nBxKnW+Syjeaqy2+iqH+dB1AuI6iFQ5QkLwdYX Uw== 
Received: from xnwpv37.utc.com ([167.17.239.17])
 by mx0a-00105401.pphosted.com with ESMTP id 3f1r6qgub4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 20:29:23 +0000
Received: from qusnwadw.utcapp.com (QUSNWADW.utcapp.com [10.161.48.87])
 by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 22SKTLFj195946
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 20:29:21 GMT
Received: from UUSTOE24.utcmail.com (uustoe24.utcmail.com [10.221.63.38])
 by qusnwadw.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 22SKTLrj001938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 20:29:21 GMT
Received: from uustoe20.utcmail.com (10.221.63.20) by UUSTOE24.utcmail.com
 (10.221.63.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.27; Mon, 28 Mar
 2022 16:29:21 -0400
Received: from uustoe1z.utcmail.com (10.221.63.19) by uustoe20.utcmail.com
 (10.221.63.20) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Mon, 28 Mar
 2022 15:29:21 -0500
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.176)
 by uustoe1z.utcmail.com (10.221.63.19) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.28 via Frontend Transport; Mon, 28 Mar 2022 15:29:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=UpTJfaElXsFyXT1HG+ywX4PJFR9Z7uh1AOHIiErDCPG0fsJVo06keYy8CN50n3FtaRrW5uzjr4JNdd2s2rCafMjA4ZsshSYrT4JIKL0+YMkbqND/qvl4OVwba+tCUOAsKRdFeSLcggAAP3F11OYO1LnIFJZNoRg5FpvG2Hsg/vncHhq62wRv2tXHqErLI2XOUq7XAT6zgoOu0HJbTymmZi77sYkY+SC0RsZitUEHd4BpKnE6u71e/fW+6rO9+jIwTyadqM0tJDp+Z8sU70Mk0U3E5oAgPQ0kr8TYHZ6jUy55dPOFk+x/OhXB2oXE5WHrl7TeGxEUxhhG7hsu7Y7KdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8HSTBF9L0nSS47a4bOJJb1ndlmFo1jx8tR4xyl7Ix4=;
 b=JK4ZLV2Botg6W745Nmjy7VGy0oXTKrMCeE05UiG7FXU54mCJJsH8P//aqy68cXVZUuCKjMJ8rVmZsQi3lB8MhDvG7wRm8QXaiO0tJQW1UDce1r1k9oGBnNrhth0X2dgE2DYUWnRYGV+cAF51mUVFAfzfPVjZlmuaCJhS7C28uKRFq6mNZavY/+yjHyTC5FMgZkqmXPUGW/xq4FLpamcgNQsKdoubs4ktlGOxzpVV+f8r+48bis5xprQCHB5rIUfpZCBo5AZKB3FTZEvbDoB1JHuQCgKR2rZIBY/QP6NZjeRkHukzKbDxkfIU0lPDXzinh/UD1OlR/al4fYWjQFCTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8HSTBF9L0nSS47a4bOJJb1ndlmFo1jx8tR4xyl7Ix4=;
 b=zQUtwu7eIbXhfmuri6MoYAcZ8EfZvVKF+RQxL9w3DXwoHjDjFBTlJpnVWPOOzdWeWzWT0hJWCySviA6fIBXXMZ9gFIkfWuMYbTeuIxnuKLpx7ag743dz6Oub39lf9VK/4nH+A8r1paCaOZDnEbImDKWiKjj4LyETP3fo63Thuh0=
Received: from BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17e::12)
 by BN2P110MB1302.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.25; Mon, 28 Mar
 2022 20:29:18 +0000
Received: from BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
 ([fe80::b567:79fb:91df:804c]) by BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
 ([fe80::b567:79fb:91df:804c%3]) with mapi id 15.20.5081.026; Mon, 28 Mar 2022
 20:29:18 +0000
To: James Hilliard <james.hilliard1@gmail.com>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
Thread-Index: AQHYFodm+T10REZ7XE6rkIdXoh6Zuax9AKQAgAOrcgCAD0ZsgIA+UBsAgAI5FXE=
Date: Mon, 28 Mar 2022 20:29:18 +0000
Message-ID: <BN2P110MB16408DC4537E54EF7ECC7906F21A9@BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM>
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
 <20220131104553.715b97ce@windsurf>
 <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
 <CADvTj4q9ea12wJk3FfpRdwKVhvLDGrBa9HW89rA2tfPQhX+NRg@mail.gmail.com>
 <6b5d3b43-fe50-0dd2-2903-e404ee7792b9@mind.be>
 <CADvTj4pocqCAVyLLj=XXSRhCHaoa6Uh9Q7of45Ksm3bN7Tj+qw@mail.gmail.com>
In-Reply-To: <CADvTj4pocqCAVyLLj=XXSRhCHaoa6Uh9Q7of45Ksm3bN7Tj+qw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 2afcef5e-2482-9033-7c89-a9fd3ac190c2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42431be9-50e0-4db3-c440-08da10f9a2b2
x-ms-traffictypediagnostic: BN2P110MB1302:EE_
x-microsoft-antispam-prvs: <BN2P110MB130222067E46568CDCD4B1D9F21D9@BN2P110MB1302.NAMP110.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k3xbmmz5Xl9Zwjf2j7PbwkZ/kiFfvMem491AhpDndNy389wBlHd3ZoD7f1i4vPnDef9zY+PQroITTa9LD6IUpzYuYQaSVAZhR/Gr/ok/Lg1LQdGYhiiv3ZYa/IQK8PVda2+ds5m2LeLlK/7PfQhsC8zV/s6vMY8en0gTmFeqsAyl20Ev2XIVKOUiZ3f3KEMw4GcdapU7RB4QthRcY2WcHzZCBgrZ4z0bCrjTqsZi8NudbvbBsfSa6t6nuKuoe/WLf5lIynGE3kWkNIuxuDailbYJje5ICGZiB0e+BpF00hEU765KqeEnuxrQrEz/II06AnICsh2hfkgas9W7NzO7vuqa7QCsZ3+7FGWlt9a9877NN51iiM2HQb6P+1yfNDljmAN1jmgR2pNNUD18AsgKdWE/jp/6KgTTRU08YhQz8UPxb2MfphVBreIfWRlNgzq7pxz56CzWnIl+hNaY658MkkJqFipxMzOV9c7CRW6tXVBanMZgaDnjzgBo+xK5KvQ0G2awmb6d2ZJ4KeD6obWV0uL20kGn5E3kqd3dLQpsnhS0EvtLpuOnl99uj1n1AQQ4BhCKS90zOKFuh7W7hspHA8cU0T5zwFy2bvuyjdCOfcutIb/cnu29MGAs4lWeGCP5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38070700005)(8936002)(122000001)(86362001)(83380400001)(71200400001)(5660300002)(52536014)(64756008)(38100700002)(66556008)(66946007)(76116006)(4326008)(66476007)(26005)(4744005)(66446008)(8676002)(82960400001)(6506007)(9686003)(498600001)(53546011)(186003)(7696005)(55016003)(110136005)(33656002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: cCvmlPJy/x1AtlcWPRyJhPlB0DiS7YT0mt+cJ97c8tCEt6IuB0TALH2Hdf+dpqqgJ4DxfxlvrCe6K/a3PuP22o/nHfqd0CLxmoVEVp+dw9Gx1+5R0ruKicDE+/1TQraLaT+Ki+pdVTNRbnYDJf5RfuwFHP15MUQb7LMgjrLYp9W65gCvdD4VsjietH16Kpr2J+CBwxVWZBVVS0XHJGgbChaGlBoqQca+okP/iLOmYA1zc2D0fEF/KQ6a/ZGqs0hJjvMC68VsUXYbSi+ESbGQXhOw7SWaeso+BqWR1CZjEYBLXK6CZgzagInDLuw/r6E2zLAzwKZyllaBZAtoZmoofv7fYfa9wFzbm7cKldeueUDg4p0SAX3wQjmb9/sGDjLpTO2wAytK5iMUEsAl6iTIchdg8ILlxSpU75ozifAna5w=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN2P110MB1640.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42431be9-50e0-4db3-c440-08da10f9a2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 20:29:18.8091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1302
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: K0MBMrseeOfkEnZQ3m3NMXo9sXwJxft0
X-Proofpoint-GUID: K0MBMrseeOfkEnZQ3m3NMXo9sXwJxft0
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203280111
Subject: Re: [Buildroot] [External] Re:  [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
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
From: "Weber, Matthew L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James,

> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Wednesday, March 23, 2022 11:30 PM
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: Romain Naour <romain.naour@smile.fr>; Joseph Kogut <joseph.kogut@gmail.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>; buildroot <buildroot@buildroot.org>; Romain Naour <romain.naour@gmail.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>; Valentin Korenblit <valentinkorenblit@gmail.com>
> Subject: [External] Re: [Buildroot] [PATCH 1/1] package:{clang, lld, llvm}: bump to version 11.1.0 
> 

[snip]

> I think I managed to fix the blockers with libclc in Matt's series
> which I've sent as a v12:

Thank you for picking up these patches!

I can confirm that the "runtest" passes for the CLANG compiler-rt (ARM64 QEMU) and I've successfully built/used an x86 defconfig(GCC8.x / Linux 4.14) I use for fuzzing.

Tested-by: Matthew Weber <matthew.weber@collins.com>

Regards,
Matt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
