Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E228ACA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE08B60901;
	Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvai1ZUkRFgQ; Sat, 10 Oct 2026 09:23:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 834CE6064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624188;
	b=ojHk9Mxd7p0mv4m2fMkgHAjhQqtPY7XiJnWczZCLijjx6Nea9ufdtjeuYfXw8uZ9GG8q
	 ebqaQ12I63svdqozq3wiftRpj9EFx8NlpQqvKccm5SFgYSFG5h41JLtvB27T27vauKBw7
	 FiC5xesYK196dTBmBfewfAXr9lv5ebrikVRCvVFzjTcYTnGViSsBS3rF3b6FqIt+Pq2E1
	 14yDLufbJ/Il8OxGaK1l2jpCNDJbCe6/Md8kWpoND3zIap8vCUmNt6THTDs3WVoz5fahW
	 va3iGJuqz7clvAS1TGOl5AjP9qKuZ9tJu/NBsdofbdUuLCrwfTclM7FdhtHCSAlfQPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nwUp9UzzhdE901dUE43SfZIATUoTBP1/oRSvkvtwOBY=;
	b=Czs0IazALPz2CHsPDZWfa5WORp4kq5L+VKx0s8nEbml0Ldj54saajrtO6v7z2fBy89bK
	 2tXJ0pTYfJRJKadMqas7ebSNyHQEZuEtXL1YxYD9s4nTv3FpoO1edEVUBE3Sl5qTTuGcX
	 QqHmY4lhEKNQ8y0k+AhGsti5vS9q9rVUYh7USpZf7sYeAp7CUs5BhHXG3B2+jlWOTyPBO
	 aeCxWlXU+1BYszyeLE6i1Xz7b8bIYdbAkae9JuGKRCtZTVjp+aYCjUDljkyGLt0wzmrtj
	 56eaH69wVAF84yYUMFPBJJ1Ul/Qq/YbHegDb1wFUWKBbu2kknogRKaYZYnLUrM0/gMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624188;
	bh=nwUp9UzzhdE901dUE43SfZIATUoTBP1/oRSvkvtwOBY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d2msFhZd+G7yBb/e5KARDhwfUrZWZPv9+o3Wk/jAqGRMvKPJachLgo31muOSahwrY
	 3KaSo2FyUCvHZpAQOkhjmIUaKxGe50JYSJQAqZ6ioBjwp46omz6ZZXMneT6Hmbq00e
	 4S6lRPBME1D2uxRC4yiIQ9KmtOMDq9c1DjfTbrIMe6sS/C1pux2V5+mgFE5twvRnTU
	 dxHUmpxl05AfvTwXWM10h0rSQ2/Q+Fq3NFWbtdsHHYOJD2zDCOx9EgZp8vIiOAu19g
	 CpyJdCDymvW3DHF+jqd5G8ggVR9vj9rEIE5leCKEQsrKpe4I9txglxpri2gCIzfqsy
	 odZMPxlAooxXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834CE6064F;
	Sat, 10 Oct 2026 09:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CE78356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EEF9400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhK0mUmqb75Z for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6C6D8400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624185;
 b=PleKp8PS1nQOhXN/h/o/k3mlhMnN5JCDajy9P4bIhBvtnCEygykrdA6Y4HhVcwPlDiwV
 CNMY1IK3uZQUHSZftLzSRTTRlLxBBp0LPTvFGptIOQoSVJ45GiyR8Nj1f7EP8x6DQIraz
 OmK5+lBY8o1pQjXAaxVhx4+WBdb5Hoqmev0zfPO71CIclf+6CNCIm36x+H0aCBlTmB3rm
 52rgebcdyEBft496zyjeXZZtCzCFOdIwEDIymitkGO68eoDURt+Oe9W7sPsIntwJgHUee
 k6z7bwVfU+UdNoeF2islGrO2FjVpu1R0uTzN2Jft3lKHEeOqsCdXmeyG5LPouUbJz4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624185;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=y/C1xJPSZXIpsNoYBUSjvktGjO+G58dikHxawntRFQQ=;
 b=rZe9rV0t5b7JzkRq9wWAAAd/VUlx5qJ4nOSyhn0JA1gvC1c0DotXj+It3SBYGaYDta3B
 AXX1Emx+pgzi2lLZETZ2Xq7xiCYJY/Wc2Yy3h4CA+CWVQqHANeMkJzVZYH9PRlJ/Ixp/c
 o42sO1tyrXyGJdieO5759FI24OhIWHZzSoqDP/9d9Dfj5vPtZoVIU9gGlc7j/VTugYbZ0
 Py4m8EHCrcqxfWlqpwBWLVyVqD4MkN1YWnbKZhcdbOtMwah4fkXs6w0MDgPODhL8N/1Tk
 qL7DXlONDXjDpGYdnsMbLE/2Ldu7IILXmC3nPm89mw6PvhqW+BLhiU1nwpBr6weWroQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JFsLu5Nd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C6D8400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso6989405e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624182; x=1792228982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=y/C1xJPSZXIpsNoYBUSjvktGjO+G58dikHxawntRFQQ=;
 b=fmjAp83SfJQIMuLhpQjox/GfrNvpfwsh28r7oUKsvol/9YmEvMf3+6B+8LuJXSZnUH
 0YShFKJElGptNtTn3mpcamHtMmPMVBIOy7sS9UTDXsA93rypwlfKBUCDbIlwP8diCmft
 15nKsfsgcuiyd7tWdKXoucTFFJfRHzJsRYxQ1k2Rlcp/Szx1S1gL+JPrtHgx+pqXEO0F
 8UzeOeVVY1QRSNhPtI3TA8Xc7YuMT4wGOz02d/y5sn23cR+x+N1/s0cVGq4hNrKAUduA
 uMPmAhba5glUk0cbJrsjpbKB2cafTjNYPV+NqMuz1Zu1chtJ4tYPQxxbCd9JyUS4e9dW
 QR1g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxazRryOLuutsIswtID2qqC0O60OTKp8dPJLwOa2NP0gq5Vcc4IEFKL6KNqvMgICmPrzHsp7NWewq0=@buildroot.org
