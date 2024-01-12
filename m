Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E1C47258
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D820684604;
	Fri, 12 Jan 2024 17:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D820684604
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5e9WfFUuTbA; Fri, 12 Jan 2024 17:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E02845C5;
	Fri, 12 Jan 2024 17:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E02845C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCC231BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2416845C5
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2416845C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXg3m7Ms2IqT for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:35:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A26E82333
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A26E82333
Received: by mail.gandi.net (Postfix) with ESMTPSA id C037920008;
 Fri, 12 Jan 2024 17:35:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOLRN-00C97J-0k;
 Fri, 12 Jan 2024 18:35:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240104171737.12200-1-fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2024 18:35:33 +0100
In-Reply-To: <20240104171737.12200-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 4 Jan 2024 18:17:36 +0100")
Message-ID: <87wmsexxne.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/python-pysensors: fix build without host lm-sensors
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since the addition of the
 > package in commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16:

 >   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
 >     import sensors
 >   File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
 >     raise ImportError("can't find the sensors library.")

 > Fixes:
 >  - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3 (after review of Thomas Petazzoni):
 >  - Drop dependency and add a patch  instead

 > Changes v1 -> v2 (after review of Brandon Maier):
 >  - Replace lm-sensors dependency by host-lm-sensors and set SENSORS_LIB

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
