From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 13:35:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-14
In-Reply-To: <20190516110616.329beae6@windsurf>
References: <20190515060039.F045C22920@silver.osuosl.org>
 <20190515221703.GC32757@momiji> <20190516083353.5cd7ae04@windsurf>
 <20190516115248.GB25918@momiji> <20190516110616.329beae6@windsurf>
Message-ID: <c7e87b0d-434a-9ec8-7fa9-c0b743e3a0f0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/05/2019 11:06, Thomas Petazzoni wrote:
> Hello,
> 
> +Samuel Martin in the discussion.
> 
> On Thu, 16 May 2019 11:52:48 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
>>> This build has BR2_ENABLE_DEBUG=y, and when BR2_ENABLE_DEBUG=y, the
>>> CMake package infrastructure passes -DCMAKE_BUILD_TYPE=Debug. I assume
>>> that's under this condition that assertions become enabled.  
>>
>> On a related note: for debug builds done by packagers we usually recommend
>> building with ?-DCMAKE_BUILD_TYPE=RelWithDebInfo? because using the ?Debug?
>> produces excruciatingly slow WebKit binaries. To give you an idea: loading
>> some simple static HTML page over the network can take a couple of minutes.
>> Typically full ?Debug? builds are only ever used by WebKit developers.
> 
> I know there was so back and forth between Debug and RelWithDebInfo,
> see the commit log of commit 104bb29e0490bfb487e2e665448dd3ca07fcc2b5:
[snip]
>     Reverting to the previous situation, so Buildroot now chooses between
>     the 'Debug' and 'Release' config types, which are semantically closer
>     to what Buildroot does everywhere else:
>       * if BR2_ENABLE_DEBUG is set:
>         The CMake build type is set to Debug, which means:
>         - only -g option is passed by CMake;
>         - optimization is not forced, nor debug level, so they are kept
>           as-is;
>       * otherwise:
>         The CMake build type is set to Release, so no change in this case:
>         - Optimization level is forced to: -O3;
>         - no log nor assert due to -DNDEBUG (as expected);
>         - size optimization is ignored.
>     
>     Follow-up patches will fix the CMake flag variables that are appended by
>     CMake.
>     
>     Cc: Charles Hardin <ckhardin@exablox.com>
>     Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>     Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>     Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>     Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> So apparently, the issue with RelWithDebInfo is that it forces the
> optimization level.

 CMAKE_BUILD_TYPE basically does two things.

1. In addition to CMAKE_C_FLAGS, CMAKE_C_FLAGS_<buildtype> is used (and the same
for a bunch of other variables). The defaults of these variables set various
debug and optimisation flags. Note that packages tend to add things both to
CMAKE_C_FLAGS and CMAKE_C_FLAGS_RELEASE/DEBUG/...

2. Package's CMakeLists.txt use it to do various things, e.g. build additional
stuff in debug mode, or enable Werror, or .... Impossible to say in general what
they will come up with.

 I think we should do the same as we did with autotools a while ago: we remove
the --enable-debug and instead always build in "release" mode, but we force
debug flags through CFLAGS. That's also how it's documented in the
BR2_ENABLE_DEBUG help text.

 So, I think we should set CMAKE_BUILD_TYPE to Release - or even leave it empty,
since that's the default. And then we only need to set CMAKE_C_FLAGS_RELEASE.


 By the way, while investigating this, I discovered that we set -DNDEBUG for
CMake release, but we don't do that for other build systems. Sounds like a
mistake...

 Regards,
 Arnout
