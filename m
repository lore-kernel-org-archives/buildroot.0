From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 22:57:59 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
Message-ID: <20170312225759.136e0f50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 21:27:41 +0100, Arnout Vandecappelle wrote:

> > +ifneq ($(READELF_ARCH_NAME),)  
> 
>  We set it for all arches, so this is never empty. Except when we forget to set
> it, but in that case we probably want this thing to be executed so we notice.

It was sometimes empty at the beginning of my tests, and then I decided
to provide the value for all architectures we support. So yes, this
test has been removed in my v3.

>  It would be nice to do it immediately after package install, so it becomes a
> package error rather than some post-build error that is more difficult to
> localise. Of course, with Yann's suggestion it would still report which package
> was the culprit, but I don't think it would show up in the autobuild results
> under the right package.
> 
>  To avoid too much overhead rechecking files all the time, it could be done as
> part of step_pkg_size_end which iterates over the files installed in target for
> that particular package. It would make the code a little more complicated,
> though, and perhaps also slower.

I've implemented this in my v3. The code is not much more complicated
in fact.

>  Top-level Makefile already exports TARGET_DIR, so no need to pass it as an
> argument. And it's not as if this script is meant to be ran outside of the build.

OK.

>  This could also be grepped out of BR2_CONFIG, like mkusers does it.

Implemented.

>  As observed by Wolfgang in the context of rpath sanitisation, file is pretty
> inefficient. We came to the conclusion that the most efficient is just checking
> the first 4 bytes (0x7f 0x45 0x4c 0x46). Since it is also needed for the rpath
> sanitisation, perhaps we should have a common script, or even compiled code, to
> do this check.

I'm not using just readelf, and if the sed expression extracting the
Machine value returns an empty string, assume it's not an ELF file.

It would be nice to get the return value of readelf, but being in a
subshell, before a pipe, it's not trivial (at least not trivial
compared to my limited bash-fu).

>  Why not the simpler sed -n '/^  Machine: *\(.*\)/s//\1/p' instead of the extra
> grep?

Implemented, using Yann's suggestion.

Thanks for the useful suggestions!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
