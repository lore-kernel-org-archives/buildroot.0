Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7541CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A23611C7
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41A23611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033FC606F2;
	Fri, 10 Sep 2021 17:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDfL6yiFFcF4; Fri, 10 Sep 2021 17:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54232606B9;
	Fri, 10 Sep 2021 17:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3201BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87F7A402F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8A9KK1FCAMtC for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70555402A0
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t6so2181406edi.9
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ux6Ssyfd6Uk1gqEyZp5irDn6xvifEATcBve3mijlw0I=;
 b=ck7yaCdP2YktxdumVL6YEsBY3ho/Ol5LrBhoPHwr8SjzPIAAZkZHnAO7zFSrtaAPQf
 1T55O9N+K7/eMdIcQzLobtXTN/5U6tXubj2Gv23fgqCradnJyDPJkVSq9TQA1aFOdqrN
 EbnRTPwg6Kuz1LIQrLvpMoCneh/C3NbQD8Nw6xKyBqvrbu+hZa5sltwhzMwTKMWgsTEY
 k/BH7Fe6gImOVNob3bQqhVhyBpfot3zCrstS/EgZOEdFwdoaJMRny02vtlXagKCI5CL7
 ruYW+Y2cij9gKTEN26KSiNNJTFohsngaD6d9x5M4Av6mwSQOa5egPQe4geud+NQdCEBR
 3JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ux6Ssyfd6Uk1gqEyZp5irDn6xvifEATcBve3mijlw0I=;
 b=1EnesyBR+gAZeFKsG4kp+IiF6Q6Jpb841wGteayEHFhzfadmRqZzUp6opmn690ZS/W
 tgxGuEY5zyiicWgmn1C7jULiUH6epWYzBRuCTaBSDflWvL+1aPpKV8YklDuEAv5R47SD
 v0M2dycji82fDNFrn9SjlQinWaqXy2viHkvY/e9xkvmTbPMrJQgvzQY6X+fuiK4Ng+8V
 KkBBasjnJtkoMNMF7bDfSN8f0EJ0TJfwjVunXFL22+0pqw8cCmTt/hNpL1bxf8KW+hmH
 xNrMeOmh+HNLPNYlM/Ut7+kBL5ikay+KXwBWm3fqmls+JPfB16AlgV6VksfwYAEJVqKD
 7kZA==
X-Gm-Message-State: AOAM532EHyPDMYdujoJ3xBBzNnRCq9/I7ooeQIo4NR4VMZLnir3jnPjE
 vaLkhje86562eg1ttoQvyEhxxJtzRLE=
X-Google-Smtp-Source: ABdhPJzEaqv4Ox9AA+/Y22OdMOzdHtdvjsdUeIsiclZkWJzJeH+4qb6QEaxT9XYwAHzYSXIDQKffiQ==
X-Received: by 2002:aa7:c04e:: with SMTP id k14mr10330963edo.101.1631296419730; 
 Fri, 10 Sep 2021 10:53:39 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 x15sm2825092ejc.59.2021.09.10.10.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:53:39 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOkiX-0001Fi-Oh; Fri, 10 Sep 2021 19:53:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210910065532.31730-1-bernd.kuhls@t-online.de>
Date: Fri, 10 Sep 2021 19:53:37 +0200
In-Reply-To: <20210910065532.31730-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 10 Sep 2021 08:55:28 +0200")
Message-ID: <875yv88ggu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/x11r7/xapp_xrdb: bump version
 to 1.2.1
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2021-August/003107.html

 > Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
