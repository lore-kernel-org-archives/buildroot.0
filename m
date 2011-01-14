From: Matt Johnson <mj1856@hotmail.com>
Date: Fri, 14 Jan 2011 09:04:43 -0700
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <20110114154430.4952dca7@surf>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>	<20110114091129.13d810c8@surf>	<AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
	<20110114154430.4952dca7@surf>
Message-ID: <BAY145-ds21C7E90736BB4F6C125201C2F30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> So, as I said in another e-mail, I think ld does allows to choose between
different ld variants.
> So the link should always be done with gcc, which then drives ld, giving
it the correct path to the appropriate libraries and runtime.
>

Sorry, perhaps I confused the issue.  It's not that -march needs to be
passed to LD, it's needed because of how the freetype makefile is designed
to use libtool.

From freetype-2.4.4/builds/unix/unix-cc.in:

# Library linking
#
LINK_LIBRARY = $(LIBTOOL) --mode=link $(CCraw) -o $@ $(OBJECTS_LIST) \
                          -rpath $(libdir) -version-info $(version_info) \
                          $(LDFLAGS) -no-undefined \
                          # -export-symbols $(EXPORTS_LIST)


Earlier in the file, they do this:

CCraw := $(CC)
CC    := $(LIBTOOL) --mode=compile $(CCraw)

I opened a bug with the FreeType team here:
https://savannah.nongnu.org/bugs/?32114

, suggesting that they pass the CFLAGS as part of CCraw, but one of their
lead devs suggested that just -march should be passed in the LDFLAGS.  Any
actual calls to LD would ignore the flag anyway.

Since FreeType is not updated anywhere near as often as BuildRoot, it seems
to make sense.

-Matt
