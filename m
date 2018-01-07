From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 17:34:27 +0100
Subject: [Buildroot] [PATCH] libselinux: set PREFIX to generate proper
 .pc file
In-Reply-To: <20180107162434.GA27635@gmail.com>
References: <20180106145249.3090-1-marcus.folkesson@gmail.com>
 <20180107151618.62c734e2@windsurf>
 <20180107162434.GA27635@gmail.com>
Message-ID: <20180107173427.1dc604d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Jan 2018 17:24:34 +0100, Marcus Folkesson wrote:

> > How can this work without passing PREFIX=/usr also at install time ?
> > (Same question for libsemanage and libsepol).  
> 
> If not PREFIX is passed, it get the value of $(DESTDIR)/usr, which I
> think is correct?

No, in the standard semantic of DESTDIR and PREFIX:

 - PREFIX should be /usr, and DESTDIR $(TARGET_DIR) or $(STAGING_DIR)
   for target installation

 - PREFIX should be $(HOST_DIR) for host installation, DESTDIR is not
   used

PREFIX is where the software is going to be executed from. So the
software is going to be executed from /usr for target software, from
$(HOST_DIR) for host software. PREFIX potentially has an effect on the
stuff being built: PREFIX might end up being hardcoded into the
binaries being compiled.

DESTDIR is used to divert the installation. It is only meaningful
during installation. It has no effect on the stuff being built: DESTDIR
is never going to be hardcoded in a binary.

> If PREFIX=/usr at install time, it tries to install on the host
> system.

That's bogus.

> I guess autotools would have done a better job with DESTDIR and PREFIX.

Yes.

> What I can tell, the libselinux.pc is the only target that make use of
> PREFIX during compile time.
> 
> But maybe I should set PREFIX explicitly to $(XXXXX_DIR)/usr during
> installation just for clarity?

In the standard (autotools) semantic of PREFIX,
PREFIX=$(TARGET_DIR)/usr is wrong, see above.

> From libselinux/src/Makefile:
> PREFIX ?= $(DESTDIR)/usr

Yes that's just plain wrong.

So, two options:

 - We fix libselinux Makefile to have a more standard DESTDIR/PREFIX
   usage.

 - We keep libselinux Makefile as-is, but we had some comments in
   libselinux.mk that explain the weird PREFIX/DESTDIR usage.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
