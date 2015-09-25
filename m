From: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Date: Fri, 25 Sep 2015 12:04:03 +0900
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: Your message of Thu, 24 Sep 2015 15:28:03 +0100.
 <56040873.30608@imgtec.com>
Message-ID: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, Vincente.

Thank you for your test and comment.

Vicente Olivert Riera writes:
> Dear Hiroshi Kawashima,
> 
> are you able to download squeezelite? I'm having this problem:
> 
> >>> squeezelite v1.8 Downloading
> Doing shallow clone
> Initialized empty Git repository in
> /br/output/build/.squeezelite-v1.8.tar.gz.pb3XtQ/squeezelite-v1.8/
> remote: Counting objects: 82, done.
> Unpacking objects: 100% (82/82), done.
> warning: Remote branch v1.8 not found in upstream origin, using HEAD instead
> fatal: unable to read tree 668edec073bef579bedf43817f65aee3a592d0ef
Hmm...
I have been working on my cached source, so I did not realize it.
Yes, I can reproduce your problem with real clean buildroot tree.
Maybe something changed https://code.google.com/p/squeezelite repo
since my last fetch.
I'm considering to change SQUEEZELITE_SITE to github repo like:
https://github.com/sixeyed/squeezelite
Does this repo work for you too ?

> > I think I reflected all feedbacks except TARGET_CONFIGURE_OPTS issue.
> > I'm not sure the right way to fix this, so would anyone suggest me?
> 
> TARGET_CONFIGURE_OPTS is a variable which defines PATH, CC, LD and more
> things. You can have a look at it in package/Makefile.in, line #247.
> 
> Instead of passing CC="$(TARGET_CC)" LD="$(TARGET_LD) to the make
> command, you could just pass $(TARGET_CONFIGURE_OPTS).
> 
> There is a comment at the end where I show you how to use it.

[snip]

> > +define SQUEEZELITE_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> > +		CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> 
> Here is where you could use the $(TARGET_CONFIGURE_OPTS) variable:
> 
> 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
> 
> Perhaps using $(TARGET_CONFIGURE_OPTS) as environment variable would
> work as well, and since it also defines PATH, then $(TARGET_MAKE_ENV)
> wouldn't be needed:
> 
> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
> 		OPTS="$(SQUEEZELITE_MAKE_OPTS)" -C $(@D) all
Yes, I know basic usage of TARGET_CONFIGURE_OPTS as you explained,
thanks.
But just changing like this does not work with squeezelite's Makefile.
I included squeezelite's Makefile in last of this e-mail.
It determines optional libraries to be linked, I choose libsoxr as
example like this:
...
CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
LDFLAGS ?= -lasound -lpthread -lm -lrt
...
OPT_RESAMPLE= -DRESAMPLE
...
LINKALL_RESAMPLE = -lsoxr
...
ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
        LDFLAGS += $(LINKALL_RESAMPLE)
endif
...
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
...
.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@
...

But TARGET_CONFIGURE_OPTS override CFLAGS, LDFLAGS, etc.
It results original Makefile logic does not work.
Can you suggest me right way (of buildroot) how to solve this ?
How should I control final CFLAGS, LDFLAGS, etc from squeezelite.mk
file ?

Regards,
Kawashima

=== squeezelite Makefile ====
# Cross compile support - create a Makefile which defines these three variables and then includes this Makefile...
CFLAGS  ?= -Wall -fPIC -O2 $(OPTS)
LDFLAGS ?= -lasound -lpthread -lm -lrt
EXECUTABLE ?= squeezelite

# passing one or more of these in $(OPTS) enables optional feature inclusion
OPT_DSD     = -DDSD
OPT_FF      = -DFFMPEG
OPT_LINKALL = -DLINKALL
OPT_RESAMPLE= -DRESAMPLE
OPT_VIS     = -DVISEXPORT
OPT_IR      = -DIR

SOURCES = \
	main.c slimproto.c buffer.c stream.c utils.c \
	output.c output_alsa.c output_pa.c output_stdout.c output_pack.c decode.c \
	flac.c pcm.c mad.c vorbis.c faad.c mpg.c

SOURCES_DSD      = dsd.c dop.c dsd2pcm/dsd2pcm.c
SOURCES_FF       = ffmpeg.c
SOURCES_RESAMPLE = process.c resample.c
SOURCES_VIS      = output_vis.c
SOURCES_IR       = ir.c

LINK_LINUX       = -ldl

LINKALL          = -lFLAC -lmad -lvorbisfile -lfaad -lmpg123
LINKALL_FF       = -lavcodec -lavformat -lavutil
LINKALL_RESAMPLE = -lsoxr
LINKALL_IR       = -llirc_client

DEPS             = squeezelite.h slimproto.h

UNAME            = $(shell uname -s)

# add optional sources
ifneq (,$(findstring $(OPT_DSD), $(CFLAGS)))
	SOURCES += $(SOURCES_DSD)
endif
ifneq (,$(findstring $(OPT_FF), $(CFLAGS)))
	SOURCES += $(SOURCES_FF)
endif
ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
	SOURCES += $(SOURCES_RESAMPLE)
endif
ifneq (,$(findstring $(OPT_VIS), $(CFLAGS)))
	SOURCES += $(SOURCES_VIS)
endif
ifneq (,$(findstring $(OPT_IR), $(CFLAGS)))
	SOURCES += $(SOURCES_IR)
endif

# add optional link options
ifneq (,$(findstring $(OPT_LINKALL), $(CFLAGS)))
	LDFLAGS += $(LINKALL)
ifneq (,$(findstring $(OPT_FF), $(CFLAGS)))
	LDFLAGS += $(LINKALL_FF)
endif
ifneq (,$(findstring $(OPT_RESAMPLE), $(CFLAGS)))
	LDFLAGS += $(LINKALL_RESAMPLE)
endif
ifneq (,$(findstring $(OPT_IR), $(CFLAGS)))
	LDFLAGS += $(LINKALL_IR)
endif
else
# if not LINKALL and linux add LINK_LINUX
ifeq ($(UNAME), Linux)
	LDFLAGS += $(LINK_LINUX)
endif
endif

OBJECTS = $(SOURCES:.c=.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

$(OBJECTS): $(DEPS)

.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) $< -c -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)
=== end of squeezelite Makefile ====
============================================================
    Hiroshi Kawashima
