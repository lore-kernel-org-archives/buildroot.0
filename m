From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 14:30:24 +0100
Subject: [Buildroot] autotools, autorefconf,
 libtoolize and non-existing m4 directory
In-Reply-To: <f4bfdbacb2180b054d3e290355dc1ed8@walle.cc>
References: <c9d71c066a825c04278c1b57df673fb6@walle.cc>
 <20191210140438.001cfca7@windsurf>
 <f4bfdbacb2180b054d3e290355dc1ed8@walle.cc>
Message-ID: <20191210143024.7b3a8bb6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 14:21:06 +0100
Michael Walle <michael@walle.cc> wrote:

> > This is simple, and works just fine.  
> 
> Correct, that would work, actually, we already had that construct in the
> recipe. But as I've already said, this behaviour is very different than
> on the host. Esp. if you'd use "aclocal -i"; which I don't know if it is
> used at all. Currently there are many workarounds, all are fine. My
> intention was to make you aware of this bug; or if you already knew it,
> your opinion on it. Eg. aclocal is handling the first include path in a
> special way, but buildroot already occupies that slot.

No, I was not aware that the first include path is handled in a special
way, and that because Buildroot uses that slot, the m4/ directory no
longer gets created automatically.

In fact, aclocal's man page says:

       --install
              copy third-party files to the first -I directory

So indeed that's I guess how the m4/ directory gets created.

Perhaps we should use:

       --system-acdir=DIR
              directory holding third-party system-wide files

instead? Could you try that in the definition of $(AUTORECONF), instead
of the -I options?

In fact, it is quite worrying that aclocal -i -I/foo/bar copies stuff
to /foo/bar. Indeed, we clearly don't want aclocal to clutter
$(ACLOCAL_DIR) or $(ACLOCAL_HOST_DIR) with additional files by effect
of running autoreconf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
