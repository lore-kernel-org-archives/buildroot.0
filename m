From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sun, 4 Nov 2018 17:48:19 +0100
Subject: [Buildroot] [PATCH 2/2] fs/f2fs: add support for creating a
 f2fs image
In-Reply-To: <20181103154843.761e9e07@windsurf>
References: <20181026200016.30856-1-grzegorz@blach.pl>
 <20181026200016.30856-3-grzegorz@blach.pl> <20181103154843.761e9e07@windsurf>
Message-ID: <64187dca-beec-cbb4-ff0f-6d12495aae26@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/3/18 3:48 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 26 Oct 2018 22:00:16 +0200, Grzegorz Blach wrote:
>> This patch makes possible to create rootfs image using f2fs filesystem.
>>
>> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> 
> I have applied, after doing a number of changes, mainly splitting into
> separate patches, as suggested by Yann E. Morin.
> 
> However, now that you have added F2FS support, it would be good if you
> could add a test in our test suite for this filesystem. Look at
> support/testing/tests/fs/ for the other filesystem tests that we have.
> Could you add something like this ?
> 

Ok, I'll write this tests tomorrow.


>> +config BR2_TARGET_ROOTFS_F2FS_COLD_FILES
>> +	string "extension list for cold files"
> 
> Any reason for having added this option for cold files, but not the
> symmetric option for hot files ?
> 

I've missed hot files because manual page don't says anything about 
them.  I'll add a patch for hot files too.


>> +	help
>> +	  Specify a file extension list in order f2fs to treat them
>> +	  as cold files. The default list includes most of multimedia
>> +	  file extensions such as jpg, gif, mpeg, mkv, and so on.
> 
> I've seen this after committing, but the help text of mkfs.f2fs seems
> to imply that the list of extensions should be comma separated. If
> that's the case, it should be mentioned in the help text, because most
> Buildroot options use space-separated lists, not comma-separated ones.
> 
>> +config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
>> +	int "size for overprovision area (0 for auto calculation)"
> 
> Actually 0 is not auto-calculation. 0 will not pass any -O option, and
> therefore mkfs.f2fs will use its default of 5%.
> 

mkfs.f2fs says that default overprovision ratio is 5%, but in manual 
page you can read `If not specified, the best number will be assigned 
automatically accoring to the partition size`. This is a bit confusing.
After reading source code I'm sure if -o option is omitted or set to 0,
overprovision ratio is auto calculated.


> Also, this option doesn't give the size, but the ratio.
> 
> I've fixed both aspects when committing.
> 
>> +	dd if=/dev/zero of=$@ bs=1 count=0 seek=$(F2FS_SIZE)
> 
> I've replaced by a truncate, as suggested by Yann.
> 
> Thanks!
> 
> Thomas
> 
