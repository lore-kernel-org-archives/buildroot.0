From: kelvincheung <keguang.zhang@gmail.com>
Date: Fri, 27 Mar 2009 23:59:21 -0700 (PDT)
Subject: [Buildroot] EABI broken on arm926t?
In-Reply-To: <22738895.post@talk.nabble.com>
References: <76d9e2a30810181737u6987153fsb6509635312f5141@mail.gmail.com>
	<22738895.post@talk.nabble.com>
Message-ID: <22754259.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I fond the sulotion:
http://lists.uclibc.org/pipermail/buildroot/2007-June/003189.html

To us EABI for ARM920T in the buildroot, two options are needed to the main
buildroot config:
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS="--with-arch=armv4t"
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-arch=armv4t"
or
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS="--with-cpu=arm920t"
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-cpu=arm920t"


kelvincheung wrote:
> 
> I have the same problem.
> My buildroot version is: buildroot-2009.02
> Any one know the solution?
> 
> Thanks!
> 
> 
> Hai Zaar-2 wrote:
>> 
>> Good day!
>> I'm building two weeks old buildroot snapshot for AT91SAM9260 board.
>> 
>> All I do it:
>> make at91sam9260dfc_defconfig
>> make menuconfig (select arm926t, EABI and remove games, etc...)
>> make
>> 
>> Results:
>> All kernels from 2.6.25 and later finish boot like this:
>>    VFS: Mounted root (ext2 filesystem).
>>    Freeing init memory: 128K
>>    Kernel panic - not syncing: Attempted to kill init!
>> 
>> The only kernel that worked is 2.6.24. After checking the kernel
>> config, I've found out that CONFIG_AEABI was not set (in spite of EABI
>> being selected in buildroot's config). Disabling EABI on later
>> kernels, (or enabling CONFIG_OABI_COMPAT) made them (almost)work.
>> 
>> Currently the situation is as follows:
>> 
>> EABI kernel + EABI rootfs = kernel panic (busibox's linuxrc dies)
>> EABI kernel + OABI rootfs = kernel panic (busibox's linuxrc dies)
>> OABI kernel + EABI rootfs = works, but some things like ping and nfs
>> return 'Illegal instruction'
>> EABI+OABI_COMPAT kernel + EABI rootfs = works, but some things like
>> ping and nfs return 'Illegal instruction'
>> EABI+OABI_COMPAT kernel + OABI rootfs = work correctly
>> OABI kernel + OABI rootfs = works correctly
>> 
>> 1. Is EABI support broken for this platform in buildroot?
>> 2. How can further investigate this issue?
>> 
>> -- 
>> Zaar
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>> 
>> 
> 
> 

-- 
View this message in context: http://www.nabble.com/EABI-broken-on-arm926t--tp20052144p22754259.html
Sent from the BuildRoot mailing list archive at Nabble.com.
