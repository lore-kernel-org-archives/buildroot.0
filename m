From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Tue, 14 Jul 2015 17:56:43 -0400
Subject: [Buildroot] [PATCH v3 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <553DF343.8010400@andin.de>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1430095555-8484-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <553DF343.8010400@andin.de>
Message-ID: <55A5859B.2010809@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-04-27 04:28 AM, Andreas Naumann wrote:
>
>
> Am 27.04.2015 um 02:45 schrieb Emeric Vigier:
>> If you had some files added to the targetfs (fs-overlay, new packages,
>> ...) and you no longer need them, buildroot does not offer a simple way
>> to remove these items from the output/target directory. The rule added
>> by this commit allows you to clean the targetfs. Issuing 'make'
>> afterward will generate a new and clean targetfs.
>>
>> A section in the documentation is also added. It describes few examples
>> when developers could need it. 'make help' is also updated accordingly.
>> And full-rebuild section of the documentation is updated with content
>> and links.
>>
>
> Hi Emeric,
>
> this is very helpful, in fact i have a similar patch running for quite
> some time where I remove target/ and images/ and the corresponding
> stamps. There are some problems though and I want to share my findings
> with you.
> To begin with i was not 100% sure if the recreated target is the same as
> after a clean build. So I wrote a small check script which compares the
> original with the re-installed target trees. Here's the comparison i do:
>
>    rsync -rvncl --delete --exclude '*.pyc' --exclude '*.pyo' --exclude
> 'tmp/ldconfig/aux-cache' output/target/ target.orig/

Hi Andreas,

Sorry for the delay (BOFH excuse #273: The cord jumped over and hit the 
power switch). I finally have some time to work on this.

I ran your rsync command on a beaglebone_defconfig and ended up with 
some differences indeed:

$ rsync -rvncl --delete --exclude '*.pyc' --exclude '*.pyo' --exclude 
'tmp/ldconfig/aux-cache' output/target/ output/target.orig/
sending incremental file list
deleting lib/libgcc_s.so.1
deleting lib/libgcc_s.so
deleting lib/libatomic.so.1.1.0
deleting lib/libatomic.so.1
deleting lib/libatomic.so

sent 12,704 bytes  received 165 bytes  8,579.33 bytes/sec
total size is 1,671,066  speedup is 129.85 (DRY RUN)

> As you see it already has some files excluded that are always recreated
> differently.
> In addition I need to delete .stamp_host_installed from host-gcc-final*
> to force reinstall of libstdc++ into target (using external linaro
> toolchain).

removing $(BUILD_DIR)/host-gcc-final-*/.stamp_host_installed in the 
'target-clean' recipe fixed that issue. But is this solution generic enough?

> Another problem that showed up was that some of the package install
> steps dont seem separated very well. E.g. qt5 examples copies everything
> from a certain staging-dir/* to target/..
> A later qt5 module also creates files in that staging-dir, so next round
> there's more files in target.
>
> I realize this is due to my way of not deleteing the staging dir any
> longer - I used to in the beginning. If I recall correctly this is
> because I noticed some packages copy files into staging/ during compile
> and these files are then missing after a reinstall. I'm not entirely
> sure though.

I enabled qt4 and compare the targetfs after a target-clean, no differences:

$ rsync -rvncl --delete --exclude '*.pyc' --exclude '*.pyo' --exclude 
'tmp/ldconfig/aux-cache' output/target/ output/target.orig.qt4/
sending incremental file list

sent 15,095 bytes  received 62 bytes  30,314.00 bytes/sec
total size is 16,028,992  speedup is 1,057.53 (DRY RUN)

With what QT configs did you meet problems specifically?

> So my question is, in your approach, are you certain the re-installed
> staging/ is the same as the original for all packages? Maybe you can run
> some comparison like my rsync line for staging as well.

Yes, I have to check that too.

>
>
> regards,
> Andreas

thanks,
--
Emeric
