Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9E5C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:21:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF0860EE4
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF0860EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C45961574;
	Fri, 27 Aug 2021 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhn8Z-MjCOZ4; Fri, 27 Aug 2021 16:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF2861578;
	Fri, 27 Aug 2021 16:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 448A01BF40D
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3467042770
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collins.com header.b="LZs17EIg";
 dkim=pass (1024-bit key) header.d=rtxusers.onmicrosoft.us
 header.b="tQNNzg5c"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x36UQOQUuMbN for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 16:21:31 +0000 (UTC)
X-Greylist: delayed 00:31:06 by SQLgrey-1.8.0
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23DD442775
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 16:21:30 +0000 (UTC)
Received: from pps.filterd (m0072139.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RFV3su003805; Fri, 27 Aug 2021 15:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=VbYCEg+ljPVp7TGoRlHhxCm1+eUosxDSO/PKuFCNgHs=;
 b=LZs17EIg0P0K6kz1tNHt6aWPBNyKVXrNeqlhDetWJNyuHhNee93Ql/0/ynJlPgomfNbW
 nuUVUyqyq8o2Lv4aoa/6VzjRzEhryleGiXUDag7b1mk5Y/119/or2Q3KhEMF7OXdyA7T
 R3kV0BKCjn3avxFNvhYD/BGuww/oYT9i3u/wTcs0PaF+4vonkjp9C+D5Tbc7mMOPpZ8y
 HUmi6JyyILEyBCYamkoz+1g7uFFMadiv4HJGmznKTazl1rTXsWtPNAIbeF25jcl5YjiI
 0gNKi7hOLn8mBWJN0lncGn1s0OdyZeTA7J9oUAhX1Ya7lIdxMjjP5shWWAbOWczpt8Zh cw== 
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0a-00105401.pphosted.com with ESMTP id 3an4q6drbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 15:50:23 +0000
Received: from qusmna60.utcapp.com (new-mailhubs.utc.com [10.161.160.136])
 by xnwpv35.utc.com (8.16.0.27/8.16.0.27) with ESMTPS id 17RFoMMd000835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 27 Aug 2021 15:50:22 GMT
Received: from UUSALE0N.utcmail.com (UUSALE0N.utcmail.com [10.220.35.33])
 by qusmna60.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 17RFoLaS032587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 15:50:21 GMT
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE0N.utcmail.com
 (10.220.35.33) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 27 Aug
 2021 11:50:21 -0400
Received: from uusale28.utcmail.com (10.220.63.22) by UUSALE28.utcmail.com
 (10.220.63.22) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 11:50:20 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.181)
 by uusale28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 27 Aug 2021 11:50:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=tmoJXRENrOxK+5bentrCQTfXjxEU1IN2y8rJAfvBhuyYv6J0o8soNl/eNvp9E56Ergen29IuUlVApHfXGcvXZGlkRK0tLKRQNdX+gdkFx94YYnw9YKRpVJisE98CMnmIj4Da+YZk7KnL/HYJWUXYivWg4upGiR6fPShNdmI1mT1Qz1YiOjGmPAe3RXyMyesOMF92zT5ToaGQCQ2pqHT+MCctCHUzJ0TJQAAocBsOJI1yBceuCSkiBYKVqBGNfLnXSpOmFXi2hjmUOsl6veGBc7vGgRsFEhdJ7qpjhhZY4cxFMMXpNdDRu199Oegw79icoPN0Wz65DQhw9v/Dc5TT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbYCEg+ljPVp7TGoRlHhxCm1+eUosxDSO/PKuFCNgHs=;
 b=BpxI6rv5MAJlPuhNtQe9c6+ndzCgTUBZ1NOp4dpPJ5ImS+0PCRZk24qZiOiqB0yyYUkGaadCHfXSdBTSh8A0fF2BvTLx0wfq15Dx99BXgNkwCEDv7CDmn+rElKkK2Awdc/MigxF321dVrykDx3rexQNhGmtrg/KPWUzRLBXSXK+9QlaOL6qQ89BQoHpwZkHouegGiZE8EQIKZYvJZF+YWgj2A8VjYqGRnNLpUaRKhjiHjOw2YIAzqFqSMlT8anD5niwM4zSktMHnkEHpf+xNpcxRtmPyphPsWv/XVOvHM+Zw56EKqOKtP+EvwLoD+Fok4Ozi/ooarylhFR12NNuqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbYCEg+ljPVp7TGoRlHhxCm1+eUosxDSO/PKuFCNgHs=;
 b=tQNNzg5c9T5nXK4zhCtHPyqobeh0oyGmQI57MS3q3o8oc8Z5OuF4os15cshbwejRYw+mM2NZ7+gVeenEWKMq2Rqso0S6dnkMTR8fILvQQxoENbMcQi5MqPc1xwfhT7S9SZwpgb4FTxV98eqSDuQaZ5w7aVP2RdihIVoVQNNQWbE=
