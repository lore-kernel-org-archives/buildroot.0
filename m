From: Stefano Guandalini <guandalf@gmail.com>
Date: Wed, 15 May 2019 06:07:36 -0700
Subject: [Buildroot] Npm install fails if package ships precompiled
 binaries
In-Reply-To: <442f0048-d81d-8172-3efa-44cb80b34ac0@mind.be>
References: <442f0048-d81d-8172-3efa-44cb80b34ac0@mind.be>
 <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
Message-ID: <CAH7nf8=GgAb1Hnorb0QRQZ6Y5ByWEV=B7b12yxcDyFcSyJHpXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I'm building for ARM 64 on an x86_64 but I think the issue comes because
the npm package is shipped with binaries for "all" arch. I incorrectly
reported only a part of the error. The following chunk should render the
issue clearer:
+ stf at 3.4.1
updated 1 package in 29.879s
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/armeabi-v7a/minirev" is "ARM",
should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/armeabi-v7a/minirev-nopie" is
"ARM", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/armeabi/minirev" is "ARM", should
be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/armeabi/minirev-nopie" is "ARM",
should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/mips/minirev" is "MIPS R3000",
should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/mips/minirev-nopie" is "MIPS
R3000", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/mips64/minirev" is "MIPS R3000",
should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/mips64/minirev-nopie" is "MIPS
R3000", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/x86_64/minirev" is "Advanced
Micro Devices X86-64", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/x86_64/minirev-nopie" is
"Advanced Micro Devices X86-64", should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/x86/minirev" is "Intel 80386",
should be "AArch64"
ERROR: architecture for
"/usr/lib/node_modules/stf/vendor/minirev/x86/minirev-nopie" is "Intel
80386", should be "AArch64"

I'm not really sure the tool works at runtime because I still have to test
all its functionalities, but at least the "base" command is installed and
correctly runs.

Thank you very much.

Best.


Stefano Guandalini
about.me/guandalf
[image: Stefano Guandalini on about.me]



On 15 May 2019 at 13:49, Arnout Vandecappelle <arnout@mind.be> wrote:


>
> On 15/05/2019 12:51, Stefano Guandalini wrote:
> > Hi,
> >
> > I'm building an image for raspberrypi3 containing nodejs and the "stf"
> npm package.
> > The npm install phase completes correctly but then the check step
> introduced by
> > this commit:
> >
> https://git.busybox.net/buildroot/commit/?id=bbb7f6c16cd5ff04ec9b78713f42ea53a940529f
> > stops the build with errors like:
> > ERROR: architecture for
> > "/usr/lib/node_modules/stf/vendor/minirev/arm64-v8a/minirev" is
> "AArch64",
> > should be "ARM"
>
> Are you building for ARM 32-bit on an ARMv8 CPU? Apparently, npm
> misinterprets
> this incorrectly as a 64-bit ARM and downloads the 64-bit version instead
> of the
> 32-bit version. This wouldn't work at runtime.
>
> It's also possible, though, that
> output/target/usr/lib/node_modules/stf/vendor/minirev contains both the
> 32-bit
> and the 64-bit variants. In that case, it would still work, and we should
> probably do something about that check.
>
>
> > I temporarily solved the issue commenting out the check, provided that I
> know
> > stf is the only package I'm installing, but I thing there could be a
> safer way
> > to perform this step.
>
> So, does this actually work at runtime? It's possible that the minirev
> package
> isn't actually used by stf (npm tends to pull in loads of dependencies
> that are
> never used), so you'd need to test minirev by itself.
>
> Regards,
> Arnout
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/efa48f62/attachment.html>
