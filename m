From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 02 Oct 2017 20:03:59 -0300
Subject: [Buildroot] [PATCH 2/5] support/testing: indent ccache
	defconfig fragment
References: <20171002054906.GB4753@scaer>
Message-ID: <59d2c5df5162d_184218187b49690@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 02, 2017 at 02:49 AM, Yann E. MORIN wrote:

> On 2017-10-01 22:03 -0300, Ricardo Martincoski spake thusly:
>> On Fri, Sep 29, 2017 at 05:17 AM, Yann E. MORIN wrote:
>> > On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
>> >> Postpone the strip out of leading spaces in defconfig fragments from the
>> >> __init__  to the setUp method. It allows test cases to post-process the
>> >> defconfig in their own __init__ before calling the __init__ method from
>> >> the base class.
>> > 
>> > Ideally, this should have been the very first patch in the series.
>> 
>> Good idea. I will do, but...
>> 
>> > 
>> >> Indent the only fragment in the tree that currently need this (in the
>> >> ccache test case), taking advantage of
>> >> "cf3cd4388a support/tests: allow properly indented config fragment".
>> > 
>> > And then that wcould have gone in the other patch without any issue.
>> 
>> It should. But the reordering shows the jlevel handling is fragile.

Fragile to other changes in the infra, I meant.

>> 
>> Both the rootfs overlay and yaffs2 tests currently have defconfig fragments that
>> don't end in a newline, so the new patch 1 ends up silently disabling jlevel:
>> ...s/core/rootfs-overlay2"BR2_JLEVEL=1
>> BR2_TARGET_ROOTFS_YAFFS2=yBR2_JLEVEL=1
> 
> Weird, because on line 46, we explicitly add a trainling '\n' :
>     https://git.buildroot.org/buildroot/tree/support/testing/infra/basetest.py#n45
> 
>    45:  self.config = '\n'.join([line.lstrip() for line in
>                                 self.config.splitlines()]) + '\n'
>    46:  self.config += "BR2_JLEVEL={}\n".format(self.jlevel)

But line 45 is the line being moved by this patch. So line 46 becomes
"unprotected" from defconfig fragments that does not end in a newline.

> 
>> So I plan to add another patch before the series, to make jlevel handling more
>> robust (to other changes in the infra) and at same time use the same style.
>>           self.config += \
>>               """
>>               BR2_JLEVEL={}
>>               """.format(self.jlevel)
> 
> Well, I doubt this is useful. Just prepend a \n, if it really is useful :
> 
>     self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)

OK.

> 
>> It also made me realize that this patch implies that I need to resend another
>> one (tests for the git downloader) since there I override the setUp method.
>> http://patchwork.ozlabs.org/patch/806161/
>> I would need to duplicate there the logic to remove the indentation of defconfig
>> fragments.
>> 
>> Perhaps instead of moving the logic to the setUp of BRTest I could move it to
>> the builder init. This way any new test class that reimplements setUp and uses
>> builder will "inherit" it. Those that reimplement setUp but don't use builder
>> don't need that code.
>>  class Builder(object):
>>      def __init__(self, config, builddir, logtofile):
>>          self.config = '\n'.join([line.lstrip() for line in
>>                                   config.splitlines()]) + '\n'
>> What do you think?
> 
> Yes, that would probably be better.

I will do this.

Regards,
Ricardo
