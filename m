From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Nov 2017 17:34:11 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171125150144.GC2798@scaer>
References: <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net> <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118223206.069b771a@gmx.net> <20171121201605.tzmasudql66iruxa@dell5510>
 <20171125150144.GC2798@scaer>
Message-ID: <d76cd131-a5ec-631d-4c8b-4bb3d09fd2ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-11-17 16:01, Yann E. MORIN wrote:
> Petr, All,
> 
> On 2017-11-21 21:16 +0100, Petr Vorel spake thusly:
>>>>  If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
>>>> always come before toolchain-external.mk. Otherwise it is possible (depending on
>>>> the state of hash tables or inode numbers or whatever) that
>>>> toolchain-external-custom.mk gets included first.
> [--SNIP--]
>> I found by bisecting that our bug is caused by this change in make:
>> 4fd5672 ("Use Jenkins hash.")
>> https://git.savannah.gnu.org/cgit/make.git/commit/?id=4fd56724ad281498d3c8b27a4b25b4070f6e4e65
> 
> Good work at bisecting it! :-)
> 
>> It's a version after last release (4.2.1).
>> I wonder whether it's a bug in make (I guess so) and whether we should report it
>> (probably).
> 
> This is indeed a change in behaviour. However, as make ever documented
> a guranteed/non-guaranteed ordering of wildcards to begin with?
> 
> The manual for the current make version says nothing about the ordering,
> and neither do the manual for older versions (I've checked only a few of
> them).
> 
> So, this is a change in behaviour, and should be reported upstream as a
> bug. Will you do so?

 As I explained in the extended commit message when I applied the patch fixing
this (b9d2d4cb4eb: "Fix makefile include order by using sort/wildcard.") make
actually has had this behaviour "forever" (since make 3.82). It calls glob with
GLOB_NOSORT. Note that in most of the cases where we didn't already do $(sort
$(wildcard ...)), the order actually doesn't (or shouldn't) matter. For example,
package/*/*.mk hopefully does not depend on the order. In other words, it's very
likely that nobody notices if things get included in the "wrong" order.

 As far as I could see, only the external-toolchain-package really could cause
any problems.

 So my guess is that the bisected commit really has nothing to do with it, it
just happens to trigger the random ordering issue.

 Now that I look at it again, however, it looks like we haven't been able to
adequately explain why this issue suddenly occurred... First of all,
external-toolchain-package has existed for a year now, so if it is truly random
we'd expect someone to have noticed before. Also, the change in Tumbleweed that
Petr pointed to [1] should actually *fix* the issue, because it removes the
NOSORT. Debian and Ubuntu, conversely, have no such patch so the autobuilders
should see this issue (they use external toolchains a lot)...

 /me is confused again...


 Regards,
 Arnout


[1]
https://build.opensuse.org/package/view_file/Base:System/make/make-sorted-glob.patch?expand=1


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
