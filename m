From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 11 Apr 2017 13:59:23 -0300 (BRT)
Subject: [Buildroot] [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts
 with busybox and util-linux
In-Reply-To: <2282fd1a-5a83-0b42-4417-3aedf252d28b@mind.be>
References: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
 <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
 <2282fd1a-5a83-0b42-4417-3aedf252d28b@mind.be>
Message-ID: <1676973985.18543033.1491929963459.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Yann E
> . MORIN" <yann.morin.1998@free.fr>
> Sent: Monday, April 10, 2017 9:45:05 AM
> Subject: Re: [PATCH v6 1/2] e2fsprogs: refactor to fix conflicts with busybox and util-linux

---8<---

>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> This has changed so much that I doubt the Sob of Maxime is still correct...
> Just turn it into a Cc. Cc makes sure that:
> 
> - Maxime is kept in Cc, obviously, but also
> - the git log shows that Maxime was involved in this series.
---8<---
>> Changes v4->v5
>>    - Extreme overhauling, deeply simplifying the recipe and following
>>      the suggestion from Arnout Vandecappelle to install e2fsprogs
>>      utilities on /bin and /sbin.
>> Changes v5->v6
>>    - Fix typos and make small changes in commit message
---8<---
>  Wow, you're changing way too much here in a single patch... Changing the
> config into a menuconfig may be a good idea (we more or less decided that
> starting from 5 suboptions it should be a menuconfig), but it certainly should
> be a separate patch.
> 
> I propose that you split up into:
> 
> - config -> menuconfig
> 
> - update upstream URL (with as commit log: "e2fsprogs.sf.net redirects to
> e2fsprogs.sourceforge.net, so use that URL directly")
> 
> - don't build uuid tools
> 
> - remove options for basic set
> 
> - add help text for remaining options
> 
> - move from /usr/{bin,sbin} to /{bin,sbin}
> 
> - whatever you're doing with host-e2fsprogs and for which no explanation is
> given in the commit message
> 
> I may have missed something that also needs to be split off, but this patch is
> too complicated to detect even that :-)

Sorry, no.

I made a deep overhauling because the original recipe was so messy that
small changes did not work. It is now reasonable to artificially split the
change in seven patches now to end up with exactly the same result. It's
harder to implement, test and review, considering all possible options I
need to deal with:

- glibc, musl or uClibc
- shared-only, static-only or shared/static libraries
- split or merged /bin|sbin and /usr/bin|sbin (triggered by systemd).

---8<---
>>  
>> -	  http://e2fsprogs.sf.net
>> +	  badblocks chattr debugfs dumpe2fs e2freefrag e2fsck e2image
>> +	  e2undo e4crypt e4defrag filefrag fsck fuse2fs logsave lsattr
>> +	  mke2fs mklost+found resize2fs tune2fs
> 
> This could be a little more explicit:
> 
>	  The following programs are always built and installed:
>	  badblocks ...
> 
>	  Other programs can be selected below.

Ok

---8<---
>> +comment "Basic set: badblocks chattr dumpe2fs e2freefrag e2fsck e2undo"
>> +comment "e4crypt e4defrag filefrag logsave lsattr mke2fs mklost+found"
>> +comment "tune2fs"
> 
> This comment is not needed. It's already said in the help text.

Ok

---8<---
>>  config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
>>  	bool "e4defrag"
>>  	depends on !BR2_nios2 # fallocate not implemented
>>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
>> +	help
>> +	  Online defragmenter for ext4 filesystem
>>  
>>  comment "e4defrag needs a glibc or musl toolchain"
>>  	depends on BR2_TOOLCHAIN_USES_UCLIBC
> 
> Hm, looks like there is a
>	depends on !BR2_nios2
> missing here...

Ok

>>  
>> -config BR2_PACKAGE_E2FSPROGS_FILEFRAG
>> -	bool "filefrag"
>> -	default y
>> -
>>  config BR2_PACKAGE_E2FSPROGS_FSCK
>>  	bool "fsck"
>> +	depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
>>  	default y
>> +	help
>> +	  Check and repair a Linux file system
> 
> This sounds as if fsck does the actual filesystem check, which it doesn't. How
> about:
> 
>	  Check and repair Linux file systems. This is a wrapper around
>	  the filesystem-specific fsck tools.
> 
> Yes, I do realize that makes it differ from the help text in util-linux, which
> is not ideal. But when you add something, it's better to do the right thing :-)

Ok

---8<---
>> -# we don't have a host-util-linux
>> -HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
>> +
>> +HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
> 
> Actually I'm not sure if we really want to depend on host-util-linux... Why
> should we?

Because host-e2fsprogs now ues libblkid and libuuid from util-linux.
This prevents overriding them with e2fsprogs' ones, which may cause
problems for other packages.
---
>> +HOST_E2FSPROGS_CONF_OPTS = \
>> +	--disable-defrag \
>> +	--disable-fuse2fs \
>> +	--bindir=$(HOST_DIR)/bin \
>> +	--sbindir=$(HOST_DIR)/sbin \
>> +	--enable-symlink-install \
>> +	--disable-libblkid \
>> +	--disable-libuuid \
        ^^^^^^^^^^^^^^^^^^^^
              Here
>> +	--disable-e2initrd-helper \
>> +	--disable-testio-debug \
>> +	--disable-rpath
>>  
>> -ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
>> -E2FSPROGS_CONF_OPTS += --enable-fuse2fs
>> -E2FSPROGS_DEPENDENCIES += libfuse
>> -else
>> -E2FSPROGS_CONF_OPTS += --disable-fuse2fs
>> -endif
> 
> Don't change this, it was better like that.

No, it was not. My change keeps all --enable/disable- together,
improving readability.

---8<---
>> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
>> -# util-linux libuuid pulls in libintl if needed, so ensure we also
>> -# link against it, otherwise static linking fails
>> -E2FSPROGS_CONF_ENV += LIBS=-lintl
>> -endif
> 
> Why can this be removed? IIUC, e2fsprogs will now use the uuid from util-linux
> if that is enabled, and will not use uuid at all if not. Correct? So if
> util-linux libuuid is enabled, this is still needed, no?

Hum, adding a uClibc build to the test set. In fact the test can be

    ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_STATIC_LIBS),yy)

>> -define E2FSPROGS_TARGET_MKE2FS_SYMLINKS
>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext2
>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext3
>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4
>> -	ln -sf mke2fs $(TARGET_DIR)/usr/sbin/mkfs.ext4dev
> 
> Can you explain why this is no longer needed? I don't see how any of your other
> changes could obviate this one...
> 
> If it actually wasn't needed to begin with, please also make it a separate
> patch with a good explanation.

Perhaps it was needed by old versions of e2fsprogs but with v1.43.4 the
symlinks are created (see the --enable-symlink-install in *_CONF_OPTS).

Also, fsck.ext4dev and mkfs.ext4dev were dropped in v1.43.4, according
to the release notes.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
