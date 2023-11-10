Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DACCC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 14:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D823740122;
	Fri, 10 Nov 2023 14:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D823740122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FFl7ANXeaOEN; Fri, 10 Nov 2023 14:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0546340A45;
	Fri, 10 Nov 2023 14:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0546340A45
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78A351BF2B5
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 14:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523DF605B3
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 14:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523DF605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2vTpWUFWqIP for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 14:12:49 +0000 (UTC)
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D3E1605AF
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 14:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3E1605AF
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 10 Nov
 2023 15:12:47 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.034; Fri, 10 Nov 2023 15:12:47 +0100
From: John Ernberg <john.ernberg@actia.se>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [BUG?] per-package not fully working with dependencies and
 rebuild
Thread-Index: AQHaE9/6XPXo8hpqwkWomzuFk1+HLg==
Date: Fri, 10 Nov 2023 14:12:47 +0000
Message-ID: <20231110141242.3796161-1-john.ernberg@actia.se>
References: <20191105164646.23820-2-thomas.petazzoni@bootlin.com>
In-Reply-To: <20191105164646.23820-2-thomas.petazzoni@bootlin.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72A5C617264
MIME-Version: 1.0
Subject: [Buildroot] [BUG?] per-package not fully working with dependencies
 and rebuild
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
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 =?iso-8859-1?Q?M=E5rten_Svanfeldt?= <marten.svanfeldt@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, list,

We are using buildroot 2023.2 with per-package setup and we've run into
a scenario where rebuilds of a package do not propagate properly into
the $(TARGET_DIR) area of the final image.

We have custom closed source packages A and B, where B depends on A.

If we make changes in A that do not require a rebuild of B, we just
want to rebuild A and then build our image.

However, since the $(TARGET_DIR) of A is rsync:ed into Bs per-package
$(TARGET_DIR), the final image assembly ends up using whatever state of
A that was last true when B was last rebuilt, because of naming.

The $(TARGET_DIR) of A is rsync:ed into the final $(TARGET_DIR), and
then the $(TARGET_DIR) of B is rsync:ed into the final $(TARGET_DIR),
overwriting whatever A put there.

Looking at pkg-utils.mk prepare-per-package-directory, the call with
target is what is causing the issue.

Thinking of this from a packaging aspect, the per-package $(TARGET_DIR)
should only contain whatever the package itself is producing, as this
matches the behavior of every package-based Linux distro and it is our
impression of per-package that this is what it is meant to do.

Removing this call however breaks multiple packages with errors of
missing directories, which would need fixing. The most reliable fix is
probably to have a step in target install that touches the basic
directories before it runs any hooks and main CMDS.

Does all this sound like a sensible assessment?

Thanks! // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
