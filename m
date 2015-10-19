From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 12:15:40 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <4678408.ifdbXGka0U@sagittea> (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Mon, 19 Oct 2015 10:47:10 +0200")
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
 <4678408.ifdbXGka0U@sagittea>
Message-ID: <87a8rf88qb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

Hi,

> I am a bit late to do the review, but why not add a script in 
 > /etc/network/if-pre-up.d ? For example (notice $IFACE and $IF_MAXWAIT 
 > are set by ifupdown):

 > #! /bin/sh
 > if [ "${IF_MAXWAIT}" ]; then
 >     printf "Waiting for interface %s to appear" "${IFACE}"
 >     while [ ${IF_MAXWAIT} -gt 0 ]; do
 >         if [ -e "/sys/class/net/${IFACE}" ]; then
 >             printf " yes\n"
 >             exit 0
 >         fi
 >         sleep 1
 >         printf "."
 >         : $((wait--))
 >     done
 >     printf " no.\n"
 >     exit 1
 > fi

That's certainly also an option. Care to send a patch reworking the
logic in S40network to a pre-up.d hook?

 > Next, interface would use "maxwait" property in /etc/network/interface:

 > auto eth0
 > iface eth0 inet dhcp
 >     maxwait 15

Then our BR2_SYSTEM_DHCP logic should probably also be adapted to add
'maxwait 15' by default.

Thanks!

-- 
Bye, Peter Korsgaard
