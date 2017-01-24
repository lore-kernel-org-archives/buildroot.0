From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 24 Jan 2017 22:48:08 +0100
Subject: [Buildroot] [PATCH 1/2] Add BR2_CMAKE_USE_NINJA_BACKEND option
In-Reply-To: <2260e784237284271ff7745986b82cc8@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
Message-ID: <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi C?dric,

Le 23/01/2017 ? 14:39, C?dric Marie a ?crit :
> Hi,
> 
> Le 2017-01-21 23:25, Romain Naour a ?crit :
>> There are currently 146 packages using CMake in Buildroot, I'm not sure all of
>> them support ninja backend yet.
> 
> I don't think there is anything specific to a package that can make it support
> ninja backend or not.
> CMake provides several backends, and the result is expected to be the same
> whatever the backend. If not, this is a bug in CMake.

Ok.

> 
>> I would suggest to enable Ninja backend package by package when it has
>> been tested.
> 
> What do you mean exactly "enable Ninja backend package by package"?
> - Add an option for each package?

no

> - Switch to ninja backend if supported by the package, without option (i.e.
> force ninja backend)?

no

> - Keep a global option - the one in my patch - but only apply it on packages
> that will define a specific package variable to say "OK I can do it"?

Yes, something like that but It's just a proposal...

<package>_SUPPORT_NINJA_BACKEND = YES in the .mk
(with default to N0)

> 
> My point of view is that we should keep a global option - that could be
> described as experimental - and never enable it in an official defconfig.
> If someone enables it, and find a package that does not compile with ninja
> backend, he can either disable the option (he knows that it is experimental),
> or/and send a bug to either CMake or the package maintainer.

Keep in mind that this new option will certainly be enabled in the generated
defconfigs for the autobuilders. So it may break several packages quickly.

For example, the openpowerlink package break with Ninja backend but I think it's
a bug in the CMakeLists.txt. I don't think openpowerlink maintainers ever used
Ninja and me neither until now. I'll take a look.

> 
> Moreover, I think we can't just say "this package is ninja compliant". Maybe if
> we change a single option in configure step, it will not compile anymore.

Maybe something like this (untested):

ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
ifeq ($$($(2)_SUPPORT_NINJA_BACKEND),YES)
$(2)_CONF_OPTS += -G Ninja
$(2)_DEPENDENCIES += host-ninja
endif
endif

It's really a proposal, If you're not convinced let's see other comments/reviews.

Also, did you do some time measurements with/without Ninja ?

Here are some results on my host:

make menuconfig (enable/disable the Ninja option)
make <package> (first build from scratch)
make <package>-dirclean
time make <package>-build

w/ Ninja

cannelloni
real	0m10.009s
user	0m8.771s
sys	0m0.885s

bullet
real	0m43.750s
user	1m4.464s
sys	0m4.356s

w/ Make

cannelloni
real	0m11.478s
user	0m9.282s
sys	0m1.127s

bullet
real	0m45.234s
user	1m4.213s
sys	0m5.501s

So, yes Ninja is slightly faster than Make.
It would be great if you can add some test results in the commit log.

> 
> Let me know what you're expecting exactly...
> 
>> Indent with one tab.
>> Indent with one tab and 2 spaces.
> 
> OK, sorry for that, didn't pay enough attention.

No problem.

> 
> 
>> I think these changes should be in a preparatory patch before adding Ninja
>> backend support.
> 
> Sorry I don't understand what you mean with "preparatory patch".

Sorry, I meant you can do a first patch with these changes in pkg-cmake.mk
(refactoring) and add the Ninja in a second patch.
I suggest to do this since it impact the cmake with Make backend build.

Best regards,
Romain

> 
> Regards,
> 
