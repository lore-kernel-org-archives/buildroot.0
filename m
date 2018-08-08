From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Aug 2018 22:37:55 +0200
Subject: [Buildroot] [PATCH] ncurses: make host-ncurses use host terminfo
In-Reply-To: <87wot1gd9a.fsf@dell.be.48ers.dk>
References: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
 <8736wec3d8.fsf@dell.be.48ers.dk> <87wot1gd9a.fsf@dell.be.48ers.dk>
Message-ID: <4b28a0d6-dc95-4d3b-6ecb-a4607935f6e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-18 16:10, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>  >> # HG changeset patch
>  >> # User Hollis Blanchard <hollis_blanchard@mentor.com>
>  >> # Date 1531239381 25200
>  >> #      Tue Jul 10 09:16:21 2018 -0700
>  >> # Node ID 5f7fe697b92ac0145674a6c96aad0f787b4bae32
>  >> # Parent  d71314cdccf1993ccdb05cddb16a5491f0bf723e
>  >> ncurses: make host-ncurses use host terminfo
> 
>  >> Host GDB suffers a serious problem: pressing backspace (or ^W ^U or any other
>  >> "delete" key) results in a plain space being printed instead, making the
>  >> command prompt almost completely unusable.
> 
>  >> That's because it's using host-ncurses, which embeds a path for the terminfo
>  >> database into the library itself. That path ends up being something like
>  >> /home/hollisb/buildroot.git/output/host/share/terminfo, which obviously doesn't
>  >> generally exist other hosts. ('relocate-sdk.sh' cannot and does not edit
>  >> binaries like libncurses.so.6, so doesn't resolve this problem.)
> 
>  >> /usr/share/terminfo is a far better path to use, since it almost certainly
>  >> exists on the host. Theoretically, it could be from a different ncurses version
>  >> with incompatible terminfo database format, but this doesn't seem to be a
>  >> problem in practice. (Future patches could address the theoretical problem if
>  >> it actually appears in real life.)
> 
>  >> This change allows buildroot's host gdb, which uses ncurses 6.x, to work on
>  >> RHEL5, RHEL6, and RHEL7, which all provide terminfo from ncurses 5.x.
> 
>  >> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> 
>  > Committed to 2018.02.x and 2018.05.x, thanks.
> 
> Hmm, this triggers an interesting issue with tic :/
> 
> ** Building terminfo database, please wait...
> Running sh ./shlib tic to install /usr/share/terminfo ...
> 
>         You may see messages regarding extended capabilities, e.g., AX.
>         These are extended terminal capabilities which are compiled
>         using
>                 tic -x
>         If you have ncurses 4.2 applications, you should read the INSTALL
>         document, and install the terminfo without the -x option.
> 
> "terminfo.tmp", line 21272, terminal 'v3220': /home/peko/.terminfo: permission denied (errno 30)
> 
> What happens here is that tic doesn't have write access to
> /usr/share/terminfo (as we are not root), so instead it writes the db to
> ~/.terminfo.
> 
> We in general don't want buildroot to touch any files outside the
> buildroot output directory (and $TMPDIR), but it normally isn't
> enforced/checked by the autobuilders. For this specific setup with
> building inside a container $HOME is mounted readonly, so it really
> fails.

 Actually, sounds like a good idea to have an autobuilder that does exactly
this: nothing writeable outside of OUTPUT_DIR.

> 
> The question is how to fix it. The logical solution would be to set
> TERMINFO to get it to put the database somewhere else, but that doesn't
> work because run_tic.sh overwrites it:
> 
> # don't use user's TERMINFO variable
> TERMINFO=${DESTDIR}$ticdir ; export TERMINFO
           ^^^^^^^^^^
 So, set DESTDIR?

 Or actually, why is this script called at all? The whole point of Hollis's
patch was to use the system's terminfo, so why should we generate the terminfo
at all? In other words, can't we just pass --disable-db-install ?

 Regards,
 Arnout

> 
> The only fix I can think of is:
> 
> HOST_NCURSES_MAKE_ENV += HOME=$(HOST_DIR)
> 
> But that isn't very nice. Any other ideas?
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
