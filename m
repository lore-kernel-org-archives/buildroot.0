From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 18:03:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
In-Reply-To: <87y2louth0.fsf@posteo.net>
References: <20200831111226.15764-1-egorenar-dev@posteo.net>
 <20200903232648.6be84338@windsurf.home> <87y2louth0.fsf@posteo.net>
Message-ID: <87v9gsus6t.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander Egorenkov <egorenar-dev@posteo.net> writes:

>> elf_info.c: In function ?get_elf64_phnum?:
>> elf_info.c:1050:23: error: ?PN_XNUM? undeclared (first use in this function)
>>   if (ehdr->e_phnum == PN_XNUM) {
>>                        ^
>> elf_info.c:1050:23: note: each undeclared identifier is reported only once for each function it appears in
>> make[1]: *** [Makefile:90: elf_info.o] Error 1
>>
>> PN_XNUM is defined in libelf/elf.h in the elfutils code base, but it
>> seems like this header file is only installed if elfutils is built with
>> --enable-install-elfh. However, I am not sure what would be the impact
>> of installing elf.h. Indeed, the kernel headers also have an elf.h file
>> in usr/include/linux/elf.h.
>>
>> Could you have a look into this ?
>
> Hmm, i checked the usr/include/linux/elf.h and it defines
> PN_XNUM but makedumpfile doesn't include this one and takes the one from
> glibc which is much bigger but doesn't contain this define,
> unfortunately. One option would be to patch makedumpfile and define
> PN_XNUM if it not yet defined, not sure whether this the way you want to
> go ? At least we wouldn't possibly break any other packages. What do you
> think ?
> This is just stupid, why would elfutils override glibc's elf.h, sigh.
>  
> Thanks for feedback
> Regards
> Alex


I checked glibc and it defines the PN_XNUM constant, it seems that
uClibc doesn't. Another possible solution would be to make makedumpfile
depend on glibc, what do you think ? That would mean no uClibc support
for this package.

Regards
Alex
