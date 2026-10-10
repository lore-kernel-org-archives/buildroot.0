Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19BBCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9328060A47;
	Sat, 10 Oct 2026 09:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqazPokyIDA4; Sat, 10 Oct 2026 09:24:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 954C860E8B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624298;
	b=F3dkWyuxh/QBAoOCVu/pix/9NYgSlnxFKkClqP1mvL3/KCLE9yulTcHLq45C+V++ZfHY
	 8BUgdwJusq+d25XyA+/xLnt9XR3gP5Db05PtcWTwQ3vkAZ1Ua/JJ2kL3+OZuTLAppLjOW
	 YkLFzCpfhu4G8Xiep4HGEzjvYT4tpNDFtqlLOfi155tWcbhx7ECter0mVmBLHCelwu69D
	 fU0PbTNB594IcAm7LYOmFtzimojTcxVyn7zutROJ6unU7zMEOacRmqrPuhC7qAWli201o
	 9EmQoltP/ARhjX3ZVqeTdIwiWiwLvjp1mR+uDLqyU3VpXUnSRjbySaC0WAfXy9QISgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=24fek2opbBXaDx5elaIeeq9qNbQLMDZkvHRKzQrogcY=;
	b=WKY2Qpuj22ZjYVfPXJdJlYyognTftd2xpPrpjehYPX7PNysVoD4KsULFTmHms8X0Own+
	 03gZFlJkRrYivlAwTQ+FgRHL13OBUUEZ8qFwn7HxeQdcQ4NERUu+qNWRkZoLRIoqAbHrZ
	 VqMf/W61wBiSKspTMoO1LnbqXu0y/QXK3W8JXzP9YqBTvj7S4qCQZJm92TsYZT6rnqhqc
	 33UhRpeQpJE38Zb+nanNQfb3WaMZA1fa/pJKPQzP/8lgJOvyw5gBghPQiHoEVSUvOxm8r
	 /pKEPGAbT9u4vLeNHjnsQs2ux8jcs+VNe2aYCMv4+vPlyhtEOaUzJ0A+UjaGr5brmlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624298;
	bh=24fek2opbBXaDx5elaIeeq9qNbQLMDZkvHRKzQrogcY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Swi1pnkCsly9btBt7w0lvKyqKBbXcVeqivP9cZM3YAGI4IW+xA9/YeyJScshRvnkL
	 /y/vIvL6nKG1wapAULicJ1f4lNiAsP/twqP8PXfE0FwuH1SDzQyGvvh4q5XQFmchcn
	 VFoBqogxPWEo+HNEPMTIUNZyN3ObMizrKMt9rlHKT/a1RCCpeYxgaZbWjjQdNDdlJa
	 spIV6sp5RMyfXtw/mmKTIvqdUSTwR6KPjoBFzR3lhPPLOkd+Vo99U57Ee76ijwuGZl
	 R7/nxn4YVG51I2jA8YWdwfCQPmn+i8WH9mAh2KF+iqXkQhkmTgaOguzG6Y99e1vX5t
	 WJ+oN5i58XmZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 954C860E8B;
	Sat, 10 Oct 2026 09:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA029356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD5D409D8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDMx-Ub5Wc0x for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 71B5E409D9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624293;
 b=V6m5+9RSVXepA3RzMa8vHTKisuQvMlWmL9DxRH0ryYlPO2TzLP5UJ5I4IzTzCqQQYfrY
 i86D+TwsFj7NqEh059h/5admgcxaxX6md9l6+2VgeIz019c0DxNOLPlCLZOxJ9EgpFNV7
 RcHFhPEB8Ec8s/gtzwgH1nreNcqgsF9enknqszZZkTfiSnMWoCHgvNofAL3KvUWB1gwYa
 bJdbX8eaZASNjOYsSh1u2jFO6kbMUKvLxzygdvPId2P8MrcxQKfjo55wFyXVoeNNX742c
 0KEQtppY5DkjJGdu0znfJDYBBJOYLg7KrgQvw6MEb1RMS8OKbpVnjypaYwaDOTaR69w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624293;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=J9bpp/yHAV/iRjr7Y5E4vHaBb/ORvu17+SXmxXZjvR0=;
 b=T6RlRXzEP6N4v5Dl+C96J0SRFKOTM6nom5Tx6VcUFJ9OsdKO1ehzNsCJ2mO7PL/GaMRn
 yxB47bCpiz8SOQWSd6odIkz3wL9Xe6l2i+PXQLG5wNcr7phzv9EnOGNwmqSL5f2kjW2pw
 KwhPBjXHcogb40MV7waa1Qst4bXNjSsAPb4yOul3MZg71yFhAp5Yf7ldP0Tzsch5orF66
 V8Kde8ta9lApfjS0F40MGjadWfTFAPOYHu2sX4jtJ4Ij+t2MBziTGpwb20RvncRwHV0M7
 MggqsSXB76IJDPcmsFBDEBOPs5tAw+P4+RpUvPS8AVTm4+b2tGVAc+ofist5SPK2qSA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OeJbUK3p; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B5E409D9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so392455f8f.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624291; x=1792229091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J9bpp/yHAV/iRjr7Y5E4vHaBb/ORvu17+SXmxXZjvR0=;
 b=HaFj9eGtuldztVvSarLJzPy2T1gOs1NjiNmCxW0Ab42E96uyoCEF6urmgtvyuMwTe1
 HCId9xS6Sis1d5cHNp6QrZeHC4Uf1P50dqlBLCPvOSdBZi5aa2q+p+0Q2dq8FA0RLYU/
 s/RjJGnsaH2cuOtYR5/TbEkhdffC64Pv8gK9KYI9K2Q/gvDgbSlnVEeZo3FogIKskBYQ
 sL6pSONpd6zvKn8vud3nVxm2ix309mKgGMqi2KOm6MW86FQSCKqMJ8zzXLB4AlslAues
 rqTy9rgG40IkVgIQ2p3Zo8zEUjQm/kY5hsuoroYavql9jR2/KHqwtg847OGAkX6wyv47
 iSQA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/9wtI3pfcUxNBbAn0goBOEqtrbh6tPo+AshNdL+U2GhFPL7Te3koxSSo801ie8x07k8mQH9zuB2E=@buildroot.org
