From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Aug 2018 22:57:06 +0200
Subject: [Buildroot] How to retain intentional absolute RPATH for target
 application?
In-Reply-To: <20180801141713.GT21354@australia>
References: <20180801141713.GT21354@australia>
Message-ID: <5cac9585-a5e8-56dc-cbde-05530d60e8f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-08-18 16:17, Thomas De Schampheleire wrote:
> Hi,
> 
> I have an application that has an RPATH containing (among some automatically
> present values) an absolute path which is present on target but not a standard
> search path, say /opt/foobar/lib , and also as first entry $ORIGIN/../lib.
> The application is stored in /opt/foobar/bin.
> 
> Testing on target in a case where fix-rpath is not used (old buildroot version)
> shows that the first entry in RPATH is used, i.e. $ORIGIN/../lib, resolving to
> /opt/foobar/bin/../lib.
> 
> When going to current buildroot including fix-rpath, this application cannot be
> loaded because the libraries are not found. Analysis shows that only standard
> search paths are considered.
> 
> Manually checking the patchelf step shows that the RPATH is completely cleared.
> I found a patch by Bryce Ferguson regarding endianness problems on PPC (this is
> indeed a PPC target), but although it is applied and fixes the display of the
> RPATH field in readelf after running fix-rpath, the actual issue remains:
> RPATH is empty after running fix-rpath.

 Let's first find out why it is cleared. patchelf should check for each
directory in rpath if it is actually needed, and only remove it if it is not
needed. So, what library do you have in /opt/foobar/lib, and is it really linked
with the program?

 Hm, I realize that we never thought about dlopen()ed libraries. Could that be
the cause? I guess that hasn't been a problem up to now because usually programs
using dlopen() will use an absolute path (to a build-time or run-time configured
plugin directory) rather than relying on RPATH.

 Perhaps we should update our patchelf patch and only remove rpath entries for
directories that don't exist on the target at all. Although even that may not be
enough, because you might install plugins at runtime (and create the directory
at that time).

 So Matt's suggestion is probably the way to go.

 Regards,
 Arnout

> 
> My question is now: how to allow preserving such an intentional RPATH, or at
> least make sure that the libraries in /opt/foobar/lib are found?
> 
> Thanks,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
