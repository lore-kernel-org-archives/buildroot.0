From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 08:46:47 -0300
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <20120312123118.7f1df4bb@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
 <20120312084645.17cea210@skate>
 <3abaf8436d672008511fb62b235ffdd1@zacarias.com.ar>
 <20120312123118.7f1df4bb@skate>
Message-ID: <a640af62ff1f83baa58d83a5cb08b0bf@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-12 08:31, Thomas Petazzoni wrote:

> Right, but the question brings us back to why do we need to build a
> host-microperl at all? Perl is part of our hard dependencies, so why
> would we need to build it for the host?
>
> The reason why we build XML::Parser is that it is not necessarily
> installed on the host (for example it is not part of the default 
> Debian
> installation, while the Perl interpreter is). And we can perfectly
> build XML::Parser and install it in $(HOST_DIR), and still use the 
> Perl
> interpreter provided by the distribution.

We need host-(micro)perl for target perl/microperl, otherwise you can't 
build any modules.
And you can't have a version mismatch, that just calls for a world of 
pain, so you can't trust distro-perl for that.
Otherwise it would be "please install perl 5.12.4 in your distro" which 
would be a big no-no.

>> So there are two solutions, either rename it to some other thing or
>> make it work as a host tool.
>
> And not build Perl for the host and use the one of the system?

Reason above.
Otherwise we can't support target microperl with any module, not even 
Config.pm.
Try building a target perl and removing /usr/lib/perl5, that's the 
result.
No Config.pm, no default INCPATH or other usually well-defined things.

> It has a reason to exist host-only: XML::Parser is not necessarily
> present on the system of the user.
>
> I am the one who created this package, and it was on purpose: it was
> necessary to be able to build host-intltool without having to add a 
> new
> hard dependency in support/dependencies/dependencies.sh on 
> XML::Parser.
>
> At the moment, I only see drawbacks in switching from the current
> solution to building host-microperl. Could you explain why you think
> building host-microperl is better?

CPAN modules in the future, and basic expected behaviour for target 
perl right now.

> We handle this problem very well for normal C/C++ libraries (having 
> our
> own version in $(HOST_DIR)/usr/lib, while a different version might 
> be
> in /usr/lib), and I don't see now why it wouldn't be possible to do 
> the
> same for Perl modules.

XS modules are basically shared objects (always) + interpreted perl 
code (sometimes), and there's no guarantee ABI won't break between major 
perl versions.

> Isn't that close enough? Of course, could be perl-xml-parser, but I'm
> not sure it makes such a big difference. But I have no strong opinion
> on this specific thing.

It's just maintaining consistency, no rush in changing it, it's just 
the debian name at use right now, which IMHO is wrong since it doesn't 
use libxml (actually it uses expat) and thus confusing somehow.
And there's also another (*) libxml-perl to makes thing worse :)
* http://perl-xml.sourceforge.net/libxml-perl/

Regards.