Received: from DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM (23.103.22.150) by
 DM2P110MB0042.NAMP110.PROD.OUTLOOK.COM (23.103.17.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21; Fri, 27 Aug 2021 15:50:19 +0000
Received: from DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM ([23.103.22.150]) by
 DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM ([23.103.22.150]) with mapi id
 15.20.4436.021; Fri, 27 Aug 2021 15:50:19 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH 1/1] package/busybox: add
 systemd service for telnetd
Thread-Index: AQHXmr3BjWPM6RKtckaI6OWROqwBGKuGVkEAgAEqgKA=
Date: Fri, 27 Aug 2021 15:50:19 +0000
Message-ID: <DM2P110MB01074BC60B97C1F94BA7DF6085C89@DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM>
References: <20210826210241.56201-1-sam.voss@collins.com>
 <942093f8-fbc2-8278-7913-e1644ecde8f0@mind.be>
In-Reply-To: <942093f8-fbc2-8278-7913-e1644ecde8f0@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none header.from=collins.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9489344-fdb1-40ac-d286-08d969725f1c
x-ms-traffictypediagnostic: DM2P110MB0042:
x-microsoft-antispam-prvs: <DM2P110MB004259083E3ADDD23DC3B9DF85C89@DM2P110MB0042.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W89xijd55fMlBo/bqco7GsaotFwzL78xaEaemuRJhgH86IL4suMvPemkPGT6LO66pIO2eR+VHkXr4yFHv/CrZ+bhmkHJc5qV0uSL1y/Zn9x3AmcaZy7cKuXQySkv0o5tigsrs+AxRra70AoagTL56CUBg9VDmc4GCi1F2S9SvabNNu3++K1pSHx+qrXsGso+BlEdRSXVpzTjl7BCcBinCF2yj4/dYOtqv5Q4DfuSO5/11AkcpDYk7RrF1O5lbdVskLEpvdKEXTEh+bhsVaSv5BN2IbNBXp/zsK6bTxxnPsrXJ4wy5n9fCzm7BdeM6TsedhliRZU9Esi5xN9liR0T71WzvVsw8cTAdE6v6uyd8VzKi6bYpvxM+Dq1JFtM4raRNyddzl/Vpj5FONlj9WLu4IO5y79tW6JRDvUIUpqxxsGGNKF70zxyWBj5XQjrLAoBFRjcrkT5WCf1oitvuqp2f5nZUdA5NmLpUBL2xe+n8LRYYk1aFDcQJtIE5uTcs3I98s2pqMLU+dIPOu2FVrItQlJ+18d+66FMJ5klQw8JnRCmjommPFftTmIQXBlausd+h/I+9L03yfR//J2IKbn9xG2haWR3hLgi3UUc717HwgiVKZ61LC9eceFEXvOrnKJX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(39850400004)(136003)(376002)(66946007)(76116006)(2906002)(5660300002)(956004)(26005)(66556008)(86362001)(64756008)(66446008)(66476007)(9686003)(83380400001)(186003)(122000001)(52536014)(71200400001)(55016002)(53546011)(8936002)(8676002)(38070700005)(6506007)(110136005)(38100700002)(508600001)(33656002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: mGGvyZTp7kRJ0ndjjqF69h9R8K7aN6dIq7An7HmiDl9HoMNGtxZXBaIDYUKirUea613RwijHO2tKsp50EyafNBZLuKwLAk8fm/RKkmiHti56XfTeih7wWpxD0kOyj6YuzpU4dDqzLdjyblpK1K9VK4lnA2DpCOIiV8HPfe01NqaVIbKEVCnpCcOdg5c0L4aDUwz/DH2/4/XQQl8eBQqVFNbc1OYbKO3ivN+dCtP/aEHguuaGzx3BV6P3MrvZ/D0B71I3DIQKNuhhg2C8ZU42ZtrQeXdritaqEY9FkvGK5/y8+rkLASGzMHnyepMQMAHQXccfo1Kg9ZCIMC1Ytq4JrK9K08C9BuaQjlfnhDWPgz+SOp60H16vO0ksSXS17P9pKCKhCJ+dKWG34cvdYRNblvzwBvOcLQ8NqP4VPXYG6Ox5yza8N5slEiwBkCCUmAtHQYDwr36Ukxxqf0raIGdnOVJGRcKkQG+smftEkzKcKQ1NgP0nmkWpBcnNey1skzRiMzRAX8f9eMwC/Rs8P7WwRqnA3MNU7Ll8ag8gxw5H6a8y/5jdNmV3X5ouXg6aXgZiTSAljvyGvepsS96jUW3ygvtHkXh9eSSO5o+n46mcVAFbFcA5sxp1nVZ0uYsnm9Z5bnazRatOpYlFgBUjHZEdpjCR+yemI47QoJ7L2mfI9fM7cXC8Oo8HjbHJ7XBhs/tL1pa6+GiTHwtUNua1MVPo1O4T1QMH4Cr6b/FjIr0SUsk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9489344-fdb1-40ac-d286-08d969725f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 15:50:19.1229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2P110MB0042
X-PassedThroughOnPremises: Yes
X-OriginatorOrg: Collins.com
X-Proofpoint-ORIG-GUID: t-0BW_C-LPkF0z8dHvTAyWfKfsZITKvB
X-Proofpoint-GUID: t-0BW_C-LPkF0z8dHvTAyWfKfsZITKvB
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270094
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1] package/busybox: add
 systemd service for telnetd
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: "Voss, Samuel M Collins via buildroot" <buildroot@busybox.net>
Reply-To: "Voss,
 Samuel M                            Collins" <sam.voss@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle <arnout@mind.be>
