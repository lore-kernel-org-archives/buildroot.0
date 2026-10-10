Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED88CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9FD74094C;
	Sat, 10 Oct 2026 09:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynsp6eoUyITj; Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4FC540952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624189;
	b=dlYHP8Dqo4igYJAUzSonYXHGHUip05JHI12FL4Z3oF5NflflGr2zANHpJkHFogI19Y1e
	 XIESXxUcxDRXLbLnoQULvJKWj+VbWIOkE8s5/fFYWXq7MuqjY+++upWhrLpUaMGJr1lej
	 NvXjAlQaJfEoc2Ns2Ku0YprbJkkD/fX0Qx4HmObU8gk2tl8gqCFBV92OR+PTlLuV/Ufu6
	 pFRprMrafJb4CGKlLG8CY9ifw0h3Cp4d5+wGb55+4a19v5rqRSUboF5JgXu0xnlknmDpx
	 CcrCyo/QVbzMMVPo2sHJa09PATV/MlvUPs5Puc2ITPiWNQLAePGNag4mEJ2Lzd28mYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ygljIx4D8Shg4Ng6rm02pZ4xjDUNwJjuzE1m4ptI/GA=;
	b=eutKF2wuJn15DMRSn4qkGTxqH/4y4s6hjZYtL8Zbjp6sebajJkPmPYIQJdZk9iHCW/K4
	 ByUZQs36J1cTd1vQaZbmbjY+BioQXcQCPRvavoF9Ykx3YZqeYGW+wKBu73v7515lL4w1d
	 1rmscOtdPB89jfd2HWQUK4LxcHTory8d/fvnql0Mf4/WTyu1irMWOF5uubGwqkxyuEVpO
	 CeJvejZZLqQTSzsohDQAR3zfiyZU6xhyHzjYwoxTdLo77amza5B1pXnu2WvFmkld+N2eb
	 DRsjsdU+Q0VzpQy41MPy3pDN3SB4o5sohQb4WJ4pY1Hm+VUX4G+AuGk0ZkyfyZB5d5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624189;
	bh=ygljIx4D8Shg4Ng6rm02pZ4xjDUNwJjuzE1m4ptI/GA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aBdv6cU9e3g+fYy/BL6AormVA3kyImlVT069eHjApYGgowTFO3LwgvmjliWSosRKp
	 ROmBVdsxKVyJJC9X+XWgqVr5/D5/bQVwkwyXj7t3xBqOOVor6L6byGRG7a+KYIXmtq
	 3/FguqCZPjwuvvGs7S/yor8rZQwAfAKh7/QvGuAAydk5eqGW/d99sR0lY5TV6BCqnH
	 ZASYmfTZjeu/KZ7UZxK4/X9MqqPlYzPIWfO39d/TfgFR/hp5A7aqOKfpeB7jNc/G8t
	 NEgCEcdhvTwdhM06RDxI4yZCdTRETeMqg74YEz5oAF3RVb79akpnMuuxOp25PDMGdq
	 pBsphvj5vHb7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4FC540952;
	Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2214DA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13CBF6060A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9qoNyq5RyXG for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EBFD76064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624186;
 b=XJbrvviWuWVkYEN1erN7082ddoc/Z2UffCy7kHxgsrb3ENdHuG56pumSpScYqY1ADjYo
 g/ZT+qaakowh9ViE7pxASjjiaYdychlnvNkdJBZhnYNEgdx7Mm6whnvUWxskULpBkqt+f
 CPZSG12kLqlEV5ey0xKLLhZfrdeGCQcslvWXbK+x8eXrdTNJo/SJj7ZJ5GMnj1GPefKjt
 e4psF8cMu1oNXBocN5wUctKXriBFLA5CeWWkM2mw5Mv65QFytVxE9glAT/94gshYEr14V
 QknYjowXhJ7i0c2NPmi00ckyzi8DMjCZnxfPdcvlkiv4nHrHER3v6bykBLKUcEkIcsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624186;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=KWugnrOe0ALtGvrIYshgz/WNncaGt0F/Ui67aprVVhg=;
 b=f/KsVVRkrrjhAR7EWO9QqXOBbREBm+Q6R9gAQ/1JRF1A9YdPGDDXtf++wLljSB8FwE5D
 f/0ZnFg3W+E8zY73I+40KuJnrrWJEEvNmESGYjYxBDR7R9EF6Q+bTxqNr2q+aUzpW9Gdd
 5iDv+ax27dSdCA5HnXRGBEg1K7ONaWEwpVI95Zd1QvRCVNKTkIq/EiDPSfldOQpADEbqy
 8WxkQomFRo9IUmKP+QzNglwgVIXNHACxuDf92ci0jbiFj//dTxcSfk52Y32I8o4TnPrWD
 IpOX2kU/0rVcwYue7Fzt9ubTPwzJ96hSqj+3iTE8kQ7n6n+/Jhs2RmCgzV/aYwsieFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XoO3Ejsp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBFD76064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a161d9b8c7so3069125e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624183; x=1792228983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KWugnrOe0ALtGvrIYshgz/WNncaGt0F/Ui67aprVVhg=;
 b=Ji2ZKGSA1f/kATD9x/CBTmQofXRvhWP2sMtl6dXRf2bShYrbDlwFn+Tge9h0KvfpKV
 mGae1Qz4EELis+VlxAFLCF7MaC/J2dfCSX34l2S4yoyCxOaVbn7LVIPVeyvOvtBje6MX
 cDlq3mTffTef5LcKWlo4gzWKjkUhdzEmEtwWMZzbqvg0Uu56QXzMV/bKKg/Dry7b27WW
 ZQz3t+BgAxxs0tH3BvrmmmZCMrCjnWzNwtzlLGzNrA4FbuK2zBpY4ExmQUrI8OYFgvE/
 BXSGAX51QIDKgxoVpfzUa/ut0lzzGuGvpg5Nc6j2Tddg7n++1JtsoZDKccdzCDCahb3K
 d2zA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz2IGYJxLGVBm0iNHU6LcW+V9tR8mBXwXWmVRMZOFPFbXrj/6R0NL+uPmzcmGzh25W2kArAD4TM2EE=@buildroot.org
