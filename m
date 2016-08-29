From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Aug 2016 09:45:27 +0200
Subject: [Buildroot] [PATCH v1 3/9] board/intel/common: Add possibility
 for adding ACPI tables to the initrd
In-Reply-To: <20160829065522.GV1812@lahna.fi.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-4-git-send-email-andriy.shevchenko@linux.intel.com>
 <7d61148d-f102-bc79-e177-3ec8f6f95b8e@mind.be>
 <20160826090454.GK1812@lahna.fi.intel.com>
 <20160826113022.2748b435@free-electrons.com>
 <20160826093901.GO1812@lahna.fi.intel.com>
 <f59bf00c-ff3f-5419-d8f1-59902dbbe35f@mind.be>
 <20160829065522.GV1812@lahna.fi.intel.com>
Message-ID: <3e7d378a-9d22-87f0-a536-bc268ba28c69@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-08-16 08:55, Mika Westerberg wrote:
> On Fri, Aug 26, 2016 at 06:30:47PM +0200, Arnout Vandecappelle wrote:
>>
[snip]
>>  Is it still possible to use an ext3 as a rootfs rather than an initrd? I.e.,
>> use a cpio archive with just the acpi stuff but have the real rootfs (including
>> /sbin/init) on SD card. We generally have a writeable and persistent rootfs in
>> the defconfigs because it's more convenient for experimenting.
> 
> Sure we can use ext3 or whatever. Only thing that requires initrd is the
> AML stuff and we can generate that separately. That said the system we
> use here for kernel development only uses initrd (because that does not
> require any kind of disk to be present in the system under development).

 Well, you'll need _some_ kind of storage for the boot loader, no? Unless you
use PXE, but in that case you'll probably want to use NFS-root.

 PXE boot is however a bit more complicated to set up (you have to run a DHCP
server, probably on a private network, which means a second interface on your PC
or setting up VLAN in your switch), so we prefer to stick with disk-based (i.e.,
SD card) boot. Cfr. for instance the existing Minnowboard configs.

 So I would say: create the cpio archive from some package (possibly the package
containing the actual definitions, like Thomas suggested), and create
board-specific defconfigs that build SD card images.

 Regards,
 Arnout

> 
>>  If this possibility exists, then I think it would make sense to add a package
>> (in the bootloader menu maybe?) that generates this cpio archive, like Thomas
>> suggested. Appending the two archives, however, is still something for a
>> post-image script I think.
> 
> OK.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
