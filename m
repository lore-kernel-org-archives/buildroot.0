Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A329C88E4D
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 13:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A3226068A;
	Fri, 11 Sep 2026 13:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LK_S9CX3oKQZ; Fri, 11 Sep 2026 13:33:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1C39060664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789133580;
	b=gIyRNlDbcbmViNkcpnrHxYTLsUDw7e2s6CnQf9cO0MEvAOx0szaemMEOS1pVe3vbECHg
	 g65A3vD3b3kQEE9JsFS4F+JRmb6ajjA05Mkiz/r3pLqgwxh0kRxP1Oxd0YqlRzcdxFwDK
	 2vpv4lDIUv93+TOUZ/lAjOgkklGrgCxkTYllCWuqKA9kW31QTErdIJqtI3JXsOIvmfLrT
	 HmOmqwZpB+iM99loTSfKDp0Ja5oeRD4jw433+8i1EOPmMFkao1HXAwr+An9+9bSigMAaK
	 9qcG7CeQqEEpTmYXI4dl8ObmE7yi+2kLlCmzqTbYCkpvWYRuxh1klUxbySEvsSf9exw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789133580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/F5tX6DklS+UDemfYRWQZI1qaGH79O/FzsdoT+h9zvg=;
	b=VZ1UxIp84tAoFQroK/3F4AZycd3+09C0RIjh6H+A/w/EaUib9Q2o9ejN/DIlIMaEH0CW
	 aHy+wN4lc78NAQ4UVmk5WHbmeq9i5PgH2+dN39jnRJygujr+i4NtN6J+mPjGaETwGK0ma
	 SXS8KXkX7oMfZ0DqqmaB8MeFcRs4+BF5RSv7e++gKFMVVELQCjhQCWy+cnjkQzCqMZKKR
	 wGJ2Xr3L7SPh31H6eZa6XxZ4/AORYWH1t8ssDDUHaWSTqxCXH0a2g9Un5T5knDkMwJFpq
	 ltvX8nXvz1wKuXM1gWqT9WDIesf/K4NsRK0FgIVk8aM5jpEFhwgBWUdopUsl933LyNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789133580;
	bh=/F5tX6DklS+UDemfYRWQZI1qaGH79O/FzsdoT+h9zvg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SqthscYajMkmSvXQuPGgtCudDfq2ny65PtG4+cqB1Bz+CWQzAftN1bxXkIysbtbPj
	 GQqBA6YWTzKlm48ILnGMtwsEIOEvCXJUQZngS7vBerQGIyuls5Fv2XGEzmWF1fmCG2
	 ilrBLeKqCMl0O2Id0pO4RTL73b6/m9PWAR7ut0yefXY34mMCCNTO4ZL4s6rPVDvmY2
	 XBOVXPc+KYgmVXBnxroH/VhZqrs0FCvBLiCqB12HbQ9st11ARWzPFlHAEGHVeoqW89
	 cnvICrLzVA4/gzRqec4mxpGVrsUlmz4z/mkFjxU+UwD0yu96zi0aAVHMVQzeJr4BN8
	 b1hD1gPeLLIsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C39060664;
	Fri, 11 Sep 2026 13:33:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1234D32F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 13:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC31D4081A
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 13:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrCRgaYbyUOl for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 13:32:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D09904081F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789133576;
 b=UgoawDk+dlcZp9b9EEUQoTG0wuUge5LBlNbF5AxnQAXUb85wvIOt3LMVF9OWbFN2jUh1
 9YszJfylbNR+HzOOPlSiPJ6xpOb2ZWyHjASm57FTQ3wEFKOAecHDtcTSCqSfW255yRNrm
 iy4xHEXlMLky2kClcanFKLT8d7dVWs8Dusp9HLMU2GcKvDLZEa5eFvFKr+k+CaEe73bsQ
 XZ5gNUGxVjBT7FzfIBFb9/nka9fuk6pgGMyNTkQ/UHuZZrCR8p8gGpRsJ4kVUCYjV8pHP
 NvtCfVhdZYY1AP5oWEbnfejx0lBvOndz0HLxsXyHx3hEpgAB2cRinsIUK8S1GwcQSlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789133576;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=VvkPfhi9xxAfdAjwfX7OmkpiIvicSztZhzXzPlaRAVo=;
 b=pM8E+XzdYXJYm8pLpShmk/4IOMg2Pb01mbV/1/E+a6eA8p3ZGrxVbHsfElW+i+SwuhPI
 zf3VkCfFJpfcmf9pY+EyEhiQrsDmal2KN6PdwFhPdMUp57tDUzz+Ccarz/0Xf74YGa4+8
 saX4uQxkgsyhdhS09SIg/P8XfK0pTRTgsScDPk9YNADKcvKyFN1TZiZDCKlEy8E/2P2wU
 +ccgp/q+D6RVzTNQ6F17Av2ETgXFsH9/ZFPDuBqmN47RxqBrcTcySNUnIYh9iRL0UMzCI
 gsV2mo5THbmijU/Fv/aqNI1mzkdSDU55o+E6a6xtWArou5z/Y3lqYuuEl5LP9hKxUwQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=aTDhgQ2J; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aTDhgQ2J
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D09904081F
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 13:32:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=aTDhgQ2J8l/ckfZqfU+6iPTBqFoVxBWcKsLFyfx9sN2iMEq9IhCm9zzAMYefzgB1RO7Ev2eOoFPLWgp2WAAkgTnZCkMrm9h+/DQ92uEm8a+bZzwW+m6PHF2l9ezVa8tOVy6k7PE6Z6E/KjdAQJ/aNorqgaQaLt5HzTFcP+mBtHCPGfMY/z8nb2aFr7SvLJ19L7iEMEcpcgdHS4pYfQRpkYIeRaDOLEbPx921zLbv9R0pm7WsQSBf4w6JK6xN0yNbIXiEK3t+5IkueAjoHskO75CvtMxTmEdYKWT9QYrQdLcwfFnyNdh786HbxhT6UzHMtff4pAkS7uu1DvcQ1KQy/A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=loKadCW65vxC0YCgp0tdoU/fbvmtPSvEYXJWQgskhBs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1006601260; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 13:32:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x51N2-0000000F31k-0iZD;
 Fri, 11 Sep 2026 15:32:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910095223.1597453-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 10 Sep 2026 11:52:19 +0200")
