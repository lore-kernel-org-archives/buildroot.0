From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Thu, 11 Jul 2013 09:42:28 +0200
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <20130711063845.GA7655@enterprise.localdomain>
References: <1373519841-6138-1-git-send-email-g@maral.me>
 <1373519960-6212-1-git-send-email-g@maral.me>
 <20130711053359.GC4338@tarshish>
 <20130711060008.GA5570@enterprise.localdomain>
 <20130711060419.GD4338@tarshish>
 <20130711063845.GA7655@enterprise.localdomain>
Message-ID: <51DE61E4.7030400@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillermo,

Am 11.07.2013 08:38, schrieb Guillermo A. Amaral:
> I searched around for alternative ways around the issue when I first
> encountered it, it seemed no-oping it would be most portable/safest approach.

The O_CLOEXEC variable was introduced in 2.6.23.

>        O_CLOEXEC (Since Linux 2.6.23)
>               Enable the close-on-exec flag for the new file descriptor.
>               Specifying this flag permits a program to avoid additional
>               fcntl(2) F_SETFD operations to set the FD_CLOEXEC flag.
>               Additionally, use of this flag is essential in some
>               multithreaded programs since using a separate fcntl(2) F_SETFD
>               operation to set the FD_CLOEXEC flag does not suffice to avoid
>               race conditions where one thread opens a file descriptor at
>               the same time as another thread does a fork(2) plus execve(2).

So if you use a kernel less then 2.6.23 it make no sense to define
O_CLOEXEC to whatever you want, the kernel doesn't know this. And in the
opposite you can't defined it to some different then already defined for
O_CLOEXEC.

The function 'open' can also used without the 3rd parameter.

So I think you have to check which kernel version is used and build a
patch which does something like

#ifdef KERNEL_VER < 2_6_23
  if ((fd = open ("/dev/mem", O_RDWR | O_SYNC) ) < 0)
#else
  if ((fd = open ("/dev/mem", O_RDWR | O_SYNC | O_CLOEXEC) ) < 0)
#endif

The guys from linux-wireless do a lot of this to get the wireless
package working om different kernel versions.

Regards
Carsten
