Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49636C61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810FF80ABB;
	Mon, 31 Aug 2026 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdgY2brvI7Cx; Mon, 31 Aug 2026 19:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788203811;
	bh=XVF/2hrFrFzKAEyCjkNvmGIhOQsJMs6SBdu5iBqOypo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCzhZyyPQKlOfX5Wh+OPursi4ZiguVy2yEVyNiDP68ibv21lwLSZLmELDoTfyOWW2
	 RnQ/bAzbM8F9QpllvT8Hk0HO6xEbdGfHMaOqza/IPIl4smcY2+ZoT4A/gqhcwOMulp
	 6Eci6QjGV8mqOAffc2RNlwY38ntQGxmyuYpcULo4zpEkGV9BRw7/IGspHhF2zv9Twa
	 lfBt5HIj/E8RgelHxzeruaLMWt8RVU43L4YXriJbiW5tSL4uHNkyOjqJN8RqbnChqb
	 wEZhbgPn4cgF26JrikC1bv4Bv3ijQXaQg+LszT0WWE7Y0WeGcHFM+QV/zhhfzU3cwY
	 ie6kHYOW7BUkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126B3808D9;
	Mon, 31 Aug 2026 19:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCEC3127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F49808D9
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIZNm3nOhwer for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=hUqwoKwg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD2F0808D2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:16:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=hUqwoKwgOQBw7QMeoxCqJNWElpf1YQDXKIUa8WaDNjbGxUMyh1KMRzYi7vXvyIvOw6TPd/JiW1Xt5N29808D7hH6lOQwn4CXKsi6bpbNokC05lxG0pmgSL8nS0pVXc6JVWXU0FR1+lNna4/M8s4CPBnWBFig19+1c1ViirtrAkIK5yagdKk797QzX7kMzJ90ayvzVqLZQv57Ke9KugbwMx60rtMD7QmhyRLJ6Nnsqz2HAgLbwkT4jyCxCIuEGDFmuSLE2KUwrQ1zw30RerKanDWAMjGbKgOoFIAVe5zXgtpLp2Ef6jBKUn+CvgPckFmpvk/l17M2FCGj1roT0eVncQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lq/+X9/eApv6c2OjfC/7a3QNCGhpz/G9kTod2orQFY8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -709304989; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 19:16:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x17Uh-00000002NrT-0OM4;
 Mon, 31 Aug 2026 21:16:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20260831125103.841338-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Mon, 31 Aug 2026 14:51:01 +0200")
References: <20260831125103.841338-1-fiona.klute@gmx.de>
Date: Mon, 31 Aug 2026 21:16:34 +0200
Message-ID: <87mru2je25.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
 > Using dm-verity may be useful for any read-only filesystem read from a
 > block device, the new hook will build the required hash tree if
 > enabled by a per-filesystem config option.

 > Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
 > ---
 > The change is small, but it's a new feature, so I assume it's for next.
 > ;-)

 >  fs/common.mk | 9 +++++++++
 >  1 file changed, 9 insertions(+)

 > diff --git a/fs/common.mk b/fs/common.mk
 > index 2f3f8bcc7e..794423476d 100644
 > --- a/fs/common.mk
 > +++ b/fs/common.mk
 > @@ -215,6 +215,15 @@ TARGETS_ROOTFS += rootfs-$(1)
 >  PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 >  endif
 
 > +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_VERITY),y)
 > +ROOTFS_$(2)_DEPENDENCIES += host-cryptsetup
 > +define ROOTFS_$(2)_VERITY_FORMAT
 > +	@$$(call MESSAGE,"Generating verity hash tree $$(@F).verity")
 > +	$(HOST_DIR)/sbin/veritysetup format --root-hash-file $$@.verity.root-hash $$@ $$@.verity

What about the user configurable settings such as hash/data block size,
uuid, salt, ...?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
