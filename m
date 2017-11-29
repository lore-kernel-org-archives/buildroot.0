From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 29 Nov 2017 22:19:27 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <d76cd131-a5ec-631d-4c8b-4bb3d09fd2ca@mind.be>
References: <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118223206.069b771a@gmx.net>
 <20171121201605.tzmasudql66iruxa@dell5510>
 <20171125150144.GC2798@scaer>
 <d76cd131-a5ec-631d-4c8b-4bb3d09fd2ca@mind.be>
Message-ID: <20171129211926.GA16373@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > So, this is a change in behaviour, and should be reported upstream as a
> > bug. Will you do so?

>  As I explained in the extended commit message when I applied the patch fixing
> this (b9d2d4cb4eb: "Fix makefile include order by using sort/wildcard.") make
> actually has had this behaviour "forever" (since make 3.82). It calls glob with
> GLOB_NOSORT. Note that in most of the cases where we didn't already do $(sort
> $(wildcard ...)), the order actually doesn't (or shouldn't) matter. For example,
> package/*/*.mk hopefully does not depend on the order. In other words, it's very
> likely that nobody notices if things get included in the "wrong" order.
Even though I understand that the change in 3.82 you pointed out *should* change the
behavior, it's different: 3.82 is working.

>  As far as I could see, only the external-toolchain-package really could cause
> any problems.

>  So my guess is that the bisected commit really has nothing to do with it, it
> just happens to trigger the random ordering issue.
I don't understand changes in 4fd5672 ("Use Jenkins hash.") [2], but it does it
permanently (I tested it several times). That's why I thought it would be good to notify
upstream. Now I'm not sure (I haven't reported it yet).

>  Now that I look at it again, however, it looks like we haven't been able to
> adequately explain why this issue suddenly occurred... First of all,
> external-toolchain-package has existed for a year now, so if it is truly random
> we'd expect someone to have noticed before. Also, the change in Tumbleweed that
> Petr pointed to [1] should actually *fix* the issue, because it removes the
> NOSORT. Debian and Ubuntu, conversely, have no such patch so the autobuilders
> should see this issue (they use external toolchains a lot)...
I've been testing buildroot in Debian unstable for few years and in openSUSE Tumbleweed
for about one year. I never noticed this, until now. You can see from [3], that the only
thing that changed in openSUSE's make is glob-lstat.patch [4]. It actually changes glob,
so it can be relevant. I can test it with and without it this week.
In Debian I've been testing it probably on 3.81, 4.0 and 4.1.

>  /me is confused again...


>  Regards,
>  Arnout


Kind regards,
Petr


[1] https://build.opensuse.org/package/view_file/Base:System/make/make-sorted-glob.patch?expand=1
[2] https://git.savannah.gnu.org/cgit/make.git/commit/?id=4fd56724ad281498d3c8b27a4b25b4070f6e4e65
[3] https://build.opensuse.org/package/view_file/Base:System/make/make.changes?expand=1
[4] https://build.opensuse.org/package/view_file/Base:System/make/glob-lstat.patch?expand=1
