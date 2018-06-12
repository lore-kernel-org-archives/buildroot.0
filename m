From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jun 2018 15:34:21 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <87in6o6u5n.fsf@dell.be.48ers.dk>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
 <87zi0074sa.fsf@dell.be.48ers.dk>
 <909872342.136921.1528804345151.JavaMail.zimbra@datacom.com.br>
 <87in6o6u5n.fsf@dell.be.48ers.dk>
Message-ID: <598a385a-5693-8fff-876c-550063645a50@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-06-18 14:55, Peter Korsgaard wrote:
>>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:
> 
> Hi,
> 
>  >> >  So bottom line: it would make sense to add a swapon -a to the default inittabs
>  >> > (both busybox and sysv).
>  >> 
>  >> Don't we then end up with an ugly error message / somewhat needlessly bloat
>  >> everyones busybox config for the (very common) situation where swap is
>  >> not used and disabled in the kernel?
> 
>  > A "swapon -a" does nothing if a swap entry is not found in /etc/fstab,
>  > so there is no error message. Conversely, a "swapoff -a" does nothing
>  > if a mounted swap is not found but I did not test if it issues some
>  > error message due to a failing system call when swap is disabled in
>  > the kernel. I will run some tests and submit an additional patch, if
>  > necessary.
> 
> It does not:
> 
> grep CONFIG_SWAP .config
> # CONFIG_SWAP is not set
> 
> # swapon -a ; echo $?
> 0
> 
> But it does require people to add swapon/swapoff to their busybox config
> even if they aren't using swap, otherwise they would get error messages

 I think if people start customizing the busybox config and remove stuff from
it, then it's only reasonable that they also modify the default inittab. Swapon
and swapoff are both enabled in our busybox.config and busybox-minimal.config.

 Regards,
 Arnout

> at bootup/shutdown (I know they already get it at shutdown, but an
> orderly shutdown is a lot more rare than bootup).
> 
> But ok, the swapon/swapoff applet is very small, so I guess that is OK.
> 
> size util-linux/swaponoff.o
>    text    data     bss     dec     hex filename
>     597       0       0     597     255 util-linux/swaponoff.o
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
