From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 01:23:42 +0100
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <87mulqebah.fsf@dell.be.48ers.dk>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
Message-ID: <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/03/2019 23:42, Peter Korsgaard wrote:
>>>>>> "Esben" == Esben Haabendal <esben.haabendal@gmail.com> writes:
> 
>  > From: Esben Haabendal <esben@haabendal.dk>
>  > What do you think. Is this kind of micro-management of a configuration
>  > file something that I should keep out of tree?
> 
> We discussed it tonight on IRC and didn't really get to a good compromise.
> 
> On one hand, we prefer to stick with upstream defaults (especially when
> security is involved)

 This patch doesn't change the defaults.

> , but it is true that dropbear allows root logins
> by default.

 It's not nice that the default for dropbear and ssh is different, but that has
little to do with deciding if this kind of configurability is relevant or not.

> We prefer to not add configuration options for these kind of
> detailed policy decisions,

 *That* is the crux of the matter. We normally only have configurability of
compile-time options, and assume that anything else is handled in post-build
scripts. The (only?) exception to that principle is the system menu.

 So *maybe* something global in the system menu could work, and then dropbear
and openssh and whatnot would do whatever is needed to permit/disallow root
login for that particular package. But I'm not exactly ecstatic about that option.

> as openssh has a LOT of other configuration
> options

 True, but permitting root login is clearly one that is a lot more
important/relevant than all the others. Currently, the typical user will naively
enable openssh, then try to ssh into the device, and fail...

> But silently allowing root logins when we have "always"
> disallowed it in the past also isn't nice.

 This is *definitely* a no-no.


> So all in all, this kind of policy tweaks are better done in a post
> build script.

 In the few projects where I've seen openssh used, it was always with a custom
config file. Otherwise, there's not much reason to use openssh instead of
dropbear I guess.

 Regards,
 Arnout
