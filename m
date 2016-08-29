From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Mon, 29 Aug 2016 19:47:35 -0400
Subject: [Buildroot] Nearly duplicate builds
In-Reply-To: <f71bd0e0-98b0-249a-0572-5a426e89a622@mind.be>
References: <CAK7rcp8xDcHTkxyd_E0QNPGy37R0693iMUGAWnRb4_akA8a8pg@mail.gmail.com>
 <da0b7f23-509b-82b0-26cf-3d30a9e2d264@mind.be>
 <CAJJ6jxu3mrBgg82c1p2neOno9CtkmimzjrE2G=9BL=RRbfpcDg@mail.gmail.com>
 <f71bd0e0-98b0-249a-0572-5a426e89a622@mind.be>
Message-ID: <CAK7rcp-Mt9Vk6caFXTqT4506hsNDypZ3uVQH-RHaQP15m6eZMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All of this discussion gives me some good ideas.

In so much as a makefile to drive the management of the staging of
each and every package, what I'm thinking of is the possibility to
write a makefile script that would accept as arguments the ability to
include other makefiles, and then use that to wrap the buildroot
system in such a way that it would just instrument the other makefile
targets. In this way, it would add some pre and post steps to each
package target in such a way that no intervention were necessary in
specifying output directory or .stamp file locations for a given
package to be managed by the system.

What I was talking about when I mentioned a "per package basis" for
this tool is the ability to both add and remove a package from being
managed outside of CCACHE, as in the case of the linux kernel, that
could be re-used. My thought is that like you said not all packages
could be cached. But a good many of them could, and you'd need to
specify which one would be managed by the tool.

So, I refined the exact operation that the tool would need to do - it
needs to calculate sharedness on a per enumeration type basis. What I
mean is, instead of having black and white, there are in fact
different levels of sharing that need to be facilitated. Some are
shared across boards. Some are shared across users. Others by all
boards and users. But if you generalize each of those, you can solve
the calculation step so that it just peels layers of the onion back so
that after each step there's one less spec that can be shared. In the
case of boards and users, those are each enumeration types, and
raspberry pi and Adam are each values of those types. But there are
more enums that might be added by different buildroot consumers based
on their own interests, so if it were programmed so that they could do
so, that would give maximum flexibility and code reuse across build
isolation instances.

CCACHE sounds like it would solve a lot, and it probably addresses
what is wanted in the first place. One thing I was thinking of was
having a sort of hash calculation performed in the above step where
the configuration, and the different options for a given shared
package to be built could be used to calculate a checksum that could
then be the argument to a built-packages server/global state metadata
cache, such that, no matter where the items are for any one given enum
value combination, it could still be found and linked to the
appropriate, already built instance. Using the makefile
instrumentation, we could just add a check against the cache to wait
for a given package to finish, that way there is also no discrepancy
or even wasted resources as to which is the appropriate tar/built
resources for a given package. And I'm betting that all of this could
be managed by fs-layers.

Thoughts?

On Mon, Aug 29, 2016 at 5:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 29-08-16 19:54, Steve Calfee wrote:
>> HI Arnout,
>>
>> On Sat, Aug 27, 2016 at 4:46 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>  Hi Kenneth,
>>>
>>>  What you're asking is unfortunately not simple...
>>>
>> snip
>>> externally. Any host tools that are needed by this script can be included in the
>>> external toolchain.
>>>
>>
>> Please explain this line?
>>
>> It seems to me with an external toolchain, the biggest overhead after
>> a make clean is the host tools (especially if you build the linux
>> kernel separately too). If you need python or some other big package
>> building the host stuff is a major time sink. It would be wonderful if
>> the host tools could also be external to the build like the toolchain.
>> I did not know they could be part of the external toolchain?
>
>  You can build anything as part of the external toolchain. However, buildroot
> doesn't recognize whatever you have built as something that is already
> available. In other words, if something depends on the things that you added to
> the external toolchain, it will just get built again instead of using the
> version from the external toolchain.
>
>  For the host tools that you use in a post-build or post-image script, however,
> that doesn't matter, because it's not considered a dependency by buildroot.
>
>  In the proposal I made, the post-image script would be used outside of
> buildroot, so you have to make sure that any host tools you want to use are
> either available on the system, or are part of the external toolchain. The
> latter is IMHO simpler and easier to control.
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