X-Gm-Message-State: AFq9FYINDOSMqkEyceAK++VZqX+YMEAAb6+C4pZXW9bvp2lUP4pTC8ai
 Saahce4cIV1fcb/G+3dKFCGQI+itp9t9huLV/Jo+/PNBxQ/dTrfqjMDZkHHxYXOxtoM=
X-Gm-Gg: AYBFou25G3bfnX9vn+EUTGN/NsJP6palrUbVs5aRI+Wh94nYuCG9UTLU5i0qbVq7p25
 kUc6r3Ihj+dKLbVadFNeLUn0434Vk9tvfYXGNn2UKdAOqF5/DQK50wTXuaQUmwRP45twH6jwoFu
 yE6a+2dbTmzZot+5SqCSPLaMyT8U1/xHfIsTSAEkXY4fQrvqIjxk5aLthmtX4VQiJFaztisk/o/
 KqV1aC7BtMh84TT6XydUAjxrKqnue007WzkxVrMzpTJHSOTxuug8rHelBK8dQ7cVUhwNd6SxWd9
 m+QUJ6+wj9p746zzSJYTHkPdxdAyPi8GY5gO3y6JaxqQlDoZ/lXwBOv8S4y+STr24Vwbph05KrM
 WvZtK0K2h3hky87fZWXhqZ6yxbGW/RukuOnfFRm6q54cWSyjmXZEoHo79OMy7q+CA02ESyWEMSa
 ZBKhwaHoAVI6tKWunSKQUujv0cHTu4/kbmGDKHZCHeKbCFLtWF3PobxMScINLJ7WZWBcTs8F9DX
 PRqrh78606LVQjSCMg+43S3INUa6H7XWdsHby/trK0oZhoRwLTlvwGa
X-Received: by 2002:a05:6000:2506:b0:488:5af8:eabc with SMTP id
 ffacd0b85a97d-48dbaae485bmr7537174f8f.26.1791624291098; 
 Sat, 10 Oct 2026 02:24:51 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db93d6069sm7848738f8f.0.2026.10.10.02.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:24:50 -0700 (PDT)
To: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:24:49 +0200
Message-ID: <20261010092449.140435-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004152104.1403546-1-ps.report@gmx.net>
References: <20261004152104.1403546-1-ps.report@gmx.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/dhcpcd: update S41dhcpcd (fix
 check-package warnings)
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
> Update S41dhcpcd:
> 
> - use plain "dhcpcd" for DAEMON (instead of "/sbin/dhcpcd"), adjust
>   PIDFILE accordingly and while at it use quotation marks for variable
>   definitions
> - fix indent (tabs vs. spaces)
> 
> Fixes:
> 
>   $ ./utils/check-package package/dhcpcd/*
>   package/dhcpcd/S41dhcpcd:6: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:8: Incorrect PIDFILE value  (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:17: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:21: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:25: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:30: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/dhcpcd/S41dhcpcd | 46 ++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
> index 55794f4075..e52e935da2 100644
> --- a/package/dhcpcd/S41dhcpcd
> +++ b/package/dhcpcd/S41dhcpcd
> @@ -3,31 +3,31 @@
>  # Start/stop dhcpcd
>  #
>  
> -DAEMON=/sbin/dhcpcd
> -CONFIG=/etc/dhcpcd.conf
> -PIDFILE=/var/run/dhcpcd/pid
> +DAEMON="dhcpcd"
> +CONFIG="/etc/dhcpcd.conf"
> +PIDFILE="/var/run/$DAEMON/pid"
>  
>  [ -f $CONFIG ] || exit 0
>  
>  case "$1" in
> -  start)
> -	echo "Starting dhcpcd..."
> -	start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
> -	;;
> -  stop)
> -	echo "Stopping dhcpcd..."
> -	start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE" -o
> -	;;
> -  reload|force-reload)
> -	echo "Reloading dhcpcd configuration..."
> -	"$DAEMON" -s reload
> -	;;
> -  restart)
> -	"$0" stop
> -	sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
> -	"$0" start
> -	;;
> -  *)
> -	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
> -	exit 1
> +	start)
> +		echo "Starting dhcpcd..."
> +		start-stop-daemon -S -x "/sbin/$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
> +		;;
> +	stop)
> +		echo "Stopping dhcpcd..."
> +		start-stop-daemon -K -x "/sbin/$DAEMON" -p "$PIDFILE" -o
> +		;;
> +	reload|force-reload)
> +		echo "Reloading dhcpcd configuration..."
> +		"$DAEMON" -s reload
> +		;;
> +	restart)
> +		"$0" stop
> +		sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
> +		"$0" start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
> +		exit 1
>  esac
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