> Sent: Thursday, August 26, 2021 5:01 PM
> To: Voss, Samuel M Collins <sam.voss@collins.com>;
> buildroot@buildroot.org
> Subject: [External] Re: [Buildroot] [PATCH 1/1] package/busybox: add
> systemd service for telnetd
> 
> 
> 
> On 26/08/2021 23:02, Sam Voss via buildroot wrote:
> > Signed-off-by: Sam Voss <sam.voss@collins.com>
> > ---
> >  package/busybox/busybox.mk      |  7 +++++++
> >  package/busybox/telnetd.service | 11 +++++++++++
> >  2 files changed, 18 insertions(+)
> >  create mode 100644 package/busybox/telnetd.service
> >
> > diff --git a/package/busybox/busybox.mk
> b/package/busybox/busybox.mk
> > index cfc06b0d78..fb427faf1c 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -378,6 +378,13 @@ define BUSYBOX_INSTALL_TARGET_CMDS
> >  	$(BUSYBOX_INSTALL_MDEV_CONF)
> >  endef
> >
> > +define BUSYBOX_INSTALL_INIT_SYSTEMD
> > +	if grep -q CONFIG_FEATURE_TELNETD_STANDALONE=y
> $(@D)/.config; then \
> > +		$(INSTALL) -D -m 0644 package/busybox/telnetd.service \
> > +
> 	$(TARGET_DIR)/usr/lib/systemd/system/telnetd.service ; \
> > +	fi
> > +endef
> > +
> >  # Install the sysvinit scripts, for the moment, but not those that
> > already  # have a corresponding one in openrc.
> >  define BUSYBOX_INSTALL_INIT_OPENRC
> > diff --git a/package/busybox/telnetd.service
> > b/package/busybox/telnetd.service new file mode 100644 index
> > 0000000000..3c1fa457b1
> > --- /dev/null
> > +++ b/package/busybox/telnetd.service
> > @@ -0,0 +1,11 @@
> > +[Unit]
> > +Description=Telnetd Service
> > +After=network.target
> > +
> > +[Service]
> > +# busybox telnet doesn't support pidfile, so run in foreground
> 
>  AFAIU Type=simple is anyway the preferred type for services without
> specific systemd support, so I don't think this comment is very useful...

Fair enough, I didn't know that was the specific guidance, so I'm okay with dropping that comment when applying.

Thanks for letting me know,

Sam

> 
>  Regardless:
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Regards,
>  Arnout
> 
> > +Type=simple
> > +ExecStart=/usr/sbin/telnetd -F
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> >
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
