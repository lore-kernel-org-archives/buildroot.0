Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000EECD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 09:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B3D41106;
	Fri, 29 May 2026 09:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDVnltQrDUpE; Fri, 29 May 2026 09:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E15E94110C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780045367;
	bh=Wk9ye+bDlwKLU+SswdTbmrquUUUt3z4sIFNHvl4Havw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P/WAHYFuNOwhh84tnVq2RGnWdiT77lVWiamMZmo6m1h19LJkZqdh+D3WJq0cR3/i4
	 Xs1SS1XJcfOKW/VJRqtfwOEuWbbxncyl46St/QhRPUvuT1f21uSBMI5Rnlcf9W8XJZ
	 sdQTgqiEobRjbqmAhTrrj5KhRn+A+m8nPu15x6j2j44u/9as44Iwoin0X1mcJ4p487
	 eOl2heC/ibXX7cUlgX9dbzShLy7LlqepdVeJDQT+m1EPALOLQaoeDgfnrXCgq+nmpN
	 lL12kjlB/D+8P8L9GFJ+MljblF/tb5lnOuXdyntxTYwF2roiYy7vkzAngjSIEmRCue
	 R2KeJAkxa0QJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15E94110C;
	Fri, 29 May 2026 09:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B63528E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFDE040BAF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GH3l75yDRxnc for <buildroot@buildroot.org>;
 Fri, 29 May 2026 09:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D08B9401C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08B9401C7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D08B9401C7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:02:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 130788046; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 09:02:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSt6z-00000001bUU-01nP;
 Fri, 29 May 2026 11:02:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260512184826.330381-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Tue, 12 May 2026 20:48:26 +0200")
References: <20260512184826.330381-1-francois.perrad@gadz.org>
Date: Fri, 29 May 2026 11:02:36 +0200
Message-ID: <87cxyek2qb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=czTYGhQLE2AI1du/UxwdkAW/03s4K5hqvV2Z8ATe9ULEEBIB6LsRyjUQMOsmbcJLHVOfeYVCVQLPa9+p6zuywtMhLfZNTW8TK1dJlgnsc+oZGm3RsRvNjEFtEl8b6KVVvaZqzgwd4+1Xa0TsXzd4r03HPrdhltSxQ5moJBXBUoK/81V13FqltCR7pQgOXsH0RoBBm/Cjh2v0avse/M4bWkQWSeR3mZ7R92Ul6dEmIBz4rvr6C8YgTLHicRxe9pSm7gA70rzuiSXLgv12jeY+sbLfpTEMW0A2pvCJpxJIIY+C/LypCrNYNhHbhzTCtFFSH8DsTNjnc+0qEa1zAL+BuA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=pceewz1shiY8sZR+TAQBUFdgRTvsc9UO5t2XpFJBmNI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=czTYGhQL
Subject: Re: [Buildroot] [PATCH v2] package/opendoas: fix permissions
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

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed after extending the commit message a bit to explain why this
is needed, thanks.

> ---
 >  package/opendoas/opendoas.mk | 6 +++++-
 >  1 file changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
 > index 06626508f..4f36d20ca 100644
 > --- a/package/opendoas/opendoas.mk
 > +++ b/package/opendoas/opendoas.mk
 > @@ -50,10 +50,14 @@ define OPENDOAS_BUILD_CMDS
 >  endef
 
 >  define OPENDOAS_INSTALL_TARGET_CMDS
 > -	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 > +	$(INSTALL) -D $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 >  	$(OPENDOAS_INSTALL_PAM_CONF)
 >  endef
 
 > +define OPENDOAS_PERMISSIONS
 > +	/usr/bin/doas f 4755 0 0 - - - - -
 > +endef
 > +
 >  # NOTE: Even though this package has a "configure" script, it is not
 >  # generated using autotools, so we have to use the generic package
 >  # infrastructure.
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
