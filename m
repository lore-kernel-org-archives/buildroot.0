From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Sep 2015 16:14:57 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <003996441bb228c23d8e79202370f8d1@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <55EDFE3E.8030205@mind.be> <d72ff365b4711836e5c1990f7b72923c@openmailbox.org>
 <55EED4CA.3040304@mind.be> <0cef4a73d23345bbaf2f88905d0ed82f@openmailbox.org>
 <55EEE3F1.3000508@mind.be> <003996441bb228c23d8e79202370f8d1@openmailbox.org>
Message-ID: <55F2E1E1.8090701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-15 09:52, C?dric Marie wrote:
> Hi,
> 
> I've just realized that this patch is breaking linux and busybox verbose mode.
> 
> Exporting KBUILD_VERBOSE makes it available for linux and busybox makefile. This
> makefile sets KBUILD_VERBOSE if V is set in the command line, but it also uses
> KBUILD_VERBOSE if exported by the shell.
> 
> In fact it seems that the original idea was to export all variables that could
> be understood by different build systems:
> - KBUILD_VERBOSE for linux and busybox
> - VERBOSE for CMake packages.
> 
> So, if we still want to handle verbosity in infrastructures (and some packages
> that use generic infrastructure) - and I think we should:
> I think the right way to forward verbose mode to linux and busybox is to add V=1
> in linux.mk and busybox.mk.

 I'm not so sure of that. The KBUILD_VERBOSE approach worked well, there wasn't
really a problem with it. The problem was with VERBOSE, which is interpreted
differently by cmake. Removing KBUILD_VERBOSE and quiet was just because
(quoting your commit message): "KBUILD_VERBOSE and quiet variables are set and
exported, but they are not used. We can safely remove them."

 The current way (exporting KBUILD_VERBOSE) is in fact quite elegant: it's just
a couple of lines of code, and it works for any package based on Kbuild. Like
uClibc, barebox, who knows, maybe they also use KBUILD_VERBOSE? This way is much
easier than handling it for every package separately.

 So I think the approach should be:
- remove quiet
- add an explanation about why KBUILD_VERBOSE is useful
- use VERBOSE but in a different way.

and in fact, since we already have KBUILD_VERBOSE, maybe VERBOSE can just be
dropped? (internally, it's still used for cmake.)

> 
> As a consequence, I believe it is not possible to split my patch into different
> steps.
> The patch must:
> - remove quiet
> - remove KBUILD_VERBOSE
> - use VERBOSE but in a different way (not exported), as already described
> - handle VERBOSE in pkg-cmake.mk, pkg-autotools.mk, linux.mk, busybox.mk, and
> qt.mk (this one is possibly already correct).
> 
> If you agree, I will provide a single patch that will cancel the two previous
> ones (I will add patch version and log this time).

 The reason for splitting was that the first one would be uncontroversial - but
it clearly isn't, so I'm OK with keeping them merged.


 Thanks for keeping this up!

 Regards,
 Arnout

> 
> Regards,
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
