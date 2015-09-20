From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 10:22:40 +0200
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
 <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
 <20150917162003.GT11632@tarshish>
 <alpine.DEB.2.02.1509171922410.13941@orcam81.orcam.lan>
 <20150917192315.6db18115@free-electrons.com>
 <20150917190424.GU11632@tarshish>
 <20150917221546.247fe210@free-electrons.com>
 <alpine.DEB.2.11.1509192310350.1987@tanhuma.tkos.co.il>
Message-ID: <20150920102240.6e8db4f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Sat, 19 Sep 2015 23:36:47 +0300 (IDT), Jonathan Ben Avraham wrote:

> > I believe there is no proper way with the current gzip build system to
> > fix the problem. It is inherently wrong to assume that the $(SHELL)
> > used on the host will be available on the target. The only sane option
> > I believe is to have a --with-shell=<foo> option, which if not given
> > defaults to $(SHELL) to retain the existing behavior.
> 
> If I understand correctly you mean that the correct fix would require 
> submitting a patch to the gzip maintainer to add the --with-shell 
> configure option.

Correct.

> This would not obviate the post-install hook you suggest 
> below because we would need a heuristic to use with gzip --with-shell 
> option.

I'm not sure to follow you. We would just have to do:

GZIP_CONF_ENV += --with-shell=/the/right/value

> In order to do this post-install hook we would need to know the shells 
> that the user selected and choose one of them using some heuristic rule 
> such as:
> 
> 1. If the user chose the bash package, then use /bin/bash
> 2. If the user chose Busybox and not bash then use /bin/ash
> 3. If the user chose neither Busybox nor bash then use /bin/sh and 
> hope for the best
> 
> If the user then changes the configuration and un-selects bash we would 
> need to cause the gzip package to be re-built.

No: we don't handle such automatic rebuilds after configuration
changes. See
http://buildroot.org/downloads/manual/manual.html#full-rebuild.

> 
> I wonder if all of this is worth it. IMHO it would be enough to note in 
> the gzip package help text that the user might need to adjust the 
> hashbangs of the scripts in some post-build script.

There's some logic in the skeleton package that guarantees that /bin/sh
points to the system shell selected by the user in his configuration.
So forcing /bin/sh as the shebang should be fine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
