From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 23:39:52 +0200
Subject: [Buildroot] [PATCH 1/1] boost: fix static detection of
 lock-free atomic ints
In-Reply-To: <20180904192734.27206-1-fontaine.fabrice@gmail.com>
References: <20180904192734.27206-1-fontaine.fabrice@gmail.com>
Message-ID: <a6fb2f98-aae0-e959-4dac-b8bd3180a67a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,


On 04/09/2018 21:27, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/bfc004ba10b50d4294be5ccd0abef7c00ed074d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index b2605a70b7..fe986edb00 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -106,6 +106,16 @@ endif
>  # variants. Override that if we want static only or shared only.
>  ifeq ($(BR2_STATIC_LIBS),y)

 Ahem, the autobuild failure you refer to actually has BR2_SHARED_LIBS=y, so how
can this fix the issue?

 Looking at the failing command (from your commit log):

    "/home/fabrice/buildroot/output/host/bin/arm-linux-g++"    -o
"bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/libboost_system.so.1.67.0"
-Wl,-h -Wl,libboost_system.so.1.67.0 -shared -Wl,--start-group
"bin.v2/libs/system/build/gcc-6.4.0/debug/threading-multi/error_code.o"
-Wl,-Bstatic  -Wl,-Bdynamic -lrt -Wl,--end-group -fPIC -pthread -g  -Wl,-elf2flt
-static

 It's doing a link without TARGET_LDFLAGS, and TARGET_LDFLAGS contains the
-mid-shared-library -mshared-library-id=0 that is needed to link a shared
library on FLT.

 And it makes sense that TARGET_LDFLAGS are not used, because we only pass that
*after* bootstrap.sh (I assume this stuff is evaluated by bootstrap.sh, and not
when running bjam itself?) Or, if it is evaluated by bjam, somehow bjam is
ignoring the linkflags we pass in user-config.jam.

>  BOOST_OPTS += link=static runtime-link=static
> +
> +# When detecting features such as lockfree atomic ints, boost does not take into
> +# account the configuration provided by the user. Indeed, boost does not specify
> +# any value and as a result the default value (shared) is used
> +define BOOST_FIX_STATIC_FEATURES_DETECTION
> +$(SED) 's/has_atomic_flag_lockfree_test.cpp/has_atomic_flag_lockfree_test.cpp : <link>static <runtime-link>static/g;' \
> +		$(@D)/libs/thread/build/Jamfile.v2

 If such a change is needed for has_atomic_flag_lockfree, isn't it also needed
for the other build-time tests? has_iconv, has_icu, native_syslog, ...


 Since I believe this patch cannot work, I've marked it as Changes Requested.

 Regards,
 Arnout

> +endef
> +
> +BOOST_PRE_CONFIGURE_HOOKS += BOOST_FIX_STATIC_FEATURES_DETECTION

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
