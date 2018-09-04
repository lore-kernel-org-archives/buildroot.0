From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 5 Sep 2018 00:25:09 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fix static detection of
 lock-free atomic ints
In-Reply-To: <a6fb2f98-aae0-e959-4dac-b8bd3180a67a@mind.be>
References: <20180904192734.27206-1-fontaine.fabrice@gmail.com>
 <a6fb2f98-aae0-e959-4dac-b8bd3180a67a@mind.be>
Message-ID: <CAPi7W81hv3pKEuHaxNRBYRWHHWniaohJLjqnw6W81tJAjoAEMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le mar. 4 sept. 2018 ? 23:39, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>  Hi Fabrice,
>
>
> On 04/09/2018 21:27, Fabrice Fontaine wrote:
> > Fixes:
> >  -
> http://autobuild.buildroot.net/results/bfc004ba10b50d4294be5ccd0abef7c00ed074d5
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/boost/boost.mk | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> > index b2605a70b7..fe986edb00 100644
> > --- a/package/boost/boost.mk
> > +++ b/package/boost/boost.mk
> > @@ -106,6 +106,16 @@ endif
> >  # variants. Override that if we want static only or shared only.
> >  ifeq ($(BR2_STATIC_LIBS),y)
>
>  Ahem, the autobuild failure you refer to actually has BR2_SHARED_LIBS=y,
> so how
> can this fix the issue?
>
Sorry, I was a little sleepy and the link was not the correct one, it took
me a lot of time to find how to find the beginning of a fix for this issue
:-(.
I will send a v2 with the correct one but basically this is fixing a lot of
build falures:
http://autobuild.buildroot.org/?branch=master&status=NOK&static=1

>
>  Looking at the failing command (from your commit log):
>
>     "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o
>
> "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0"
> -Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group
> "bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"
> -Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g
> -Wl,-elf2flt
> -static
>
>  It's doing a link without TARGET_LDFLAGS, and TARGET_LDFLAGS contains the
> -mid-shared-library -mshared-library-id=0 that is needed to link a shared
> library on FLT.
>
The issue is that bjam takes the TARGET_LDFLAGS which have -Wl,-elf2flt
-static but also adds its own flags such as -Wl,-Bdynamic -fPIC because it
thinks it has to do a dynamic link.
This is more clear if you read also the console log with bjam configured to
debug level 5 (-d5):

(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|
gcc.link
<pbin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi>has_atomic_flag_lockfree
:
<pbin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi>has_atomic_flag_lockfree_test.o
<pbin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi>libboost_system.so.1.67.0
: <abi>sysv <address-model>32 <architecture>arm <asynch-exceptions>off
<binary-format>elf <context-impl>fcontext <cxxflags>-Wextra
<cxxflags>-Wno-long-long <cxxflags>-Wno-unused-parameter
<cxxflags>-Wunused-function <cxxflags>-pedantic <debug-symbols>on
<deduced-address-model>32 <deduced-architecture>arm
<define>BOOST_ALL_NO_LIB=1 <define>BOOST_SYSTEM_DYN_LINK=1
<define>BOOST_THREAD_BUILD_DLL=1
<dll-path>/home/fabrice/buildroot/output/build/boost-1.67.0/bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi
<exception-handling>on <extern-c-nothrow>off <hardcode-dll-paths>true
<host-os>linux <implicit-dependency>object(notfile-target)@2281 <include>.
<inlining>off <install-dependencies>off <library>object(file-target)@2595
<link>shared <main-target-type>EXE <optimization>off <os>LINUX <pch>on
<preserve-test-targets>on <profiling>off <python-debugging>off
<python.interpreter>python <python>2.7 <relevant>address-model
<relevant>architecture <relevant>c++-template-depth <relevant>cflags
<relevant>context-impl <relevant>cxxflags
<relevant>cxxflags:<relevant>toolset <relevant>cxxstd
<relevant>cxxstd-dialect <relevant>debug-symbols
<relevant>deduced-address-model <relevant>deduced-architecture
<relevant>define <relevant>define:<relevant>link
<relevant>define:<relevant>target-os <relevant>define:<relevant>toolset
<relevant>dll-path <relevant>exception-handling
<relevant>find-shared-library <relevant>find-static-library <relevant>htm
<relevant>include <relevant>inlining <relevant>instruction-set
<relevant>library-file <relevant>library-path <relevant>link
<relevant>link:<relevant>toolset <relevant>linkflags <relevant>optimization
<relevant>pch <relevant>pch-file <relevant>profiling
<relevant>python.interpreter:<relevant>python
<relevant>python.interpreter:<relevant>target-os <relevant>rtti
<relevant>runtime-link <relevant>segmented-stacks <relevant>strip
<relevant>target-os <relevant>threadapi:<relevant>target-os
<relevant>threading <relevant>toolset <relevant>toolset-gcc:version
<relevant>valgrind <relevant>variant <relevant>warnings
<relevant>warnings-as-errors <relevant>warnings:<relevant>toolset
<relevant>wavetool <relevant>xdll-path <rtti>on <runtime-debugging>on
<runtime-link>shared <stdlib>native <strip>off <suppress-import-lib>false
<symlink-location>project-relative
<tag>@Jamfile</home/fabrice/buildroot/output/build/boost-1.67.0/libs/thread/build>%Jamfile</home/fabrice/buildroot/output/build/boost-1.67.0/libs/thread/build>.tag
<target-os>linux <testing.execute>on <threadapi>pthread <threading>multi
<toolset-gcc:version>6.4.0 <toolset>gcc <user-interface>console
<variant>debug <vectorize>off <warnings-as-errors>off <warnings>all
<xdll-path>/home/fabrice/buildroot/output/build/boost-1.67.0/bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi
<xsl:param>boost.defaults=Boost :  :  :  :  :  :  :  :  :  :  :  :  :  :  :
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>
gcc.quote-rpath
<pbin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi>has_atomic_flag_lockfree
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>
MATCH ('.*') :
/home/fabrice/buildroot/output/build/boost-1.67.0/bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>
common.Clean clean-all :
<pbin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi>has_atomic_flag_lockfree
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>
RULENAMES
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>
PAD     - lockfree boost::atomic_flag : 30
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>
UPDATE_NOW
<pbin.v2/libs/thread/build/gcc-6.4.0/debug/threading-multi>has_atomic_flag_lockfree
: 7 : ignore-minus-n : ignore-minus-q
(builtin):>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>>>>|>
configure.log-check-result     - lockfree boost::atomic_flag : no

You can see in the trace above that link and runtimelink are set to shared
even if we tell bjam to use static in BOOST_OPTS.
bjam seems to use the default value for these parameters as if I change the
order of shared and static in
boost-1.67.0/tools/build/src/tools/features/runtime-feature.jam and
boost-1.67.0/tools/build/src/tools/features/link-feature.jam, the link will
be static.

>
>  And it makes sense that TARGET_LDFLAGS are not used, because we only pass
> that
> *after* bootstrap.sh (I assume this stuff is evaluated by bootstrap.sh,
> and not
> when running bjam itself?) Or, if it is evaluated by bjam, somehow bjam is
> ignoring the linkflags we pass in user-config.jam.
>
From my understanding, this is evaluated by bjam and bjam ignores link or
runtime-link option when using the exe command. I think it use it only for
the lib directive but I don't know how to fix it "properly".

>
> >  BOOST_OPTS += link=static runtime-link=static
> > +
> > +# When detecting features such as lockfree atomic ints, boost does not
> take into
> > +# account the configuration provided by the user. Indeed, boost does
> not specify
> > +# any value and as a result the default value (shared) is used
> > +define BOOST_FIX_STATIC_FEATURES_DETECTION
> > +$(SED)
> 's/has_atomic_flag_lockfree_test.cpp/has_atomic_flag_lockfree_test.cpp :
> <link>static <runtime-link>static/g;' \
> > +             $(@D)/libs/thread/build/Jamfile.v2
>
>  If such a change is needed for has_atomic_flag_lockfree, isn't it also
> needed
> for the other build-time tests? has_iconv, has_icu, native_syslog, ...
>
From my understanding, this is only needed for the exe directive which is
indeed used in boost-1.67.0/libs/locale/build/Jamfile.v2 to detect icu or
iconv support.
For now, I did not check if the detection of these features was working
when building statically.

>
>
>  Since I believe this patch cannot work, I've marked it as Changes
> Requested.
>
>  Regards,
>  Arnout
>
> > +endef
> > +
> > +BOOST_PRE_CONFIGURE_HOOKS += BOOST_FIX_STATIC_FEATURES_DETECTION
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180905/de95525d/attachment-0001.html>
