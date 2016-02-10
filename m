From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 21:35:03 +0100
Subject: [Buildroot] [PATCH] Makefile: Fix overlay overwriting everything
In-Reply-To: <CAGduivxYY-U23A63DHFhtmsAQ-jrEHmhNze=WQX82FmkF6MsBA@mail.gmail.com>
References: <1455119908-21976-1-git-send-email-maxime.hadjinlian@gmail.com>
 <56BB98E1.4070008@mind.be>
 <CAGduivxYY-U23A63DHFhtmsAQ-jrEHmhNze=WQX82FmkF6MsBA@mail.gmail.com>
Message-ID: <56BB9EF7.80805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-02-16 21:16, Maxime Hadjinlian wrote:
> Hi Arnout, all
> 
> On Wed, Feb 10, 2016 at 9:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 10-02-16 16:58, Maxime Hadjinlian wrote:
>>> After bumping from a 2 years old Buildroot installation, I got the
>>> following messages from the kernel at boot:
>>>
>>> Failed to execute /init (error -2)
>>>
>>> It appears that the overlay mechanisms was causing my issues.
>>>
>>> Description:
>>> The overlay mechanisms works by rsync'ing files from a folder specified
>>> by the user into target.
>>> Since c5bd8af65e50a51735eb112fed9cbe6337f14e06, /bin, /sbin and /lib are
>>> symlinked into /usr.
>>>
>>> Problem:
>>> If you have an overlay that contains the directory /bin, /sbin or /lib, rsync
>>> will erase the symlink and create a directory in its place.
>>> The directory, say .../target/lib, would *only* contains the overlay's content.
>>> Obviously, this causes a lot of troubles, starting with the kernel
>>> failing to start init (because of missing shared libraries).
>>>
>>> Solution:
>>> Telling rsync to treat symlinked dir on the receiver side as directory
>>> allow users to be blissfully ignorant of that problem.
>>
>>  I'm not so sure of this one... It makes it impossible to override the symlinks
>> in the skeleton in the overlay. Say, you want to populate /var/spool with some
>> directories so it becomes useable.
> Just a precision: it's not all the symlinks only the symlinks that
> points to a directory, like /var/spool
>>
>>  That said, it's probably better in that case to override the skeleton directly,
>> so that package installation can pick up the new directory.
>>
>>  Still, you _are_ breaking a valid use case with this patch.
> Another way to deal with this, is to test if in the overlay, there's a
> a folder that is a link is the default skeleton and in that case,
> treat it differently.

 That is just dealing with the "accident" that the /bin and /lib symlinks are
created with an explicit ln instead of being present in the skeleton. It could
just as well have been the reverse, that they are symlinks in the skeleton and
mkdirs in the makefile. So I wouldn't rely on that.


 Regards,
 Arnout

> In the spur of the moment it seems too complicated. But maybe it's the
> right solution after all.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
