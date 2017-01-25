From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 14:27:16 +1300
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
Message-ID: <20170125142716.55e7d7b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 22:48:08 +0100, Romain Naour wrote:

> > - Keep a global option - the one in my patch - but only apply it on packages
> > that will define a specific package variable to say "OK I can do it"?  
> 
> Yes, something like that but It's just a proposal...
> 
> <package>_SUPPORT_NINJA_BACKEND = YES in the .mk
> (with default to N0)

But then that's a bit annoying because we would have to explicitly
set this option to "YES" on all packages that support the Ninja backend
(most likely the majority).

I think it would make more sense to default the other way around, i.e
default to YES, and set it to NO on the few packages that do not
properly support the Ninja backend.

Or maybe better: do not introduce a per-package option for the moment,
have only the global one, see in practice how many packages work /
don't work and decide if we need a per-package option, and what default
value it should have.

> w/ Ninja
> 
> cannelloni
> real	0m10.009s
> user	0m8.771s
> sys	0m0.885s
> 
> bullet
> real	0m43.750s
> user	1m4.464s
> sys	0m4.356s
> 
> w/ Make
> 
> cannelloni
> real	0m11.478s
> user	0m9.282s
> sys	0m1.127s
> 
> bullet
> real	0m45.234s
> user	1m4.213s
> sys	0m5.501s

So we're saving between 1 and 2 seconds of build time, while host-ninja
requires building host-python or host-python3 ?

Seeing those numbers, the whole thing seems really pointless to me.
You're saving 1-2 seconds of build time, but you've got a full Python
interpreter to build.

Would it be possible to get numbers on the overall build time showing
what Ninja is improving?

> >> I think these changes should be in a preparatory patch before adding Ninja
> >> backend support.  
> > 
> > Sorry I don't understand what you mean with "preparatory patch".  
> 
> Sorry, I meant you can do a first patch with these changes in pkg-cmake.mk
> (refactoring) and add the Ninja in a second patch.
> I suggest to do this since it impact the cmake with Make backend build.

I looked again at the patch, and I don't really see where it can be
split in two parts. Which changes do you see as "preparatory" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
