From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 22:55:24 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <87pog3ypb1.fsf@dell.be.48ers.dk>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
 <87pog3ypb1.fsf@dell.be.48ers.dk>
Message-ID: <8b127902-0268-8307-70da-065362773da9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-04-17 20:03, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Fri, 14 Apr 2017 19:00:32 +0200, Arnout Vandecappelle wrote:
> 
>  >> This is the correct approach I think. I think we could also do this for all the
>  >> other cases where we have a -> busybox dependency just because they install the
>  >> same apps.
> 
>  > Yes, I'm also wondering if it isn't better to disable the Busybox
>  > applets (like Matt does in this patch for ncurses) rather then
>  > overwriting the symlinks.
> 
>  > First of all, overwriting the symlinks means that if you "make
>  > busybox-reinstall", you no longer get the right thing (for sure, we
>  > never guarantee that partial builds/rebuilds give the correct output,
>  > but it's nice when they do). And then of course, it means that there is
>  > code in Busybox, consuming some space, that is never used.
> 
>  > The only annoyance that I can see is a potential blotification of
>  > busybox.mk, with lots of conditional for various packages.
> 
> That and the fact that we're adding more "magic" to silently override
> the configuration behind the users' back. I get it that people may be
> less likely to tweak their busybox config than E.G. the kernel, but just
> like for the kernel config I prefer to keep the config overrides to the
> minimum.

 Well, we are "overriding" the user's busybox config, but since the alternative
is deleting the busybox-installed tool, whatever the user has configured is not
available anyway...

 Well, except that it still is available by calling it as "busybox clear".

 So, the choice comes down to:

1. Add a dependency on busybox like we do now, but it's actually a fake
dependency and can lead to circular dependencies. And it's anyway not failsafe
because a "busybox-rebuild" will again overwrite it. On addition, it has the
bloatification that Thomas mentions.

2. Make sure that busybox doesn't overwrite a tool that already exists. Needs to
be done for all the different ways that busybox can install things. Then the
order doesn't matter. Great solution, except for the bloatification. Also, it is
not great when you have FEATURE_INDIVIDUAL selected in busybox, because a
busybox-rebuild will not actually rebuild anything.

3. Like proposed in this patch, adapt busybox config. Has the advantage of no
bloatification, but it means that the user sees his own config overridden which
isn't nice. In addition, it's quite ugly for the busybox.mk to have all these
references to other packages (about 40!).


 Of course, we can also choose to apply solution 3 only to the situation where 1
doesn't work because of circular dependencies.


 I can't say which solution is the best. I therefore tend to say: stick to what
we have, and find a workaround if needed. In other words, apply this patch, but
don't do it for other packages until required.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
