From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 May 2014 20:13:19 -0300
Subject: [Buildroot] [PATCH] audiofile: does not build with static-only
In-Reply-To: <20140524184541.47d3f8f9@free-electrons.com>
References: <1400941494-29900-1-git-send-email-luca@lucaceresoli.net>
 <20140524184541.47d3f8f9@free-electrons.com>
Message-ID: <5381278F.9040209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/24/2014 01:45 PM, Thomas Petazzoni wrote:

> No, I disagree. The real problem is the fact that we pass --static
> instead of -static when building statically, so libtool turns -lstdc++
> into a full path to libstdc++.so instead of libstdc++.a.
> 
> The real fix is to understand why we switched from -static to --static
> a few years ago: there is a commit from Andy Kennedy making this
> change, but the commit log is quite fuzzy about why this is actually
> needed.

Hi.
As we discussed with Thomas on IRC i've been digging and testing a bit
and promised to write about my assorted notes for the static dilemma:

1) --static isn't the documented way to do it, not for libtool, ld or
gcc. Just reverting it makes audiofile happy (patch done).

2) --static (or the correct -static IMHO) is just added to LDFLAGS, that
won't help generic packages that link directly so it should live in
CFLAGS/CXXFLAGS as well (patch done).

3) BR2_PREFER_STATIC_LIB should be renamed and it's description changed
accordingly, we don't prefer, we want.
There's no configuration granularity possible to say "A, B, C dyn and D
static" and we really don't want to walk that path (Thomas mentioned he
has something done about this already).

4) host-gcc-final always builds shared even if we want static, that
seems to cause issues for the internal toolchain but i'm unsure about
the reason (patch done).

5) libiconv tries to build the preloadable version even for static
targets, that's not possible (patch done).

6) The uclibc package tries to install ld* tools even for static builds,
that's no problem yet but it will be once/if we don't build a
shared+static version (patch done).

7) toolchain-external seems to be copying .so files to staging and
causing confusion for a mpd w/audiofile project: /usr/bin/mpd results in
a static binary, however some accesory binaries are not (example: gdbus,
gettext, others).

It's a WIP patchset, i want to work it out a little bit more before
sending it unless someone has an itch in helping out immediately ;)
Some of the patches i think are pretty clear-cut for -next and i'll be
sending them out.

Regards.
