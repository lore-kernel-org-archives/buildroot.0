From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 12:31:18 +0100
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <3abaf8436d672008511fb62b235ffdd1@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
 <20120312084645.17cea210@skate>
 <3abaf8436d672008511fb62b235ffdd1@zacarias.com.ar>
Message-ID: <20120312123118.7f1df4bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 12 Mar 2012 07:07:33 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> The big issue right now is that the new host-microperl installs a
> real perl in $(HOST_DIR)/usr/bin and PATH precedence makes it win
> over any other perl installed on the system.

Right, but the question brings us back to why do we need to build a
host-microperl at all? Perl is part of our hard dependencies, so why
would we need to build it for the host?

The reason why we build XML::Parser is that it is not necessarily
installed on the host (for example it is not part of the default Debian
installation, while the Perl interpreter is). And we can perfectly
build XML::Parser and install it in $(HOST_DIR), and still use the Perl
interpreter provided by the distribution.

> So there are two solutions, either rename it to some other thing or 
> make it work as a host tool.

And not build Perl for the host and use the one of the system?

> The solution i approached was making it work as host with the patches 
> i've sent.
> Otherwise renaming it would be somewhat simple and we could just kill 
> the libxml-parser-perl package since it has no reason to exist being 
> host-only.

It has a reason to exist host-only: XML::Parser is not necessarily
present on the system of the user.

I am the one who created this package, and it was on purpose: it was
necessary to be able to build host-intltool without having to add a new
hard dependency in support/dependencies/dependencies.sh on XML::Parser.

At the moment, I only see drawbacks in switching from the current
solution to building host-microperl. Could you explain why you think
building host-microperl is better?

> Most of the packages that require intltool are somewhat big in 
> dependencies and build time anyway (pulseaudio, gtk2-engines, 
> x11r7/xkeyboard-config, gmpc, midori) with the exception of 
> shared-mime-info and avahi.

Sure, but it's still a new thing that gets built while it already
exists on the host system.

> As for reasons, other than dropping the distro-installed perl 
> dependency and,

It's part of the default install of most distros, so that's really not
a really problematic dependency.

> in the future when/if we get CPAN modules we'd have a 
> conflict of distro module vs. host (as in host package) module given
> the original purpose of libxml-parser-perl if we wanted to implement 
> some/all host-variant modules for some future reason.

We handle this problem very well for normal C/C++ libraries (having our
own version in $(HOST_DIR)/usr/lib, while a different version might be
in /usr/lib), and I don't see now why it wouldn't be possible to do the
same for Perl modules.

> Also libxml-parser-perl should be named something closer to the 
> upstream name XML::Parser

Well:

    XML::Parser
 libxml- parser-perl

Isn't that close enough? Of course, could be perl-xml-parser, but I'm
not sure it makes such a big difference. But I have no strong opinion
on this specific thing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
