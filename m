From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 00:47:55 +0200
Subject: [Buildroot] [PATCH] luajit: new package (v2)
In-Reply-To: <CAB0FRssEYqXNWbALe9HPGOyjkffumkOoDfS_zhj0W1d7F8-7Ow@mail.gmail.com>
References: <CAB0FRssEYqXNWbALe9HPGOyjkffumkOoDfS_zhj0W1d7F8-7Ow@mail.gmail.com>
Message-ID: <20120715004755.4cc159e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 2 Jun 2012 10:49:14 +0200,
Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                     |    3 ++-
>  package/luajit/Config.in              |    9 +++++++
>  package/luajit/luajit-root-path.patch |   16 ++++++++++++
>  package/luajit/luajit.mk              |   44 +++++++++++++++++++++++++++++++++
>  4 files changed, 71 insertions(+), 1 deletion(-)

I started integrating this. I made a number of changes (link the luajit
binary dynamically against its shared library, remove the symbolic
thing, addition of the proper 'depends on' for the architectures
that luajit supports, etc.).

However, I've hit a wall with the fact that apparently the luajit build
process requires the host compiler to have the same bitness as the
target architecture. As I was building for ARM on a x86_64 machine,
luajit wasn't happy, and suggested to add -m32 to the host compile
flags. With this, it works.

Unfortunately, it has a number of drawbacks:

 * Requires the host to have multilib libraries available. This is not
   a big problem IMO, as most x86_64 machines will most likely have the
   32 bits libraries installed for one reason or another, and we are
   anyway thinking of using this multilib capability to build Grub when
   the target architecture is x86_64.

 * The major problem is that it means that if your build machine is a 32
   bits machine, then you cannot build luajit for a 64 bits
   architecture (at the moment, the only 64 bits architecture supported
   by luajit is x86_64, so basically, on a i386 build machine, you
   can't build a x86_64 target).

Can you have a look at this and see what's possible to do? I will send
as a reply the current state of the luajit patch that includes my
modifications.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
