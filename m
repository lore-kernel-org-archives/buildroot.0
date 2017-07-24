From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jul 2017 00:44:41 +0200
Subject: [Buildroot] [PATCH 19/20] system: make systemd work on a
 read-only rootfs
In-Reply-To: <20170724154552.GC2918@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
 <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be> <20170724154552.GC2918@scaer>
Message-ID: <a5838b47-f369-1f47-f74d-5741284fde51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-07-17 17:45, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-07-24 00:18 +0200, Arnout Vandecappelle spake thusly:
>> On 18-07-17 19:25, Yann E. MORIN wrote:
>> [snip]
>>> With a line like:
>>>
>>>     C /var/something - - - -
>>>
>>> it will look for /usr/share/factory/something and copy it (recursively
>>> if it is a directory) to /var/something, but only if it does not already
>>> exist there.
>>
>>  So we could just have a line
>>
>> C /var - - - -
>>
>> and be done with it?
> 
> No, because systemd-tmpfiles will only act if the entry does not exist.
> But our case, /var does exist, and it is a mount point. We must have
> /var to exist, because / is read-only.

 Right! I knew that, actually... You even wrote it there :-)

 Thinking out of the box: can we make /var a symlink to /tmp/var, and avoid
creating a tmpfs on /var at all? Since /tmp/var doesn't exist, "C! /tmp/var"
should work, no? Or did that cause journald to bail out?


[snip]
>>  However, it is possible that a package creates a relative symlink based on the
>> /var location. Most symlinks that we create in Buildroot stupidly assume that
>> all the path components are not symlinks. So a package could for example do
>>
>> ln -sf ../srv/www $DESTDIR/var/www
>>
>> This will now create a broken symlink. It's fine as long as it is copied as-is
>> to /var, but not with your approach...

 Note that this is *NOT* fine anymore if /var is a symlink to /tmp/var ...


> Hmm... I'll have to think about that a bit more, even though I think I
> have taken that into account...

 There is unfortunately no way to fix this. If the package is smart, it does
calculates the relative path based on the real path of the source and
destination. If the package is stupid, it just assumes ../something. Whatever we
do, one of them will break... The only safe approach would be to put stuff in
/factory instead of /usr/share/factory.


> At least I did see no breakage so far, but the set of packages I built
> was arguably rather limited...
> 
>> [snip]
>>> +define SKELETON_SYSTEMD_ROOT_RO_OR_RW
>>> +	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
>>> +	mkdir -p $(TARGET_DIR)/usr/share/factory
>>> +	ln -s usr/share/factory $(TARGET_DIR)/var
>>
>>  Since other stuff may also want to put things in /usr/share/factory, I think it
>> should be
>> 	mkdir -p $(TARGET_DIR)/usr/share/factory/var
>> 	ln -s usr/share/factory/var $(TARGET_DIR)/var
> 
> Not really, because systemd-tmpfile will look in exactly the factory
> path to find the source of the copy/link. See the exerpt I pasted above.
> 
> So, given this entry, for example:
> 
>     C /var/foo - - - -
> 
> systemd-tmpfiles will see if it can find /usr/share/factory/foo not
> /usr/share/factory/var/foo

 Weird, the way I read both the man page and the source code seem to suggest
that "C /var/something" will copy from /usr/share/factory/var/something... But I
guess you tested that so I must be misreading the source code.


> And if other packages install things in factory, they would most
> probably install their own tmpfile description to copy it in place on
> boot, becasue factory *is* for factory settings.

 Yes but you could have a name collision.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
