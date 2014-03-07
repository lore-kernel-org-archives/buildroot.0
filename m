From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 23:19:42 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAHkwnC8Te3buvsDtyF+p_=iTcL_QYdaCz-Ty6B_BqY2RHNbhLw@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
 <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
 <20140307214651.1cb85457@skate>
 <CAHkwnC-g36dQ0OzSkqZdrWbjkwe3izYqpF+e81gff-ezA35H6g@mail.gmail.com>
 <20140307215801.69039f22@skate>
 <CAHkwnC9Yx_uQqZQwiqmExJgErg_tey0n7dm5cZYWLp2sG_HsPw@mail.gmail.com>
 <20140307223003.53d17887@skate>
 <CAHkwnC8Te3buvsDtyF+p_=iTcL_QYdaCz-Ty6B_BqY2RHNbhLw@mail.gmail.com>
Message-ID: <CAHkwnC-Y+Q7uKhXGLkyeUTZ8otp+kLE4N5ySQyRiMKXeqsg_ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 10:58 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Fri, Mar 7, 2014 at 10:30 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Fri, 7 Mar 2014 22:11:33 +0100, Fabio Porcedda wrote:
>>
>>> > Ok, but not on ARM or MIPS, and probably not on many other 32 bits
>>> > architectures supported by Buildroot. Bottom line: testing 'gcc -m32'
>>> > is not a good way of testing whether the architecture is 32 bits or is
>>> > a 64 bits architecture capable of building and running 32 bits binaries.
>>>
>>> We need to test if 32bit binaries are built only for 64bit host architectures.
>>> Which are the 64bit host architectures that Buildroot supports?
>>
>> Potentially any 64 bits architecture, we don't have particular
>> dependencies on the host architecture.
>
> Ok i undertand the general problem but right now the luajit package
> support building 32 binaries on a 64 host architecture only if the
> host compiler support the -m32 option so right now it's fine to test
> only if the -m32 option is used.
>
> So i think adding the line
> select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_ARCH_IS_64

I've forgotten to add the "!" sign, so it's:

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 9c4ecc3..dd93609 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAJIT
        # Luajit is only available for some target architectures, and
        # has some complexity wrt 32/64. See luajit.mk for details.
        depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
|| BR2_powerpc || BR2_arm || BR2_armeb
+       select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
        help
          LuaJIT implements the full set of language features defined
          by Lua 5.1. The virtual machine (VM) is API- and


> it's the right solution for checking the configurations supported by
> the luajit package.

because in luajit.mk there is this:

ifeq ($(BR2_ARCH_IS_64),y)
LUAJIT_HOST_CC=$(HOSTCC)
else
LUAJIT_HOST_CC=$(HOSTCC) -m32
endif

Regards
-- 
Fabio Porcedda
