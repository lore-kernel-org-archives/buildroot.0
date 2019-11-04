From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Mon, 04 Nov 2019 10:53:54 +0100
Subject: [Buildroot] [External] [PATCH v2 1/2] package/netdata: new
 package
In-Reply-To: <CANQCQpZGdVG8QmOLoWtaswnn25tM1KYiTAzn2i_vy1+Ggt231w@mail.gmail.com>
References: <20191030093243.2936111-1-m.niestroj@grinn-global.com>
 <CANQCQpZtHBMFJUHxikL2vuYOj7iwnCXwOTQi=Svkk-FHLvuGwA@mail.gmail.com>
 <87r22sq4p6.fsf@grinn-global.com>
 <CANQCQpZGdVG8QmOLoWtaswnn25tM1KYiTAzn2i_vy1+Ggt231w@mail.gmail.com>
Message-ID: <87y2wwx8zx.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Matthew Weber <matthew.weber@collins.com> writes:

> Marcin,
>
> On Thu, Oct 31, 2019 at 11:18 AM Marcin Niestr?j
> <m.niestroj@grinn-global.com> wrote:
>>
>> Hi Matt,
>>
>> Matthew Weber <matthew.weber@collins.com> writes:
>>
>> > Marcin,
>> >
>> > On Wed, Oct 30, 2019 at 4:33 AM Marcin Niestroj
>> > <m.niestroj@grinn-global.com> wrote:
>> >>
>> >> Always provide --disable-dbengine configuration option, because we do
>> >> not support libjudy dependency that is required otherwise.
>> >>
>> >> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>> > [snip]
>> >
>> >> --- /dev/null
>> >> +++ b/package/netdata/netdata.mk
>> >> @@ -0,0 +1,56 @@
>> >> +################################################################################
>> >> +#
>> >> +# netdata
>> >> +#
>> >> +################################################################################
>> >> +
>> >
>> > The package's default install step attempts to create folders in
>> > $(TARGET_DIR)/var/lib/netdata, $(TARGET_DIR)/var/cache/netdata, and
>> > $(TARGET_DIR)/var/log/netdata.  For the cache and log cases in the
>> > default Buildroot skeleton, those point to ../tmp and results in a
>> > race condition causing a "file exists error".
>>
>> I'll try to clarify what happens there. This is what we see in build
>> log:
>>
>>    /usr/bin/install -c -m 644 packaging/installer/.keep '/buildroot/test-netdata/TestNetdata/target/var/lib/netdata'
>>     /usr/bin/install -c netdata '/buildroot/test-netdata/TestNetdata/target/usr/sbin'
>>    /usr/bin/install -c -m 644 packaging/installer/.keep '/buildroot/test-netdata/TestNetdata/target/var/lib/netdata/registry'
>>    /usr/bin/install -c -m 644 packaging/installer/.keep '/buildroot/test-netdata/TestNetdata/target/var/log/netdata'
>>    /usr/bin/install -c -m 644 packaging/installer/.keep '/buildroot/test-netdata/TestNetdata/target/var/cache/netdata'
>>   /usr/bin/install: cannot change permissions of '/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep': No such file or directory
>>
>> The problem is that `install` is called in parallel. Looking at what
>> `install` really does with strace:
>>
>>   stat("/buildroot/test-netdata/TestNetdata/target/var/cache/netdata", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
>>   stat("packaging/installer/.keep", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
>>   newfstatat(AT_FDCWD, "/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep", {st_mode=S_IFREG|0644, st_size=0, ...}, AT_SYMLINK_NOFOLLOW) = 0
>>   unlink("/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep") = 0
>>   openat(AT_FDCWD, "packaging/installer/.keep", O_RDONLY) = 3
>>   fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
>>   openat(AT_FDCWD, "/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep", O_WRONLY|O_CREAT|O_EXCL, 0600) = 4
>>   fstat(4, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
>>   fadvise64(3, 0, 0, POSIX_FADV_SEQUENTIAL) = 0
>>   mmap(NULL, 139264, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f6dfa7ee000
>>   read(3, "", 131072)                     = 0
>>   fsetxattr(4, "system.posix_acl_access", "\2\0\0\0\1\0\6\0\377\377\377\377\4\0\0\0\377\377\377\377 \0\0\0\377\377\377\377", 28, 0) = 0
>>   close(4)                                = 0
>>   close(3)                                = 0
>>   munmap(0x7f6dfa7ee000, 139264)          = 0
>>   lstat("/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep", {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
>>   chmod("/buildroot/test-netdata/TestNetdata/target/var/cache/netdata/.keep", 0644) = 0
>>
>> So what (most probably) happens is that one `install` process has
>> created the `.keep` file, but didn't make it to change permission,
>> because another `install` process has already unlinked it.
>
> Yeah, it's inheritly because of the way the base skeleton is setup
> with symlinks in buildroot.
>
>>
>> > To fix that target install issue, I'd propose the following patch be
>> > added.
>> >
>> > https://urldefense.proofpoint.com/v2/url?u=https-3A__pastebin.com_TL3znCJs&d=DwIFaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=QZL88tMKpKawDLFC9yPt80FEa5Ojbic8ue1DfxOQ3mY&s=U45yjsRvZGNjr4DcvyCulMnguBFPNn2KgFqHYPPQBpA&e=
>>
>> With this patch cache files would be written in persistent storage under
>> /var/lib/netdata/cache. I would rather leave those files in tmpfs.
>>
>> I also do not like the fact that logs would be put under /tmp/debug.log,
>> /tmp/error.log and /tmp/access.log files. There are plenty of other
>> daemons which would like to do the same :)
>>
>
> Keep in mind, none of the items written to /var/log or /var/cache
> during build time end up on the target.

Yes, I am aware of that. So both /var/log/netdata and /var/cache/netdata
point to non-existing (during system boot) /tmp/netdata directory.

> If you want different runtime behavior with folders for cache and logs
> you have to stage those with a startup script.

Correct. And with current patch series we just install netdata within
Buildroot and rely on configuring and starting netdata by user. I am not sure

> Maybe it makes sense to add a S60netdata script in your new version of
> the series which could setup the folders in the tmpfs to be used for
> logging and cache accordingly?

If we will provide S60netdata, then we also need some equivalent for
systemd. What do you think about creating (mkdir -p) only
/var/cache/netdata in such init script? This directory is used as
current (home) directory for netdata. /var/log/cache looks like optional
for netdata, because it will safely continue execution if log files
cannot be opened. In default skeleton however both would point to
/tmp/netdata, so there would be no problem with logs.

> As part of this startup script you could also symlink the
> /var/lib/netdata/cache folder to a tmpfs location.  I suggested the
> patch to keep the changes minimal to the upstream package and then at
> runtime we can tailor how netdata actually uses the folder.

We can also simply remove the installation of .keep files with
https://pastebin.com/raw/P9DQC1ry and it solves the problem with even
less changes (in my opinion). This is also what you suggested below I
think.

>
>> So far we depend on creating /var/cache/netdata (because netdata tries
>> to cd into it by default during init). So we have already the needed
>> structure for both cache and log (both point to /tmp/netdata). So the
>> only thing I would do is to remove .keep installation from Makefile.am
>> to get rid of race condition. This means simple patch to maintain within
>> Buildroot. What do you think?
>
> Like previously mentioned you'll need an init script to setup any
> folders in /var/cache or log as those locations are symlinked to /tmp
> by default and the buildtime folders won't be present at runtime.  So
> you could suggest a .keep cleanup script if that seems less intrusive
> to the package and maybe you can even make it upstreamable?  In some
> ways if we can just bypass this whole localstatedir folder setup
> section of the makefile that would be ideal.

The problem with netdata is that it is not clear which autotools or
cmake they are targetting to support in the future. I don't feel
comfortable in investing time now to support some feature in autotools
(I barely know it as developer) if cmake will be the only supported
solution in near future. On the other hand cmake seems to work
differently, e.g. there is no .keep installation there at all, but
unfortunately more dependencies are required instead of optional.

So in order to do things properly we would need to ask netdata about
their prefered build system for future and do improvements there :)

>
> Regards,
> Matt
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Regards,
Marcin Niestr?j
