From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 18 May 2018 19:45:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-17
In-Reply-To: <20180518060019.6D04C207AC@mail.bootlin.com>
References: <20180518060019.6D04C207AC@mail.bootlin.com>
Message-ID: <20180518194512.1acb5de3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 May 2018 08:00:19 +0200 (CEST), Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build statistics for 2018-05-17
> ===============================
[...]
> Results for branch 'master'
> ===========================


>      powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/61de5206016437174cbd269eb74aafaf0446862f |     

The first error is:

	src/connectorthread.cxx: In member function 'virtual void log4cplus::helpers::ConnectorThread::run()':
	src/connectorthread.cxx:92:13: error: 'sleep_for' is not a member of 'std::this_thread'

with the given toolchain:

	BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
	BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
	BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y

which can be worked around by ([1], [2]):

	diff --git a/package/log4cplus/log4cplus.mk b/package/log4cplus/log4cplus.mk
	index 890d2ee8f5..241e10a14f 100644
	--- a/package/log4cplus/log4cplus.mk
	+++ b/package/log4cplus/log4cplus.mk
	@@ -11,4 +11,6 @@ LOG4CPLUS_LICENSE = Apache-2.0, BSD-2-Clause, BSD-like (threadpool)
	 LOG4CPLUS_LICENSE_FILES = LICENSE
	 LOG4CPLUS_INSTALL_STAGING = YES
 
	+LOG4CPLUS_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -D_GLIBCXX_USE_NANOSLEEP"
	+
	 $(eval $(autotools-package))


The next error is:

	src/hierarchy.cxx: In member function 'log4cplus::Logger log4cplus::Hierarchy::getInstanceImpl(const tstring&, log4cplus::spi::LoggerFactory&)':
	src/hierarchy.cxx:291:36: error: 'log4cplus::Hierarchy::LoggerMap' has no member named 'emplace'

which is std::map::emplace, according to [3] not available in gcc-4.7, but from
gcc-4.8 on wards...

What to do? Bump existing BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 dependency to
BR2_TOOLCHAIN_GCC_AT_LEAST_4_8?

Regards,
Peter


[1] https://stackoverflow.com/questions/4438084/stdthis-threadsleep-for-and-gcc
[2] https://stackoverflow.com/questions/12523122/what-is-glibcxx-use-nanosleep-all-about
[3] https://stackoverflow.com/questions/24389014/stdmap-emplace-gcc-4-8-2
