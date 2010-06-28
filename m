From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Mon, 28 Jun 2010 10:31:56 +0200
Subject: [Buildroot] [PATCH] fix ldconfig at target-finalize
References: <013c7951a6ee3d95f4eb50842e16b771e4f42619.1276695686.git.baruch@tkos.co.il>
	<BLU0-SMTP74DDC98C00DC73900EC521E7CA0@phx.gbl>
	<20100628072240.GD2681@jasper.tkos.co.il>
Message-ID: <BLU0-SMTP79D4E32FB669B65E6DDF18E7CA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, June 28, 2010 9:22 AM, Baruch Siach wrote:
> Hi Andy,
>
> On Mon, Jun 28, 2010 at 09:16:09AM +0200, Andy Gibbs wrote:
>> On Wednesday, June 16, 2010 3:43 PM, Baruch Siach wrote:
>> >Host ldconfig fails when the directory of the aux-cache file
>> >(/var/cache/ldconfig, by default) does not exist. Make sure this 
>> >directory
>> >exists before calling ldconfig.
>> >
>>
>> Also would be good to do a "touch $(TARGET_DIR)/etc/ld.so.conf" too,
>> along with your mkdir.
>>
>> Then you get rid of both errors...
>>
>> /sbin/ldconfig: Can't open configuration file
>> (...)/target-dir/etc/ld.so.conf: No such file or directory
>> /sbin/ldconfig: Can't open cache file /var/cache/ldconfig/aux-cache
>> : No such file or directory
>>
>> Do you need me to provide a patch file to do this?
>
> This patch fixes both problems for me. Do you still encounter failure 
> after
> applying this patch?
>

I'm afraid I did.  I am running buildroot with a toolchain created by 
crosstool-ng for powerpc.  Since crosstool doesn't generate a 
cross-ldconfig, buildroot is picking up the one on my PC at /sbin.  I 
believe in contrast uclibc *does* generate a cross-ldconfig.  Up until the 
end of last week I never got an error, but then I upgraded eglibc on my PC 
from 2.9 to 2.11.1 and then this error happened.  Searching the web found 
your post, and helped me find the solution to my own problem - so I am very 
grateful!

However, I am wondering whether it is better simply to remove the ldconfig 
step in my case, since it doesn't actually do anything useful, and I need to 
run it on the target anyway to correctly initialise the ld cache.

So, I then thought about patching Makefile to make the line in question 
become:

ifneq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
endif

Or alternatively, disabling it via a change to 'package/Makefile.in' 
changing the block around line 140:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
TARGET_LDCONFIG=/sbin/ldconfig
endif

to:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
TARGET_LDCONFIG=/bin/true
endif

But this may not really be appropriate for an upstream patch, since I do not 
know the rationale that set the TARGET_LDCONFIG variable to be 
/sbin/ldconfig when an external toolchain is used.  Maybe a better approach 
would be an additional setting inside buildroot that enables the ldconfig 
line to be disabled.  Also then it could disable its use in other places 
where its used during the build.

Unfortunately, however, I don't think such a patch is within my grasp to 
write!  But I will happily test it if someone else feels that they want to 
do it.

Cheers
Andy
