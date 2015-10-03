From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 12:57:18 +0100
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <62a2d08d2430eb10d07b3a87b6d42906@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
 <20150920151157.7dc9b021@free-electrons.com>
 <55FF1A8A.5030507@openmailbox.org> <55FF2498.3060105@mind.be>
 <be665633918344391cf5a86576592c7c@openmailbox.org> <56003A45.8050306@mind.be>
 <62a2d08d2430eb10d07b3a87b6d42906@openmailbox.org>
Message-ID: <560FC29E.6020101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-10-15 16:52, C?dric Marie wrote:
> Hi,
> 
> The more I try to fix it, the more I believe there is nothing to fix... :)
> 
> Arnout has pointed out that KBUILD_VERBOSE should be kept, because it was a nice
> way to set verbose level in Kbuild packages, without having to modify any .mk
> files.
> 
> I have also recently realized that autotools infrastructure didn't need anything
> more to have support for V=0 or 1.
> When V is in the command line, it is exported to all sub-makes. As a
> consequence, an autotools package already sees the value of V. It doesn't check
> whether it comes from the command line or not.
> 
> I thought there was a problem because I first checked with autotools packages
> that did not support verbose level, and couldn't see any difference. With
> libpthsem, I have realized that V=0/1 was already supported.
> 
> The fact that V is exported is not enough for Kbuild packages, because they also
> check that it comes from the command line. That's why they need KBUILD_VERBOSE
> to be exported. Autotools packages don't check that V comes from the command line.
> 
> So, in the end, I think it would be stupid to convert V=0/1 into VERBOSE=0/1,
> and then, in pkg-autotools.mk, convert VERBOSE=0/1 into V=0/1 - which is already
> set and exported - again!...
> 
> So, to sum up:
> - we keep KBUILD_VERBOSE for Kbuild packages
> - we don't need to change anything for autotools packages
> - If CMake is the only one that needs a conversion (from V to VERBOSE), wouldn't
> it be more simple to keep on exporting VERBOSE as it is done currently?
> 
> In the end, the only thing I could do, is just to remove "quiet" :)
> I can still provide a patch for that, if it makes sense.

 Yep, sounds like a good idea!

> 
> Sorry for the time we have spent on this subject, while there is - almost -
> nothing to change in the end...
> There are many subtleties in makefiles that I was not aware of, in the first place.

 It's great that you investigated all this, I wouldn't call this time wasted.
Now I think we really understand most of the subtleties of the different verbose
options.

 One more fix you could do is to document all this in comments in the top-level
Makefile. Something like:

# autotools packages use the V=0/1 option, which is passed implicitly by make.
# Kbuild packages use KBUILD_VERBOSE
# CMake packages use VERBOSE
# Others don't have a supported verbosity switch
export VERBOSE KBUILD_VERBOSE


 I wonder if exporting the Q is useful at all?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
