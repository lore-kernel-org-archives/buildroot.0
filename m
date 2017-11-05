From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 17:31:41 +0100
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
 <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
 <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
Message-ID: <20171105163141.GL2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-05 17:13 +0100, Arnout Vandecappelle spake thusly:
> On 31-10-17 11:20, Norbert Lange wrote:
> > Hello Thomas,
> > 
> > I dont know about the autobuilder (can I upload configs to test
> > there?), this is an issue I encountered with a private buildroot
> > config.
> > I tried to reduce it as much as possible, and added the defconfig.
> > 
> > 2017-10-30 20:40 GMT+01:00 Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com>:
> >> Hello,
> >>
> >> On Mon, 30 Oct 2017 17:31:21 +0100, Norbert Lange wrote:
> >>> The build of doc/examples/cmake-multiple-shared-libraries
> >>> does fail as a dependend library is missing.
> >>> This issue is not specific to builroot and should ideally
> >>> be fixed upstream (Issue: https://bugs.lttng.org/issues/1132)
> >>>
> >>> The fix is done without any indepth knowledge of the CMake
> >>> mechanisms, but seems to work correctly
> >>>
> >>> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> >>
> >> Which specific build problem are you fixing? Is this a problem that has
> >> been found by http://autobuild.buildroot.org? If that's the case, we
> >> like to include a reference to such an autobuilder failure in the
> >> commit log.
> 
>  It has not been found by the autobuilders, the only failure is
> http://autobuild.buildroot.net/results/c86a82b2fd41316a7a451b20d9274d5c95f89baa
> and that's due to CMake version.

But aren't we supposed to build our own host-cmake if the system cmake
is tool old? And IIRC, we consider cmake < 3.1 to be too old:

    $ grep 3.1 support/dependencies/check-host-cmake.mk
    BR2_CMAKE_VERSION_MIN = 3.1

So in that case, we should have been using our own cmake, while the
build log clearly state that was not the case:

    CMake Error@CMakeLists.txt:1 (cmake_minimum_required):
      CMake 2.8.11 or higher is required.  You are running version 2.8.9

But lttng-libust is an autotools package, which explains why our
host-cmake is not necessarily built.

But I digress, and I think a better fix would indeed be to teach
configure.ac and Makefile.am to disable building the examples.

Regards,
Yann E. MORIN.

>  The build error is:
> 
> output/host/lib/gcc/x86_64-buildroot-linux-gnu/7.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
> warning: liblttng-ust-tracepoint.so.0, needed by
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so, not found
> (try using -rpath or -rpath-link)
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
> reference to `exit_tracepoint'
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
> reference to `__tracepoint_probe_unregister_queue_release'
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
> reference to `__tracepoint_probe_register_queue_release'
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
> reference to `__tracepoint_probe_prune_release_queue'
> output/build/lttng-libust-2.9.0/liblttng-ust/.libs/liblttng-ust.so: undefined
> reference to `init_tracepoint'
> collect2: error: ld returned 1 exit status
> 
>  The weird thing is: liblttng-ust.so.0 does have the correct RPATH to find the
> tracepoint library. And on all other builds I tried (and apparently including
> all the autobuilders), it does find it. So I guess it's either binutils 2.29 or
> GCC 7's LTO plugin that is acting up somehow...
> 
> 
>  Since this is anyway just an example, wouldn't it be better to just disable the
> documentation entirely? I.e. teach configure.ac to understand --disable-doc and
> teach Makefile.am to not recurse into doc if docs are disabled?
> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
