From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 19:44:42 +0000
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <20111117224211.0e793a0b@skate>
 <CAAXf6LVzQpbdCJ3yaQsSREAoNUTjhGLGTgm3izj19m6Z2HJFYg@mail.gmail.com>
Message-ID: <201111181944.42621.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 November 2011 06:53:22 Thomas De Schampheleire wrote:
> - for packages that have multiple versions at once in buildroot,
> patches go into package/foo/foo-version, but have the same filename:
> <pkg>-<seqnum>-<description>.patch
[snip]
> * how many digits should the sequence number have? I now that
> git-format-patch uses 4 digits (0001) but really isn't necessary for
> buildroot since the number of patches we'll have for each package is
> limited. A package with 99 patches would already be extraneous, so I'd
> say 01 (2 digits) is enough.

 After going through ThomasP's ELC presentation, I've started using the approach of a <PKG>_OVERRIDE_SRCDIR which contains a git clone to generate the patches.  Works out great, much more convenient than my previous approach of copying the source tree to .orig and diffing.

 Except for one little detail: the patch naming.  git format-patch doesn't give much leeway in how the patches are named, so you end up needing to do a rename of the resulting patch set.

 For prepending a <pkg>- prefix, it is still doable with a simple
for i in 00*patch; do mv $i linux-$i; done
But with only two digits, you almost need a shell script (or mmv or mrename) to do it...

 Bottom line: I would prefer to see a git format-patch compatible filename:
<pkg>/0000-<description>.patch
<pkg>/<version>/0000-<description>.patch

 The extra zeroes are not really in the way IMO, and the package name is really redundant anyway.

 Note that people who prefer to name their patches in any other way can still do it.  The only thing you can't do is to mix patches of two different packages (or two different versions) in the same directory.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
