From: Matthew Weber <matt@thewebers.ws>
Date: Sun, 28 Aug 2016 15:53:03 -0500
Subject: [Buildroot] [PATCHv2] pckages/sconeserver: fix build with gcc-6
In-Reply-To: <20160828180603.GD5758@free.fr>
References: <1472111153-14215-1-git-send-email-yann.morin.1998@free.fr>
 <20160825102650.0acafa05@free-electrons.com>
 <CAFt09wOQ9fOLGkdbM-Jtuw9G_tizsO8103x317ADp2Rf+YU7wQ@mail.gmail.com>
 <20160828180603.GD5758@free.fr>
Message-ID: <CAFt09wMT-wfs1y5qb5a-=RcpmuJ-zJZqn+0KsSJ4VTzbhD0BDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Aug 28, 2016 at 1:06 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Matt, All,
>
> On 2016-08-27 07:38 -0500, Matthew Weber spake thusly:
>> On Thu, Aug 25, 2016 at 3:26 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Hello,
>> >
>> > On Thu, 25 Aug 2016 09:45:53 +0200, Yann E. MORIN wrote:
>> >> We simply bump the version rather than backport the patch, as there has
>> >> been only very few, minor commits in-between.
>> >>
>> >> Fixes:
>> >>     http://autobuild.buildroot.org/results/fa7/fa7881c6ffb821a2aff139f95ba53c96d6e2b942/
>> >>     http://autobuild.buildroot.org/results/749/749fbd6cc505f6f3c0cccfeb63be6deddab8fba5/
>> >>
>> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> >>
>> <snip>
>>
>> Looks like the new revision has a failed build.
>> http://autobuild.buildroot.org/results/e92/e929799366e6f574c7b08d8635b18623afd3e3e1//
>>
>> ModuleLoader.cpp:29:19: fatal error: dlfcn.h: No such file or directory
>>  #include <dlfcn.h>
>>                    ^
>> I didn't have a chance to check if the conf opts for disable-load
>> works on this package yet but that might fix it (assuming it can be
>> statically built).
>>
>> When I first rebuilt, I tried just doing a "make clean sconeserver"
>> and got this error.
>>
>> configure.in:118: error: possibly undefined macro: AC_MSG_FAILURE
>>       If this token and others are legitimate, please use m4_pattern_allow.
>>       See the Autoconf documentation.
>> configure.in:120: error: possibly undefined macro: AC_MSG_WARN
>> autoreconf: /home/mlweber/buildroot/output/host/usr/bin/autoconf
>> failed with exit status: 1
>> package/pkg-generic.mk:191: recipe for target
>> '/home/mlweber/buildroot/output/build/sconeserver-d659468cd164e6a6cc12932cc6780566b04f8328/.stamp_configured'
>> failed
>>
>> I haven't had a chance to look into why but thought I'd get it out there.
>
> OK, so I finally had the time to give it a shot:
>
>   - the autoreconf issue is because it uses pkg-config macros, and it
>     was missing a dependency on host-pkgconf,
>
>   - the build issue is because a pure static uClibc build does not
>     install dlfcn.h and can't do dynamic loading with dlopen().
>
> Both issues already existed with the previous version, we just did not
> notice them...
>
> So: thanks for noticing this time! ;-)

I would have taken a look tonight, so I appreciate that you beat me to
a patch set and I'll start a build to test :-).

- Matt
