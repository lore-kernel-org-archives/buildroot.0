Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65974C6FD1C
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 12:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43CA840F2;
	Thu, 23 Mar 2023 12:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43CA840F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBXYt6JbVKdn; Thu, 23 Mar 2023 12:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FDD84098;
	Thu, 23 Mar 2023 12:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12FDD84098
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0E961BF31C
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 12:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BFCC4151B
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 12:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFCC4151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nE7IM19FSTsW for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 12:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20C8410AB
Received: from mx0b-002c1b01.pphosted.com (mx0b-002c1b01.pphosted.com
 [148.163.155.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C20C8410AB
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 12:37:02 +0000 (UTC)
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NBAKYR011745; Thu, 23 Mar 2023 05:37:00 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pdaucmg5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 05:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkLypkbcbGRB7/E3dBwQM+XtVzwVOYssmI+M9Vs0JEcycyRvRYz6iWqNXCg5WNs2RsaMdY0cPTMhkyFH1PFYNtWQUfesRlQEYy4AOxPsojhC7wVLC3biAJHx7yOTsySbUH71q25PNFidAYreWuIHZHcxFflxm7826UMXD7YYFuw7kL2rGb3t4oR0IPbKWzuBWBdGp3BmdqpeumjT6978P5H46p1Lf9o7y61/pFbm16od2DxjjAqw6GPXZYaIrNxqL7NqWGvkPWHR9HVHx8+VJGobUzisnOk0Acwur8i12pL5twFUHd8aU7Lv/X5YBUjFfC0VAfLmjY2QARUw8DPOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMrCCWIzJ1GkwY/VDfWyTwtKvZVV7lUD3aVPthT3Tpw=;
 b=cUXVoD0FLtHo6cXt1nySZYEimwz6sWGVENzqLhIo1Uiog6Lw+DAP8hfLeCsKAVTlxg22Rj78rrf5/uuBqWjVLzS1v2L/edAMBvksAfPEbUvBTXR6X7R3MLaMQYUQ1H7XInRPh3VL0xB+yYOZzdFuEfJRJWORtxO3rf9NTuUq3nmdzdX3WYUdyGWUuO2P93hVc5s1EGIomAg4B5zRbtVGPiqOJJ8H4RAyzcI+RMDzvRnbPeYxCOhf5MH2Ep5UxBs9HJ++VWjrXC/flOLFo2pb15tYOe0eCimRE7mJAsK2YV58J9a3QOCMY6VSPwUL1FQZEedDTvi4n7ObmwE89nYDvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from DM8PR02MB8121.namprd02.prod.outlook.com (2603:10b6:8:1a::12) by
 CO1PR02MB8505.namprd02.prod.outlook.com (2603:10b6:303:158::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 12:36:54 +0000
Received: from DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3]) by DM8PR02MB8121.namprd02.prod.outlook.com
 ([fe80::e706:a96a:43cc:a0e3%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 12:36:54 +0000
From: Simon Rowe <simon.rowe@nutanix.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
Thread-Index: AQHZV/uNTZxCJmjV6k+ozJeAjpxo8K8CTv0AgALrHqWAAA9cgIADDWcI
Date: Thu, 23 Mar 2023 12:36:54 +0000
Message-ID: <DM8PR02MB81213985E6D21FD5B0B318ED93879@DM8PR02MB8121.namprd02.prod.outlook.com>
References: <20230316113615.138847-1-simon.rowe@nutanix.com>
 <20230319172554.0d5ea60c@windsurf>
 <DM8PR02MB81219477CD31D864F078BC8493819@DM8PR02MB8121.namprd02.prod.outlook.com>
 <20230321145455.7dce4271@windsurf>
In-Reply-To: <20230321145455.7dce4271@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8121:EE_|CO1PR02MB8505:EE_
x-ms-office365-filtering-correlation-id: e6d92fea-209b-4c58-700c-08db2b9b48c1
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wGgsgGYkmpDtAc3cgGRWY5MpTjmkQ1lsjLjSvKQnIoPZvgOs66R2CJe+Y0GzbvyuG45UDe9yTCODVZyJLsSUi0sTaHpfTU5DrdDPDvZw/mj66PWLAfxKm74TKaQaEm3d/OlMWc7CH523uWej/cixN4uc7BBEMXJ8ghDDENoNTTkaDhLcCPz5+uXuyX06UDAPqHe+e2i5/JORPi9lf/FzsF8f1xo9UDBHz2BvW2rXruqNbAs16KYdeS0L6jwK0vKNYH9VgAsts10iiUuGaZ4TfBDvfr/ZdLBTrFKM8BAJyJztvCCAWq9pyLdm3t896eyCIzbiayebW5jR6D5zOYGY997cdk1tF5Bir5DcE/FibOv9AeMQTgldYMoPSlZ9+Tc5zoAs/yuWZSWlRi8UqvP8/BPa2u/70wNciUfvJpVPCUvDkryErTOED/t8Ra1oBflr0p7clkqBpwA+eu+Q46cBuqK2lmVvzDQxukVyoal3Uzttp+b7fEoZHGK52agyRl3zZKFZsIVeR6zdsECxFSIDuNG9DFPGc5MiKd377xXdkH/3jM9SMvI3Si7nAh1u9bhebNPn1kpxtOrqEo0D8/awt9AFvC1CWvrF9BabwohSVxF79eKeYxu32RZKu2YLm02UKQLGrTKMDa400abXZHkyNYhrcJAennxsTaIwp84b2EgfcCRq/QMEtyYglpabc+xZBwv3v3JSZUTN6PtuY3aMQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8121.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(4326008)(76116006)(66946007)(66476007)(66446008)(64756008)(8676002)(66556008)(6916009)(316002)(91956017)(44832011)(5660300002)(122000001)(41300700001)(8936002)(52536014)(6506007)(26005)(9686003)(186003)(83380400001)(478600001)(7696005)(71200400001)(86362001)(33656002)(55016003)(38100700002)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Yt+/bmV2csEdw84WGJ68Ss83IeaS/+otLzEF6JORGsIMAd5VVSqnN77j?=
 =?Windows-1252?Q?NvBxkvC2IMHwq6fV7n8TBYgjfT2k13pcxFRiydAAero711fDgKlxQQW0?=
 =?Windows-1252?Q?EmRXvVnW/DJyjyE5y6A+qhjZ0dJBQOjz4PQXDquH5OZ5d4s9VYUMfMcT?=
 =?Windows-1252?Q?U2RFPmNClOqTMAN1tM0lf1DhEBM7vde4CN5Wfe7tOQX+yA1j3/YXgtf4?=
 =?Windows-1252?Q?33Y0jnze3sYh03a3qgJDYqDAonySJRmHUnI5FDjbWM0WLd/vihElr41W?=
 =?Windows-1252?Q?hgMQLgX0NrjeUfI8lz0axujG+sPE5qPPc+vGb3JLcTzvatak3f+CYaAj?=
 =?Windows-1252?Q?v7ffEzrp/KOMJqYmtfpqhTtFug09frfg+I1wvcHBWvqZyfaxJgHWXKU7?=
 =?Windows-1252?Q?vUX4T4Nk/5IvH1JUg6X/YY8OBloiOOeDeuTkM4QqcZrGmIYMHFJKppS0?=
 =?Windows-1252?Q?ArToAdociWCkqyGhAlB9+a+zvIXGDJG6uQA/LbdvtQWG3ligrmfUxDQo?=
 =?Windows-1252?Q?qs/o5F2vsVtqeB16gieffmNfgANYDGBbqpgh32zuKTLzfQHnRHEjYxkj?=
 =?Windows-1252?Q?xKgzJaBOBUhRGtS9kmefF5B79E9jUiN6Lup2k/s5TcBewQc3sTnV7Ke9?=
 =?Windows-1252?Q?bvVmSce/gALyeunGu2yi30rSdt0dawqiX0RizHMPkV6R9pV5v2YfUfmH?=
 =?Windows-1252?Q?XffW6B1CBuoxsvnGPOLJz+k2aB5iIX0w5FS3Mfi8iuL9x+Vjab/2HYim?=
 =?Windows-1252?Q?eAt+YB/UL2iR+OtzUejxEgMtnto3qK2jJCg6e9dNv7WwYQPbEmXmtDeW?=
 =?Windows-1252?Q?wqx98U9Z4iHxt0OHasBi1+glteNnZ7wNFTPZvHDoySmKkI3jhlqDz8ae?=
 =?Windows-1252?Q?BGNAFXrkoLBwSAN8mo0Y8WI38rdAWpS4hYRAoYmPLWcGRZQg7QsRigKk?=
 =?Windows-1252?Q?A9Ir/m9SZEEKwsOLTskITsBlDT5oOiSq4LkZj23qXFOJ6//8vidhwMZi?=
 =?Windows-1252?Q?2PLdCrzHIcVxHtoohaJXFc+zSpqjiLIMLbxbdn1ScY/Kh65qy+VsoD70?=
 =?Windows-1252?Q?+xuSxjx1NHrJTwuFoVWoO3IHG45gUlcEZaYYMdwp5+Hhtwvk8B2fMoqN?=
 =?Windows-1252?Q?jTsK6/afNdxgJbG0ZrWdLp8yt00LYt5f9zq0GIWDaRHXKof5C+Hs6BJ/?=
 =?Windows-1252?Q?X+MBMdPh/E2q8TbrJTtiO051MFadg7Mah66GeaAeppw9yLeuVERsjrRJ?=
 =?Windows-1252?Q?bxLjUjE4Zs1u5cXMhCle1wsOTdGBu8f74+zh9JvzgdMdzRDPGQ29r89H?=
 =?Windows-1252?Q?2bHJ6hVBx3wc2jGz+x2NV7pglMnb6pnJvPWp9CTh6IOwfmaWlEmFU98V?=
 =?Windows-1252?Q?5HIuaGiKUe6WjmfBIiL5DTlD3v0SQRV1J6nUNG1V9+caIPuVeepQGDLj?=
 =?Windows-1252?Q?3zzydrTO2VfTw3Lzs9vZ2F4fkVgtjqGRVUqj/rej+7iz2KePQ97Np098?=
 =?Windows-1252?Q?C488kVZBrdteLWp1O5k5ArdxmWnvt+q1l66YFMZykrh+JUf1BAKOHXsk?=
 =?Windows-1252?Q?K7mgP17qnaMxvZBviwgtm3KsJsbop1DBIpfkdeR3ui8usUO7yZftoC3+?=
 =?Windows-1252?Q?DPE0jLvVxXKosHnc9GEzW/4jj9Vn0ipP+oULPwi5DfJVEX5aTlQQ90uI?=
 =?Windows-1252?Q?ytYStdsbk5YOhq6y3RsPXGuz4dj8h26Qgim+9zF5JEASzfzHjtDr3g?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8121.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d92fea-209b-4c58-700c-08db2b9b48c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 12:36:54.3462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K6ifRApFvy4ZsiqG0Ug7HcQNsPdwVVTVYQmwIVtS5B5gJ72ZnY+dE96P65PIxVMAHoeHXlp1VgCD8kvHZ82Kvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8505
X-Proofpoint-ORIG-GUID: cBKinSJ7aSjxZdOeig3c2nCZwjFOIzrT
X-Proofpoint-GUID: cBKinSJ7aSjxZdOeig3c2nCZwjFOIzrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=JMrCCWIzJ1GkwY/VDfWyTwtKvZVV7lUD3aVPthT3Tpw=;
 b=HHQuUei9HQEuIG+JhUMdB4KBODoomeqWwLSjsLx3uyezPWFGs7wkDjcIgVHswX2W7tNT
 nlbV5BGGeN349CaBKaUG8qYmGZi/VeJIfN4OSOlKQDkUsplgGV8HJAR4JHebLkr2++Oa
 ma+0MuyvK6T6cr2DIuiQIHfVrGwiZ3PgrrRjq6HAzu7V58KkfHi5EHp3MxpHhCX9vhNG
 c5woFFB6sMhXw6poL739FCfWVjObE9VykFcF8FsMNBZwnMdSnCbDTT4tbqzP6760UQXJ
 eDssyte0AYJgrKv6a0WjdwyESJqShjJst5A2kzT1Ebr9rRaNYJbUGgYtqAfrf7+UYOk4 yg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nutanix.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMrCCWIzJ1GkwY/VDfWyTwtKvZVV7lUD3aVPthT3Tpw=;
 b=Q3adQtyJkcrKje7rA9Cum3hpQNkPN8eoow7O4+959Fv3UHRMBxCiOrpy2HkzeFcuKaow1AEXZ+l9fL8TDilxkomIxKFcxMNREUIEYrbWwkuR1UTE+T3ORhUZyLEfJp4tCqlAJcqpdUVb6I+DiRzYaYxY9Cjqihhb15KYyo951sD6aSzegVg46LrOtyVOFYo+43hHpMttIZphkOwH0gLxKK4V9x6XTLu+4hopZZ01poFGIzohu0kPxC4Ia+0pOz7BcnTJ5wp4QoQspXUPLJFMTA8d7eCOR90XWac+UGctya8w8ibaSC7kZ/F1c0SNlp3oXgzxPR8TmfkIo5bY+VsVmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=nutanix.com header.i=@nutanix.com
 header.a=rsa-sha256 header.s=proofpoint20171006 header.b=HHQuUei9; 
 dkim=pass (2048-bit key,
 unprotected) header.d=nutanix.com header.i=@nutanix.com header.a=rsa-sha256
 header.s=selector1 header.b=Q3adQtyJ
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: enable package with musl
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5536894944996102579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5536894944996102579==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM8PR02MB81213985E6D21FD5B0B318ED93879DM8PR02MB8121namp_"

--_000_DM8PR02MB81213985E6D21FD5B0B318ED93879DM8PR02MB8121namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On 21 March 2023 Thomas Petazzoni wrote:

> A Signed-off-by is not only an indication of the author, but also an
> indication of the chain of people through which the patch traveled. For
> example in the Linux kernel, patches have a SoB from the author, then a
> SoB from the maintainer taking the patch, and possibly another SoB from
> yet another maintainer taking the patch from that previous maintainer.
>
> In Buildroot, we therefore have patches with two SoB: one from the
> original author, and one from the developer bringing the patch into
> Buildroot. Or alternatively patches with only one SoB, from the
> developer bringing the patch into Buildroot (you in this case) when the
> original patch lacks an SoB.

Thank you for explaining this, I=92ll add the SoB to the new series.

> It's been a while ago. Perhaps time to do another attempt at
> upstreaming those patches?

After a little more research I=92ve discovered that some of the fixes are c=
overed by changesets present in the upstream master. I=92ll replace my patc=
hes with those and try to upstream the remainder.

I=92ve confirmed that multipath-tools builds with musl so I=92ll include a =
patch for this. I=92ve not tested if the resulting binary works though.

Regards
Simon

--_000_DM8PR02MB81213985E6D21FD5B0B318ED93879DM8PR02MB8121namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">On
</span><span style=3D"font-size:12.0pt;color:black">21 March 2023 Thomas Pe=
tazzoni wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; A Signed-off-b=
y is not only an indication of the author, but also an<br>
&gt; indication of the chain of people through which the patch traveled. Fo=
r<br>
&gt; example in the Linux kernel, patches have a SoB from the author, then =
a<br>
&gt; SoB from the maintainer taking the patch, and possibly another SoB fro=
m<br>
&gt; yet another maintainer taking the patch from that previous maintainer.=
<br>
&gt;<br>
&gt; In Buildroot, we therefore have patches with two SoB: one from the<br>
&gt; original author, and one from the developer bringing the patch into<br=
>
&gt; Buildroot. Or alternatively patches with only one SoB, from the<br>
&gt; developer bringing the patch into Buildroot (you in this case) when th=
e<br>
&gt; original patch lacks an SoB.<br>
<br>
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Thank you for explaining this, I=92ll add the SoB to the new series=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; It's been a wh=
ile ago. Perhaps time to do another attempt at<br>
&gt; upstreaming those patches?<br>
<br>
</span><span style=3D"font-size:11.0pt;mso-fareast-language:EN-US"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">After a little more research I=92ve discovered that some of the fix=
es are covered by changesets present in the upstream master. I=92ll replace=
 my patches with those and try to upstream
 the remainder.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I=92ve confirmed that multipath-tools builds with musl so I=92ll in=
clude a patch for this. I=92ve not tested if the resulting binary works tho=
ugh.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Simon<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p></o:p></span><=
/p>
</div>
</div>
</body>
</html>

--_000_DM8PR02MB81213985E6D21FD5B0B318ED93879DM8PR02MB8121namp_--

--===============5536894944996102579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5536894944996102579==--
