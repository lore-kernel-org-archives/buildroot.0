From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 14:59:35 +0100
Subject: [Buildroot] [PATCH v4 2/3] Add LINUX_DIR to EXTRA_ENV for use
 in post-build scripts
In-Reply-To: <20170318142331.061e2cda@free-electrons.com>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1489664602-32596-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <b7ac0faf-3b85-2439-1386-e181257c2d29@mind.be>
 <20170318142331.061e2cda@free-electrons.com>
Message-ID: <78a51dc2-e493-4b74-bd65-0e3f579ebba7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-03-17 14:23, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 17 Mar 2017 23:39:46 +0100, Arnout Vandecappelle wrote:
>> On 16-03-17 12:43, Abhimanyu V wrote:
>>> From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>>>
>>> To build fitImage in post-build scripts, we need compressed
>>> kernel binary which is intermediate target, hence doesnt get
>>> copied to output/images folder.
>>>
>>> Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>>> Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>  
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> I am not sure about this one. Why would we pass in the environment
> specifically LINUX_DIR, and not the <pkg>_DIR of the other ~2000
> packages we have in Buildroot ?

 Because LINUX_DIR is *much* more likely to be used in a post-build/image
script. E.g. if the initramfs wouldn't be supported directly by Buildroot, you'd
need it. Same for mxs-bootlets.

 I agree though that it's not great, but could find no better way. Although,
actually, it could use a recursive 'make printvars VARS=LINUX_DIR' (which will
be even better when [1] gets committed).

> What about instead using BR2_LINUX_KERNEL_VMLINUX_BIN, to get
> vmlinux.bin copied to output/images, and then compress it in the
> post-build script ?

 I considered that in one of my reviews, but vmlinux.bin doesn't contain the
load and start address. The post-build script would have to retrieve those in
some other way.

 However, Abhimanyu reported that there is upstream support for generating a
fitImage in the kernel build itself. That's of course preferable...


 Abhimanyu, could you rework using either 'make printvars' in the post-build
script (optionally incorporating [1] in your series so 'make printvars' actually
does the right thing), or using the in-kernel fitImage support?

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/721102/

> 
> Or alternatively, if there is a vmlinux.bin.gz target, add support for
> it in our linux package?
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
