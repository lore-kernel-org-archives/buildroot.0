From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 25 Nov 2016 08:54:31 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <440dae9f-817e-5e1c-cc30-1d80c96d2320@mind.be>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
 <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
 <20161123130636.5b362a27@free-electrons.com>
 <CAM+bi4ujUpa+BEtU8XAC1sCW2AoM8gUhT-Rtg8xWs-_O8KTF6A@mail.gmail.com>
 <CAM+bi4sYT51Qc72s1bpsRw8K3mOPRjMtYC171YOms1L_PG0R7g@mail.gmail.com>
 <CAM+bi4sa9FG+eac3WdciC+rGih7mKk14syiT_O0mwXeyQh_5qA@mail.gmail.com>
 <440dae9f-817e-5e1c-cc30-1d80c96d2320@mind.be>
Message-ID: <CAM+bi4vkv9h7sK4LOhXTm0TvZ3OiW2kNm6vfR3LHLtZmONjnzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-11-24 21:41 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:

>  I haven't followed this in detail, but is there any reason why
> CC="$(TARGET_CC) -ffreestanding" doesn't work?
>

Hi Arnout,

In the end I've managed to get this thing to build and it's working now on
the platform.

The reason why that won't work with this codebase is because the BSP over
which the
bootloader is built requires some newlib files. Specifically, it requires
the set of crt*.S files,
which seem to have been semi-split from newlib into libgloss.

I've copied files from here and patched crtinit.S to add __init and __fini
sections

https://sourceware.org/git/gitweb.cgi?p=newlib-cygwin.git;a=tree;f=libgloss/
microblaze;h=d713445523e8a7cd84cc3e4dadf12d06a8a3daa6;hb=HEAD

I also found this document
https://forums.xilinx.com/xlnx/attachments/xlnx/zaps/
13261/1/(Guidance%20Note)%20Zynq%20-%20Using%20a%20Custom%20BareMetal%20GCC%
20Toolchain%20in%20XSDK%20(Cross%20GCC)%20r05.docx
<https://forums.xilinx.com/xlnx/attachments/xlnx/zaps/13261/1/%28Guidance%20Note%29%20Zynq%20-%20Using%20a%20Custom%20BareMetal%20GCC%20Toolchain%20in%20XSDK%20%28Cross%20GCC%29%20r05.docx>

which helped me create a Xilinx.spec file to pass over to gcc

In the end it's been an almost 18 hours journey that has been fruitful:
I've learned
lots of things I didn't know and I've managed to do what I needed: bulding
standalone
applications for microblaze using buildroot.

However, I don't know if I can generalize this work to improve buildroot
and make this
available for anyone. Should newlib exist as a package for buildroot? Maybe
only libgloss?
I don't mind working on this, but I'd need some guidance, as I don't have
everything clear
yet. What could be a nice starting point?

I see on the list there was a patch from March "toolchain: add support for
the newlib library"
but as far as I know it hasn't been comitted. Maybe improving that patch to
fix the issues
it had could be the first step.

Best regards!

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161125/3e7e08f8/attachment.html>
