Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630ADE9B36A
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 12:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C4846078E;
	Mon,  2 Mar 2026 12:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTV4IrrEJfhS; Mon,  2 Mar 2026 12:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CA961255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772454088;
	bh=4me6LOjZjaPzw5yb4Gd9a/P3K3Dud9VzS5Ssho1KaFU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVX5E5qiiu+ELTbSplT4FZLKES378DcmgV0j2Ou7R4r4c/aFnF6uryn8rV9CCdIm2
	 6m4mQf0mRBiUI9VsD2cG8L2k5FgDvLU0Tv2GNrg0qXF9gsi1teb+dkpXwA3bTrx2Vp
	 AhDJqVFF9T7d2vHsryZDcOwOQh7d4i4Y7l1d/lKuObeH2bhO6DV3T+mzHiSf8YEIQL
	 mZLD5qDjkhiDGPWihjiog4+tpN8o/7LLoosHJmru0u/37dYkZPVzfHsGsC9aOpeL6g
	 H+41wMWzPgPdSfqq0UfvSfinDuLlk1qi9r6j8iDxJ4/GlgL/f1ri1S3atWm5y/T6Xz
	 iRqPWvrx1AZBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52CA961255;
	Mon,  2 Mar 2026 12:21:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6D6231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D9541942
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNVKKL7W1CgO for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 12:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F7004189D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F7004189D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F7004189D
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 12:21:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1631698620; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Mar 2026 12:21:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vx2H2-0000000DwUx-476i;
 Mon, 02 Mar 2026 13:21:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,  Fiona Klute
 <fiona.klute@gmx.de>,  Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20260301134538.3030668-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 1 Mar 2026 14:45:36 +0100")
References: <20260301134538.3030668-1-peter@korsgaard.com>
Date: Mon, 02 Mar 2026 13:21:20 +0100
Message-ID: <871pi2mngf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=l5ExRT0TzWFNzJW0fLYN4geOG8ELizmZ0dcbss80UYsPu6yqmNGbJEpvUXcJ7Gsun30MNNblK0z2x6PC1bEi6Mi3erVZGtTY6njcwpVyQOpR7geko2r6qzMwYlKz7fOxaHvtr/t7xPJeq9waF2/RbwIVjz+tJng04IbD5ohywi81EPMnsz0GOPDtqRiEfANiVF9+I38w4FMPUCSQ1QDt4Tf5tZAUF1rRW9b9v43bAuWhUroMTT5Rj22lvNohn+QUr9QW7bCGo99oI8LQqPy9LQTtY8STOldpUm60Q+0Q0trsZz//OnwdbnA+YO5Bo5teNUAitb5SmXUcgSNG/IUPWQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=h5qUu/zV2AmhPbuAe2ycxU9Znd/uiYwtDbr/I5WIPrw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=l5ExRT0T
Subject: Re: [Buildroot] [PATCH] support/testing/run-tests: unbreak on
 Debian testing/unstable
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

 > Commit 3d2141bcee("support/testing/run-tests: specify multiprocessing
 > method") added a call to multiprocessing.set_start_method('fork') as a
 > workaround for python 3.14, which changed the default start method to
 > forkserver - Which is incompatible with the nose2 setup.

 > multiprocessing.set_start_method() is only supposed to be called a maximum
 > of 1 time per process and throws a RuntimeError if called more than that
 > (even with the same arguments):

 >>>> import multiprocessing
 >>>> multiprocessing.set_start_method('fork')
 >>>> multiprocessing.set_start_method('fork')
 > Traceback (most recent call last):
 >   File "<python-input-2>", line 1, in <module>
 >     multiprocessing.set_start_method('fork')
 >     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
 >   File "/usr/lib/python3.13/multiprocessing/context.py", line 247, in set_start_method
 >     raise RuntimeError('context has already been set')

 > Debian included a similar patch in python3-nose2 0.51.1-2 (currently in
 > testing/unstable) which adds its own call to set_start_method():

 > https://salsa.debian.org/python-team/packages/nose2/-/blob/debian/0.15.1-2/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch?ref_type=tags

 > Which comes from:
 > https://github.com/nose-devs/nose2/pull/644

 > As discussed in the upstream PR, this is not a correct fix is wrong and
 > breaks various use cases.  An issue has been opened to get this fixed in the
 > Debian packaging at:

 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350

 > But until that is done, rework the patch to:

 > - Only override set_start_method() if needed to limit impact
 > - Monkey patch set_start_method() so additional calls are ignored

 > To unbreak run-test on affected Debian systems and add some documentation to
 > make it clear why this is done.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed after changing the logic to use the optional allow_none /
force arguments as pointed out by Julien, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
