From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 01:29:29 -0500
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161122212534.GA3529@free.fr>
References: <20161122212534.GA3529@free.fr>
Message-ID: <20161123062928.gmn7gbzjcsinujd5@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Nov 22, 2016 at 10:25:34PM +0100, Yann E. MORIN wrote:
> Those issues seem to occur on second-and-subsequent (re)builds, never on
> the first (full) build. They manifest themselves as incorrect acces
> rights in the generated images, like (as reported by J?r?me), first line
> is correct, second line is incorrect:
> 
>     rwxr-xr-x 0/0  4700 2016-11-22 16:57 ./usr/sbin/nologin
>     rw------- 0/0  4700 2016-11-22 16:57 ./usr/sbin/nologin
> 
> Then J?r?me noticed that those files were the ones stripped during
> target-finalize. Removing the call to strip fixed the issue for him.
> 

I am a bit confused of why the strip is altering the file permissions...

Is it sure the strip causes this issue? I cannot reproduce the issue.

J?r?me: could you tell me how to reproduce easily your issue?

> What this means is that, by tweaking the content of target/ outside of
> pseudo, we break its internal state that it saved in its DB.
> 

Indeed...

But we can still change files from target directory as soon as we make sure we
are not altering data stored in its database, ie.:

$ echo ".schema" | sqlite3 output/build/.pseudodb/files.db 
CREATE TABLE files ( id INTEGER PRIMARY KEY, path VARCHAR, dev INTEGER, ino INTEGER, uid INTEGER, gid INTEGER, mode INTEGER, rdev INTEGER, deleting INTEGER );
CREATE TABLE xattrs ( id INTEGER PRIMARY KEY, dev INTEGER, ino INTEGER, name VARCHAR, value VARCHAR );
CREATE TABLE migrations ( id INTEGER PRIMARY KEY, version INTEGER, stamp INTEGER, sql VARCHAR );
CREATE INDEX files__path_dev_ino ON files ( path, dev, ino );
CREATE INDEX files__dev_ino ON files ( dev, ino );
CREATE INDEX xattrs_dev_ino ON xattrs ( dev, ino );
CREATE INDEX xattrs_dev_ino_name ON xattrs ( dev, ino, name );
CREATE INDEX migration__version ON migrations ( version );

Damn... does the stamp fields from the migrations table is the file timestamp?

If so, we are fucked up :( (it depends also of the meaning of migration).

> Now, when pseudo reloades its DB and detects inconsistencies, it wil try
> to repare it. Sometimes, it guesses correctly; sometimes, it gueses
> wrong.
> 
> However, we don't really need the pseudo DB because we ensure setting
> all acces rights when assembling the filesystem images; we don;t need to
> remember anything.

Except for the file we create using pseudo... ie. makedevs

> 
> Hence, we could very well get rid of the DB after exiting pseudo.
> 
> Except it still breaks one case.
> 
> /dev/console is created under pseudo and its {c,5,1} is tored in the DB.
> When we remove the DB, a second run under pseudo will see a real file,
> not a {c,5,1}. Then makedevs will whine that /dev/console already exist
> as a real file and fail.
> 

:)

... so not a good idea to drop the db without dropping the files created by the
script under pseudo (ie. makedevs, at least).

> 
> So, we now have two antagonist needs:
> 
>   - keep the "specialness" of some files so that makedevs does not break
>     when creating /dev entries; 
> 
>   - get rid of the DB to avoid mis-match when pseudo rebuilds its
>     internal state.
> 
> 
> There is no way we can (easily) satisfy both.
> 
> 
> One solution that would make it work in all cases would be:
> 
>   - do the target-finalize actions in a copy of target/
>   - generate, filesystem images form that copy
>   - trash the copy
>   - trash pseudo DB
> 

I am not a big fan of that solution... I do not like copy :(

> Another possibility would be to always do changes in target/ under
> pseudo:
>   - installing packages
>   - taget-finalize
>   - filesystem generation
> 

I am quite new to buildroot (a 2-weeks young hobbiest), but I guess only
target-finalize alters the target directory; I mean for customization.

So maybe, if it helps, only target-finalize can be run under pseudo.

But I agree those steps should all be run under pseudo.

> Neither solution is trivial, especially so close to the release.
> 
> 
> Alternatively, we can revert back to using fakeroot for this release, at
> the expense of breaking (already previously broken) setups with SELinux
> on the host.
> 

Every patches we made, take us closer to the perfect intergration of pseudo into
BR :)

> 
> Thoughts? Ideas?
> 

The bug concerning the issue with device attribute is certainely solved.
See my patch `[PATCH] pseudo-wrapper: fix console issue' which is an
intergration of what you suggested.

... so lets fixup the bug reported by Jerome!
