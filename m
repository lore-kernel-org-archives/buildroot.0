From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 09:52:48 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <1507770391.3839.67.camel@synopsys.com>
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
 <87d191afyw.fsf@dell.be.48ers.dk>
 <20170715214809.2158c3e2@windsurf>
 <87inis8jjj.fsf@dell.be.48ers.dk>
 <20170716164353.GI1482@waldemar-brodkorb.de>
 <246b2393-ffd3-99e5-5de9-db52d73488bb@mind.be>
 <20170718230641.479308e9@windsurf>
 <20170718210704.GO1482@waldemar-brodkorb.de>
 <1507770391.3839.67.camel@synopsys.com>
Message-ID: <20171012095248.1c9839a8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 01:06:32 +0000, Alexey Brodkin wrote:

> 1. As a representative of those minorities who's been living without glibc
> ? ?I'm a bit disappointed to see those packages that "depends on *GLIBC*"
> ? ?especially if that's just a matter of config option in some tool.

Well, we want to provide a user experience that is reasonable for
newcomers, and therefore if a package depends on a uClibc feature that
our default uClibc configuration doesn't enable, the only easy solution
is to add a "depends on !uclibc" or "depends on glibc".

The other options would be:

 * Do not add a dependency. We would get tons of build failures
   reported in the autobuilders, and the results of the autobuilders
   would become unreadable. Our newcomer users would face weird build
   failures when they enable a new package, definitely not the
   experience we want for newcomers.

 * Add more and more Buildroot options to replicate the myriad of
   uClibc configuration options. But then how do we test all of this ?
   Who is going to try and test all the weird combinations ?

> 2. Speaking about bloating of default uClibc config in Buildroot I think
> ? ?we saw movements from both sides but in the same direction:
> ? ? - uClibc's options get removed or become enabled by default to make it
> ? ? ? simpler, cleaner and more robust tool but that inevitable adds a couple
> ? ? ? of hundred bytes here and there. I haven't done comparison of uClibc
> ? ? ? sizes from release to release, but might be Waldemar has some data here.
> ? ? - Buildroot's add-ons to uClibc's defaults also were adding more and more
> ? ? ? things [and some unconditionally]. For example IPv6 is always on now while
> ? ? ? I guess this option adds quite a bit of size.

IPv6 was enable because tons and tons of packages now assume that IPv6
is supported by the C library. We had gazillions of packages that had a
dependency on IPv6.

FTS on the other hand is only needed by very few packages:

 - clamav has fanotify functionality disabled because of this

 - elfutils, but we have worked around this by adding a custom fts
   implementation as a patch

 - libcgroup

 - libselinux/libsemanage

 - a few ltp-testsuite tests, but the biggest part of ltp-testsuite is
   OK.

And that's pretty much it. As you can see, the case for enabling FTS
by default is a lot weaker than the case for enabling IPv6.

> 3. Regarding purity of standards I may agree that we as more knowledgeable
> ? ?engineers need to educate our users and resist temptation to return to
> ? ?deprecated things. But as an advocate of my users I'd say that usability
> ? ?and support of wider packages might be even more important.

Yes, I agree that there is a balance between "purity" and "pragmatism".

I don't have a very strong opinion on this FTS enabled or not. I don't
remember the size measurements with FTS enabled/disabled. Perhaps we
should just enable all features needed by Buildroot packages in our
uClibc configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
