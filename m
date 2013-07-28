From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sun, 28 Jul 2013 22:17:20 +0800
Subject: [Buildroot] [PATCH v2] <pkg>-rsync: support user custom cmds
In-Reply-To: <CAAXf6LWwD6fkDpANcYnKT+ShQoBPJKpjJm-1K70DYjs+5eWqEA@mail.gmail.com>
References: <CAAXf6LXQWBEF2uM4e5MQg-QooTMwHmgZ99HT6PDH1DHNDDM-Gw@mail.gmail.com>
 <1375007963-15935-1-git-send-email-tjlee@ambarella.com>
 <20130728150334.6a8a862c@skate>
 <CAAXf6LXvJjA_Wxm=OMCBKYZKudveUj=J-fpU7SeXgCxoH3MQhA@mail.gmail.com>
 <CAAXf6LWwD6fkDpANcYnKT+ShQoBPJKpjJm-1K70DYjs+5eWqEA@mail.gmail.com>
Message-ID: <CAEvN+1iY-77EV8Ao9zNhm94H0JKbOQNv10iQRqMLMnot28PJAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 28, 2013 at 9:57 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
>
> Op 28-jul.-2013 15:15 schreef "Thomas De Schampheleire"
> <patrickdepinguin+buildroot@gmail.com> het volgende:
>
>
>>
>> On Sun, Jul 28, 2013 at 3:03 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Dear Tzu-Jung Lee,
>> >
>> > On Sun, 28 Jul 2013 18:39:23 +0800, Tzu-Jung Lee wrote:
>> >> This patch allows users to override the options or entire command
>> >> line of rsync.  The default options filters out object or libraries
>> >> during rsync.  For local packages which come with pre-built binaries,
>> >> the copy in build/ directory will not have complete files as src/
>> >
>> > Hum, I am not sure this is the right way to fix this. When it was
>> > introduced, I thought the --cvs-exclude option was only ignoring things
>> > like CVS/ directories, .svn/ directories or .git/ directories. But now
>> > that I read the rsync man page, I see that it excludes a huge number of
>> > other file name patterns, which I think isn't desirable.
>> >
>> > So rather than providing a way for the user to override the rsync
>> > command, I'd prefer the rsync command to behave appropriately. I
>> > believe it should simply copy /everything/, including version control
>> > directories. Yes that's longer, but there's no reasonable generic way
>> > to determine which files should be copied and which files should not.
>>
>> In my version of 'man rsync', here is the list of excluded patterns
>> when using cvs-exclude:
>>
>> RCS SCCS CVS CVS.adm RCSLOG cvslog.* tags TAGS .make.state
>> .nse_depinfo *~ #* .#* ,* _$* *$ *.old *.bak *.BAK *.orig *.rej .del-*
>> *.a *.olb *.o *.obj *.so *.exe *.Z *.elc *.ln core .svn/ .git/ .hg/
>> .bzr/
>>
>>
>> I can see how excluding *.a *.o *.obj *.so *.exe can be debatable.
>> I would certainly like to keep excluding .svn, .git, .hg, and .bzr.
>> These directories can become very big, and in the general use case,
>> aren't needed.
>> Frankly, I don't care a lot about the other patterns.
>>

It actually benefit me a lot since most of my 'local package' are manged by git.
And the sync to larger project such as Linux kernel does takes a lot of time.

Indeed some projects need the SCM metadata to generate the version info.
For git or recent version of svn, this can be easily solved by providing a
POST_RSYNC_HOOKS, which links to the metadata directory.

For those packages that require special treat, they can still override
the default
rsync command.

>> Here are three suggestions:
>> - follow the proposed patch, keeping the default as it is and
>> providing a way to overrule it per package.
>> - simplifying the default exclusion list to .svn, .git, .hg and .bzr
>> (but this wouldn't cover the use case of Tzu-Jung Lee)
>> - make the exclusion list a global config option, defaulting to e.g.
>> .svn, .git, .hg, .bzr and maybe others, but changeable by the user.

I'm okay with the default setting being either exclusive or conservative.
As long as the HOOKS will be provided, and the default can be OVERRIDEN.
For example, if the default fetch step is reverted to 'cp -r', I can
still override it for
the large local projects to save the sync time.

>
> Other suggestion:
> - add a config option 'don't exclude version control files when rsyncing'
> and don't provide further flexibility.

Thanks.

Roy
