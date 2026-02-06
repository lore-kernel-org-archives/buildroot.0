Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDCEE6B44
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5217835B1;
	Fri,  6 Feb 2026 17:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S5-ldlywS0H; Fri,  6 Feb 2026 17:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9A4F83566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770399387;
	bh=Udm8QL8MqOzYnt37qbk4Aex2wwCTjer3GlAstoKdXqU=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6q7nxudMGa3S6+DKCMaR7/xann6QXuG/lZEcz45ovyHLjk+3hELEdIIgQLdsupLj
	 I68bQaPl/DWb5k/C4ZTj0jBjK7IbbZETNu7xZUEmaBjDV2bH2zLZOXUDx5eVoWR6ld
	 pEYsgO43rLqtaQniFz6g7dMJ6Tw/dE8bEUqiFlD3Gcw/Y19QwEwAVZAQCYq19To545
	 LXn1x/coZA9xKEz7PKhnyBvV39sDR/wmGVwlmCBFDNxr9ZYnD9oyZavtAFyND/QF8D
	 jsAJJnMMDG6H5GS78ngGQ5xrN8HPZYOJTZ+v3FCJ3kvv4oIjzTBETgXrvpXSm8JJ0g
	 pDweJbxWgZfCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9A4F83566;
	Fri,  6 Feb 2026 17:36:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8337D2EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2638961125
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuVHGkxufJ38 for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F12B861130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12B861130
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F12B861130
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:36:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1139884342; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Feb 2026 17:36:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1voPkd-0000000FPDw-1qMa;
 Fri, 06 Feb 2026 18:36:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
In-Reply-To: <20260124150540.270915-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 24 Jan 2026 16:05:39 +0100")
References: <20260124150540.270915-1-peter@korsgaard.com>
Date: Fri, 06 Feb 2026 18:36:15 +0100
Message-ID: <87ecmxkc4w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WFROs+ME3JxrJ3V7BMCRQYAOBI7/lsCDjCrtYh8iVgWPbHU2B9enUjOH8QmMIeAqnWJO9Wsx1ZRljhxrtxqZ0J7RRnMZm/nt9jyJbjsvTTo5SrnNP9hSV3feTTcroSsPD4J7GSPqbEAuIksWqwtRaHx7piNwf8TfkZw6YPzRqkrQ/U2C0O9aVAhimu5VQ6GXHqIGKAH25beIacttws+pNrvr0gUyzglrn92eMfeqdu/WcVQ8RoyLlDu5HMXcZWgzH4KeSqAEfiqJVROn6aOaYDPFqWI4pkY2OfZBrp5byxI/iUgw0x2ONslrBmbiD3FnYoFxRbsV9AY8dWn7bvTgMw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=B2GUfJ0Cb/hRy4a+RuA2zWJvwbn4Ys/KXF+VDpzDmTY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WFROs+ME
Subject: Re: [Buildroot] [PATCH] package/swig: add host-swig wrapper script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Swig has a compiled in absolute path to its data files, which can be
 > overridden using the SWIG_LIB environment variable:

 > https://github.com/swig/swig/blob/v4.1.1/Source/Modules/main.cxx#L931-L945

 > This unfortunately means that host-swig misbehaves when used in the SDK, as
 > this points to the ${HOST_DIR}/bin of the build, which may not be available
 > when the SDK is used.

 > The issue was reported upstream but rejected in
 > https://github.com/swig/swig/issues/253, so instead add a wrapper script
 > which calculates a sensible SWIG_LIB relative to the wrapper location unless
 > SWIG_LIB is set, similar to how we do it for E.G. gcc or pkgconf.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/swig/swig-wrapper.in |  8 ++++++++
 >  package/swig/swig.mk         | 15 +++++++++++++++
 >  2 files changed, 23 insertions(+)
 >  create mode 100644 package/swig/swig-wrapper.in

 > diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
 > new file mode 100644
 > index 0000000000..68be44231f
 > --- /dev/null
 > +++ b/package/swig/swig-wrapper.in
 > @@ -0,0 +1,8 @@
 > +#!/bin/sh
 > +# wrapper to make swig relocatable
 > +
 > +if [ -z "${SWIG_LIB}" ]; then
 > +    export SWIG_LIB=${0%/*}/../share/swig/@SWIG_VERSION@

Added quotes around this to make shellcheck happy and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