X-Gm-Message-State: AFq9FYKyT2IkKtPyct8fwWWA6op1124YE5M+j1yYhGZf+Mt52rgbvM9g
 Mg55j1NM7ZLrTDDOkmS5oWdFqiHlsPmAmPsD0kKlzpPqsuM/Ykw5gM8fAs6WDON/pyY=
X-Gm-Gg: AYBFou0MoOhimQCx7Q7WXoBTJDBLR3ivMkAWkztrGZLJ5Inmm4IRyzmsdFJVbuzxQad
 BAEHtd8gIN3wxmuZEGd9EinjcgJk3eC13IZr6KCoMvA7JZkUygAVJivKbUuA8mCZugDem0Lwpg3
 Mycw1uR1BBu7PtQQpVniEebHmuN+Cimzqvgj5KBtgN5IqiZRVc9HTnamaggitC7EWrHmUdcQtxy
 rDhRzr+0O1UEaFaZiLDUIWZIMqEJhdJ3zr31SGKGwIb+QwQfhBXGuELIAl+qXI9g1dxasxwNZGi
 Em7+0cZLS8CGA5aZLGbA3NjDk/5lWWShZ3KRw51ms9R2Kin/tC/oKtpFBIcieDjkgI3vAZ2yNaK
 DsVQOYrw3XT1OZNTKL1tVZSQUqsqvoB4zezT05is/Ki+X6qXExuF50nyt1NOzEpqt8/gXTjfCgW
 T3hHftSxIFt2PFR9oMmMdftxhL7Z3Wk8rGm+5ABXN1C3APRlpNc7TeJYlAqZvGJO7zS2RSMTumz
 dNZPbWdmaPiVwvUDh9bV4x5JJELrf1d2u8qPHB+y+VkN65TWncrzQi6sQ==
X-Received: by 2002:a05:600c:1d20:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4a18e4f50ecmr85309155e9.34.1791624183355; 
 Sat, 10 Oct 2026 02:23:03 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm106067445e9.5.2026.10.10.02.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:03 -0700 (PDT)
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:02 +0200
Message-ID: <20261010092302.138928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904134128.4656-1-tianyuanhao3@163.com>
References: <20260904134128.4656-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: add 50-chrony.list for
 systemd-timedated
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
> systemd-timedated discovers NTP services from ntp-units.d/*.list.
> Buildroot's chrony package never installs one: on a systemd image
> without timesyncd, 'timedatectl status' reports
> 
>     NTP service: n/a
> 
> and 'timedatectl set-ntp on' fails with
> 
>     Failed to set ntp: NTP not supported
> 
> even though chronyd is running.
> 
> Install 50-chrony.list, following the convention set by Debian,
> Fedora and Arch, so timedatectl can manage chrony.
> 
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/chrony/50-chrony.list | 1 +
>  package/chrony/chrony.mk      | 3 +++
>  2 files changed, 4 insertions(+)
>  create mode 100644 package/chrony/50-chrony.list
> 
> diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
> new file mode 100644
> index 0000000000..6b9cca00bb
> --- /dev/null
> +++ b/package/chrony/50-chrony.list
> @@ -0,0 +1 @@
> +chrony.service
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index d1745419a2..b2311df667 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -85,6 +85,9 @@ endef
>  define CHRONY_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/chrony/chrony.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
> +	# advertise chrony.service to systemd-timedated
> +	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
> +		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
