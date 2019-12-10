From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 14:04:38 +0100
Subject: [Buildroot] autotools, autorefconf,
 libtoolize and non-existing m4 directory
In-Reply-To: <c9d71c066a825c04278c1b57df673fb6@walle.cc>
References: <c9d71c066a825c04278c1b57df673fb6@walle.cc>
Message-ID: <20191210140438.001cfca7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Dec 2019 11:34:51 +0100
Michael Walle <michael@walle.cc> wrote:

> Hi Thomas, Hi Peter,
> 
> we have a package [1] where:
>   - we have AC_CONFIG_MACRO_DIR([m4]) in configure.ac
>   - we have ACLOCAL_AMFLAGS = -I m4 in Makefile.am
>   - we do *not* have an m4/ subdirectory (there is actually a commit
>     that introduces an empty m4/ directory, but that should not be
>     necessary)
> 
> We now do trigger a bug where autoreconf from the host works perfectly
> and the autoreconf of busybox do not. Here is our first analysis:
>   - originating from [2], there was an upstream patch which degrades the
>     absence of a local m4 directory from fatal to just a warning in the
>     aclocal step.
>   - the current aclocal script treats just the _first_ include directory
>     that way. Ie. it assumes, that the local m4/ is the first one in
>     @user_includes, see [3]
>   - buildroot sets the first one by its own in the automake package,
>     see [4], because it supplies the first include already in the
>     "$(ACLOCAL)"
> 
> Is this behaviour intended? There is also an install option to aclocal
> which uses first directory in the list.
> 
> Unfortunately, I cannot come up with a solution other than:
>    ACLOCAL_AMFLAGS = -I m4 $(SOME_OTHER_FLAGS)
> and buildroot would set its own include path in SOME_OTHER_FLAGS. But
> I'd guess that will break many packages. So maybe the current behaviour
> is the lesser evil. But it does not really work like on the host system.

Maybe I misunderstood, but why don't you solve this like we're doing in
many other Buildroot packages already:

define LIBISCSI_CREATE_M4_DIR
        mkdir -p $(@D)/m4
endef
LIBISCSI_POST_PATCH_HOOKS += LIBISCSI_CREATE_M4_DIR

This is simple, and works just fine.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
