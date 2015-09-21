From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 21 Sep 2015 16:25:54 +1200
Subject: [Buildroot] blackfin and micropython
Message-ID: <CAFOYHZCPCAEdq_wjxY+P=U+5cmthuEy_TkTzu6HNsLLcXHhBVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm just looking at the micropython build failures and the blackfin
ones have have me a bit stumped.

The ones currently showing up[1] are format specifier errors. The code
in question[2] doesn't look particularly bad and other
architectures/compilers aren't complaining I guess it is getting
confused with the math around const byte * and unsigned int. I can
work around that issue by adding -Wno-error=format to CFLAGS for
BR2_bfin. But that leads to the next issue.

  modffi.c:87: error: expected specifier-qualifier-list before ?ffi_closure?
  modffi.c: In function ?mod_ffi_callback?:
  modffi.c:248: error: ?mp_obj_fficallback_t? has no member named ?clo?

I think these are because nothing defines FFI_CLOSURES. ffitarget.h
for bfin seems a lot sparser than for other architectures so I'm
thinking that's the problem.

I notice python, python3 and guile are not available for bfin. Not
that they explicitly exclude it but probably because of on of the
other dependencies they all have.

I'm not really familiar with bfin so I'm wondering if I should pursue
the libffi angle to try and get something that builds. Or look at the
dependencies of python/python3 and make micropython unavailable for
bfin.

Any thoughts/guidance?

Thanks,
Chris
--
[1] - http://autobuild.buildroot.org/results/cd2/cd21ee5ca3ca441aa2941e8d2729afa99d0403f0/build-end.log
[2] - https://github.com/micropython/micropython/blob/master/py/showbc.c#L294
