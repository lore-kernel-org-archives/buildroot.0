From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Wed, 14 Oct 2015 13:05:46 -0300
Subject: [Buildroot] [PATCH v2 0/2] Add support for AXFS filesystem type
In-Reply-To: <20151013231428.2e611e06@free-electrons.com>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <20151013231428.2e611e06@free-electrons.com>
Message-ID: <561E7D5A.1010600@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

El 13/10/15 a las 18:14, Thomas Petazzoni escribi?:
> Dear Ariel D'Alessandro,
> 
> On Mon,  5 Oct 2015 13:55:00 -0300, Ariel D'Alessandro wrote:
>> This patch series adds support for using the AXFS filesystem type.
>>
>> The Advanced XIP File System is a Linux kernel filesystem driver that enables
>> files to be executed directly from flash or ROM memory rather than being copied
>> into RAM.
>>
>> More info can be found here: http://elinux.org/AXFS
>>
>> Changes from v1:
>> * Removed unnecessary call to $(generic-package) in axfsutils.mk.
>>
>> Ariel
>>
>> Ariel D'Alessandro (2):
>>   axfsutils: add new package
>>   axfs: add new filesystem type
> 
> You received some feedback on both patches. Could you address this
> feedback, and submit a new version of the patches?

Yes, right away.

> 
> Note that adding the axfs patches as a kernel extension, as suggested
> by Yann E. Morin, is optional and can perfectly be done as a set of
> follow-up patches: it is not mandatory to have this part of the current
> series.

Understood.

> 
> However, one thing that I remember about AXFS is that you could decide
> when creating the root filesystem, which parts of which files would be
> stored uncompressed (so that they can be XIP-ed) and which parts of
> which files would be stored compressed (to save space). This allowed to
> combine the nice aspects of a XIP-capable filesystem, with the nice
> aspects of a compressed filesystem. 

Yes, indeed. One of the keys of AXFS is that it "has the ability to
store individual *pages* in a file uncompressed/XIP or compressed/Demand
Paged." [0]

Moreover, "mkfs.axfs tool can receive an additional argument using the
-i flag which points to a user-created file in the XML format; it
indicates which pages the user desires to have marked for XIP within the
file system image." [1]

> I remember there was even a tool to
> run on the target to "measure" the filesystem accesses, and give some
> hints on which pages of data should be stored uncompressed vs. which
> pages should be stored compressed. Is this actually implemented in
> AXFS ? 

Yes. The CONFIG_AXFS_PROFILING option is added in order to enable the
profiling tool. Then simply running on the target platform, the AXFS
profiler will collect data and write the information it could gather to
/proc/axfs/volume0. See [1] for more information.

> If so, do you plan to add support for such functionality ?

Yes, it would be nice to add support for this functionality in order to
explode the entire AXFS capability. I'll do this as a set of follow-up
patches if that's OK, and let the -a flag (XIP all) for now.

Thanks,


Links:

[0]
http://www.academypublisher.com/ojs/index.php/jcp/article/viewFile/03017989/370

[1]
http://docslide.us/documents/application-execute-in-place-xip-with-linux-and-axfs.html

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
