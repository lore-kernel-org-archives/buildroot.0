From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Jul 2018 00:54:43 +0200
Subject: [Buildroot] [PATCH 00/50] busybox: invert dependencies
In-Reply-To: <20180704163928.GB2595@scaer>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <907b4fa8-f2c6-120d-4980-95b9a5e656a1@mind.be> <20180704163928.GB2595@scaer>
Message-ID: <4f9e3665-aecc-5067-02aa-25b4a816195c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-18 18:39, Yann E. MORIN wrote:
> Arnout, all,
> 
> On 2018-07-04 00:56 +0200, Arnout Vandecappelle spake thusly:
>> On 07/02/18 23:12, Yann E. MORIN wrote:
>>> Hello All!
>>>
>>> Currently, the issue that busybox may install the same executables as
>>> those from other packages, is handled in all those packages. This is
>>> not very practical.
>>
>>  The reverse is also not very practical...
> 
> The reverse means that the dependencies are sprinkled in all those
> packages, while now they are all nicely gathered in a single location.
> At least, I believe this is a maintenance improvment; not an enormous
> gain, but still.

 It certainly is!


>>> Furthermore, this means that those packages all overwrite the
>>> busybox-installed applets, which means that this triggers the
>>> no-two-packages-touch-the-same-file rule. So far, this is only a
>>> warning, but when we eventually go with TLPB, we'll have to enforce
>>> that rule.
>>
>>  Although we've already discussed this a couple of times in BR meetings, we
>> never found a solution that is really satisfactory.
> 
> I'm not sure what you mean by "satisfactory". If speakign about busybox,
> I think this solution is technically better than the alternative,
> current situation, at least becasue we know that busybox will enforce a
> noclobber install (heck, this was already the case with our hook), while
> we can not easily audit all packages to be sure they properly install
> their executalbes.

 Well, normally the proper way to install is to overwrite what was previously there.

 So the solution is not entirely satisfactory because it only really applies to
busybox. Which means that for other packages, we either have to perform manual
install commands to prevent overwriting, or we have to revert the dependency
(i.e., for busybox, the first package wins, while for other packages, the last
package wins...).

 Also note that in the latter case, we should allow two packages to touch the
same file, at least as long as there is a dependency between them. Indeed, if
there is a dependency, then the build result is reproducible, so there is no
need to disallow it. Checking for that will get hairy though...


> For example, the attr package we current have will forcibly overwrite
> any destination file without unlinking it, thus effectively replacing
> /usr/bin/setfattr withits own code, and if that fiel happens to be a
> hardlink or a symlink to busybox, we lose busybox. See
>     https://bugs.busybox.net/show_bug.cgi?id=10986

 *That* is really a bug in the attr package. If it would use install, like the
rest of the world does, it wouldn't have this problem.


> So, I think it is better to rely on a single package we know behaves
> correctly.
> 
>>  However, I have a new idea now...
>>
>>  IIUC, with PPS, there is no real problem with two packages touching the same
>> file, as long as the dependency is explicitly tracked in Buildroot, right?
>> Because when it is explicitly tracked, the file created by package A will always
>> be present in package B's PPS when package B is built, so it's perfectly
>> reproducible.

 Huh weird, I thought this was a new idea I had tonight, but apparently I
already thought of it yesterday :-)

> 
> Yes.
> 
>>  For the case of two packages *writing* the same file (without looking at the
>> previous contents, i.e. not appending or anything like that), the constraint is
>> even lighter: there doesn't really need to be an explicit dependency, we just
>> have to make sure that when the rsync is done, the order is predictable. That's
>> just a matter of sorting. But also, we want it not just to be predictable, but
>> also in the "correct" order, e.g. if busybox is a dependency, it should be
>> rsync'd before another package that creates the same executable. The rsync will
>> then overwrite it (because the rsyncs are not done in parallel).
> 
> Should be, yes.
> 
>>  For that particular ordering, I think there could be a simpler solution than
>> enumerating all those dependencies in busybox.mk. We could give each package a
>> priority, and use that priority to order the rsync's. The default priority would
>> be e.g. 5, and busybox would get e.g. 3. That way, we only need BUSYBOX_PRIORITY
>> = 3 in busybox.mk, and everything is solved.
> 
> Please, no, do not introduce a notion of 'priority'. That is ugly, and
> it does not work in the long term, because it is hard to maintain. One
> pain point of priorities is detecting how a change in A's priority will
> play against the priorities of all other A-related packages, especially
> since there will no longer be a mean to find those relations (as the
> FOO_DEPENDENCIES would get dropped in all A-related packages).

 Hm, good point.


> If I go even further, we have ntp and openntp and busybox that can
> provide an ntp implementation, so we'd have to have non-conflicting
> priorities for all those three.  And then (just an example) what about
> apache, lighttpd, nginx, and busybox, which may all install an httpd
> executable?
> 
> So we'd have to also find a priority for that set, and now that new
> priority for busybox may come conflicting with the priority we found for
> the ntp implementations...
> 
> Then factor in all other busybox-related packages that will in turn need
> a priority.
> 
> So, this is a pain...
> 
> So, priorities are just re-inventing a kind of dependencies, except it
> is not a build dependency, but an install dependency... Let's call a cat
> a cat. We may introduce a FOO_INSTALL_DEPENDENCIES variable, where foo
> would list the packages that must be installed before it, but which may
> be built in any order witho itself.
> 
> But this is still an explicit list, and this does not get us much
> further than what we already have...
> 
>>  Obviously, it would make the infra more complicated :-)
> 
> Yes, and the gain is so minimal, without even considering the risk of
> incorrectness, that I don't believe this is a good idea...

 OK. Just thought I'd shoot the idea.

 Regards,
 Arnout

> 
>>  We would then also need to change the "two packages touching same file" check
>> to be error out only if they have the same priority.
>>
>>  For the other packages that install the same file (e.g ntp <> openntpd, the
>> different nmaps, ...), we can then use the same simple resolution rather than
>> explicitly encoding the dependency. We would still need to choose the priority
>> (which is a bit arbitrary), we would still need to detect the conflict, and we
>> would still need to verify that this conflict really is of the "overwrite" type
>> and not the "append" type. So it's not a silver bullet, but it might make
>> maintenance a little bit simpler.
>>
>>  What do you think?
> 
> Besides the arguments I explained above, I'm afraid my gut-feeling is
> really bad about that... :-/
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
