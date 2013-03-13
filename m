From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Wed, 13 Mar 2013 09:47:56 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <513FB6CF.1070301@mind.be>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
 <513FB6CF.1070301@mind.be>
Message-ID: <84EA0F7435E5F64C9B660453645DB90497AE6FBC34@DSW350.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, hello Thomas,

Thanks for your response!

I'm using Ubuntu 10.04 LTS Server.

You can find the output of the preprocessed code here:  http://pastebin.com/XnT1wzLK

Do you have any ideas what is going wrong? Thanks for your help!


Best regards

Werner

-----Original Message-----
From: Arnout Vandecappelle [mailto:arnout at mind.be] 
Sent: Wednesday, March 13, 2013 12:14 AM
To: Spielmann Werner
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Problem with buildroot-2013.02 - ncurses

On 03/08/13 12:29, Spielmann Werner wrote:
> /usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. 
> -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include 
> -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_addstr.c -o ../objects/lib_addstr.o /usr/bin/gcc -DHAVE_CONFIG_H -I../ncurses -I. -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I<MY_WORKSPACE>/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -c ../ncurses/./base/lib_beep.c -o ../objects/lib_beep.o In file included from ../include/term_entry.h:48,
>                   from ../progs/progs.priv.h:111,
>                   from ../progs/tic.c:41:
> ../include/term.h:702: error: field ?Ottyb? has incomplete type

 Looks like there's something fishy with your host's environment...

 The field 'tty' that is indicated has type TTY, which is defined as 'struct termios'.  struct termios is defined in /usr/include/bits/termios.h, which is included by /usr/include/termios.h, which is included by ../include/term.h.
So it _should_ work.

 Can you do the following:

cd /home/spiewe/svnws/buildroot-2013.02/output/build/host-ncurses-5.9/progs

/usr/bin/gcc -I../progs -I. -DHAVE_CONFIG_H -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64  -DNDEBUG -I. -I../include -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include/ncurses -O2 -I/home/spiewe/svnws/buildroot-2013.02/output/host/usr/include  --param max-inline-insns-single=1200 -E ../progs/dump_entry.c > /tmp/dump_entry.E

 and post the resulting /tmp/dump_entry.E in a pastebin. Then we can check what is going wrong with termios.

 BTW which distro do you use?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
