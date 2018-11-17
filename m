From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Nov 2018 18:57:18 -0600
Subject: [Buildroot] [PATCH 3/5] support/testing/infra/emulator.py:
 support aarch64
In-Reply-To: <5bef40ec4534b_55dd3fae540e463c159d7@ultri5.mail>
References: <1542150146-12188-3-git-send-email-matthew.weber@rockwellcollins.com>
 <5bef40ec4534b_55dd3fae540e463c159d7@ultri5.mail>
Message-ID: <CANQCQpa+p3sxjO9M14ptoxaNWJMZ22FdYOmG_jEwT1pk4mkoDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Fri, Nov 16, 2018 at 4:13 PM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Hello,
>
> + Thomas
>
> On Tue, Nov 13, 2018 at 09:02 PM, Matt Weber wrote:
>
> >  - Add the condition under the -kernel assignment for aarch64
> >  - Tested with a defconfig simliar to qemu_aarch64_virt_defconfig
>
> s/simliar/similar

Noted.

>
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  support/testing/infra/emulator.py | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> > index 802e89d..8e5a7e9 100644
> > --- a/support/testing/infra/emulator.py
> > +++ b/support/testing/infra/emulator.py
> > @@ -62,7 +62,9 @@ class Emulator(object):
> >                      kernel = infra.download(self.downloaddir,
> >                                              "kernel-versatile")
> >                      qemu_cmd += ["-M", "versatilepb"]
> > -
> > +            elif arch == "aarch64":
> > +                kernel_cmdline.append("console=ttyAMA0")
> > +                qemu_cmd += ["-M", "virt", "-cpu", "cortex-a53"]
>
> We don't really need this code here.
> You could do this in the test case:
>
> self.emulator.boot(arch="aarch64",
>                    kernel=kern,
>                    kernel_cmdline=["console=ttyAMA0"],
>                    options=["-M", "virt", "-cpu", "cortex-a53", "-m", "512", "-initrd", img])
>
> If we think more and more test cases would need/want this we could add this
> here, preferably as a "builtin" pre-compiled kernel for aarch64.
>
> But for now, I suggest to move this code to the test case.

I think I'm good either way and asked a bit about this during the last
developers meeting.  I just need to know if the preference is to
provide a kernel or build it each time.  If we start using more
pre-builts, probably need a way to version control those and
streamline submission?

For this test it is quite time consuming already so the kernel build
is in the noise.  Plus your point is valid that we don't have a least
two examples where we would have this in common (yet).  I'll
consolidate this in with the test in my next version.

Thanks for the review!
Matt
