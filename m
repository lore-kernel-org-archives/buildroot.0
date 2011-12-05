From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 5 Dec 2011 12:13:48 +0100
Subject: [Buildroot] Pre-RFC: clean integration of unclean packages
In-Reply-To: <201112051108.12890.arnout@mind.be>
References: <201112051046.38674.arnout@mind.be>
 <CAAXf6LUVOFFmrG5izTXKZJr=_DGVou0sc_GOdPYVRajZKPp3rQ@mail.gmail.com>
 <201112051108.12890.arnout@mind.be>
Message-ID: <CAAXf6LV85CrRSQbUbKgHBB4-uP6SHWcpDcbDFHo5dMekU5ee2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 5, 2011 at 11:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 05 December 2011 10:58:11 Thomas De Schampheleire wrote:
>
>> On Mon, Dec 5, 2011 at 10:46 AM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>
> [snip]
>
>> > A second problem is that TI uses a horrible self-cooked build system. It
>
>> > makes assumptions about file locations that are difficult to satisfy. In
>
>> > addition, some packages don't even have a Makefile. And finally, they
>
>> > generate libraries with names like 'cmem.a470MV' instead of the usual
>
>> > 'libcmem.a'. To overcome all this, I wrote a custom 'Makefile.ti' that
>> > is
>
>> > used by buildroot instead of the packages' Makefiles. Does everybody
>> > agree
>
>> > that this is a good idea, or does someone have a better suggestion?
>
>>
>
>> Where is the Makefile.ti located and how does it get there? Is it
>
>> created by patching the source tree, or is it directly present in the
>
>> buildroot sources?
>
>
> It's in the packages/ti directory and is used by calling
>
> $(MAKE) -f packages/ti/Makefile.ti -C $(@D)
>
>
> I prefer that way to patching the actual source tree because of clarity.
>
> Note that the same Makefile.ti is used for all ti packages.

Could you gives us an idea of the contents of this file?
Depending on its contents, this may be problematic: what if you update
only one of the ti packages and it became incompatible with the
existing Makefile.ti?
But, if this Makefile.ti file is sufficiently general, I wouldn't be
opposed to this principle.

>
>
>> > A third problem is that some packages depend on 'xdctools'. This is a
>> > system
>
>> > to ease integration of embedded components into Eclipse. One small part
>> > of
>
>> > it is a header file that defines some standard types (basically stdint.h
>> > and
>
>> > stdbool.h but with different names). The whole xdctools package is a
>> > source
>
>> > tree of about half a gig, but for buildroot we just need this one
>> > 'std.h'
>
>> > file out of it... So I decided to copy that file directly into
>> > buildroot.
>
>> > Does everybody agree that this is a good idea, or does someone have a
>> > better
>
>> > suggestion?
>
>>
>
>> How is this achieved? Is there a dummy xdctools package that just
>
>> installs one file into staging? How is the file copied, is it directly
>
>> present in buildroot, or by patching?
>
>> Or did you add a patch adding that file to each of the packages that
>
>> depend on xdctools?
>
>
> packages/ti/xdctools/std.h which has the following .mk file:
>
>
> XDCTOOLS_SOURCE =
>
> XDCTOOLS_VERSION = 1
>
>
> XDCTOOLS_INSTALL_STAGING = YES
>
> XDCTOOLS_INSTALL_TARGET = NO
>
>
> define XDCTOOLS_INSTALL_STAGING_CMDS
>
> $(INSTALL) -D -m 0644 package/ti/xdctools/std.h
> $(STAGING_DIR)/usr/include/xdc/std.h
>
> endef
>
>
> define XDCTOOLS_UNINSTALL_STAGING_CMDS
>
> $(RM) $(STAGING_DIR)/usr/include/xdc/std.h
>
> endef
>
>
> $(eval $(call GENTARGETS))
>
>
> It also doesn't have a Config.in, it can only be used as a dependency.

What if someone would really like the full xdctools for some reason?
I think it'd be better to rename your package to something more
specific, like xdctools-dep, or otherwise to have just one package but
with two targets (with a different name, of course).

Best regards,
Thomas
