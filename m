From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 23:59:18 +0200
Subject: [Buildroot] uboot-tools autobuild failures
In-Reply-To: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
References: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
Message-ID: <6de7b55d-97a1-0992-c4a9-13d7f2efd87d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-04-17 03:55, Matthew Weber wrote:
> It looks like all of these recent failures are because the python swig
> build does a "$(if $(shell which swig 2> /dev/null),_libfdt.so)" to
> determine if the host system has swig and if so, try to build the
> python bindings.  Obviously not taking into account any prefix we'd
> provide to the host/ in out build.
> 
> http://autobuild.buildroot.org/?reason=uboot-tools-2017.03
> 
> I don't directly have a need for those bindings, would a patch that
> disables this swig detect be reasonable at this point?  Other option
> would be to rewrite how they're doing it to search a prefix path vs
> using the shell's which.  Then work upstreaming of that change.

 The problem with patching uboot-tools is that you usually also built uboot when
you build uboot-tools, and most likely uboot will also fail to build (at least
if it's a recent version). But we can't patch uboot because we don't know which
version it is... So we'd need to do horrible sed-based "patching" in uboot.mk...

 So the ideal solution would be to convince the U-Boot build system that swig
isn't available, without patching... But that would be difficult...

 How about just touching tools/_libfdt.so, so that it doesn't get rebuilt?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
