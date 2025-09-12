Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CACCCA101F
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 18:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738A761222;
	Fri, 12 Sep 2025 18:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAL8icNB0lks; Fri, 12 Sep 2025 18:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE87960DB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE87960DB2;
	Fri, 12 Sep 2025 18:46:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DD7392E
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 18:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57ADC60DB2
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 18:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbEDd5ZVEDNI for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 18:46:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 534DD60BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534DD60BA1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 534DD60BA1
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 18:46:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1A53FC8EC5C
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 18:46:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A98E860638;
 Fri, 12 Sep 2025 18:46:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AEBC102F2A87; 
 Fri, 12 Sep 2025 20:45:46 +0200 (CEST)
Date: Fri, 12 Sep 2025 20:45:45 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Message-ID: <20250912204545.082c51b4@windsurf>
In-Reply-To: <87qzwb4rku.fsf@dell.be.48ers.dk>
References: <20250911171334.593571-1-bernd@kuhls.net>
 <20250911171334.593571-2-bernd@kuhls.net>
 <87qzwb4rku.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757702752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bIw/XjnNaG/r+lywGyMKcx2sS3fORxVIQgLrl8rPxHg=;
 b=FF3pr/P4K9548tRzelgpy7BNw6221RAEcJjAlhgDjGTbRiKDXQ2tkVmQSP7KjUWdmPazuj
 7JnVmMxd0Xul9GrSdew611aIHzYDv2qYq5oRApvnqVThgIt+4JeNdl9Te3b03dygd8ntLn
 PNZReBXuAS07hmbTvTxIbL0i9VEOinq3LFhZFVNMOkC+qDDdfgDIJe+34V7hxK6x809Wwm
 g3Aw3CLGu10ggmO23huYmaAjtYtiHXlavQ0pIUt6AYZzLuHJjoGe2863T6Z++lW6JBu/Xw
 7VTOsZI9iUQIG6S/xiJ7i91+26ZI8FE+XcFmknT0lVx2Wm0lrGNfl6fNlp2Tnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FF3pr/P4
Subject: Re: [Buildroot] [PATCH 2/3] package/cmake: bump version to 4.0.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Sep 2025 17:29:37 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Given that libcurl 8.16.0 is a security fix we would like to backport it
> to stable/lts. Could we do some simpler fix and only later move to cmake
> 4?

Also worth mentioning that CMake is broken in 2025.02.x:

  https://autobuild.buildroot.net/results/bda/bdac2534f79e0def3185138f00efb189d68c7cad/build-end.log

/workdir/instance-0/output-1/build/cmake-3.31.5/Source/cmCurl.cxx: In function 'std::string cmCurlSetNETRCOption(CURL*, const std::string&, const std::string&)':
/workdir/instance-0/output-1/build/cmake-3.31.5/Source/cmCurl.cxx:178:26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
  178 |       curl_netrc_level = CURL_NETRC_OPTIONAL;
      |                          ^~~~~~~~~~~~~~~~~~~
      |                          |
      |                          long int

I suspect upstream CMake commit
1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd might help, but I'm not sure.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
