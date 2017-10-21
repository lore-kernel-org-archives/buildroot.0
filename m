From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 17:08:24 +0200
Subject: [Buildroot] [PATCH] pppd: Do not overwrite /etc/resolv.conf
In-Reply-To: <22237e85-c99b-1000-a339-c8e13e776443@mind.be>
References: <20170828155604.24229-1-jer@airfi.aero>
 <140e8e93-df14-fea5-ada5-4e1aa4636f94@mind.be>
 <CANCHnQq=yjt4HwC8=vpQ17nv8xJMaWtU1CxxF=r9xMM4eq1uNg@mail.gmail.com>
 <22237e85-c99b-1000-a339-c8e13e776443@mind.be>
Message-ID: <4c77149b-69f6-4301-4a25-1baf3a384c71@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jeroen,

On 12-09-17 01:04, Arnout Vandecappelle wrote:
> 
> 
> On 11-09-17 09:58, Jeroen Roovers wrote:
>> On 28 August 2017 at 22:28, Arnout Vandecappelle <arnout@mind.be> wrote:
>  My point is: people who currently use pppd and another network interface
> simultaneously either have something that doesn't really work (unlikely) or have
> fixed it locally (more likely). However, people who currently have a working
> ppp-only setup would no longer have a working setup after updating Buildroot.
> That's something we prefer to avoid.
> 
>  If there is no way to avoid breaking existing configs, we probably indeed
> should still accept this patch because as you say, it does fix things for a
> (probably) more common use case. Well, except it doesn't really fix things,
> because you still need an additional script to actually use the DNS information.
> 
>  Your point 1. is interesting. It suggests that a better solution would be to
> not change pathnames.h at all, but instead symlink /etc/ppp/resolv.conf to
> either /etc/resolv.conf (keeping the current behaviour) or /tmp/ppp-resolv.conf
> (providing the behaviour you want).
> 
> 
>  We recently added a "Migrating" section in the Buildroot manual. So what we
> could do is:
> 1. ln -s ../../tmp/ppp-resolv.conf $(TARGET_DIR)/etc/ppp/resolv.conf
> 2. Add a paragraph to the Migrating section explaining that a configuration that
> was using pppd with usepeerdns needs to either enable dnsmasq or to symlink
> $(TARGET_DIR)/etc/ppp/resolv.conf to /tmp/resolv.conf or to create a
> /etc/ppp/ip-up script.
> 
>  Does that sound reasonable?

 I imagine that my proposed solution is way too complicated. So instead, I
applied the patch from Maksim Salau [1]. It is also very simple, like yours, but
in addition it keeps backward compatibility.

 A more extended solution can still be added in the future.

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/826889/


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
