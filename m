From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 07:59:58 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
 <5171D63D.7050705@mind.be>
 <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
Message-ID: <5174D1DE.6000902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/13 18:08, Danomi Manchego wrote:
> On Fri, Apr 19, 2013 at 7:41 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
>
>         Then, the effects of all the
>         hidden variables are in some way accounted for without grepping
>         for them
>         in the .config.
>
>
>       Not entirely. Many toolchain options affect the C library, not the
>     compiler. A change in these options may not affect the gcc binary
>     itself. Even a gcc configuration option may not change the gcc
>     binary, because most of gcc is in cc1 and libgcc.a. But it's still an
>     improvement over previous proposals.
>
>
> Arnout, I'm wavering on this.
>
> At work, we only use external toolchains (downloaded or pre-installed),
> so using the gcc -v output and the md5sum of the compiler/wrapper
> provided to ccache is perfect for our projects, because
> these discriminators capture everything.  But if toolchain configuration
> options in the general case (for everyone else) cannot be simply captured
> (without doing lots of variable renaming as you mentioned earlier),

  Actually, after thinking a bit harder about it: the following should work:

sed -n '/^# Toolchain/,/^# System configuration/' $(BUILDROOT_CONFIG) \
	| md5sum -

  So there's no need to rename stuff or anything.

> then
> it seems to me that buildroot's official position must remain that the
> user must know when to flush the cache, and do it manually.

  I personally find that a very weak position, so anything we can do to 
remove that limitation is not just good, but a must. Note BTW that the 
documentation makes no mention of the need to clear ccache when you 
change the toolchain.

> What was not
> clear to me before is that I have to not only keep in mind my build
> configuration, but also the configuration of every other buildroot build
> on the machine, whether it's mine or somebody else's.

  The 'somebody else's' is only true if you explicitly share your ccache 
by setting BR2_CCACHE_DIR to a shared directory.


  Regards,
  Arnout

>  In light of that,
> would it not be better to limit the scope of self-policing to just the
> area you are working in, by including absolute paths (in the
> COMPILERCHECK, or HASHDIR) to disable sharing cached objects when you
> change output directories, or between several developers?  It's bad
> enough to have to remember to flush the cache based our our own
> activities, but it truly stinks to have to defend against getting screwed
> up by somebody else's build.
>
> I'm just trying to think this through from a community perspective ...
>
> Danomi -
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
