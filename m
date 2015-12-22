From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 11:53:26 +0100
Subject: [Buildroot] [PATCH 0/8 RFC] core: install foo-config scripts
 early in the PATH (branch yem/foo-config-in-PATH)
In-Reply-To: <20151221225518.GI3454@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
 <20151221232048.1218dd26@free-electrons.com>
 <20151221223030.GG3454@free.fr>
 <20151221233458.32befcc2@free-electrons.com>
 <20151221225518.GI3454@free.fr>
Message-ID: <20151222115326.26177c69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Dec 2015 23:55:18 +0100, Yann E. MORIN wrote:

> That one is interesting, indeed. We "fix" rtai-config in-place in
> staging, but then we never pass $(STAGING_DIR)/usr/bin/rtai-config to
> any variable of any package, which means that any consumer of
> rtai-config, if any, is called with $(STAGING_DIR)/usr/bin in its PATH.

Absolutely not.

There are no packages in Buildroot that use the RTAI libraries. The
rtai-config script in $(STAGING_DIR) is meant to be used:

 1/ by custom packages (i.e not in Buildroot mainline)

 2/ by people building their stuff outside of Buildroot

> I think this is an abomination. There are three cases there:

There is absolutely no abomination here. This is a regular *-config
script, installed in STAGING_DIR like any other. It is just not used by
any package in the upstream Buildroot.

> > It is not broken today. Such special *-config scripts get naturally
> > installed in $(STAGING_DIR), they might be fixed up by a patch or some
> > custom hook. And then on the consumer side, we pass some environment
> > variable or other trick to get the consumer build system to use this
> > specific -config script rather than the one in the PATH. Nothing
> > special.
> 
> Then those patch-or-hook fixups should be complemented by a post-install
> hook that also installs the -config script in the newly-introduced
> FOO_CONFIG_DIR.

Correct.

> Again, nothing that this series would *break*; existing "workarounds"
> would continue to work as-is. It's only a new opportunity to cleanup
> the mess, but will need much more pathces later on.
> 
> Ah, that's probably what I forgot to write in my cover later: this
> 8-patch series only introduces the "infra" and does not actually fix the
> packages, or undo our workarounds, or removes our patches, of add new
> fixes. Hmm. Well, actually I did:
> 
>     When/if the topic is accepted (and the series is fixed after the
>     reviews), we can then (un)fix / (un)patch packages in follow-up
>     patches.

Yes, yes, this is fully understood, I do understand that we will be
able to remove a number of patches, or custom variable passing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
