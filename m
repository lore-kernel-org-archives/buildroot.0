From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 00:24:25 +0200
Subject: [Buildroot] [PATCH 19/20] system: make systemd work on a
 read-only rootfs
In-Reply-To: <20170725160726.GA2773@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
 <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be> <20170724154552.GC2918@scaer>
 <a5838b47-f369-1f47-f74d-5741284fde51@mind.be> <20170725160726.GA2773@scaer>
Message-ID: <908fa532-66d1-83f5-a2e5-7c366993fa32@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 18:07, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-07-25 00:44 +0200, Arnout Vandecappelle spake thusly:
>> On 24-07-17 17:45, Yann E. MORIN wrote:
>>> On 2017-07-24 00:18 +0200, Arnout Vandecappelle spake thusly:
>>>> On 18-07-17 19:25, Yann E. MORIN wrote:
> [--SNIP--]
>>  Thinking out of the box: can we make /var a symlink to /tmp/var, and avoid
>> creating a tmpfs on /var at all? Since /tmp/var doesn't exist, "C! /tmp/var"
>> should work, no? Or did that cause journald to bail out?
> 
> Worth a try, of course. But still we'd need hoks of some kind to allow
> package to install in /var at build time, and move that to factory at
> the end of the build, while still preserving the ability to be able to
> rebuild stuff without requiring a 'make clean'.

 I forgot to add: and create a symlink from /tmp/var to
/usr/share/factory/tmp/var. That way stuff will still get installed directly
into /usr/share/factory/tmp/var. We don't need to remove any of the symlinks,
however: when the tmpfs is mounted over /tmp, the symlink magically disappears.

 But that still doesn't fix:

> [--SNIP symlinks in /var--]
>>  There is unfortunately no way to fix this. If the package is smart, it does
>> calculates the relative path based on the real path of the source and
>> destination. If the package is stupid, it just assumes ../something. Whatever we
>> do, one of them will break... The only safe approach would be to put stuff in
>> /factory instead of /usr/share/factory.
> 
> But that is not where systemd-tmpfiles will look at...

 Yes, then we'd still have to copy/move /factory to /usr/share/factory.

 BTW, systemd-tmpfiles will look at anywhere you tell it to look:

C! /var - - - - /factory/var


> Unless you meant we have /factory during the build, then move it at the
> moment we aggregaate the images, and move it back (moving the problem
> from handling /var to handling /factory instead) ?

 It is what I meant. This was not to solve the interrupted rootfs creation
problem, this was to solve the broken symlink problem.


[snip]
> However (thinking aloud now), I have another tentative to do, which
> instead of creating a symlink for /var at runtime, would just creat it
> as a direcotry as expected.
> 
> Then the hooks would simply "mv /var /usr/share/factory/var; mkdir /var",
> create the tmpfiles entries, aggregate the image(s), the rm -rf /var; mv
> /usr/share/factory/var /var".

 You still have the interrupted rootfs creation problem. But the symlinks are fixed.


> This is probably much simpler than moving the entries one by one.
> 
> The only drawback in this case would be a package that already creates a
> factory/var/foo entry. It would end up in /var/foo afterwards... :-/
> So I think the /var symlink is better, in fact, so I'll keep that.

 Except that it may break symlinks...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
