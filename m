From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 18 Nov 2019 11:51:05 -0600
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: really fix build on
 Arch Linux x86_64
In-Reply-To: <CANQCQpaoHQwD+F++N=snVu25+xT_NZp-M5GCH7Or=t+frpuTVw@mail.gmail.com>
References: <20191117184114.1917-1-arnout@mind.be>
 <CANQCQpaoHQwD+F++N=snVu25+xT_NZp-M5GCH7Or=t+frpuTVw@mail.gmail.com>
Message-ID: <CANQCQpbcScCZgFhtsz77C_avtgiRHtk8nBdRouTJ+=hRWXPuWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Mon, Nov 18, 2019 at 8:45 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> On Sun, Nov 17, 2019 at 12:41 PM Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
> >
> > On x86_64, we use the host compiler instead of the target compiler to
> > build kvm-unit-tests, because it is built with -m32 and our target
> > compiler doesn't support that.
> >
> > However, the compiler on Arch Linux is broken: it *always* builds with
> > -fstack-protector, even when -ffreestanding is passed. However, when
> > -fnostdlib is passed at link time (which is normally the case when
> > building with -ffreestanding), it is not linked with the stack-protector
> > library. This leads to a link time error:
> >
> > /usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
> > .../x86/realmode.c:104: undefined reference to `__stack_chk_fail'
> >
> > Since the entire package is built with -ffreestanding, it doesn't
> > support stack-protector at all. Therefore, simply pass
> > -fno-stack-protector explicitly on x86_64 to work around the bug in Arch
> > Linux.
> >
> > Commit c0ffd16e4 tried to do this, but got the condition wrong:
> > -fno-stack-protector was passed in all cases *except* for x86_64. This
> > commit fixes that, by inverting the condition and moving the
> > --cross-prefix part to the else branch.
> >
> > Fixes: (no new autobuild failures yet)
> >
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Oops, I'm pretty sure I tested this with that condition set
> incorrectly.  I wonder if we have something else going on that masked
> the problem because of commit c0ffd16e4  addition of
> "$(KVM_UNIT_TESTS_MAKE_OPTS)" to the build/install cmds.

Disregard that statement above about build/install cmds, I did a build
test and it still fails with current master.

I've applied this patch and my Arch Linux build passes.
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

>
> Reviewed
>
> > ---
> >  package/kvm-unit-tests/kvm-unit-tests.mk | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> > index bb08c0603d..2637066701 100644
> > --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> > +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> > @@ -35,13 +35,14 @@ KVM_UNIT_TESTS_CONF_OPTS =\
> >  # compiler. However, for x86-64, we use the host compiler, as
> >  # kvm-unit-tests builds 32 bit code, which Buildroot toolchains for
> >  # x86-64 cannot do.
> > -ifneq ($(BR2_x86_64),y)
> > -KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
> > +ifeq ($(BR2_x86_64),y)
> >  # Arch Linux adds -fstack-protector even when building with -ffreestanding, but
> >  # it doesn't link with the stack-protector library when -nostdlib is passed,
> >  # which leads to a link error. Therefore, disable it explicitly to work around
> >  # this bug in Arch Linux. https://bugs.archlinux.org/task/64270
> >  KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
> > +else
> > +KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
> >  endif
> >
> >  define KVM_UNIT_TESTS_CONFIGURE_CMDS
> > --
> > 2.21.0
> >



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
