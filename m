Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ADAD64086
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 07:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4863C40426;
	Wed, 17 Dec 2025 07:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nls3Gnz1557u; Wed, 17 Dec 2025 07:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0DC40599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765956182;
	bh=RxIONvfvP/WvXRPb5FLkXPUYT24SUPAomWGIgeAN2gk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kEDArcpP2Gi/pPRBy3uF2+RkhoTTAZGfQin4SY5BHZoH63hn1LJckxZxCbnZmMa8z
	 ONq9mZfMXInE5FB33rAQEAjKZ+sw+IG9JaTEEuILfSy0m5B6mpESdUlJimf1zDVIAj
	 lpWVB2oNEaCxLHJfcV/OTIJnow3A68MIEZauRqHnFEEHJ/uK8f+zVsxkPfykjN8VhY
	 6ScbhnpLfA5JAq+loryeE1ID1EGrEjC6VqbvmYd8kZha2sSWLSCnxKnSjEMvg2xF+T
	 TsqSKCztUBtxLChz5mcZuQhNNMoq1cNDuNy7xdGmzAdFso1zeb3cEmWzLUgpwmtJRJ
	 80JM7KfvHuFXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0DC40599;
	Wed, 17 Dec 2025 07:23:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A74B2364
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990684027D
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfV1uEiF9ipu for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 07:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98462400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98462400E4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98462400E4
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:22:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1643443125; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 17 Dec 2025 07:22:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vVls8-00000004KNz-3lMS;
 Wed, 17 Dec 2025 08:22:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists--- via buildroot <buildroot@buildroot.org>
In-Reply-To: <20251216151939.3188611-1-yegorslists@googlemail.com>
 (yegorslists's message of "Tue, 16 Dec 2025 16:19:39 +0100")
References: <20251216151939.3188611-1-yegorslists@googlemail.com>
Date: Wed, 17 Dec 2025 08:22:56 +0100
Message-ID: <8734598tdb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=dJLwG5x/gJqkx3ROJQcRDjhIX4zMWp6f/yUcwwtnXBbggr6VslfWSb0IuNS91w2FqCtX/QImMy5sC8RnmlbK4wX5EZ3v3Y4MttEPayr3lEBb7BaZrWOkhq8QL5BsxmTu70x+SKRoaOLCgWFuYXjM+QyLJvefIfA4v2Lo+W0Ld4btm3dDHzZLJ3UDsaI67I8t5a6SC2wYFgtq9g32xBDrbyiZrCwzUJsQ3cjVslSa1cbfzG6DFxtnVSltVJyjenuNT/j+MmWiLFtoiXQvSnh14c53TNuctUCSarFnKLZCZAPAXwL+VsAsxGFicWQCqvx39at11n2MobXPCrKHJcrAHQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=c/iE7IdCkmvge0Ral/YGQWlpxPc2H2Y9OkFKkChWgsw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dJLwG5x/
Subject: Re: [Buildroot] [PATCH v2] package/cmocka: disable documentation
 building
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "yegorslists---" == yegorslists--- via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > cmocka tries to find the Doxygen binary by default and if successful,
 > it tries to download style sheets and breaks with the following message:

 > CMake Error at
 > doxygen-awesome-css-subbuild/doxygen-awesome-css-populate-prefix/src/doxygen-awesome-css-populate-stamp/download-doxygen-awesome-css-populate.cmake:163
 > (message):
 >   Each download failed!

 >     error: downloading
 > 'https://github.com/jothepro/doxygen-awesome-css/archive/refs/tags/v2.4.1.tar.gz'
 > failed
 >           status_code: 1
 >           status_string: "Unsupported protocol"
 >           log:
 >           --- LOG BEGIN ---
 >           Protocol "https" not supported

 > closing connection #-1

 > Disable the Doxygen package search entirely.

 > Fixes:
 > https://autobuild.buildroot.org/results/e6a04cee8bc3028bd8a1a535c2852e60f362c4ba/

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 >   - disable package search entirely instead of a patch adding a BUILD_DOC option

 >  package/cmocka/cmocka.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
 > index 0ee18e2931..b2d489b7f7 100644
 > --- a/package/cmocka/cmocka.mk
 > +++ b/package/cmocka/cmocka.mk
 > @@ -10,7 +10,7 @@ CMOCKA_SITE = https://cmocka.org/files/2.0
 >  CMOCKA_LICENSE = Apache-2.0
 >  CMOCKA_LICENSE_FILES = LICENSE
 >  CMOCKA_INSTALL_STAGING = YES
 > -CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
 > +CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=TRUE

Maybe that is something we should do for all cmake packages? Oh well,
lets see if similar issues show up in the future before doing so.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
