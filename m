From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 26 Aug 2009 12:45:05 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090825190153.GA29206@mx.loc>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
	<20090822011906.2dd045fc@surf>
	<BD79186B4FD85F4B8E60E381CAEE19091E7909@mi8nycmail19.Mi8.com>
	<20090822105505.27ace9b6@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, August 25, 2009 12:02 PM, Bernhard Reutner-Fischer wrote:
> On Tue, Aug 25, 2009 at 01:48:21PM -0400, H Hartley Sweeten wrote:
>> Thomas,
>>
>> I found this FAQ on the CodeSourcery website.
>> 
>> Installing CodeSourcery Run-time Libraries
>> http://www.codesourcery.com/sgpp/lite/arm/portal/kbentry48
>> 
>> Would this simplify copying the external toolchain libraries
>> to the target rootfs?
>> 
>> What was the original problem with using the external toolchain
>> from it's installed location?  Why do the files need to be
>> copied to $(STAGING_DIR) and the flag "--sysroot $(STAGING_DIR)"
>> added to the TARGET_*FLAGS.
>> 
>> If the external toolchain is used from the install location I
>> think the -march= option will correctly setup the library paths
>> and allow the multilib toolchain to work correctly.  I believe
>> this is how the kernel build works.
> 
> except that the kernel won't link against those helper-libs as opposed
> to userspace which will need some of those libs on the rootfs.

I agree that the kernel does not link against the helper-libs in the
toolchain.

I also agree that those libs need to be copied to the rootfs.

What I don't understand is why they need to be copied to $(STAGING_DIR)
and then needing to re-direct the --sysroot to them.  The only comment
about this in ext-tool.mk says:

#  3. Copy the libraries and headers to the staging directory. This
#  will allow all further calls to gcc to be made using --sysroot
#  $(STAGING_DIR), which greatly simplifies the compilation of the
#  packages when using external toolchains. So in the end, only the
#  cross-compiler binaries remains external, all libraries and headers
#  are imported into the Buildroot tree.

The question is "how" does this actually simplify the compilation?

Thanks,
Hartley
