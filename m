From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 7 May 2008 11:01:45 +0200
Subject: [Buildroot] svn
	commit:trunk/buildroot/target/device/Atmel:atngw100
	atngw100-baseatngw100-expanded etc...
References: <20080506013810.213FE3C6D4@busybox.net><46a136670805051855v20cfee30o267907b605f6bc9a@mail.gmail.com><008e01c8af69$830eef00$5e8d910a@atmel.com>
	<d6cda7730805061019j4d5a8d8fvb4c9c2d3016c89d2@mail.gmail.com>
Message-ID: <012001c8b021$4806e580$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
>>  > A couple of us AVR32 users have been
>>  > discussing the patch.avr32 scheme, is this out of the question?
>>
>>  What is the benefit?
>>  You can add patches to the AVR32 prepatched toolchain at "target/device/Atmel/toolchain"
>>  Just need to add the correct directories.
>>
>>  The drawback of having patches inside the svn is that everyone not
>>  using AVR32 will have to suffer the additional download.
> 
> Anyone not using avahi suffers additional download for that package,
> as well as java, or MIPS, or x86. Do you see where I'm getting?
> 

No, you only download what you want to build.
I think you are confusing the contents of the defconfigs with 
the configuration used in a real product.
The defconfigs are examples, or starting points, and are
normally changed to something suitable.

> The benefit are several:
> 
> - More eye balls: the underlying building is used and improved by many
> different platforms. Improvements in one affects all. A breakage here
> will be detected and fixed more rapidly.
> 

The underlying build is exactly the same for the prepatched toolchain.
It is only the download and patch process which has changed.

> - Freedom of access: anyone with commit access to SVN can fix or
> update the whole system, there is no dependency on a single person.
> 

No, you can't normally update the source of the packages.
You can add patches to any package, and this is possible
for the prepatched toolchain source.
It is an easy fix (which I am not against) to add a mirror anyway
where more people can update the ftp.

> - Less disk space consumed and bandwidth saved: Anyone building for
> more than one platform doesn't require additional 50Mb per toolchain.
> That's for all developers, everyone here has at least once built for a
> different $(ARCH) than they usually do.

No - I assume more disk space and more bandwidth consumed.
This is because the AVR32 users are a limited group.
My guess would be less than 5% of buildroot users build for AVR32.
The toolchain source needs to be downloaded *once* every time it is updated,
I.E: 1-2 times per year.

[DISKSPACE]
I do not see diskspace as a problem. If 50 MB is going to make or break
your build, you are in trouble anyway.
That is only theoretical, since gcc-4.2.2 is not a supported toolchain
in buildroot, so you will ONLY build this for the AVR32.

[BANDWIDTH USED]
According to my measurements the complete buildroot svn is 37,8 MB today.
The previous AVR32 patches increases the svn by 

gcc        0,7 Mb
uClibc    0,3 MB
gdb        3,0 MB
binutils   3,6 MB
---------------------
total        7,6 MB or an additional 20%.

This is to be multiplied with each toolchain version supported.
An AVR32 user which downloads the svn multiple times, 
quickly get past the point where they use more bandwidth
downloading the svn than they do downloading the prepatched source code.

[DOWNLOAD SPEED]
Worse is that you force ALL users to download the svn which will increase 
THEIR downloading time and will increase the loading on the server by 20%.

[DOWNLOAD COST]
I do not know about others, but I have 100 Mb Ethernet at home
and use a HSDPA/WCDMA modem when travelling, which cost $1-$15/MB
depending on where I am. 
I can usually reach a high speed/zero cost Internet connection within a week,
so I do not think that a delay for a toolchain package updated once or twice per year
is going to cause me that much trouble.

[SCALABILITY]
When you start to add new versions of the compiler the percentage
of the system will grow. There is a new binutils and new gdb
which are the main culprits. With support for the new toolchain
we would be close to 40% additions to the toolchain.

While you can purge older versions, this can cause problems
in itself, if a new toolchain will break on building certain packages.
The prepatched toolchain can support all toolchains very easily at low cost.

[DOWNLOAD SPEED]
I tried downloading AVR32 binutils from the current BR2_ATMEL_MIRROR 
(www.at91.com /pub/buildroot) and achieved 5 MB/seconds = 40 Mbit/second.
I can upload at 800 kB/second.

This was not using any internal connection.  Just a connection from home to Internet.
I doubt that this server should be too slow in the normal case.

> 
> - It worked: the external toolchain doesnt.
> 
> - Gives visibility to patches: If a patch breaks an $(ARCH) all you
> have to do is rename it, but you gain the knowleadge that the issue
> exists, and the patch maintainer can be notified. This makes it easier
> for patches to be accepted upstream later on.

Any patches applied in "target/device/Atmel/toolchains" will be visible as well.
Maybe they should be moved to "toolchain/gcc/<version>/prepatched/$(ARCH)"
or similar to highlight that the capability exists.
Obviously people seems unaware of the capability.

> - We could get rid of Atmel Specifics: In buildroot we have 2 flavors
> of external toolchain: generic and Atmel. Kill Atmel.
> 

I think the only real benefit of that is psychological.
The proper way of going mainstream, is for *Atmel* to go mainstream
by having AVR32 included in the mainstream toolchain downloads. 
Can't do too much about that I am afraid.

> Seriously, building an image takes several gigabytes, my dl dir has
> 1Gb of downloaded packages alone, when extracted they expand a lot,
> when compiled, another 2 fold, how significant is a few patches?
> 

It is a matter of pro's and con's.
I think the con's heavily outweighs the pros of adding the patches.
Especially for the non-AVR32 users.
I *AM* an AVR32 user myself but in this case, but I spent quite
some time pondering about the best approach of supporting
the AVR32 before adding the prepatched toolchain functionality.
I decided to show respect to the rights of the non-AVR32 users,
rather than carelessly try business as usual when it is unsuitable.

> Regards,
>    Thiago A. Correa
> _______________________________________________


Best Regards
Ulf Samuelsson
