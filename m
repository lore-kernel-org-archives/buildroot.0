From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 May 2017 20:51:32 +0200
Subject: [Buildroot] [PATCH for-next 2/3] package/google-breakpad:
 switch to the new git repository
In-Reply-To: <clgrvdxfme.ln2@ID-313208.user.individual.net>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
 <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
 <clgrvdxfme.ln2@ID-313208.user.individual.net>
Message-ID: <0530a854-021a-33e4-96f2-7cacc7eac0a5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 28/05/2017 ? 20:14, Bernd Kuhls a ?crit :
> Am Sun, 27 Nov 2016 17:16:39 +0100 schrieb Romain Naour:
> 
>> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-
> support
>> +
>> +HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support 
>> +
>> +# Avoid using depot-tools to download this file.
>> +define HOST_GOOGLE_BREAKPAD_LSS
>> +	$(INSTALL) -D -m 0644 \
>> +		$(HOST_DIR)/usr/include/linux_syscall_support.h \
>> +		$(@D)/src/third_party/lss/linux_syscall_support.h
>> +endef
>> +HOST_GOOGLE_BREAKPAD_POST_EXTRACT_HOOKS += HOST_GOOGLE_BREAKPAD_LSS
> 
> Hi,
> 
> I do not know whether I found a bug or not while currently testing an 
> allyesconfig with "make legal-info" only.
> 
> In this case the package linux-syscall-support was not installed to 
> staging, therefore linux_syscall_support.h cannot be installed by 
> _POST_EXTRACT_HOOKS breaking the google-breakpad-legal-info target:
> 
> /usr/bin/install: cannot stat '/home/bernd/buildroot/buildroot/output/
> host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/
> linux_syscall_support.h': No such file or directory
> 
> Is the legal-info target meant to be used that way, this means without 
> building the package first, or do the packages have to be built before?
> In this case the problem would not exist.

Thanks for the report, I reproduced the bug here.

You're right, you can generate a defconfig and then extract legal-info without
building at all.

It seems I used the wrong hook to copy the linux_syscall_support.h file.
What do you think about PRE_CONFIGURE instead ?

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
