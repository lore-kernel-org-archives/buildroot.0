From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 19 Mar 2017 15:44:11 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-18
In-Reply-To: <20170319072840.949DB2077A@mail.free-electrons.com>
References: <20170319072840.949DB2077A@mail.free-electrons.com>
Message-ID: <20170319144411.GA9040@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-03-19 08:28:40, Thomas Petazzoni wrote:
>
>         m68k |           host-skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/c2e8e1180571976b412cbba729c45a3698aea0b2 |

This one is puzzling. I could not reproduce it on my build machine
(Fedora 25, gcc 6.3.1).

The build of the host variant of skalibs fails at configuration time as
follow:

```
Checking whether system has timer_create()...
  ... yes, with -lrt
  Checking system endianness...
  ./configure: unable to determine endianness
```

At this step, ./configure tries to compile two programs to determine
endianness (src/sysdeps/trybigendian.c and src/sysdeps/trylittleendian.c).
Both test some compiler macros related to endianness. Example, for big
endian:

```
#if defined(__BYTE_ORDER) && (__BYTE_ORDER == __BIG_ENDIAN) ||?        \
?       defined(__BYTE_ORDER__) && (__BYTE_ORDER__  ==
__ORDER_BIG_ENDIAN__) || \
?       defined(__BIG_ENDIAN) ||?       ?       ?       ?              \
?       defined(__ARMEB__) ||?  ?       ?       ?       ?              \
?       defined(__THUMBEB__) ||?        ?       ?       ?              \
?       defined(__AARCH64EB__) ||?      ?       ?       ?              \
?       defined(_MIPSEB) || defined(__MIPSEB) || defined(__MIPSEB__)
#define YEAH
#else
#error "not big endian"
#endif
```

So the failure means that both programs failed to compile. Which
version of GCC is used on the autobuild machine?

Best regards,

--
ELB
