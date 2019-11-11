From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Mon, 11 Nov 2019 15:06:54 +0000
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <20191111153657.1a56760e@windsurf.home>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
Message-ID: <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,
Thanks for reviewing.

On 11/11/2019 14:36, Thomas Petazzoni wrote:
> Hello Thomas,
> 
> On Mon, 11 Nov 2019 12:48:07 +0000
> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
> 
>> The ARM sys/io.h has been removed from upstream glibc, which is in
>> buildroot. This causes the xorg-server build to fail on ARM when using
>> the glibc toolchain.
>>
>> The following patches from upstream xserver fix this, but have not yet
>> been released.
>>
>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> 
> Do we have any autobuilder failures for this? From a quick look, I
> don't see any. So the question is: why?
> 

I will reproduce and get back to you.

>> diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch b/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
>> new file mode 100644
>> index 0000000000..f1b27d7484
>> --- /dev/null
>> +++ b/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
>> @@ -0,0 +1,32 @@
>> +From 6a2ce6c5da9456b97683db6224f38ef3b02cce4b Mon Sep 17 00:00:00 2001
>> +From: Ross Burton <ross.burton@intel.com>
>> +Date: Thu, 20 Sep 2018 13:21:34 +0100
>> +Subject: [PATCH 1/2] compiler.h: only use inx/outx on ARM with glibc
> 
> Use "git format-patch -N" when generating patches, so that we don't
> have the "PATCH 1/2" prefix, but just "PATCH". Indeed PATCH 1/2 for a
> patch labeled 0006-something is a bit useless.
> 

Noted, thanks.

>> +
>> +musl only implements inx/outx on x86, so check for __GLIBC__ instead of
>> +__linux__.
>> +
>> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> But this commit doesn't seem at all related to the glibc failure, it
> would rather be useful to fix a build issue against the musl C library.
> I also don't see such build failures in our autobuilders. Why?

I'm not sure about failures on musl, I included this commit is to provide
context for the next patch.

Is it normal to pull in patches in from upstream or are "buildroot patches"
specifically to fix buildroot build errors. Eg. the context patch above
doesn't fix anything for buildroot per say, just prepares the source for
the following patch.
