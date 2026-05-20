Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2278FCD4F54
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 02:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C2BA60E9E;
	Wed, 20 May 2026 02:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qwc4ZSQLqQ5e; Wed, 20 May 2026 02:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F0D460E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779245582;
	bh=aaipzQJu1lUUwaA5mRXjGeOkCLHL5rBXZcJi9geeGis=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7ChPQzuURid03VOlgW9X0iSS/RIR7asqiTZtkwzZktTUmb3dFcUzyX2/Yyk5nkwe
	 UAuOsKt5eH5v0ocLoySB5Ku/KlcldNMZlBJq0emi9gNFWxk3TcbYlItSFfw/6mnxfT
	 gmRalnK0vu4U0N/+lLM6NRLgktx0Z9LFA7dpkY38IoxqJNEFWC85jL4GWZxIrVfPo+
	 dLVzE7CWP6M4ptBfe5kD2APPQ21MglnSn6tN4tFgzNUb1dWrFApWxpVA9gkw79B7qu
	 C6eLq1oTPQlKoneu2iIk/0asVUpMiWxDahJLgJdmYb1S6Fu4KTDmmJDPkpa/V0u+7m
	 WslzbZnsaz8CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F0D460E8D;
	Wed, 20 May 2026 02:53:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27AD2265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 02:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1969C60E8D
 for <buildroot@buildroot.org>; Wed, 20 May 2026 02:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZneVmn_satvi for <buildroot@buildroot.org>;
 Wed, 20 May 2026 02:53:00 +0000 (UTC)
X-Greylist: delayed 370 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 May 2026 02:52:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8039560E8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8039560E8A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8039560E8A
 for <buildroot@buildroot.org>; Wed, 20 May 2026 02:52:59 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [240e:40e:2302:974e:312c:d4ac:36f1:5dc9] ) by ajax-webmail-wmsvr-40-117
 (Coremail) ; Wed, 20 May 2026 10:38:46 +0800 (CST)
X-Originating-IP: [240e:40e:2302:974e:312c:d4ac:36f1:5dc9]
Date: Wed, 20 May 2026 10:38:46 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "Arnout Vandecappelle" <arnout@rnout.be>
Cc: "James Hilliard" <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 "Eric Le Bihan" <eric.le.bihan.dev@free.fr>,
 "Gary Bisson" <bisson.gary@gmail.com>,
 "Alexander Clouter" <alex+buildroot@digriz.org.uk>,
 "Sergio Prado" <sergio.prado@e-labworks.com>,
 "Sergey Matyukevich" <geomatsi@gmail.com>, "Bernd Kuhls" <bernd@kuhls.net>,
 "Brandon Maier" <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 "Paul Cercueil" <paul@crapouillou.net>,
 "Refik Tuzakli" <tuzakli.refik@gmail.com>, "Doug Kehn" <rdkehn@gmail.com>,
 "Spenser Gilliland" <spenser@gillilanding.com>,
 "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 "Marcus Hoffmann" <bubu@bubu1.eu>,
 "Pascal de Bruijn" <p.debruijn@unilogic.nl>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <5143eaaa-0c17-4071-ac0b-cb2d894e9049@rnout.be>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <5143eaaa-0c17-4071-ac0b-cb2d894e9049@rnout.be>
X-NTES-SC: AL_Qu2cC/6fu08p4CGeZukfmksSgOg6X8CxuP8g3IRWO5x+jD/p9SQZX1hFFnzM/MuRMSKCviqxfBVJz+t6ZaJGQbAlDn72kM53WTfdi2JunPtI/w==
MIME-Version: 1.0
Message-ID: <76d75683.2757.19e433ff79b.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgBnLWe2Hg1qJ5hkAA--.5407W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4haSIGoNHrZiSgAA3h
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=0HrE7HkQ6y4F9FioXKnEI7FJbY+DfgnZioxhFLxXMCk=; b=H
 Ul3coQK7M7StjHooKD4dvJpzKTsvu3B2pcTu1AVZWnVlFukf2R8FW1PWprTr9a+k
 wdVsoMK3bk4qGobC4AjfGA4w/VJfQ/ELWCyuitFwXE2l3IuEsLCsogIS83FS0tki
 JOB9/z0ibrTGS+QWIGeEBmPMEtbnw5s6RyvvYIG5+A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=HUl3coQK
Subject: Re: [Buildroot] [PATCH 01/40] package/arptables: preserve /usr/sbin
 symlink
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

At 2026-05-19 04:25:46, "Arnout Vandecappelle via buildroot" <buildroot@buildroot.org> wrote:
>
>
>On 07/05/2026 00:33, James Hilliard wrote:
>> With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
>> Using install -D for files below $(TARGET_DIR)/usr/sbin can create
>> the parent directory path and replace that symlink with a real
>> directory.
>
>  Which version of install are you using? It shouldn't do that...
>

I reproduced this issue on Ubuntu 26.04. The problem is caused by Rust's coreutils, see https://github.com/uutils/coreutils/issues/11469#issuecomment-4389604475.

>  Regards,
>  Arnout
>
>> 
>> With per-package directories, this can later make rsync fail when a
>> package target directory contains a non-empty usr/sbin directory and
>> the skeleton provides usr/sbin -> bin.
>> 
>> The skeleton dependency has already created /usr/sbin, either as a
>> directory or as the merged-bin symlink, so use plain install and let it
>> follow the existing path.
>> 
>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> ---
>>   package/arptables/arptables.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
>> index 320a33bb3c..ec65201c86 100644
>> --- a/package/arptables/arptables.mk
>> +++ b/package/arptables/arptables.mk
>> @@ -15,7 +15,7 @@ define ARPTABLES_BUILD_CMDS
>>   endef
>>   
>>   define ARPTABLES_INSTALL_TARGET_CMDS
>> -	$(INSTALL) -m 755 -D $(@D)/arptables-legacy \
>> +	$(INSTALL) -m 755 $(@D)/arptables-legacy \
>>   		$(TARGET_DIR)/usr/sbin/arptables-legacy
>>   endef
>>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
