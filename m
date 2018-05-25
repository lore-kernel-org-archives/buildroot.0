From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 May 2018 19:13:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-17
In-Reply-To: <20180518194512.1acb5de3@gmx.net>
References: <20180518060019.6D04C207AC@mail.bootlin.com>
 <20180518194512.1acb5de3@gmx.net>
Message-ID: <CAPi7W80_ayAf2XQ=vFdCHDS9BBA6ygNe8uurxAAb5DpbWWUVSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter and all,

2018-05-18 19:45 GMT+02:00 Peter Seiderer <ps.report@gmx.net>:

> Hello,
>
> On Fri, 18 May 2018 08:00:19 +0200 (CEST), Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
> > Hello,
> >
> > Build statistics for 2018-05-17
> > ===============================
> [...]
> > Results for branch 'master'
> > ===========================
>
>
> >      powerpc |                log4cplus-2.0.0 | NOK |
> http://autobuild.buildroot.net/results/61de5206016437174cbd2
> 69eb74aafaf0446862f |
>
> The first error is:
>
>         src/connectorthread.cxx: In member function 'virtual void
> log4cplus::helpers::ConnectorThread::run()':
>         src/connectorthread.cxx:92:13: error: 'sleep_for' is not a member
> of 'std::this_thread'


> with the given toolchain:
>
>         BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/t
> oolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
>         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-li
> nux-gnuspe"
>         BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
>
> which can be worked around by ([1], [2]):
>
>         diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/
> log4cplus.mk
>         index 890d2ee8f5..241e10a14f 100644
>         --- a/package/log4cplus/log4cplus.mk
>         +++ b/package/log4cplus/log4cplus.mk
>         @@ -11,4 +11,6 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause,
> BSD-like (threadpool)
>          LOG4CPLUS_LICENSE_FILES = LICENSE
>          LOG4CPLUS_INSTALL_STAGING = YES
>
>         +LOG4CPLUS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS)
> -D_GLIBCXX_USE_NANOSLEEP"
>
This solution is not recommended (see https://gcc.gnu.org/
bugzilla/show_bug.cgi?id=52680).

>         +
>          $(eval $(autotools-package))
>
>
> The next error is:
>
>         src/hierarchy.cxx: In member function 'log4cplus::Logger
> log4cplus::Hierarchy::getInstanceImpl(const tstring&,
> log4cplus::spi::LoggerFactory&)':
>         src/hierarchy.cxx:291:36: error: 'log4cplus::Hierarchy::LoggerMap'
> has no member named 'emplace'
>
> which is std::map::emplace, according to [3] not available in gcc-4.7, but
> from
> gcc-4.8 on wards...
>
> What to do? Bump existing BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 dependency to
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_8?
>
I agree with you, we should bump to BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 as
sleep_for is also always defined since gcc 4.8 (see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52680).

>
> Regards,
> Peter
>
>
> [1] https://stackoverflow.com/questions/4438084/stdthis-threadsl
> eep-for-and-gcc
> [2] https://stackoverflow.com/questions/12523122/what-is-glibcxx
> -use-nanosleep-all-about
> [3] https://stackoverflow.com/questions/24389014/stdmap-emplace-gcc-4-8-2
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180525/a19f44e4/attachment.html>
