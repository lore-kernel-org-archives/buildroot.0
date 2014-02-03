From: Danny Gale <Daniel.Gale@coloradoengineeringinc.com>
Date: Mon, 03 Feb 2014 12:50:34 -0700
Subject: [Buildroot] Error building with external toolchain
In-Reply-To: <20140203193701.5775f5d5@skate>
References: <52EBD7F7.8010504@coloradoengineeringinc.com>	<20140201094246.20d7dc22@skate>	<52EFD674.7060800@coloradoengineeringinc.com>
 <20140203193701.5775f5d5@skate>
Message-ID: <52EFF30A.6070905@coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's an RPM of the toolchain to run on x86-64 host that will install 
to /opt/start64TC (54 MB download)

http://www.sendspace.com/file/rtvitd

Thanks,
Danny

On 02/03/2014 11:37 AM, Thomas Petazzoni wrote:
> Dear Danny Gale,
>
> On Mon, 03 Feb 2014 10:48:36 -0700, Danny Gale wrote:
>
>>> Aren't you running with "make -j<something>" by any chance?
>> I'm running make with a single thread (-j1) to pinpoint this error.
>>
>> The external toolchain was built on an x86_64 host by Crosstool-NG
>> 1.19.0 for a powerpc64-e6500 target. I've attached the config file for
>> ct-ng.
> Ok. Can you put up online a tarball of this toolchain?
>
> We don't have powerpc64 support in Buildroot, so maybe some minor
> changes in the external toolchain logic are needed.
>
>> I was able to go through the buildroot source and follow it through: the
>> .stamp_staging_installed target calls $($(PKG)_INSTALL_STAGING_CMDS),
>> with PKG=TOOLCHAIN_EXTERNAL. TOOLCHAIN_EXTERNAL_INSTALL_STAGING_COMMANDS
>> in ./toolchain/toolchain-external/toolchain-external.mk calls
>> TOOLCHAIN_EXTERNAL_INSTALL_CORE in that same file. The message "Copying
>> external toolchain libraries to target..." is there, though I don't
>> understand why it fails at that point.
> Correct. All the external toolchain logic is in
> toolchain/toolchain-external/toolchain-external.mk.
>
>> It seems I was mistaken -- the 32-bit version of the toolchain doesn't
>> seem to import either. A different 32-bit toolchain (for the powerpc 440
>> core) does import, however. So there seems to be something wrong with my
>> toolchain configuration. I suspect RPC support to be the culprit.
>>>> What will be required to get buildroot working with the 64-bit toolchain?
>>> When you're talking about 32 bits or 64 bits, are you talking about the
>>> bitness for the host architecture, or the target architecture?
>> The target. The host is an x86_64. The target is a 64-bit powerpc (e6500
>> core)
> Again, if you can sure the toolchain tarball, I could do some testing.
>
> Thanks!
>
> Thomas
