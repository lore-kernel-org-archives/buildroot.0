From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Aug 2018 22:35:16 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-Q8jL5YpRLJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

--- Comment #2 from Frank Vasquez <frankv@helium.com> ---
Thank you for your prompt reply, Frank.  I was away on vacation and am just
getting back to this now.

>  I assume bitcask was cross-compiled outside of Buildroot, right?

Yes and no.  Our application is being built using rebar3 as opposed to
Buildroot's built-in rebar-package support.  Our package .mk file looks like
this.

define BEAMCOIN_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) compile \
        PATH='$(BR2_EXTERNAL_HELIUM_PATH)/output/host/lib/erlang/bin:$(PATH)' \
       
CPATH='$(BR2_EXTERNAL_HELIUM_PATH)/output/target/usr/lib/erlang/usr/include:$(CPATH)'
\
       
LDFLAGS='-L$(BR2_EXTERNAL_HELIUM_PATH)/output/build/erlang-20.0/lib/erl_interface/obj/arm-buildroot-linux-gnueabihf
-fPIC -shared'
endef

$(eval $(generic-package))

And the underlying Makefile looks like this.

REBAR=./rebar3

compile:
        $(REBAR) compile

You can see from FOOBAR_BUILD_CMDS that I set PATH, CPATH and LDFLAGS so that
the NIFs cross-compile correctly.  Don't know if I am going about that the
right way.  At least the NIFs appear to build fine on x86 32-bit hosts.  My
team is doing bleeding edge blockchain work in Erlang (much of it already open
source) so they really want to use rebar3.

> Is it possible to reproduce this with a small Erlang application?

I believe so.  I will try to assemble a small repro using just rebar3 and
bitcask.

Cheers,
Frank

-- 
You are receiving this mail because:
You are on the CC list for the bug.