References: <20260910095223.1597453-1-aperez@igalia.com>
Date: Fri, 11 Sep 2026 15:32:48 +0200
Message-ID: <87v78bewvz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.12.0
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Fixes a sandbox escape through symlink traversal tracked in
 > CVE-2026-87766, which affects all previous versions.

 > Using the bwrap binary with the setuid bit set is no longer supported
 > and user namespaces are now always required, so a kernel config fixup
 > is applied.

 > A new build option allows indicating the minimum kernel version that
 > will be used, which removes code used for backwards compatibility with
 > kernels older than 5.6.0 when a newer version is specified. Passing
 > $(LINUX_VERSION_PROBED) seems reasonable here.

 > This version also changed the license from LGPL-2.0+ to LGPL-2.1+,
 > hence the updated hash.

 > Release notes:

 >   https://github.com/containers/bubblewrap/releases/tag/v0.12.0

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  package/bubblewrap/bubblewrap.hash |  6 +++---
 >  package/bubblewrap/bubblewrap.mk   | 17 +++++++----------
 >  2 files changed, 10 insertions(+), 13 deletions(-)

 > diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
 > index e87d3c81cb..e150e1495d 100644
 > --- a/package/bubblewrap/bubblewrap.hash
 > +++ b/package/bubblewrap/bubblewrap.hash
 > @@ -1,5 +1,5 @@
 > -# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
 > -sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
 > +# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
 > +sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
 
 >  # Hash for license files:
 > -sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
 > +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 > diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
 > index 7838ab90b3..40a8148e14 100644
 > --- a/package/bubblewrap/bubblewrap.mk
 > +++ b/package/bubblewrap/bubblewrap.mk
 > @@ -4,21 +4,24 @@
 >  #
 >  ################################################################################
 
 > -BUBBLEWRAP_VERSION = 0.11.2
 > +BUBBLEWRAP_VERSION = 0.12.0
 >  BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 >  BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 >  BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
 
 > -BUBBLEWRAP_LICENSE = LGPL-2.0+
 > +BUBBLEWRAP_LICENSE = LGPL-2.1+
 >  BUBBLEWRAP_LICENSE_FILES = COPYING
 >  BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
 > +define BUBBLEWRAP_CONFIG_FIXUPS
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
 > +endef
 > +
 >  BUBBLEWRAP_CONF_OPTS = \
 > +	-Dassume_kernel=$(LINUX_VERSION_PROBED) \

What happens if the config does not build a Linux kernel (then this
presumably expands to -Dassume_kernel=)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
