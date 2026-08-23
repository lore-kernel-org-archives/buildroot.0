Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD1C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 19:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76CAA6061B;
	Sun, 23 Aug 2026 19:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePKOdeg8jgwj; Sun, 23 Aug 2026 19:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787513424;
	bh=amI3ZUTIl1MVprkM/4dV2tl9op12OSVWbC3OPNodowU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzjMwzv5JT43ycIGs9s0lcv1Z031lPVnkfewGnze7o4yVh/BLtXjaNDmLLkamfm43
	 BikzVsG2EyoCRXqFb8HiwGeIS2caHNksYMkCJvhTBwLHn+TVGKLNg7Qgt6+LMBTLUO
	 QHxKCJJkE1rXjdQiQtr1Ym4Ug8CKFcgO9QWsYzGJPY6onVSuwJb5xll4h6ynreYFaX
	 2Bw1T1KrtuJyrugxppMiAN3l91K4ZQZbdu/XWMVpX3y16tfYUudA3VCk3/AdgBv5qt
	 c8rCK8lwzsbSutyl0o2fT/bDBprTLubz09S1BzhQdgTpposFPNlFB76VucAuk4IkLf
	 KVQBOmyZIxQKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 908E460622;
	Sun, 23 Aug 2026 19:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD5542B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97DE60622
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50OiNvHlDldS for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 19:30:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=JTi8GitG
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6F96061B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 19:30:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JTi8GitG7YTszZr/ALUOdcKKu3JI0fUqrhTZZ+bOXXu1XsM7CNc/9urfWMsjEoVslXMPFl2XOzvhRoPfN+iW3PWaBdwo4DTxBAobokglGFFzIgLBtiTSVG5OJVWwITpe/btlfqbzLt1fvRzzmtQ/17abPwMrM+rh8KBkpw7T5KegOdnh4VKkyrJPaNjBNuKSMhmF8PCoaIjjFQdPZ59RFhmdPGDWYnJOjx+SB3LT3DQN6aV/d9hlvgOiqm2hA3VbpY/wuyf7eYrsdr3E6g5QT2mR8SanA+SGZk8S/zdCnA5rkS18pCQ6aXFItij2EwQCinoqFE8arFEZqe3ex0oQRA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wSkjWp44ymYofrPezre4rr/Edm5mvoUDI4jzmipSqvU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1650129;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 23 Aug 2026 19:30:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyDtc-0000000AMDv-0dy7;
 Sun, 23 Aug 2026 21:30:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260809180926.2942045-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sun, 9 Aug 2026 20:09:26 +0200")
References: <20260809180926.2942045-1-ju.o@free.fr>
Date: Sun, 23 Aug 2026 21:30:20 +0200
Message-ID: <87a4qcd48j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: security bump to
 version 2.5.7
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log since v2.4.7, see:
 > https://github.com/FluidSynth/fluidsynth/releases

 > According to:
 > https://github.com/FluidSynth/fluidsynth/blob/master/doc/wiki/ChangeLog.md

 > FluidSynth 2.5.6 fixes:
 > CVE-2026-58264 - a heap-based buffer overrun in command handler (GHSA-mqmq-w63q-cj94)
 > CVE-2026-61714 - a heap-based buffer overflow in MIDI player (GHSA-976m-35rw-h3m6)
 > CVE-2026-61721 - a heap-based buffer overrun for DLS samples (GHSA-59ph-rx8r-8p4j)
 > CVE-2026-61723 - a DLS ptbl chunk integer overflow (GHSA-r4mc-v3p8-pv47)
 > CVE-2026-61722 - a DLS articulation chunk integer overflow (GHSA-hp72-35pr-6h6r)
 > CVE-2026-61720 - a SF2 DMOD chunk integer underflow (GHSA-rmc4-c8hw-455w)

 > FluidSynth 2.5.2 fixes:
 > CVE-2025-68617 - a heap-based use-after-free involving DLS files (GHSA-ffw2-xvvp-39ch)

 > SDL2 audio support was removed upstream in commit:
 > https://github.com/FluidSynth/fluidsynth/commit/89145b004a44a53e734b6bf82a73cef255baef5d

 > It was replaced by the newer SDL3. This commit reflects that change
 > (update option name and comments, add legacy option entry).

 > Also, dynamic library dependency was added in Buildroot commit:
 > https://gitlab.com/buildroot.org/buildroot/-/commit/111a1c7091aed6f9da03c2a095bcc2f50a1ad32c
 > This commot removes the duplicate dependency for SDL3.

 > FluidSynth also added a native DLS soundfont support in:
 > https://github.com/FluidSynth/fluidsynth/commit/c959f8d208bbad9e396dfb745285806b5a4c5a07
 > It is enabled by default and uses C++17. This commit adds a new
 > option with a dependency on gcc >= 7.

 > The license option hash is also updated, after the FSF address
 > update in:
 > https://github.com/FluidSynth/fluidsynth/commit/db42fa333baf1cb7c60556ab75ad1e592c850f68

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/2745501844

 > Note to the LTS maintainers:

 > The CVEs fixed here are a bit hard to backport.
 > This new FluidSynth version also depends of a new SDL3 library.

 > I let you decide what to do (update the package in LTS, do nothing,
 > try to backport, or remove the package). What would be your opinion
 > in such a case?

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
