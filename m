From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 19:43:59 +0100
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
 wait for slow network interfaces
In-Reply-To: <CAGduivwa-qfDjTNoryRgCV=ZCmDVUa5A8TXTYLbzZ7mcJOY-fA@mail.gmail.com>
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
 <20151003164732.28d042e6@free-electrons.com>
 <CAGduivwa-qfDjTNoryRgCV=ZCmDVUa5A8TXTYLbzZ7mcJOY-fA@mail.gmail.com>
Message-ID: <561021EF.7020105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 19:29, Maxime Hadjinlian wrote:
> 
> 
> On Sat, Oct 3, 2015 at 5:47 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
> 
>     Hello,
> 
>     On Sat,  3 Oct 2015 14:31:45 +0100, Yann E. MORIN wrote:
> 
>     > +    printf "Waiting for interface %s to appear" "${IF}"
>     > +    wait=${WAIT_DELAY}
>     > +    while [ ${wait} -gt 0 ]; do
>     > +        if [ -e "/sys/class/net/${IF}" ]; then
>     > +            printf " yes\n"
>     > +            return 0
>     > +        fi
>     > +        sleep 1
>     > +        printf "."
>     > +        : $((wait--))
>     > +    done
> 
>     One thing that I really like in Buildroot is that by default, it
>     generates you a system that boots really fast. People often don't have
>     to do anything special with Buildroot to make it boot fast. So having a
>     shell script that is installed by default and does a "sleep 1" in a
>     loop is not very nice :-/
> 
>     Though I agree that it will only slow the boot on systems where the
>     network interfaces are not available immediately at boot time.
> 
> I have that trouble too but instead of doing a sleep 1, I "hammer" the system
> with sleep 0.1 or usleep 25 if it's available (even usleep 1 can work, since
> it's not RT, it takes around 10ms).

 Since sysv init is not parallel, you're not even hammering the system since
nothing else is going on except perhaps some hotplug callbacks.

 Regards,
 Arnout

> This way it's almost transparent and add the necessary requirements before going
> on with the boot.
> 
> 
>     Thomas
>     --
>     Thomas Petazzoni, CTO, Free Electrons
>     Embedded Linux, Kernel and Android engineering
>     http://free-electrons.com
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
