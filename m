From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 13:41:33 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
 platform description
In-Reply-To: <20170302122940.xhkdgbz6sj3zfqsb@tarshish>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <20170302122940.xhkdgbz6sj3zfqsb@tarshish>
Message-ID: <20170302134133.31e3a9aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 14:29:40 +0200, Baruch Siach wrote:

> On Tue, Feb 28, 2017 at 07:07:22PM +0100, Yann E. MORIN wrote:
> > -set(CMAKE_SYSTEM_NAME Linux)
> > +set(CMAKE_SYSTEM_NAME Buildroot)
> >  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)  
> 
> This breaks libiio.
> 
> http://autobuild.buildroot.net/results/281/2812b008a0ab6bab5fe4d45eb9ffe4e9496a8cb4/
> 
> /home/dawncrow/buildroot-test/scripts/instance-0/output/build/libiio-0.9/local.c: In function 'local_open':
> /home/dawncrow/buildroot-test/scripts/instance-0/output/build/libiio-0.9/local.c:856:33: error: 'O_CLOEXEC' undeclared (first use in this function)
> 
> That is because the libiio CMakeLists.txt has the following code:
> 
> IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
> 
> 		[...]
> 
>         set(CMAKE_REQUIRED_DEFINITIONS "-D_GNU_SOURCE=1")
>         add_definitions(-D_GNU_SOURCE=1)
> endif()
> 
> Now cmake skips this code, thus omitting _GNU_SOURCE which leads to the build 
> failure.

As I reported earlier today, this series breaks several other CMake
based packages. So I guess, we're good for yet another revert, back to
CMake 3.6.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
