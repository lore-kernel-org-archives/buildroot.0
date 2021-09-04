Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66578C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F13460ED6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F13460ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EA64047F;
	Sat,  4 Sep 2021 20:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gRD2z407xIw; Sat,  4 Sep 2021 20:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060FC4049B;
	Sat,  4 Sep 2021 20:49:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1A41BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6243C40304
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4pEoJ4jbEPB for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:48:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E38402F6
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:48:48 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n27so5157808eja.5
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=5D9gNSY49EFuA8JjKRr/ULUovSLAg/gaxLf8RJsoV1g=;
 b=hGR0Pp6RN5AIyMPTCh6OkuTDyJs1ThYmTtUPApmuDwZspdk7Yi5kfszw2rTu8tgl6S
 y8ea/Ll7G9Ft163YUsladz4xpQlK/tJ4rxPzLyujccMnaRGEMtdvExvUnouIMWEZh5xI
 hOJzqyC4j8xdwNs5kW8Or+yKkkcXyWt4nq6Tjz8FTqr6KlZWKS8zcLhCKnOD55exAJGg
 PyVvFMn8LZ4rqNqM90DRTSrrzxHBy6AHwC+MiZC7hPcnpghlhk+yCFq15+BBpzRaSIKG
 ZmjxIMsjzSYR5JV1AeDg2XD+jPiXuXWzO4GvcEWoiWMoQY/icYL/+JxYTMOhzVVQ/Kth
 5+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=5D9gNSY49EFuA8JjKRr/ULUovSLAg/gaxLf8RJsoV1g=;
 b=jPgS+5TI2X0Pehu6AnGG1xcCkquacHEv0wClVSMKW5GPSqKDc9jVUjxA/QYijuqQ6g
 zrn+yaZIjBxDdOf4TsaWpKGXRhrdtpJtM5pSHOGUzjiVHZgNpsA4yqeEjR1ARXjYx1dQ
 6/agLbaPRv9Lwkv03o5cYsTdHpOOQoaHmMIFo3+9tii3YsBOyDn+Wrd9klwX39HPvN9z
 tj9nG4TtlU0pKJKqUBDaR/KFWeotLUvvDxGBaFf8+ultIBGVtDCGKAJ1QHhFJM/gjB66
 5FyIOEMuoAh61584A6PPRKkLtNC9jfC6Lyp/wvAN1gL6wBoBT8TNpcm7oSUiV8hGHZqt
 uJ9g==
X-Gm-Message-State: AOAM531GtkyxS6FKdT0mojnFoiQkaZZ0mQAUq4DGip2SJh5IQIP8dU+N
 s/tnySR33bFS8V425sa8j7I=
X-Google-Smtp-Source: ABdhPJzbCxhuPkGzyioOmWUSz5J4T0h8uh7Yuk4fOEP3VsDms4Y2bwfg05M4vQvJPeJqrK7oqaA1kw==
X-Received: by 2002:a17:906:2346:: with SMTP id
 m6mr5724319eja.512.1630788526475; 
 Sat, 04 Sep 2021 13:48:46 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 r6sm1487214ejb.119.2021.09.04.13.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:48:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMcaj-0004Ct-42; Sat, 04 Sep 2021 22:48:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210815160318.2E9BA8CA81@busybox.osuosl.org>
Date: Sat, 04 Sep 2021 22:48:45 +0200
In-Reply-To: <20210815160318.2E9BA8CA81@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 15 Aug 2021 18:03:22 +0200")
Message-ID: <87v93gm5hu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] DEVELOPERS: drop Sven Fischer
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=829ecf7d794b454a9fa9557b2420d624e3d3bb14
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Sven has privately asked to no longer receive notifications related to
 > this package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
