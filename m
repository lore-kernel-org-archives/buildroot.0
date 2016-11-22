From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Nov 2016 22:25:34 +0100
Subject: [Buildroot] pseudo: remaining issues...
Message-ID: <20161122212534.GA3529@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

We recently switched from using fakeroot to using pseudo to generate the
filesystem images.

After fixing the biggest fallouts from the conversion, we're still left
with a few users reporting remaining issues.

We're now starting to better understand what is going on, and it is
pretty messy...

Those issues seem to occur on second-and-subsequent (re)builds, never on
the first (full) build. They manifest themselves as incorrect acces
rights in the generated images, like (as reported by J?r?me), first line
is correct, second line is incorrect:

    rwxr-xr-x 0/0  4700 2016-11-22 16:57 ./usr/sbin/nologin
    rw------- 0/0  4700 2016-11-22 16:57 ./usr/sbin/nologin

Then J?r?me noticed that those files were the ones stripped during
target-finalize. Removing the call to strip fixed the issue for him.

What this means is that, by tweaking the content of target/ outside of
pseudo, we break its internal state that it saved in its DB.

Now, when pseudo reloades its DB and detects inconsistencies, it wil try
to repare it. Sometimes, it guesses correctly; sometimes, it gueses
wrong.

However, we don't really need the pseudo DB because we ensure setting
all acces rights when assembling the filesystem images; we don;t need to
remember anything.

Hence, we could very well get rid of the DB after exiting pseudo.

Except it still breaks one case.

/dev/console is created under pseudo and its {c,5,1} is tored in the DB.
When we remove the DB, a second run under pseudo will see a real file,
not a {c,5,1}. Then makedevs will whine that /dev/console already exist
as a real file and fail.


So, we now have two antagonist needs:

  - keep the "specialness" of some files so that makedevs does not break
    when creating /dev entries; 

  - get rid of the DB to avoid mis-match when pseudo rebuilds its
    internal state.


There is no way we can (easily) satisfy both.


One solution that would make it work in all cases would be:

  - do the target-finalize actions in a copy of target/
  - generate, filesystem images form that copy
  - trash the copy
  - trash pseudo DB

Another possibility would be to always do changes in target/ under
pseudo:
  - installing packages
  - taget-finalize
  - filesystem generation

Neither solution is trivial, especially so close to the release.


Alternatively, we can revert back to using fakeroot for this release, at
the expense of breaking (already previously broken) setups with SELinux
on the host.


Thoughts? Ideas?

(In Cc:, people already aware/working on the issue).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