X-Gm-Message-State: AFq9FYLQNuw118+RaPKSWJBbyf20bGtFeRGg5RIswQcutU0EHskJdav6
 vs31Mz6iLqjT1tsb8K14MD20lTcMoTgR3ai4c6oqZR2X09rbiKcwxtegxYVWEU/2VRtSQBwgXR9
 WZpcvLkI=
X-Gm-Gg: AYBFou1TTpwV7BWwcXBTxwIZPoyTBj+18Fo8ziGgkLhCnJ5OLDMiP0JNcn9rHiQ6nEX
 ol6eo841SSaMhbu/jvSQHXR0QbiWqtH2sTnGncpbrYpJGFfoFthCFNxS/qh5DXmk+hKD4vFHREZ
 7SLspbGVChtf+vxxd/h9qLWFWnP/FSIL9Yu+6fUc3/R0ihcwudIGW6Tagap2/Gv1wXkZe77moQI
 l/dQwRH3R1LoHLSBvgeZUMGaFqTUfPWaKho+xk6ip/jsJSKVZ9ZnI656Dq/nJmHtcA+5ZwoxyfP
 xCh4lyGs9+3Ek/bQI0MWUtP55jyHjIL7fi9s2AmfKx5Es8G977tTLE3el3LitQhWy64IkOVc7AC
 mRxfRZ0PTkfzqNvl/RvyaXJNFzCXkUwYinES3Un+a7dE5pD1JYrXW8Zb3igonAJzX3NCwj1SY3A
 g03Kt7awvNrb/BnB8njyucujEfty7RmB6GNJLCPanNkuPt+EgElonwgsXuPyCn9jf9JeVVnDv6q
 94Fj66WSvlaCXsFJSElVyIzxXeiG/gIkFLN1Qw4wmOVzh+/KYkbrJPZ
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4a18e4837f2mr79530795e9.5.1791624180854; 
 Sat, 10 Oct 2026 02:23:00 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a195b300f5sm19044305e9.1.2026.10.10.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:00 -0700 (PDT)
To: John Ernberg <j@j-ernberg.se>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:59 +0200
Message-ID: <20261010092259.138873-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260614155328.304282-7-j@j-ernberg.se>
References: <20260614155328.304282-7-j@j-ernberg.se>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 6/8] package/util-linux-libs: Do not
 install to target
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
> util-linux-libs was introduced as an intermediate package to help break
> circular dependencies with util-linux, and therefor only exists to provide
> more basic versions of the libraries util-linux provide, to break these
> dependency chains.
> 
> There is no need to install these to target as they will never be used
> there.
> 
> Under all circumstances the libraries are built and installed by the main
> util-linux package.
> 
> This only solves the confict for target, the conflict will remain for
> staging as that conflict is much harder to solve.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> 
> v2:
>  - Add a note that this only solves the conflict on target. (Arnout)
>    (see RFC discussion for longer explanation)
> ---
>  package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 6716a656d2..d434a8f461 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>  # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>  UTIL_LINUX_LIBS_AUTORECONF = YES
>  
> +# This package is only used to build other packages that have a depdendency
> +# on util-linux libraries which in turn may be dependencies for the full
> +# util-linux build. The libraries that are actually used on target are built
> +# by the util-linux package.
> +UTIL_LINUX_LIBS_INSTALL_TARGET = NO
>  UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>  UTIL_LINUX_LIBS_DEPENDENCIES = \
>  	host-pkgconf \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
