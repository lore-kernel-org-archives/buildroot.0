Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE0CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 11:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 291B760C3E
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 11:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 291B760C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA79C6078E;
	Tue, 17 Aug 2021 11:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faLlWF3Dy__J; Tue, 17 Aug 2021 11:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08B660795;
	Tue, 17 Aug 2021 11:10:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0E2D1BF23C
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 11:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF2A4400FC
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 11:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYljs9Kh8FM6 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 11:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 931C8401CE
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 11:10:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lo4so37730019ejb.7
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 04:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7QewCxrAPcHV0WHHyTGw6yve7lZ3/7JZQGrapt0cMis=;
 b=quGYi6RuDNBNw8JoDHfLf89PT/0AlfoyPTxsZW+IY0bLamlS6K6P2J6VIYYGYCi7op
 jsW2//CHbnG5zHdChUJgSWsZ+PAlamA7aXFW3X7Ro9RE7qbqTvzsZxoJQeS1gjCypKCR
 WGf1ivQei+lRuR6Po81SV7WBzIx+IQXC58H2V+uOdQi67+NEGx+Qz2uWhHbcBcse2jDg
 HraO4IR56Gmv8nhYT2eWQrnd7qZZ+Z9F+sNlYeb1KixmAKaUyZx+Udj9i/gCjUHV2wgL
 Fcp2o+xSTom8TT6mvLfIbcy0HlUJLgpUM3R7Farl7ISRq0LsvtueQmwxEvggqadH7iU0
 HnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7QewCxrAPcHV0WHHyTGw6yve7lZ3/7JZQGrapt0cMis=;
 b=G2B5Pa3AMhzDlbixCvHozak/G4pIukVQ/am5cKzULQ9IVADOuPkHsAh7+p4wgafVcN
 TOvVQbf1hsVhplSoGT6iwkNZouaD4d7yweKQc2/JDo3P+iHlanXfBOzUuzoZPuH4R59x
 PpVzu9zxSf4fluZQN0hcmvs7W0PdqPixtippMkV/qKnmFoFzDZHSLDVVyn+ZA+E1tI+J
 8NwTO9LFpr1Q/mR8dnRd3hkbXXYiY6BgBQK4DvfVmcKUBOqoPZA9DE82hYcPTe6a1v1G
 LScm/OXjjdipEq5fZ+Brk2y0TQXmEs+YlrOjdxGRtf8XDOPXtMZqVC2LKQwS6z4N/3Ww
 XECw==
X-Gm-Message-State: AOAM533CJ5gQ3BTiAl5wrEAHkFyazdeFW2PR2ptAhbqQR0jEeJXkIxeW
 P6gwvRaNXcrf1KIG1UQdVo4=
X-Google-Smtp-Source: ABdhPJyc5soAV4zHFUxlNpXis+K4zerZdmoW6gKKaDule/4HGbnEnoC/hFy3Cjk2MLkRjB6GZ/NIag==
X-Received: by 2002:a17:906:8310:: with SMTP id
 j16mr3325080ejx.135.1629198605961; 
 Tue, 17 Aug 2021 04:10:05 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 z6sm857049edc.52.2021.08.17.04.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 04:10:04 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mFwyp-0000jg-H4; Tue, 17 Aug 2021 13:10:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <871r6s4avr.fsf@dell.be.48ers.dk>
 <20210817125624.54e64a83@windsurf>
Date: Tue, 17 Aug 2021 13:10:03 +0200
In-Reply-To: <20210817125624.54e64a83@windsurf> (Thomas Petazzoni's message of
 "Tue, 17 Aug 2021 12:56:24 +0200")
Message-ID: <87wnok2upg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-08-15
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 17 Aug 2021 12:35:20 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >              name              |       CVE        |                             link                            
 >> > -------------------------------+------------------+--------------------------------------------------------------
 >> >                      mosquitto | CVE-2021-34432   | https://security-tracker.debian.org/tracker/CVE-2021-34432    
 >> 
 >> Hmm, looks like we have a bug in the version comparison logic. We have
 >> 2.0.11 and the CPE data states <= 2.0.7:

 > No, the CPE data states: "Up to (including) 2.07". Notice how 2.07 is
 > different than 2.0.7 ?

 > 2.07 is indeed "newer" than 2.0.11, so our comparison logic works fine.
 > You can look at
 > https://nvd.nist.gov/vuln/detail/CVE-2021-34432/cpes?expandCpeRanges=true
 > which shows the full list of CPE IDs that are considered vulnerable,
 > and 2.0.11 is among the one considered vulnerable, based on the
 > (probably incorrect) 2.07 information.

Ahh, indeed!


 > If you have some evidence that shows that the fix only affects versions
 > up to 2.0.7, then we can contact the NVD maintainers and get the issue
 > fixed.

Yes, it was (silently) fixed in 2.0.8 as mentioned in the linked
bugtracker issue:

https://github.com/eclipse/mosquitto/commit/9b08faf0bdaf5a4f2e6e3dd1ea7e8c57f70418d6

What was the process for reporting issues in the CPE data again?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
