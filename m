From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 23:14:18 +0200
Subject: [Buildroot] [PATCH 3/3] python3: Compile host-python3 statically
In-Reply-To: <CAA=pTTTiF11gkQzUN6n9yX+aNUZaZiRicKZa2ieF=W92yvLeFg@mail.gmail.com>
References: <1474032631-21311-1-git-send-email-fpa@sbtaqua.com>
 <20160916190833.7c776697@free-electrons.com>
 <CAA=pTTSgNWY-orBD0ff1Y6U-p+ujXRyg+mtNvyb_UOivSqMqww@mail.gmail.com>
 <CAA=pTTTiF11gkQzUN6n9yX+aNUZaZiRicKZa2ieF=W92yvLeFg@mail.gmail.com>
Message-ID: <20160923231418.0c2c0c3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 16:10:41 +0000, Frederik Peter Aalund wrote:
> I noticed that while the host-python executable doesn't have an rpath
> value, it does have a runpath value:
> 
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library:
> [libpython3.5m.so.1.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>  0x000000000000001d (RUNPATH)            Library runpath:
> [/projects/RedPitaya/OS/buildroot/buildroot/output/host/usr/lib]
>  0x000000000000000c (INIT)               0x4008c0

Interesting. We are passing -Wl,-rpath, so it should be a rpath. Not
sure why it gets turned into a runpath :/

> Turns out that I had LD_LIBRARY_PATH defined which overrides runpath
> (though not rpath). After undefining LD_LIBRARY_PATH, everything worked.

Ah, yes, indeed. But as said above, we're supposed to have a rpath in
all binaries installed in output/host/usr/bin, so having a runpath here
is not expected.

However, it at least explains why you were seeing the problem, while
many other people were using host-python3 without any problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
