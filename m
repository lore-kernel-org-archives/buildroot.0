From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 13:36:45 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
 <1311178214.2189.68.camel@dublxciaranr1.verifone.com>
Message-ID: <CAAXf6LXV+7P5636KKv9TSKNPPT2zdXUJF=MP_A5r4fMHXXOyBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 20, 2011 at 6:10 PM, Quotient Remainder
<quotientvremainder@gmail.com> wrote:
> Thomas,
>
> On Wed, 2011-07-20 at 15:38 +0200, Thomas De Schampheleire wrote:
>> >
>> >> * I need to be able to compile external kernel modules, so in that
>> >> Makefile I need to point to the right kernel directory.
>> >
>> > Ok. Those could be integrated as Buildroot packages, in which case
>> > getting access to the Linux source directory is easy.
>>
>> Good point. I'll have to add Mercurial support in buildroot to get there though.
>
> I may be misinterpreting, but does the above mean that you have a decent
> generic external kernel module build structure going? ?I have a terribly
> hacky setup working here but it's completely incompatible with the
> recent linux GENTARGETS approach.
> Care to share your external module build stuff?

I wouldn't call it a 'generic build structure'. So far I have been
using a simple Makefile, taking one command-line variable pointing to
the buildroot 'output' directory. Based on this variable, the location
of the kernel is inferred (currently based on a 'linux' symlink I
added, as mentioned earlier), together with the compiler.

TARGETS=module1 module2
OPTIONS= -C $(BUILDROOT_OUTPUT)/build/linux M=$(PWD) ARCH=powerpc
CROSS_COMPILE=$(BUILDROOT_OUTPUT)/host/usr/bin/powerpc-linux-
EXTRA_CFLAGS += -DDEBUG

OBJECTS=$(addsuffix .o, $(TARGETS))
obj-m += $(OBJECTS)

all:
        make $(OPTIONS) modules

clean:
        make $(OPTIONS) clean

install:
        make $(OPTIONS) INSTALL_MOD_PATH=$(BUILDROOT_OUTPUT)/target
INSTALL_MOD_STRIP=1 modules_install



After the suggestions in this thread, plus the intention to have as
much of the project builds being coordinated from buildroot, I'm going
to step away from this approach though. The linux-fusion Makefile that
Thomas referred to seems like a good starting point for me.

Thomas
