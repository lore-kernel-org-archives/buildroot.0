From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jan 2013 07:57:56 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxuKWz3-que3MYwBSrLh_F2-L_XhMvE-+oUog+kL_2mobA@mail.gmail.com>
Message-ID: <50E3DA74.6080303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/25/12 04:52, Steve Calfee wrote:
> On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
>> Hello All!
>>
>> Some systems require a specific partition layout to be able to boot.
>> For example:
>>    - the RaspberryPi:
>>      - the first, primary partition, and vfat-formatted, with the bootloader
>>        files and the kernel
>>      - the rest of the filesystem hierarchy can be dispatched at will
>>    - on i.MX:
>>      - the first, (primary?) partition must be non-FAT (special type?), with
>>        the bootloader raw-binary inside
>>      - the rest of the filesystem hierarchy can be whatever
>>    - on OMAP paltforms:
>>      - similar to the PI, but the kernel can be on ext2/3/4 (as wel as VFAT?)
>>
>> For now, buildroot can build a single filesystem image. This is not useable
>> for these systems. The only possibility as of today is to configure BR to
>> generate a tarball, and have a custom script that does the required split up
>> of the different components.

  That's not really true, is it? Buildroot generates the ext2fs and the 
boot loader and kernel images, you only have to create the partitions and 
the fatfs and pull everything together into a single image.

>>
>> It would be nice to have buildroot smoothly handle these cases.
>>
>> After a quick talk on IRC with Thomas, here are a few proposals.
>>
>> 0) Keep as-is
>>
>> Buildroot can not handle all possibilities, we can't even *think* about
>> all such possibilities. This is the easiest for buildroot, and pushes the
>> complexity down to the users.
>>
> This is my favorite. There are no known situations that cannot be
> handled by buildroot. Quit adding to the makefile. It adds
> complexities, and only fixes the one, current users complaint. Keep
> mechanism separate from policy. Buildroot should be a simple
> consistent way to build a root file system. People who have weird
> build/target desires can do that in an external script.


  +1

  On the other hand, if an external package would exist that implements 
the fully monty (your option 2), then I would have no problem with 
integrating that package and running it automatically post-build.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
