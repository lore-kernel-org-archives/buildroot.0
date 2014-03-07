From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 21:51:57 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <20140307214651.1cb85457@skate>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
 <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
 <20140307214651.1cb85457@skate>
Message-ID: <CAHkwnC-g36dQ0OzSkqZdrWbjkwe3izYqpF+e81gff-ezA35H6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 9:46 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 7 Mar 2014 21:37:14 +0100, Fabio Porcedda wrote:
>
>> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
>> index 9c4ecc3..d0c1512 100644
>> --- a/package/luajit/Config.in
>> +++ b/package/luajit/Config.in
>> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAJIT
>>         # Luajit is only available for some target architectures, and
>>         # has some complexity wrt 32/64. See luajit.mk for details.
>>         depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
>> || BR2_powerpc || BR2_arm || BR2_armeb
>> +       select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_x86_64
>
> This will prevent building Luajit for ARM, while running Buildroot on
> an ARM platform. It's fairly unlikely, but still. "gcc -m32" will only
> work on x86, or x86-64 with the 32 bits development files installed.
> While in fact Luajit can build in situation where the bitness of the
> target and the bitness of the arch match.
>
> For example, Peter has one PowerPC build server: a "gcc -m32" test
> would fail on it, even though it would be perfectly capable of building
> the ARM 32 bits, PowerPC or x86 Luajit.

Reading the gcc documentation the option -m32 work even on PowerPC:
http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/RS_002f6000-and-PowerPC-Options.html

 RS/6000 and PowerPC Options -mcpu=cpu-type -mtune=cpu-type
-mcmodel=code-model -mpowerpc64 -maltivec  -mno-altivec
           -mpowerpc-gpopt  -mno-powerpc-gpopt -mpowerpc-gfxopt
-mno-powerpc-gfxopt -mmfcrf  -mno-mfcrf  -mpopcntb  -mno-popcntb
           -mpopcntd -mno-popcntd -mfprnd  -mno-fprnd -mcmpb -mno-cmpb
-mmfpgpr -mno-mfpgpr -mhard-dfp -mno-hard-dfp -mfull-toc
           -mminimal-toc  -mno-fp-in-toc  -mno-sum-in-toc -m64  -m32

So maybe we need to change the name of the option
BR2_HOSTARCH_NEEDS_IA32_COMPILER

Regards
-- 
Fabio Porcedda
