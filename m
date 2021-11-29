Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE85C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F5960A99;
	Mon, 29 Nov 2021 17:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LtsZiU8GMus; Mon, 29 Nov 2021 17:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E681C60A97;
	Mon, 29 Nov 2021 17:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 522681BF392
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3241B40128
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4CHEBcpE3BE for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 17:19:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 850384010A
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 17:19:53 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-62-Zw7X_i-zOuSutphaT6aE8g-1; Mon, 29 Nov 2021 17:19:49 +0000
X-MC-Unique: Zw7X_i-zOuSutphaT6aE8g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 17:19:49 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Mon, 29 Nov 2021 17:19:49 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: DHCP default.script
Thread-Index: AdflRRWl50vMBTqNTvKf7Q5EylNhqQ==
Date: Mon, 29 Nov 2021 17:19:49 +0000
Message-ID: <e3ba29bfce7a4de3aa95a105146eadbf@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: [Buildroot] DHCP default.script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I was looking at the DHCP default.script (that ends up in /usr/share/udhcpd)
and found some quite nasty problems.
I've fixed them locally and ended up with the script below.
(Which is probably easier to read than a diff.)
I've ripped out ahavi - we don't need it (and i don't know what it does!).

The main problems:
1) On a 'renew' indication it would delete all the routes and then
   add the supplied routes back in.
   This leaves the system missing routes (typically the default one)
   for a while - which can lead to lost transmit packets.
   I've done a 'mark and scan' to only delete routes that no longer exist.

2) On a 'renew' it would delete all routes, not just the one added
   by dhcp.
   The 'proto dhcp' parameter can be used to identify routes added by
   dhcp so that they are the only ones deleted (this matches my desktop).

3) If both IPv6 and IPv4 DHCP are used the entries for both protocols
   get removed from resolve.conf.
   They should only remove their own entries.
   It is also not necessary to use a temporary file.

4) When 'deconfig' is done for IPv6 it removes the IPv4 address!
   I've split the IPv4 and IPv6 paths to ensure they don't tread
   on each other.
   The IPv6 address is saved in a file - I think it should be possible
   to 'tag' the address (much like the routes).

In reality it needs quite a few patches - but I've not got the git
tree and generating them is quite hard for me even if I download it.

Thoughts?

	David



#!/bin/sh

# udhcpc script losely based on the buildroot default.script

[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1


nl="$(printf '\nx')"
nl="${nl%x}"

update_resolv_conf()
{
	: ${RESOLV_CONF:=/etc/resolv.conf}

	marker=$interface$1
	# drop info from this interface
	# resolv.conf may be a symlink to /tmp/, so take care
	resolv_conf="$(grep -vE "# $marker\$" $RESOLV_CONF 2>/dev/null)"

	if [ "$2" = update ]; then
		# prefer rfc3397 domain search list (option 119) if available
		if [ -n "$search" ]; then
			search_list=$search
		elif [ -n "$domain" ]; then
			search_list=$domain
		fi

		[ -n "$search_list" ] &&
			resolv_conf="${resolv_conf}${nl}search $search_list # $marker"

		for i in $dns ; do
			echo adding dns $i
			resolv_conf="${resolv_conf}${nl}nameserver $i # $marker"
		done
	fi

	# Hopefully nothing tries a lookup while the file is empty.
	echo "$resolv_conf" >$RESOLV_CONF
}

update_routes()
{
	ipv=$1

	# RFC3442: If the DHCP server returns both a Classless
	# Static Routes option and a Router option, the DHCP
	# client MUST ignore the Router option.
	if [ -z "$staticroutes" ]; then
		for gw in $router ; do
			staticroutes="${staticroutes} default $gw"
		done
	fi

	old_routes=' '
	routes="$(ip $ipv route show proto dhcp dev "$interface" 2>/dev/null)"
	IFS="$nl"
	for rt in $routes; do
		IFS=' '
		set -- $rt # addr via gateway ...
		[ "$2" = via ] && old_routes="$old_routes$1@$3 "
	done
	IFS=' '

	# format: dest1/mask gw1 ... destn/mask gwn
	set -- $staticroutes
	while [  "$#" -ge 2 ]; do
		x="${old_routes#* $1@$2 }"
		if [ "$x" = "$old_routes" ]; then
			ip $ipv route add "$1" via "$2" proto dhcp dev "$interface"
		else
			old_routes="${old_routes% $1@$2 } $x"
		fi
		shift 2
	done

	# Delete any routes that have gone away
	for route in $old_routes; do
		echo ip $ipv route delete ${route%@*} via ${route#*@} proto dhcp dev "$interface"
	done
}

if [ -z "$ipv6" ]; then
	case "$1" in
	deconfig)
		/sbin/ifconfig $interface up
		/sbin/ifconfig $interface 0.0.0.0

		update_resolv_conf -4
		;;

	leasefail|nak)
		;;

	renew|bound)
		/sbin/ifconfig $interface $ip ${broadcast:+broadcast $broadcast} ${subnet:+netmask $subnet}

		update_routes -4

		update_resolv_conf -4 update
		;;
	esac
else
	case "$1" in
	deconfig)
		addr=`cat /var/run/dhcp.$interface.addr`
		if [ "$addr" != "" ]; then
			ip -6 addr del $addr dev $interface
			echo "" > /var/run/dhcp.$interface.addr
		fi

		update_resolv_conf -6
		;;

	leasefail|nak)
		;;

	renew|bound)
		ip -6 addr add $ipv6 dev $interface
		echo $ipv6 > /var/run/dhcp.$interface.addr

		update_routes -6

		update_resolv_conf -6 update
		;;
	esac
fi

exit 0

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
