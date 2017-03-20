From: Abhimanyu V <abhimanyu.v@imgtec.com>
Date: Mon, 20 Mar 2017 12:38:13 +0530
Subject: [Buildroot] [PATCH v4 2/3] Add LINUX_DIR to EXTRA_ENV for use
 in post-build scripts
In-Reply-To: <78a51dc2-e493-4b74-bd65-0e3f579ebba7@mind.be>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1489664602-32596-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <b7ac0faf-3b85-2439-1386-e181257c2d29@mind.be>
 <20170318142331.061e2cda@free-electrons.com>
 <78a51dc2-e493-4b74-bd65-0e3f579ebba7@mind.be>
Message-ID: <fa25f244-e956-cbfa-b81c-88887e15a040@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas,


On Saturday 18 March 2017 07:29 PM, Arnout Vandecappelle wrote:
>
> On 18-03-17 14:23, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Fri, 17 Mar 2017 23:39:46 +0100, Arnout Vandecappelle wrote:
>>> On 16-03-17 12:43, Abhimanyu V wrote:
>>>> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>>>>
>>>> To build fitImage in post-build scripts, we need compressed
>>>> kernel binary which is intermediate target, hence doesnt get
>>>> copied to output/images folder.
>>>>
>>>> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>>>> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
>>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> I am not sure about this one. Why would we pass in the environment
>> specifically LINUX_DIR, and not the <pkg>_DIR of the other ~2000
>> packages we have in Buildroot ?
>   Because LINUX_DIR is *much* more likely to be used in a post-build/image
> script. E.g. if the initramfs wouldn't be supported directly by Buildroot, you'd
> need it. Same for mxs-bootlets.
>
>   I agree though that it's not great, but could find no better way. Although,
> actually, it could use a recursive 'make printvars VARS=LINUX_DIR' (which will
> be even better when [1] gets committed).
>
>> What about instead using BR2_LINUX_KERNEL_VMLINUX_BIN, to get
>> vmlinux.bin copied to output/images, and then compress it in the
>> post-build script ?
>   I considered that in one of my reviews, but vmlinux.bin doesn't contain the
> load and start address. The post-build script would have to retrieve those in
> some other way.
When working I also had 2 other way to get it working:

1. Using vmlinux.bin and use gzip in build script to generate 
vmlinux.bin.gz and use fixed ENTRY_ADDR which is
how openwrt version also does.

2. Extracting vmlinux.bin.gz from uImage directly.

Out of 3 i thought using what is already generated is best way to use it 
and it also reduces extra processing. If out of above 2 look good let me 
know i can propose the patch with
solution.
>
>   However, Abhimanyu reported that there is upstream support for generating a
> fitImage in the kernel build itself. That's of course preferable...
fitImage support would need some more time, i would prefer if we get it 
pushed before fitImage support is ready.

>
>
>   Abhimanyu, could you rework using either 'make printvars' in the post-build
> script (optionally incorporating [1] in your series so 'make printvars' actually
> does the right thing), or using the in-kernel fitImage support?
>
>   Regards,
>   Arnout
>
> [1] http://patchwork.ozlabs.org/patch/721102/
>
Thanks, i will work on patch.


>> Or alternatively, if there is a vmlinux.bin.gz target, add support for
>> it in our linux package?
>>
>> Best regards,
>>
>> Thomas
>>
Regards
Abhimanyu
