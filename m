From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Aug 2018 16:28:20 +0200
Subject: [Buildroot] [PATCH] ncurses: make host-ncurses use host terminfo
In-Reply-To: <4b28a0d6-dc95-4d3b-6ecb-a4607935f6e2@mind.be> (Arnout
 Vandecappelle's message of "Wed, 8 Aug 2018 22:37:55 +0200")
References: <5f7fe697b92ac0145674.1531241163@cveaol6qa08.wv.mentorg.com>
 <8736wec3d8.fsf@dell.be.48ers.dk> <87wot1gd9a.fsf@dell.be.48ers.dk>
 <4b28a0d6-dc95-4d3b-6ecb-a4607935f6e2@mind.be>
Message-ID: <87d0urfwcb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> We in general don't want buildroot to touch any files outside the
 >> buildroot output directory (and $TMPDIR), but it normally isn't
 >> enforced/checked by the autobuilders. For this specific setup with
 >> building inside a container $HOME is mounted readonly, so it really
 >> fails.

 >  Actually, sounds like a good idea to have an autobuilder that does exactly
 > this: nothing writeable outside of OUTPUT_DIR.

Indeed. I will try to find (time and cpu) cycles to setup such a
builder.


 >> 
 >> The question is how to fix it. The logical solution would be to set
 >> TERMINFO to get it to put the database somewhere else, but that doesn't
 >> work because run_tic.sh overwrites it:
 >> 
 >> # don't use user's TERMINFO variable
 >> TERMINFO=${DESTDIR}$ticdir ; export TERMINFO
 >            ^^^^^^^^^^
 >  So, set DESTDIR?

That isn't really handy as DESTDIR is used in a bunch of other places
and this is built as part of make install.


 >  Or actually, why is this script called at all? The whole point of Hollis's
 > patch was to use the system's terminfo, so why should we generate the terminfo
 > at all? In other words, can't we just pass --disable-db-install ?

Ahh, I hadn't noticed that option. That indeed works, I'll send a patch
- Thanks!

-- 
Bye, Peter Korsgaard
