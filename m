From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 09:30:46 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
Message-ID: <55AF8CF6.7080709@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/07/15 08:24, Brendan Heading wrote:

> A bit of further info. buildroot is generating a toolchain for SPARC v8
> (25 years young!), which doesn't have the instructions available to
> support all of the atomic functions in GCC. It seems to support some of
> them, so naive source code *thinks* that since the macro indicating the
> presence of atomic support is defined, that all of the functions exist.
>
> I guess there are a few options. We could find some way of disabling
> atomic support completely when building for SPARC; or set up the LDFLAGS
> to always link libatomic; or try to patch upstream to detect atomic
> features better - the configure script could be extended to detect if
> libatomic is needed or not.

Hi Brendan.
That's exactly the problem, though in your previous mail you had a 
slight conceptual slip, libatomic is provided by gcc itself.
libatomic is provided to provide (sic!) fallback atomic operations, 
usually implemented via a lock.
SPARC v8 doesn't provide lockless atomics, it needs stbar trickery.
v9+ does implement them via membar (TSO), see:
http://www.oracle.com/technetwork/server-storage/solaris10/index-142944.html

Long story short not every architecture provides the necessary atomics 
for all packages (sparc v8 being the "none"), since there are varying 
sizes (bits=8,16,32,64 normally).

A failure example would be building libglib2 for i386 which doesn't have 
them either, though glib captures this rather than failing later:

checking for lock-free atomic intrinsics... configure: error: GLib must 
be build with -march=i486 or later.

Another example is the trick i'm doing for the new webkit version and 
some arch combinations:

# Some 32-bit architectures need libatomic support for 64-bit ops
ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_sh),y)
WEBKITGTK24_CONF_ENV += LIBS="-latomic"
endif

So adding libatomic to LIBS normally "fixes" the problem, but enabling 
it on a global-scale doesn't look that great, and each package has a 
different set of requirements depending on the atomics size it uses.
(example: microblaze and strongswan = 8 bits).

We could "declare" each package atomics needs via selects and throw 
libatomic into some variable in the package infrastructure, that's the 
best i could think of so far - but it's some work, which sparc could 
help test because it generally needs it ;)

Regards.
