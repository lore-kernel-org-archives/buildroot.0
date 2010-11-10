From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 10 Nov 2010 18:29:25 +0100
Subject: [Buildroot] Buildroot creates broken jffs2 image
In-Reply-To: <20101109184310.257314b0@surf>
References: <AANLkTi=zp_NcMLOBTK5v+Hc=ryLOwT5YuNg9TXrrtdu=@mail.gmail.com>
	<20101109184310.257314b0@surf>
Message-ID: <AANLkTik6UkpFMZV1AR_yCAHiCa-LT8vaZXqcWx+EkzpX@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 November 2010 18:43, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 9 Nov 2010 16:25:23 +0100
> Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>
>> 3) look at the build log and retrieve the mkfs.jffs2 command that
>> buildroot used:
>> echo
>> " ? ? /home/bjornfor/forks/buildroot-skipper/output/host/usr/sbin/mkfs.jffs2
>> -e 0x20000 -p -l -s 0x800 -n
>> -d /home/bjornfor/forks/buildroot-skipper/output/target
>> -o /home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2"
>> >> /home/bjornfor/forks/buildroot-skipper/output/build/_fakeroot.fs
>>
>> 4) issue the command with *host* mkfs.jffs2 instead (using the exact
>> same arguments):
>> mkfs.jffs2 -e 0x20000 -p -l -s 0x800 -n -d
>> /home/bjornfor/forks/buildroot-skipper/output/target -o
>> /home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2.v2
>>
>> 5) flash new jffs2 image and mount. This time with *no errors*.
>>
>> Any ideas on why this is happening?
>
> Not sure, but steps 3) and steps 4) are not identical. In step 3),
> mkfs.jffs2 is called by fakeroot, which first creates the device files.
> In step 4), you don't have anything creating the device files.

True.

> Could you try doing step 4 (i.e calling mkfs.jffs2 directly), but by
> calling the mkfs.jffs2 built by Buildroot (in $(HOST_DIR)) ?

Yes. What I found is that calling HOST_DIR mkfs.jffs2 directly (and
not in fakeroot) also created a bad image.

However, I just looked at the BR changelog and found this:

$ git log HEAD..origin/master -- package/mtd/
commit 90660c282298fdb6b09baefe44845b923d9e077f
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Sat Oct 16 22:20:21 2010 +0200

    mtd: bump version

    For mkfs.jffs2 bugfix.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

commit 823aaef1ce9d68e14ff9ac26f38b74139a77f47b
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Fri Oct 15 10:39:23 2010 +0200

    mtd: fix big endian crc calculation

    Taken from upstream git.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

So I cherry-picked these commits and rebuilt. Now the issue is gone!
Sweet! But AFAICS, jffs2 is broken for 2010.08 users...

Thanks for your help, Thomas.

Best regards,
Bj?rn Forsman
