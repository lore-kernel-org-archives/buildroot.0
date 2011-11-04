From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 4 Nov 2011 09:57:39 +0100
Subject: [Buildroot] Migration to the latest stable release
In-Reply-To: <CACXKkoacGwW266H8TFRWmjgN76_aLCid9TTzQNEWQM_chNR4Vw@mail.gmail.com>
References: <CACXKkoZ3hxrhy00WxLPLCmbHet00e1_nnvgGc1E=U+w8hS5vSA@mail.gmail.com>
 <CAAXf6LU45N-CXRjCKF854jdii-=ZQ+6b+k7xiJUt5-2txZ7COQ@mail.gmail.com>
 <CACXKkoaHDhFzBT6rskRzoEDrq1e7hL5R03+v0zkV7dGodoaduQ@mail.gmail.com>
 <CAAXf6LW=hJVyLZs6DO7=QdM1yNKO=YaBJ5VLvEp=0Xj7qXy-Ag@mail.gmail.com>
 <CACXKkoacGwW266H8TFRWmjgN76_aLCid9TTzQNEWQM_chNR4Vw@mail.gmail.com>
Message-ID: <CAAXf6LWEc73hibuFNpNeQioRgDRcYzbL4aeRbrwS41i9qrnrNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Milan,

Please don't top-post. See
http://linux.sgms-centre.com/misc/netiquette.php#toppost


On Thu, Nov 3, 2011 at 4:05 PM, Milan Stevanovic
<milan.o.stevanovic@gmail.com> wrote:
[..]
>> >> >
>> >> > I want to migrate to the latest buildroot stable release. Also, I
>> >> > want
>> >> > to
>> >> > keep all my changes after migration.
>> >> > Is there a some procedure for this?
>> >>
>> >> Assuming you have not put your current buildroot environment in a
>> >> version control system, you'll have to first generate a list of
>> >> changes you have made compared to the baseline you started from, and
>> >> then reapply the changes on the new release (you could use diff/patch
>> >> to help with this).
>> >>
>> >> Of course, type of changes you made will determine how easy this goes.
>>
>> > Hi,
>> >
>> > Thanks for fast replay.
>> >
>> > Unfortunately, I was not precise.
>> > Current buildroot environment is under git version control system.
>>
>> In that case, you can use the 'git pull' command to fetch the new
>> version (you'll probably want to specify a specific tag) and merge
>> your changes with the latest release. This is generic git usage,
>> nothing buildroot specific.
>
> It is clear. Your first advice is for me.
> In git repository for my project  buildroot environment is added as source
> code.
> My buildroot environment is not under git for buildroot. It is in local git
> repository.
> I hope you understand me.

If I understand correctly, you have a tree like
/tree/.git
/tree/A
/tree/B
/tree/buildroot
/tree/C

where buildroot is just an extract of a stable source release tarball,
or a snapshot of the sources.

In this case, I would suggest the following (note that I'm used to
Mercurial, rather than Git, but the concepts should be the same):
* change the working tree of your repository to the revision that
added the unmodified buildroot sources (without any changes you made),
using 'git checkout'. (you may want to use -b to create a branch, I'm
not sure if that's preferable)
* remove all existing buildroot files (rm)
* extract the new buildroot revision to the same directory as before
* notify git of new and removed files (git add -A)
* at this point you should be able to commit the changes. You now have
a new head, with the new buildroot release.
* merge the new head with the latest revision you have. You'll now
have to merge all the changes you made to buildroot with the new
version. On top of that, the other files that have changed outside
buildroot will also be merged, but I would expect all these are
trivial merges.

A git expert may correct some of this...

I hope this is clear to you.

Best regards,
Thomas
