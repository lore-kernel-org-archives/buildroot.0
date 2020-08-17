From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Aug 2020 23:43:36 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Analysis of build results
In-Reply-To: <20200816000914.5ad801d9@windsurf.home>
References: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
 <20200816000914.5ad801d9@windsurf.home>
Message-ID: <c3d6e69b-ee5a-ade0-e505-abc7006738b3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 16/08/2020 ? 00:09, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Frank, Gwenhael, Romain, Adam, ARC maintainers, Peter, there are some
> questions/issues for you below.
> 
> Everybody else: please help fixing autobuilder issues !
> 
> See below some preliminary analysis of all build failures that occurred
> on August 14.
> 
> On Sat, 15 Aug 2020 08:01:40 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>     master   | 121 | 67  |  0  | 188 |
> 
> So we're still at about ~30% of failures, which isn't exactly good.
> 
> 
>>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/84eb9bb82255878d6a58772cb96d253a5c02f625 |     
>>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2ddfabda83a42d06b6b9689bc83882c59d1b8db6 |     
>>    x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ce3f75b5a259924924c934e784b58feed2705be8 |     
> 
> A wonderful:
> 
> ./boost/thread/thread_time.hpp:32:60: internal compiler error: Segmentation fault
> 
> This is failing only with this toolchain, which uses gcc 6.2.0. We're
> using the version 2016.11-19 of this toolchain, which is really old,
> and Mentor Graphics has published newer versions
> (https://sourcery.mentor.com/GNUToolchain/subscription51456) but they
> are no longer publicly available.
> 
> So I would advocate for dropping support for this toolchain. I'll send
> a patch doing that.

+1

> 
>>     arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/0b972b4e63cac9ae95dcac78e031d7b19e2e4e0d |     
> 
> Detects Fortran (even though that dependency is not expressed in the
> eigen package), but fails to use it.
> 
> It would be good to explicitly disable using Fortran in this package.
> Romain, is this something you could have a look at ?

This is not an obvious fix, eigen try to detect libblas dependency and check for
Fortran compiler because the complete list of supported languages is not
provided (project(Eigen3))

https://gitlab.kitware.com/cmake/cmake/-/issues/18348

I'm not sure why we define unconditionally CMAKE_CXX_COMPILER even if
BR2_INSTALL_LIBSTDCPP is not set, while CMAKE_Fortran_COMPILER is set only when
TOOLCHAIN_HAS_FORTRAN is set.

https://git.buildroot.net/buildroot/tree/support/misc/toolchainfile.cmake.in#n70

>
> 
>>  aarch64_be  |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/0f02877a665b2281266df4b23c72a7c113906c31 |     
> 
> /tmp/instance-0/output-1/build/supertux-0.6.0/src/editor/object_settings.cpp:223:26: error: 'remove_if' is not a member of 'std'
>      m_options.erase(std::remove_if(m_options.begin(), m_options.end(),
> 
> Romain, supertux is your thing, could you have a look ?

Already fixed by 14552122ac46028b78f05eeed1154da2ba87b174

Best regards,
Romain


> 
> Thanks,
> 
> Thomas
> 
