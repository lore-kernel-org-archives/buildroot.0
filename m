Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3CCCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E514075D;
	Tue, 13 Oct 2026 17:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5aF8q_nYGRX; Tue, 13 Oct 2026 17:56:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B941A4074C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914198;
	b=M9Hw2V1Rmemm3I/bECG95o4pPQWZd6rZq/qpSsmZivb9/PL64ZoktzNcOKEhXU86hClK
	 i8fvnvhm37zXzL7w6Y+2Y49RD0aOrzoqFlnhk2kW8alTvflwFswyP3weCtUOiiM+O8zRQ
	 J7SNcPLTSQ9PAtOkFJiCotkNrHzCcwqWPxyYwIHcCJXLyjgfa7tO2ZB9I5IKOj09zxP/q
	 wQwcYbLhbdnlvfH2diYuIgPyCWf8XHscNkOXJ61IaY1z2OaECR0tGHsuKyVJelQ6c31Rw
	 MXUtmkfhfg3hdWA2BSVjW0VYJZxz3LhBLe74D0SRkCtw5KWUfwBHdAN4w/+pbXrouaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jVUscLDqK83gxyrnRVONfusMrmbl+cxlxM6MlToK94Y=;
	b=fqoufhzvrPyHledT0JFrdEY/p0arcLaUUGkFszoe9tlGl/jRDPfLzEhjFTVrnLJ2N1v/
	 uuXzgq3Qymn6CMogQY51keGOOSL1lxvrG1VsFBcU3QKQi+CTJXD11eaLgKPLKSmOHZzok
	 5CavWjV/4IRLZLcV775yZ1EfRXoQ5vva2+D+Bp+YeQ/qszOKI3K+zdwgtzh8/QiiYULnY
	 sjXpcNYXcOxPKHSYPj9nOt/sLoGYWrbPOlZ8SlHj2Odfc+mlCRrC7B3ZkZ2tIqUGN/ltP
	 ADVfGFg7GO4Vil1uuQ0wFmKDHcyvaOWnMn6TxWG01b3pgkr/r8nAH0azO9jSobbKkjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914198;
	bh=jVUscLDqK83gxyrnRVONfusMrmbl+cxlxM6MlToK94Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ofbni0bU0OFhtKEums+AJuUUFIM8h9nQvwGjSZAS2U+hZuhJm/pKUeK4Cn2wkSH9o
	 AKgFpjSH6385CKq6tb20b7fKHMCqs/t+bVfCWgy84DkSNUb3ShdXQxznbPwBmy0d8g
	 uJgFftZMQigbXgPpRQDlltIcg4s7YzkYd51PPQ87mDJFuyAZ3oH4qB+R4PTJLICWEm
	 mU4DqLyN0Aj3lcaqfXA3dYexVjwPyi2l5OooeEp0WTJfMo846A0QdQoVtzbIQf9mWG
	 3OCAkwV+Y7O+013+HnQJYkMjJyI02DFR7w/koTiHHK6XjRUgYPViq6ZC/PqUhHETZ0
	 6zUn1otaKR9jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B941A4074C;
	Tue, 13 Oct 2026 17:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F954362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 917B8402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BJIHKjXSyU5 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A5D674002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914193;
 b=BmNaOn89D1vi4VEA+ChCNqnSSXhqObpeoy6xTCxB0QK+iYDwBVkqNqRwCYL1PxyjxEt0
 4rFFwf9cyyjPWR3NYuIUlx1LhDVHGeeFImJ7ye4apSWrK5p9f/kupiaYYsKIaifSmmD9V
 /hF+zripr0fWlb7Tqz1rp0k7kmZ6xKsxjKv4j2yAu7KLbXZuKzcsjzjJXvHm30UHQ0zSE
 l0PLOihsKdX3UMQf7oEk9+Vk34n26sJ8HOuYLCPEwEFBHnc/zpwi76XGOgMHtp5nuR7pO
 hMl14P+nQNPq3jTK2PfNkOZbymN96L3wbn303iSDuWGMM0XHbpV7s6IjI5Sycy6Dp/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914193;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=imJX7rqaMSkg4gmyP+rfsWHcVLpBdnPwNazZgfia9wA=;
 b=kxaUtk2UNC2XRt0CXFDq+EqtN1cyCaX9Ycd7XwDyZgsIsyBQ+BY8UzD5O5LarJFJlAfl
 WWBu7cEV2TGsWwlQq1Obdp4TCo5zfCFwDqCbEtvUpw/HlpPQUIiOeEkUgp5XOzfPC73Cf
 YfO2XN6ncCSC6PIDZduNp6BnDBLmS2Jf/n51/DDMzPNeu6KcThV9Giq9qkegtQM0JkGtM
 ikM2uEjKCwMYcrmW6oXB4PdOtZqXjXHGTSspqFHCJSQavDY28eDg29qtyp6WT0TCAbKBk
 nFNAucle4/h7H0aQYHDleSVYCP4PquACkuZiPITYxUYTtq4OarpaPs3psfDl8Y01jtA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eP1DuVxL; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5D674002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 113684E41215
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA05860362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:31 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 228F811D718C7; Tue, 13 Oct 2026 19:50:48 +0200 (CEST)
Date: Sun, 11 Oct 2026 10:50:53 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Message-ID: <astNq9p7MlKwp2qG@windsurf>
References: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
 <8006a4ffe97e560506b5e7dfa8634f18dceaae6b.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8006a4ffe97e560506b5e7dfa8634f18dceaae6b.camel@gmail.com>
X-TUID: RzwkpKoCiWgG
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 228F811D718C7
X-Spamd-Result: default: False [0.36 / 30.00]; BAYES_HAM(-1.04)[81.24%];
 DATE_IN_PAST(1.00)[57]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 MIME_TRACE(0.00)[0:+]; TAGGED_RCPT(0.00)[]; BCC(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,buildroot.org];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH] package/readline: link host shared library
 against ncurses
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 10:28:11AM +0200, Alexander Sverdlin wrote:

> This assumes that host-ncurses always builds the wide variant... Should we
> just mimic commit baa81362ef instead? Something like
> 
> HOST_READLINE_CONF_ENV = $(READLINE_CONF_ENV)
> HOST_READLINE_CONF_OPTS = $(READLINE_CONF_OPTS)

I don't have the full context, but doing this is almost always a bad
idea. It easily breaks as people change target variable (CONF_ENV,
CONF_OPTS) without realizing it also affects the host package.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
