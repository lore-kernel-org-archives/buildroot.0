From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jan 2020 11:57:08 +0100
Subject: [Buildroot] Linux kernel: host-libyaml dependency
In-Reply-To: <CAGm1_kuySu9PVbXpJL5Z1V2UQj6C0cgiqgERoWrAC1FkT3sdAg@mail.gmail.com>
 (Yegor Yefremov's message of "Fri, 31 Jan 2020 10:33:39 +0100")
References: <CAGm1_ktWWnNymXDhkKowu+0u2DSwqNA-3dW6hHy_omW_PXXdOg@mail.gmail.com>
 <87lfposhfl.fsf@dell.be.48ers.dk>
 <CAGm1_kuySu9PVbXpJL5Z1V2UQj6C0cgiqgERoWrAC1FkT3sdAg@mail.gmail.com>
Message-ID: <87r1zfrj0b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > On Thu, Jan 30, 2020 at 11:33 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
 >> 
 >> > I had a build breakage during the 5.4.15 kernel compilation because of
 >> > the missing yaml library. The code in kernel is under scripts/dtc.
 >> 
 >> Hmm, what is the error exactly?

 >>>> linux 5.4.15 Configuring
 >>>> linux 5.4.15 Building
 >   HOSTCC  scripts/dtc/yamltree.o
 > scripts/dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory
 >  #include <yaml.h>
 >           ^~~~~~~~
 > compilation terminated.

yamltree.c only gets conditionally compiled. From scripts/dtc/Makefile:

ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
ifneq ($(CHECK_DTBS),)
$(error dtc needs libyaml for DT schema validation support. \
        Install the necessary libyaml development package.)
endif
HOST_EXTRACFLAGS += -DNO_YAML
else
dtc-objs        += yamltree.o
HOSTLDLIBS_dtc  := $(shell pkg-config yaml-0.1 --libs)
endif

So presumably pkg-config things you have yaml-0.1 available, but then
doesn't find the header file.

Building your defconfig, I see what the problem is. You build libyaml
for the target and host-pkgconf, so the kernel build system finds our
pkg-config but we don't set the PKG_CONFIG_ environment variables so it
returns information for the target confusing this host build.

I guess the easiest workaround is to unconditionally (rather than just
if NEEDS_HOST_LIBELF is enabled) set these environment variables when
building the Linux kernel. If the kernel doesn't use pkg-config or if we
don't build host-pkgconf then they don't hurt.

I will send a patch to do that.

-- 
Bye, Peter Korsgaard
