From: daggs <daggs@gmx.com>
Date: Sat, 25 Feb 2017 11:54:29 +0100
Subject: [Buildroot] [1/2] first_boot_rootfs_resizer: New Package.
In-Reply-To: <3158593.OjcTtQLqz9@sagittea>
References: <20161202101028.26736-1-daggs@gmx.com>,
 <3158593.OjcTtQLqz9@sagittea>
Message-ID: <trinity-bd87b014-3970-45bb-b055-1bbbf2420589-1488020069291@3capp-mailcom-bs05>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Friday 02 December 2016 12:10:27 daggs wrote:
> [...]
> > +	p2_start=`fdisk -l ${DEV} | grep ${PART} | awk '{print $2}'`
> > +	p2_finish=`fdisk -l ${DEV} | grep sectors | awk '{printf $5}'`
> > +
> > +	fdisk ${DEV} <<EOF
> > +p
> > +d
> > +2
> > +n
> > +p
> > +2
> > +$p2_start
> > +$p2_finish
> > +p
> > +w
> > +EOF
> 
> This script always resize 2nd partition, isn't? Is it the expected 
> behavior? I think it should resize last partition.
> 
> For information, I wrote a similar script for a customer some time ago: 
> 
> for part in 4 3 2 1; do
>     for file in ${device}${part} ${device}p${part}; do
>         if [ -e $file ]; then
>             echo ',+,' | sfdisk -q -L -D -uM -N $part $device
>             [ $? -eq 0 ] || exit 1
>             resize2fs -p $file
>             [ $? -eq 0 ] || exit 1
>             e2fsck -f $file
>             [ $? -le 1 ] || exit 1
>             exit 0
>         fi
>     done
> done
> 
> Also note, we did use this script during flash procedure, not during 
> first boot. Therefore, we do not need to detect first boot (and I think 
> it is safer).
> 
> BR,
> 

Thanks, will take that into account on later stage.

Dagg.
