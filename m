From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jun 2018 23:12:48 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
Message-ID: <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-06-18 19:14, Carlos Santos wrote:
> Hi,
> 
> I'm working on a product that needs a swap partition and noticed that
> both package/{busybox,sysvinit}/inittab invoke "swapoff -a" in their
> shutdown sequences but do not invoke "swapon -a". Is this intentional
> or the swapon call is missing (e.g. right after "mount -a")?

 It has been like that since

commit ffde94bd2ca21542ae0b4518348f8e986b9d92e0 (tag: 0_0)
Author: Eric Andersen <andersen@codepoet.org>
Date:   Sat Dec 22 01:56:11 2001

    Initial revision

so whatever reason there was, it is lost in the mists of time.

 IMO I think it's pointless (the kernel will freeze swap accesses before
shutdown) and possibly wrong (swap to file should be disabled before the
corresponding filesystem is unmounted).


 Anyway, the proper way to handle swap is by adding it to fstab, no? I just
checked and busybox seems to support it.

 Regards,
 Arnout


> BTW, what about systemd?


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
