From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 23:37:39 +0200
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <OF074BC262.DC488FB4-ON86257BF7.006D21D1-86257BF7.006DFBEC@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
 <20131001205154.059ec4af@skate>
 <OF074BC262.DC488FB4-ON86257BF7.006D21D1-86257BF7.006DFBEC@rockwellcollins.com>
Message-ID: <20131001233739.618eb9f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Oct 2013 15:01:52 -0500, clshotwe at rockwellcollins.com wrote:

> > It seems like the mechanism you're proposing overlaps quite
> > significantly with that, while being a bit less flexible. Have you
> > tried the <pkg>_OVERRIDE_SRCDIR mechanism?
> 
> I did a little digging into the <pkg>_OVERRIDE_SRCDIR mechanism but I 
> could not find any documentation and the implementation in the make 
> structure is a little unclear.  What is the full intent of that mechanism?

Either in your package .mk file or in a local.mk file, you can add:

FOO_OVERRIDE_SRCDIR = /path/to/foo/sources/

If you do that, then Buildroot will no longer download/extract/patch
the sources for the foo package, it will directly assume the sources
are located in /path/to/foo/sources/. It will rsync them to the build
directory, and build from there. Whenever you do:

	make foo-reconfigure

or

	make foo-rebuild

Buildroot will rsync again the source code, and restart the build at
the configuration step, or the build step of the foo package.

Usually, /path/to/foo/sources/ will be the directory where you did your
Subversion checkout or Git clone of your "foo" source code.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
