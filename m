From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 16 Apr 2012 18:42:28 +0200
Subject: [Buildroot] Problem with apply-patches.sh
In-Reply-To: <CAFbHwiS0n-j33nq1pkA5N=y6kwwEL=084VxpB6F3Qk5HVu5-9g@mail.gmail.com>
References: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
 <4F8C4224.6040500@atmel.com>
 <CAFbHwiSjrxd39k7U2jMReBKT2sMmBp1PmLwQA3Kq_pAwqjc9RA@mail.gmail.com>
 <4F8C478E.8010002@atmel.com>
 <CAFbHwiS0n-j33nq1pkA5N=y6kwwEL=084VxpB6F3Qk5HVu5-9g@mail.gmail.com>
Message-ID: <4F8C4BF4.3040904@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/16/2012 06:27 PM, Will Newton a ?crit :
> On Mon, Apr 16, 2012 at 5:23 PM, Ludovic Desroches
> <ludovic.desroches@atmel.com>  wrote:
>> Le 04/16/2012 06:09 PM, Will Newton a ?crit :
>>
>>> On Mon, Apr 16, 2012 at 5:00 PM, Ludovic Desroches
>>> <ludovic.desroches@atmel.com>    wrote:
>>>>
>>>> Hi
>>>>
>>>> Le 04/16/2012 04:40 PM, Will Newton a ?crit :
>>>>
>>>>> Hi all,
>>>>>
>>>>> I noticed that in some cases apply-patches.sh will misbehave if you
>>>>> have a file matching the glob '*.patch' in the top-level directory.
>>>>> For example the patching of binutils fails in this case. The problem
>>>>> is at the line:
>>>>>
>>>>>      support/scripts/apply-patches.sh $(@D)
>>>>> $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
>>>>> || exit 1;
>>>>>
>>>>> in package/Makefile.package.in. The glob gets expanded prematurely (to
>>>>> e.g. myfile.patch) and then the expanded glob is passed to
>>>>> apply-patches.sh which will fail to find any patches matching the
>>>>> glob. I've had a go at trying to stop this happening but with no
>>>>> success so far. Can anyone think of any creative ways to suppress this
>>>>> expansion?
>>>>>
>>>>> Thanks,
>>>>
>>>>
>>>>
>>>> I see what you mean but I can't reproduce your issue:
>>>
>>>
>>> Hi Ludovic, thanks for the quick response!
>>>
>>> Did you have a dummy patch file in the top-level? e.g.:
>>>
>>> # cd buildroot
>>> # touch mypatch.patch
>>> # make
>>>
>>
>> Yes I did this, I have created an empty patch file.
>>
>>
>>> For me that causes the patch patterns passed to apply-patches.sh to
>>> look like: mypatch.patch *.patch.arm. The arch specific glob in this
>>> case does not match anything so it remains unexpanded.
>>>
>>
>> I agree but I had no error. I didn't do the whole build so maybe I will
>> encounter an issue later due to the "no-patched" binutils.
>
> I don't think it will cause an obvious issue for most people - I
> happen to have a patched binutils so that if the patch is missing
> things go wrong quite obviously. I put an echo in the top of
> apply-patches.sh and I was quite clearly seeing the glob had been
> expanded by the time it was run (whilst building host-binutils).

Still true with the patch I sent?

For me the glob was expanded here: scan_patchdir $patchdir $patchpattern

Without the patch:

 >>> binutils 2.21.1 Extracting
bzcat /home/ldesroches/workspace/buildroot/dl/binutils-2.21.1.tar.bz2 | 
tar --strip-components=1 -C 
/home/ldesroches/workspace/buildroot/output/build/binutils-2.21.1  -xf -
 >>> binutils 2.21.1 Patching package//binutils
 >>> binutils 2.21.1  Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find 
/home/ldesroches/workspace/buildroot/output/build/binutils-2.21.1 -name 
$file); do cp support/gnuconfig/$file $i; done; done
 >>> binutils 2.21.1 Patching libtool



With the patch:

 >>> binutils 2.21.1 Extracting
bzcat /home/ldesroches/workspace/buildroot/dl/binutils-2.21.1.tar.bz2 | 
tar --strip-components=1 -C 
/home/ldesroches/workspace/buildroot/output/build/binutils-2.21.1  -xf -
 >>> binutils 2.21.1 Patching package//binutils

Applying 110-arm-eabi-conf.patch using patch:
patching file configure
Hunk #1 succeeded at 3180 with fuzz 2 (offset 935 lines).
patching file configure.ac
Hunk #1 succeeded at 652 with fuzz 2 (offset 130 lines).

Applying 120-sh-conf.patch using patch:
patching file configure
Hunk #1 succeeded at 3148 (offset 867 lines).
Hunk #2 succeeded at 3487 (offset 881 lines).
patching file configure.ac
Hunk #1 succeeded at 620 (offset 90 lines).
Hunk #2 succeeded at 959 (offset 104 lines).

Applying 300-001_ld_makefile_patch.patch using patch:
patching file ld/Makefile.am
Hunk #1 succeeded at 37 (offset 19 lines).
patching file ld/Makefile.in
Hunk #1 succeeded at 365 (offset 78 lines).

Applying 300-012_check_ldrunpath_length.patch using patch:
patching file ld/emultempl/elf32.em
Hunk #1 succeeded at 1272 (offset 2 lines).
Hunk #2 succeeded at 1501 (offset 2 lines).
 >>> binutils 2.21.1  Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find 
/home/ldesroches/workspace/buildroot/output/build/binutils-2.21.1 -name 
$file); do cp support/gnuconfig/$file $i; done; done
 >>> binutils 2.21.1 Patching libtool

> For the record my make is 3.81 and bash is 4.1.2.
>


Regards

Ludovic
