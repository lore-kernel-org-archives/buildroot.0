Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E49C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C4684091E;
	Sat, 13 Aug 2022 14:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C4684091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeuvQUpTFqc7; Sat, 13 Aug 2022 14:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D07A40913;
	Sat, 13 Aug 2022 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D07A40913
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDBAC1BF57F
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 14:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF4E740162
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 14:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF4E740162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGKzvEzYRt69 for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 14:49:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F4040913
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F4040913
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 14:49:39 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x19so4835119lfq.7
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 07:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc;
 bh=dpfYXAvX4OSp8urICMUDoHw2qGVVDfnPpXyeMNhFVZE=;
 b=AfABBiXJu36Kai3w9E4x+qJuBexUeS+CUjk9017navFa1/mZPfDfkYfHj7RKHsGxQx
 ooUCp4sEmUAt2wU8FV38ezQnF3WBEn+3nRJGpPhebWk49vRw6mWyIvQKzV0iHeF8tXFC
 KMrQAr7lbHVqDN6tjGZUXnHLK9Bp36Arpxm38ZD+cfQxq0PhMdtY0AWQvYfph1AQ0TCX
 pi62JW1EatEDTQZ2fRuSdmF5NpqadrTSr80/GoRh3Yb6WCF0Q89MAFd5lFpu5w+w3BvV
 jVJyf/yH5wTzlVynR/btboYcYmkOgk4KbigO/RGQG7ALe9HRI7hX/f9Y4nLpw9ya8Gkm
 MIXw==
X-Gm-Message-State: ACgBeo09uJkL4VmmA6iiXNHg1UklfEvf29SQFt2mgREZqXWSGPATxXht
 JgynwdLZeM2d9cmB0EZTdkmgXe9Crb8=
X-Google-Smtp-Source: AA6agR54UNexkhVGIACbjnAb62Fk1ZSQKz4Vm3ZErOC9IbAsU5W4pcIHbznMmeV3HWEnugXpDypkfg==
X-Received: by 2002:a19:a40b:0:b0:491:f648:2245 with SMTP id
 q11-20020a19a40b000000b00491f6482245mr150401lfc.200.1660402177083; 
 Sat, 13 Aug 2022 07:49:37 -0700 (PDT)
Received: from luthien ([94.254.51.204]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac24e72000000b0048b18700dddsm562640lfs.106.2022.08.13.07.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 07:49:36 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220813125641.43312d45@windsurf>
References: <20220812124952.182664-1-troglobit@gmail.com>
 <20220813125641.43312d45@windsurf>
Date: Sat, 13 Aug 2022 16:49:35 +0200
Message-ID: <87zgg8mc5c.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc;
 bh=dpfYXAvX4OSp8urICMUDoHw2qGVVDfnPpXyeMNhFVZE=;
 b=T0F+RHeR9EnE/4HRgeNWLO59uYHwilnmDIz6I6kPonlkV92eeipfqWcadttVpos+Di
 juybmhV972LodJRcofvuz530b6LwfotjBvc/judo/OTpQ7LnXkt6cAR19OBgO5BMIq+B
 oU0M4TifaTGg81wiez6QIQQh81HGSGVanHpf/CmMrelWg7rJXAwEVaU6TZdSy5pkBAcB
 siBrOuCmIVb1uwjPdy1ksMARxVSQ9RaP8HD1p/EREHDCmoQ3SK7fn0SZjnjEQ6sASmPG
 +/B++ivmshRj8fpoVV53ObZFJt/BPNxyAsyjhoMTPwTgeLk7pSkd50dmntMYixerSycy
 wB4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T0F+RHeR
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.4.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 13, 2022 at 12:56, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Fri, 12 Aug 2022 14:49:52 +0200
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> Fixes garbled tag name in std log file output (critical), and addresses a
>> minor issue with confusing project name from `syslogd -v` vs `logger -v`.
> Even though we normally don't take version bumps in master at this
> point, this seems like a minor release with very few changes, all of
> them being bug fixes. So applied to master, thanks!

Thank you Thomas, very appreciated!

Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
