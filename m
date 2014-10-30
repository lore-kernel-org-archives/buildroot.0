From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Oct 2014 20:50:48 +0100
Subject: [Buildroot] target rootfs permissions
In-Reply-To: <20141030131530.GA12318@fox>
References: <20141024193436.GA29505@fox>
 <20141025103454.0b923b26@free-electrons.com> <20141030131530.GA12318@fox>
Message-ID: <54529698.9010903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/10/14 14:15, Guido Mart?nez wrote:
> Hi all,
> 
> On Sat, Oct 25, 2014 at 10:34:54AM +0200, Thomas Petazzoni wrote:
>> Dear Guido Mart?nez,
>>
>> On Fri, 24 Oct 2014 16:34:36 -0300, Guido Mart?nez wrote:
>>
>>> I've noticed that when building a rootfs, some of the permissions on the
>>> target depend on the users umask (directly and indirectly). This occurs
>>> because some files (notably the system skeleton and overlay) are copied
>>> with "rsync -a", which copies permissions exactly as they were on the
>>> source. The thing is, Git doesn't track file permissions (except for
>>> the exec bit) so both of these depend on the users umask at the time of
>>> cloning (if there were no posterior changes).
[snip]
>> Thanks for your report. It is indeed a problem that should be fixed.
>> The only clean solution that I see is to have the fakeroot script reset
>> the permission for all files to a certain sane value (just like we
>> already have a 'chown -h -R 0:0' to re-assign all files to the root
>> user), and then re-adjust using makedevs the permissions of the needed
>> files, such as /tmp, /etc/shadow and so on.
> Good to know I'm not crazy! ;)
> 
> I have been trying a solution based on running 'chmod -R u=rwX,go=rX'
> for the last few days and it seems to work just fine. We're basically
> making everything public (exception should go in the device table or in
> *_PERMISSIONS) and keeping the executable bits of files that already
> have them. This saves the trouble of making packages declare which files
> should be executable.
> 
> Packages should only declare ownerships, special permissions (like
> sticky bits and setuids) and private files (like /etc/sudoers). Most of
> them (at least the ones I could find) do exactly this, so I don't think
> much breakage should appear (but undoubtedly, some will). I'd go as far
> as saying that 644 is the default permissions everyone unconsciously has
> in mind.

 There is one problem with this solution: it means that for each package, we
have to make sure that we find and apply all the special permissions it
requires. And that's something that can only be discovered at runtime. It's much
better if we could rely on the package's build infrastructure to do the right thing.

 So what we really want to do is to clear the umask. I found [1] which suggests
to do

SHELL = /bin/bash --noprofile -c 'umask 000; eval "$$2"' --

 Alternatively, we could also reset the umask in the places where it's relevant,
i.e. where rsync and cp are used - but that's a bit complicated an risky - we
might forget something.


 For the skeleton and overlay, the umask is not the issue, it's just the fact
that we preserve permissions. That could easily be solved by using
--chmod=u=rwX,go=rX for rsync.



 Regards,
 Arnout

[1] http://lists.gnu.org/archive/html/bug-gnu-utils/2012-03/msg00012.html


> A build using this change is perfectly reproducible, given one does not
> mess with output/target too much (if you set the exec bit on a random
> file, it will set).
> 
> This change also clears up quite a bit of system/device_table.txt since
> most of the permissions declared there are the defaults.
> 
> I can submit a proper patch if it sounds reasonable for you guys.
> 
>> Since /tmp, /etc/shadow and so on are part of the skeleton, one option
>> would be to make the skeleton a real package, so it could declare a
>> SKELETON_PERMISSIONS variable to adjust whatever is needed. This is
>> quite in line with some discussions we had recently about cleaning up
>> the skeleton from init scripts, and possibly making it a proper package.
> Right, that would be great, but it wouldn't fix the issue of variability
> due to the permissions of the overlay files (hence due to the umask
> too), right?
> 
> Cheers!
> 



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
