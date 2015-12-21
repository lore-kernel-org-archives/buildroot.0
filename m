From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 23:55:18 +0100
Subject: [Buildroot] [PATCH 0/8 RFC] core: install foo-config scripts
 early in the PATH (branch yem/foo-config-in-PATH)
In-Reply-To: <20151221233458.32befcc2@free-electrons.com>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <20151221232048.1218dd26@free-electrons.com>
 <20151221223030.GG3454@free.fr>
 <20151221233458.32befcc2@free-electrons.com>
Message-ID: <20151221225518.GI3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-21 23:34 +0100, Thomas Petazzoni spake thusly:
> On Mon, 21 Dec 2015 23:30:30 +0100, Yann E. MORIN wrote:
> > And how do we handle them today? If we don't do anything about it, then
> > this series would indeed not solve those, but it would not break it
> > either, since it would already be broken today.
> > 
> > Unless we do have code to manually install them in $(HOST_DIR)/usr/bin ?
> 
> What? No, we are just installing them in $(STAGING_DIR), like all
> libraries. You can look at package/rtai/rtai.mk for an example.

That one is interesting, indeed. We "fix" rtai-config in-place in
staging, but then we never pass $(STAGING_DIR)/usr/bin/rtai-config to
any variable of any package, which means that any consumer of
rtai-config, if any, is called with $(STAGING_DIR)/usr/bin in its PATH.

I think this is an abomination. There are three cases there:

  - cross-compiling for a different architecture with shared libraries:
    this is not really a problem, binaries in there will not work; yet,
    this might still cause problems, because there might be binaries in
    there that would shadow those of the host, and that would be a
    problem.

  - cross-compiling for the same architecture: binaries in staging would
    probably work if the host system is recent enough that the C library
    id "compatible" (same or newer glibc on the host) or if doing a
    static build.

  - cross-compiling with static libs: damn, that one would be awfully
    trricky to debug. For example, my machine is setup to run qemu-user
    for some architectures, so I'd totaly be able to run ARM binaries on
    my build machine. Fortunately, this is a rare-enough case that we
    were not caught by it yet...

And we indeed do such abonminations. For example, the libhid stuff that
I already fixed in my series.

> > > Also, this solution doesn't solve the (admittedly unlikely) case of a
> > > package calling /usr/bin/<foo>-config directly.
> > 
> > Indeed. But it is already broken today, and the series does not break it
> > any more.
> 
> It is not broken today. Such special *-config scripts get naturally
> installed in $(STAGING_DIR), they might be fixed up by a patch or some
> custom hook. And then on the consumer side, we pass some environment
> variable or other trick to get the consumer build system to use this
> specific -config script rather than the one in the PATH. Nothing
> special.

Then those patch-or-hook fixups should be complemented by a post-install
hook that also installs the -config script in the newly-introduced
FOO_CONFIG_DIR.

Again, nothing that this series would *break*; existing "workarounds"
would continue to work as-is. It's only a new opportunity to cleanup
the mess, but will need much more pathces later on.

Ah, that's probably what I forgot to write in my cover later: this
8-patch series only introduces the "infra" and does not actually fix the
packages, or undo our workarounds, or removes our patches, of add new
fixes. Hmm. Well, actually I did:

    When/if the topic is accepted (and the series is fixed after the
    reviews), we can then (un)fix / (un)patch packages in follow-up
    patches.

Or maybe I completely missed the point...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
