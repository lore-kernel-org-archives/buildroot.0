From: Charles Manning <cdhmanning@gmail.com>
Date: Wed, 12 Aug 2015 17:56:24 +1200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <20150812053852.GI25261@tarshish>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <20150811114020.GD25261@tarshish>
 <CAE21AQqJwCZMRDj3C+JEHjoNJvprxhZusW6TTfNWVwLaL7UziA@mail.gmail.com>
 <20150812043816.GG25261@tarshish>
 <CAE21AQr13hYAsTkcD2_qRjSHme8aCHPDZDt2CWMeo8Fi4jptHw@mail.gmail.com>
 <20150812053852.GI25261@tarshish>
Message-ID: <CAE21AQoAijLnBYmqgBmCOSJcARQwfsZjznR_pqKDe6-gvJGLXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 12, 2015 at 5:38 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Charles,
>
> On Wed, Aug 12, 2015 at 05:16:35PM +1200, Charles Manning wrote:
>> >> On Tue, Aug 11, 2015 at 11:40 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> >> > On Tue, Aug 11, 2015 at 07:17:02PM +1200, Charles Manning wrote:
>> >> >> wf111 really needs mdev
>> >> Actually udev would work too.
>> >
>> > Recent kernels gained the ability to load firmware directly without any help
>> > form userspace, so this is probably another option.
>>
>> Well not without rewriting the wf111 driver and the associated
>> prebuilt "helper" binaries it comes with...
>>
>> The wf111 buildroot package unwraps a tarball from Bluegiga, does an
>> out of tree build of the kernel modules then copies the modules +
>> binaries into the file system tree.
>>
>> This isn't "pure" or anything like that, but it gets the job done....
>>
>> This is why there is quite a bit of "funkiness" to the wf111 package.
>
> All that should be mentioned in the commit log.
>
>> >> The wf111 driver set uses hotpug to perform the firmware patching
>> >> (loading .xbv files).
>> >>
>> >> From what I have experienced, fw patching is required when you first
>> >> fire up a new module and when you change modes (sta only vs ap).
>> >
>> > Since there are different ways to load the firmware we generally don't make
>> > firmware or driver packages build depend on any specific firmware loading
>> > mechanism.
>>
>> In general you are right, but I think this is a special case.
>>
>> wf111 driver + associated files  is built out of tree by a special package.
>>
>> That package already has other dependencies that are nothing to do
>> with the kernel. eg.BR2_TOOLCHAIN_USES_GLIBC because of those prebuilt
>> binaries.
>>
>> The prebuilt binaries (and therefore the whole wf111 package) does not
>> result in a functioning wf111 subsystem unless there is udev or mdev
>> (I've only tested with mdev)., therefore let's be helpful and add the
>> dependency.
>
> I'm still not convinced. We use dependencies to express build time or run time
> dependencies. I think the glibc dependency is appropriate, but a hotplug
> mechanism is too broad.

I am a bit confused. If a binary needs hotplug as a runtime
dependency, then surely we put that in as a dependency. If not then
what's the purpose of dependencies?

The reason I discovered this dependency is that I had a system which
would not load a new fw and I got the WF111 trouble shooting guide.
(Login needed to access pdf). That says on page 14 Step 4.2 that if
you do not have udev or mdev operational then the fw upgrade will not
work.

I then added BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV and the module worked.

Perhaps there is a better choice for determining this than
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_xxx

We can just leave the dependency out, like it is now, and it won't
work, but that seems rather pointless.

>
> Let's see what others think.

I am hoping Antoine will weigh in as he put the wf111 package together
and will have the most familiarity with this.

Regards

Charles
