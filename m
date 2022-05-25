Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7036C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 12:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EEB612F3;
	Wed, 25 May 2022 12:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCnU1KlcrP3c; Wed, 25 May 2022 12:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 596D9612EA;
	Wed, 25 May 2022 12:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38CAC1BF82C
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 12:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2476F4168A
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 12:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFu7RfLD3QHS for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 12:12:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C720B4160D
 for <buildroot@buildroot.org>; Wed, 25 May 2022 12:12:54 +0000 (UTC)
Received: from [77.244.183.192] (port=63506 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ntpsh-000GrV-7r; Wed, 25 May 2022 14:12:51 +0200
Message-ID: <1325638a-c5a9-3795-d282-c0a6accee081@lucaceresoli.net>
Date: Wed, 25 May 2022 14:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: it-IT
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220525085717.GC301044@scaer>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220525085717.GC301044@scaer>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: giulio.benetti@benettiengineering.com, wesley@sonifex.co.uk,
 michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal, Yann,

On 25/05/22 10:57, Yann E. MORIN wrote:
> Neal, All,
> 
> On 2022-05-22 07:15 -0600, Neal Frager via buildroot spake thusly:
>> This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
>> extlinux.conf file, so developers will only need to modify the
>> board_defconfig file to change the console and boot file system locations.
>>
>> Signed-off-by: Neal Frager <neal.frager@amd.com>
>> ---
>>  board/zynqmp/post-build.sh | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
>> index 9fd8bbf2c8..749784c3f3 100755
>> --- a/board/zynqmp/post-build.sh
>> +++ b/board/zynqmp/post-build.sh
>> @@ -4,5 +4,19 @@
>>  # in the binaries directory
>>  
>>  BOARD_DIR="$(dirname $0)"
>> +CONSOLE=$2
>> +ROOT=$3
>> +
>> +FILE=$BOARD_DIR/extlinux.conf
>> +if test -f "$FILE"; then
>> +    echo "$FILE aready exists."
>> +else
>> +  cat << __HEADER_EOF >> $BOARD_DIR/extlinux.conf
> 
> Why would you need append-redirection >> ? Afterall, you just tested
> that the file did not already exist... Anyway, see below...

Sure, '>' is enough here.

>> +label linux
>> +  kernel /Image
>> +  devicetree /system.dtb
>> +  append console=$CONSOLE root=/dev/$ROOT rw rootwait
>> +__HEADER_EOF
>> +fi
>>
>>  install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
> 
> We try to avoid generating files in the source tree.
> 
> Instead, why not just:
> 
>     FILE="${BOARD_DIR}/extlinux.conf"
>     if test -f "$FILE"; then
>         install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"

Right, but use "${FILE}" after -D.

>     else
>         mkdir -p "${BINARIES_DIR}"
>         cat <<-__HEADER_EOF >"${BINARIES_DIR}/extlinux.conf"
>     TAB>label linux
>     TAB>  kernel /Image
>     TAB>  devicetree /system.dtb
>     TAB>  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
>     TAB>__HEADER_EOF
>     fi
> 
> Note: the <<- rediretion removes leading TABs, so it is allows a nicer
> indentation (so, replace TAB> above with an actual TAB, of course).

It's amazing how I always have some more shell trick to learn from Yann! :-D

> Also, please always evaluate variables using curly braces and quote the
> expansion, like so:   "${foo}"   (in the here-document, quotes are not
> needed, of course).
> 
> Eventualy, at the end of this series, the script will always be used for
> boards that do not already have an extlinux.conf, the condition can be
> dropped in a final patch, to just only keep the else part of the
> condition, don't you think?

Good point as well.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
