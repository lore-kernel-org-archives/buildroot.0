Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE1BC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAF1614CF;
	Fri, 11 Jul 2025 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hagQ5FhgF42f; Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB426145F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB426145F;
	Fri, 11 Jul 2025 10:45:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1D7199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B482C40251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nev1mpH6xM9v for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23F3B40094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23F3B40094
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23F3B40094
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1052275f8f.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230692; x=1752835492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oLRz+ZIP1EPaea14FzVWhddE6kANE+PjPunHJtE4YAY=;
 b=Pe4WC8T0/221FQeavICzoJ8OrgfsMS6l2fdrEpkuj27My/mRR/MlGm5xi+LqcF7PX4
 HLzYn4TkHvBLRRgyPdjcS3+OO0ojI0qRgUVOqiveEnswdJYAZpcRqrMiS744gBimHiOA
 NzcXxDVfLRtLk9TIPPDi4wxEDBsrGx2pifr4cQxC46aGv7ob4vcuhZ9vTsHVtNcMXG8h
 nGlqeUcCRXOMlG9bYth33kIV1Fp8pcx0bHl0HO2s94zOJlWe0hhLTZkNtJebsENwgGh4
 ILY82OWxhaNpSEKqHRP3G9ibbvY5oXDluXtzzamJDZIHNaI7ytOMHOubGv5r0jwtkOBj
 98og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLlZONsTywsVh6ag+5U53ZR2kO08gkO3PERQhLdg8LvwJaUCLwzpC8Y/S/7fDyoDB2ZGm5TjCi6Y0=@buildroot.org
X-Gm-Message-State: AOJu0Yz0Dkmim+0qQITTOnisgSyiP3pF8HN+mThmD+KJXTaAObdI1d62
 2uT+EOp8bewAhxNi8ti4o4NjFKwKA4d4kGB6zFdKFZuCyHdgBd6V+GMa8SPTZqa0X0A=
X-Gm-Gg: ASbGncs0pSGuwIV7t0ey4sNzO4H8ZEv01EUvKV2B6yTLCAKTh4YvPlSPe0s4358ysSQ
 NqSCbVPDgzeqdNOruaxKG3Pv7X5xVmQOI9sKnAkjMYvkI4dWsX2PawTJ/iVToSeJNy7cRjtZ1CX
 yMOyZFrxV6NJtmOfLrmCfLjh35rIbqIlifC6SCAosg94COU9inJxjYNeQVPl6WaAWELddW3BSHC
 j444Nh4r22s6UjKuHVMOnzWB6rWpwuOuiOCjxIvJ/SFQmSTxU+/tnlyI322jo6wsyilUwY6gxcY
 yW2VCEork2AQeXxCUtRnC1BeUhSacDu3/LD2Qd9cJCdtZz6PY0RA3zjWXA1vUaLsbjlQIzaoE1g
 C8S3pJC1Lma3fxw==
X-Google-Smtp-Source: AGHT+IFpVSouuKrhZ6DsUrNA6Jpl7JnIQlSsawXMmerq/DdQaeQLsDrkbbVJxIl0/+MMUmByTCJECw==
X-Received: by 2002:adf:b613:0:b0:3a4:eb92:b5eb with SMTP id
 ffacd0b85a97d-3b5f18f8be2mr2478506f8f.50.1752230692096; 
 Fri, 11 Jul 2025 03:44:52 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d587sm4048906f8f.46.2025.07.11.03.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:51 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:51 +0200
Message-ID: <20250711104451.823932-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250702063549.2096156-1-peter@korsgaard.com>
References: <20250702063549.2096156-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230692; x=1752835492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLRz+ZIP1EPaea14FzVWhddE6kANE+PjPunHJtE4YAY=;
 b=bwL32OS0dg8zR/tUqlWkfN7KZlT/8l/4W/v6RwRtJJom502F7D/+ePe0DgPesxbmjJ
 7Whx23jgm3m+Go5U/6/GgMvrK/3mMYSs+IqItY07341szMwy4B2xM2biLFMtWuPDRWVg
 l8KQWGL7dK21A7+GqfvG0mGJ3B6YH/KmSL5wyxdz/+DMWoVFVuFmJ943x8lPpYgTHHkp
 dlQnKaftho4qUujtBxOLZAATxbfI2MOOkoCDAfTGuEoCSPfxvuLbH/MXPZoJ+AIMdENy
 10YERM2qYlP2RMl6k7ExUD+B1yWC1qyMMfdbZRjaDioKLs8BRcQSSz338C+uJN2cEuIF
 q7Xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bwL32OS0
Subject: Re: [Buildroot] [PATCH] package/sudo: security bump to version
 1.9.17p1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following security issues:
> 
> - CVE-2025-32462: Sudo before 1.9.17p1, when used with a sudoers file that
>   specifies a host that is neither the current host nor ALL, allows listed
>   users to execute commands on unintended machines (since sudo 1.8.8)
> 
>   https://www.sudo.ws/security/advisories/host_any/
> 
> - CVE-2025-32463: Sudo before 1.9.17p1 allows local users to obtain root
>   access because /etc/nsswitch.conf from a user-controlled directory is used
>   with the --chroot option (since sudo 1.9.4)
> 
>   https://www.sudo.ws/security/advisories/chroot_bug/
> 
> Update the LICENSE.md hash for a change in copyright years:
> https://github.com/sudo-project/sudo/commit/30729312c2091f3891daa39b571efa40cb261785
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/sudo/sudo.hash | 4 ++--
>  package/sudo/sudo.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
> index ed4e527f36..3bbce74cbc 100644
> --- a/package/sudo/sudo.hash
> +++ b/package/sudo/sudo.hash
> @@ -1,4 +1,4 @@
>  # From: https://www.sudo.ws/getting/download/
> -sha256  976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c  sudo-1.9.16p2.tar.gz
> +sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
>  # Locally calculated
> -sha256  a6e4ec823f2ba58f840b0ff5fc5459e4893f46a91bbcd6b2a2d91315de5a2d2b  LICENSE.md
> +sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 1fe713ab2d..4e1405eaf1 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -SUDO_VERSION_MAJOR = 1.9.16
> -SUDO_VERSION_MINOR = p2
> +SUDO_VERSION_MAJOR = 1.9.17
> +SUDO_VERSION_MINOR = p1
>  SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
>  SUDO_SITE = https://www.sudo.ws/sudo/dist
>  SUDO_LICENSE = ISC, BSD-3-Clause
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
