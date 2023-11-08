Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C863CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 16:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C6E7400C6;
	Wed,  8 Nov 2023 16:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C6E7400C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnmWa9mroqo7; Wed,  8 Nov 2023 16:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DDDC400BA;
	Wed,  8 Nov 2023 16:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DDDC400BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 128991BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EADA2400A4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 16:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EADA2400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZWe1ZKbGxKt for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 16:26:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F9C540042
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 16:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F9C540042
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AE2E4000A;
 Wed,  8 Nov 2023 16:26:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0lNq-000QVp-2m;
 Wed, 08 Nov 2023 17:26:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231103173645.2069295-1-fontaine.fabrice@gmail.com>
Date: Wed, 08 Nov 2023 17:26:26 +0100
In-Reply-To: <20231103173645.2069295-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 3 Nov 2023 18:36:45 +0100")
Message-ID: <871qd0rz2l.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/azure-iot-sdk: fix static build
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable provisioning client when building statically to avoid the
 > following build failure raised since bump to version LTS_01_2022_Ref01
 > in commit 06bb3640c13191f7515f2140c2207f5b7a2cb7ab and
 > https://github.com/Azure/azure-iot-sdk-c/commit/1de399fd4875d16eb78e8193778238b9762ed44f
 > which enabled provisioning client by default:

 > /home/buildroot/autobuild/instance-3/output-1/build/azure-iot-sdk-c-LTS_01_2023_Ref02/provisioning_client/deps/utpm/src/tpm_comm_linux.c:13:10: fatal error: dlfcn.h: No such file or directory
 >    13 | #include <dlfcn.h>
 >       |          ^~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/894188649f66d9917e1ed94989ebe307102ab28c
 >  - http://autobuild.buildroot.org/results/735b96c842796f309c33a0545eeb2e8f8d1f75ca

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
