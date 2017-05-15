From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 May 2017 09:23:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-11
In-Reply-To: <CANQCQpa=9ATKZvQtdunYZ35pPm8tc4GvJ3qeRqeYDhEJDWK1bg@mail.gmail.com>
References: <20170512062950.23CF0220A8@mail.free-electrons.com>
 <20170514174506.GA16283@itchy>
 <20170514211956.662430db@free-electrons.com>
 <CANQCQpaFEJtVONm4=0nNvKCU0CYqNo+M87QEvXda3PLzHB6TLA@mail.gmail.com>
 <CANQCQpZWfvYShTNGVQ_X+f=8EKMj19B5nBqBYHGujTnpSap1gw@mail.gmail.com>
 <CANQCQpa=9ATKZvQtdunYZ35pPm8tc4GvJ3qeRqeYDhEJDWK1bg@mail.gmail.com>
Message-ID: <20170515092350.3ca282a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 22:03:27 -0500, Matthew Weber wrote:

> > Well this is interesting and I'll have to dig around some more but
> > here's what I've found after doing a build.  It looks like I have
> > SPARC ELF ABI compatibility on my x86_64 Ubuntu 14.04.1 machine.  I
> > can execute the test app since it's statically linked.
> >
> > # ./tryancilautoclose
> > Unsupported ancillary data: 65535/1
> > # echo $?
> > 111
> > # file tryancilautoclose
> > tryancilautoclose: ELF 32-bit MSB  executable, SPARC version 1 (SYSV),
> > statically linked, with unknown capability 0x41000000 = 0xf676e75,
> > with unknown capability 0x10000 = 0x70403, not stripped
> 
> Ok, didn't realize the qemu-user-static will automatically hook-up
> support for executing the arch it supports seamlessly.  When I straced
> I noticed the call into qemu-sparc-static.  Since removing that
> package, I now observe what would be expected.

Wow, ok. Thanks a lot for investigating this issue.

> # ./tryancilautoclose
> bash: ./tryancilautoclose: cannot execute binary file: Exec format error
> # echo $?
>  11126
> 
> Sorry about that one Eric, it's fixed now on that machine and shouldn't reoccur.
> 
> Thomas, should there be a check or warning added as part of
> buildroot's package/host checking which would catch a case where
> qemu-user-static is installed and may adversely affect the build?

Yes, we should definitely do something about that. Ideally, Buildroot
should do something to prevent binfmt_misc from kicking off the
execution of foreign binaries. I have no idea if this is possible. If
not, at the very least, we should warn/error out, but I really hate
when a build system/tool asks me to change my system-wide configuration
to operate correctly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
