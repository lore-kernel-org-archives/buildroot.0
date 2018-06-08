From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 8 Jun 2018 08:38:19 -0300 (BRT)
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
Message-ID: <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "DATACOM" <casantos@datacom.com.br>, "buildroot" <buildroot@buildroot.org>
> Sent: Thursday, June 7, 2018 6:12:48 PM
> Subject: Re: [Buildroot] swapoff, but no swapon in initab

> On 06-06-18 19:14, Carlos Santos wrote:
>> Hi,
>> 
>> I'm working on a product that needs a swap partition and noticed that
>> both package/{busybox,sysvinit}/inittab invoke "swapoff -a" in their
>> shutdown sequences but do not invoke "swapon -a". Is this intentional
>> or the swapon call is missing (e.g. right after "mount -a")?
> 
> It has been like that since
> 
> commit ffde94bd2ca21542ae0b4518348f8e986b9d92e0 (tag: 0_0)
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Dec 22 01:56:11 2001
> 
>    Initial revision
> 
> so whatever reason there was, it is lost in the mists of time.
> 
> IMO I think it's pointless (the kernel will freeze swap accesses before
> shutdown) and possibly wrong (swap to file should be disabled before the
> corresponding filesystem is unmounted).
> 
> 
> Anyway, the proper way to handle swap is by adding it to fstab, no? I just
> checked and busybox seems to support it.

The point here is that I'd like to avoid adding yet another init script
just to call swap{on,off} in its st{art,op} phase. A "swapon -a" in
inittab would inspect /etc/fstab, as stated in the man page:

  "All devices marked as ``swap'' in /etc/fstab are made available,
   except for those with the ``noauto'' option. Devices that are
   already being used as swap are silently skipped."

So even if the system already has such init script (e.g. from a
rootfs ovelay) a second call would be harmless.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
