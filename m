From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Mar 2014 21:37:14 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <20140307204055.2d0a4b23@skate>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
Message-ID: <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 7, 2014 at 8:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Fri, 7 Mar 2014 18:49:03 +0100, Yann E. MORIN wrote:
>
>> Doing the check in dependencies is not much better than doing it as a
>> pre-configure hook: it can be delayed quite late in the build process.
>>
>> > Right now i don't know how to check about the presence of the 32bit
>> > support on the 64 bit host toolchain.
>>
>> What about something like this:
>>
>>     ifeq ($(BR2_PACKAGE_LUAJIT),y)
>>     ifeq ($(TARGET_32BIT)$(HOST_64BIT),yy)
>>     ifneq ($(shell echo 'int main() { return 0; }' |gcc -m32 -o foo -x c - >/dev/null 2>&1 && echo y; rm -f foo),y)
>>     $(error Can't build luajit for 32-bit target on this machine (mising 32-bit development packages))
>>     endif
>>     endif
>>     endif
>>
>> Not really trivial, but should work with some tweaking...
>
> Why do you invent something crazy here? We already have
> BR2_HOSTARCH_NEEDS_IA32_COMPILER which tests exactly what your new test

That's great so we need to add just:

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 9c4ecc3..d0c1512 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAJIT
        # Luajit is only available for some target architectures, and
        # has some complexity wrt 32/64. See luajit.mk for details.
        depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
|| BR2_powerpc || BR2_arm || BR2_armeb
+       select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_x86_64
        help
          LuaJIT implements the full set of language features defined
          by Lua 5.1. The virtual machine (VM) is API- and

> intends to do. However, I'm not sure this test is actually completely
> correct: -m32 is a x86 compiler option. And my understanding is that
> Luajit needs to be built with a host that has the same bitness, so for
> example building a x86-64 target on a x86 system would not work, and
> your test would not catch such a situation.

For such a case there is already a check:

config BR2_PACKAGE_LUAJIT
depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') ||
BR2_powerpc || BR2_arm || BR2_armeb

Regards
-- 
Fabio Porcedda
