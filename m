Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0D1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE97061153
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 15:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE97061153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE4A80FF4;
	Sat, 11 Sep 2021 15:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBPKmvSegCjl; Sat, 11 Sep 2021 15:46:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2B480F8E;
	Sat, 11 Sep 2021 15:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75F271BF35A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F101607AE
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 15:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qU15olR_9py for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 15:46:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B83260758
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 15:46:55 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id i21so10786700ejd.2
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=IGLNPLUSDH0CyNrtCtm4keE256XCYXh2Qp97SQ8fQnw=;
 b=eRZ6INZMoxonUS8sauYPoncCMaZcQZmdBwE3AQSKhlIj+B3aesOZQ7pcwSuqBrETYi
 CIxtLKHkPbsxuRA17QvVaYPzaNs3IyyYrW6lEorzzVHJzuRZRl8jSPxh/0MVEehGZhDl
 HNJby75S4KVi0aV6aY4NtvkGeLcqt7wth0OBNbrU1dJJWdlrfQNnmtZOPr1rxa4PahrG
 m5ALaRwmwJY9if//wBEycS4aYNnFlIJl7JzvS3Og/XOP1kdA1QfVEoegQVaVUUCSosE8
 BiKEtVhpiPmi5N1CXtB6C1DMhglqY9sdJf8ubRLMaHELtM8T7+zMxQWk/lQJ1SEu3qWw
 pR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=IGLNPLUSDH0CyNrtCtm4keE256XCYXh2Qp97SQ8fQnw=;
 b=EJsyikYhU7z0rHdxaW0zuYGJxkQmNuA/Ujp5oHNNcSsm6FSyTU5sRij5D6AUy2dX9k
 8BvN0QZdHeM1QoI+35LwpP/Mxsgh59enFExilaFNyqD8ElpD1GqOPMrjzJLWhxagDH3K
 Ft3kbbd/QCezzKWbPvsTgMQIJVzFcCr5UuDLRZhKTkJlhNt+l+sVw2oPkYGmIavP/ixo
 OkklbCHxkYYNBbEHfv2/I0sH6pUYUsY02gimiPkZAnY3sgP5aiVyl4vSSXbnp0zlb8GW
 riHYO+yHhRs3FCDrJb1Hd8zAxVVU/icBQabuaJmuiBo+LCZx99ke98JnrGqpea12n1J/
 SFww==
X-Gm-Message-State: AOAM533KO+SDbpJXgFuuyQ2+soXgKqP1Y248pWWdQf4/TBmHn8tNmp7+
 GKn2QWHnChcOqBar9JdnoQMfUuDLO44=
X-Google-Smtp-Source: ABdhPJw2aNIBxEev7/Pxw1/TZSwCbZV/tvhr92LVaySiZEE674M8LBC3YJCcnrAofNvYnRTfZefcnw==
X-Received: by 2002:a17:906:72d0:: with SMTP id
 m16mr3404622ejl.282.1631375213890; 
 Sat, 11 Sep 2021 08:46:53 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 jx21sm925700ejc.27.2021.09.11.08.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 08:46:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mP5DQ-0000iR-JV; Sat, 11 Sep 2021 17:46:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20210827205430.39745-1-matthew.weber@collins.com>
 <20210827205430.39745-3-matthew.weber@collins.com>
 <87o88z5jgl.fsf@dell.be.48ers.dk>
 <85dd14fc-98ae-fc48-2121-d6614da8ca0f@mind.be>
Date: Sat, 11 Sep 2021 17:46:52 +0200
In-Reply-To: <85dd14fc-98ae-fc48-2121-d6614da8ca0f@mind.be> (Arnout
 Vandecappelle's message of "Sat, 11 Sep 2021 17:03:21 +0200")
Message-ID: <87bl4z5d3n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/3] fs: new OCI filesystem type
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
Cc: Matthew Weber via buildroot <buildroot@busybox.net>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 11/09/2021 15:29, Peter Korsgaard wrote:
 >>>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@busybox.net> writes:
 >> 
 >> > From: Sergio Prado <sergio.prado@e-labworks.com>
 >> > Add support to generate OCI (Open Container Initiative) images.
 >> 
 >> > An OCI image consists of a manifest, an image index (optional), a set of
 >> > filesystem layers, and a configuration. The complete specification is
 >> > available in the link below:
 >> 
 >> Out of interest, what is the functional difference between this and just
 >> doing docker import output/build/rootfs.tar <my-tag>?

 >  "import" just creates a filesystem. An OCI image also has an entrypoint, an
 > environment, exposed ports, and a bunch of metadata.

Ok. I guess you can do most if not all of those with the --change option
to docker import though:

https://docs.docker.com/engine/reference/commandline/import/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
