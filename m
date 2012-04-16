From: Will Newton <will.newton@gmail.com>
Date: Mon, 16 Apr 2012 17:09:48 +0100
Subject: [Buildroot] Problem with apply-patches.sh
In-Reply-To: <4F8C4224.6040500@atmel.com>
References: <CAFbHwiQUUsb2XPY_+nw--m1KTutFY_zXVYHaFNAfac_ftg78fA@mail.gmail.com>
 <4F8C4224.6040500@atmel.com>
Message-ID: <CAFbHwiSjrxd39k7U2jMReBKT2sMmBp1PmLwQA3Kq_pAwqjc9RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 16, 2012 at 5:00 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:
> Hi
>
> Le 04/16/2012 04:40 PM, Will Newton a ?crit :
>
>> Hi all,
>>
>> I noticed that in some cases apply-patches.sh will misbehave if you
>> have a file matching the glob '*.patch' in the top-level directory.
>> For example the patching of binutils fails in this case. The problem
>> is at the line:
>>
>> ? ? support/scripts/apply-patches.sh $(@D)
>> $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH)
>> || exit 1;
>>
>> in package/Makefile.package.in. The glob gets expanded prematurely (to
>> e.g. myfile.patch) and then the expanded glob is passed to
>> apply-patches.sh which will fail to find any patches matching the
>> glob. I've had a go at trying to stop this happening but with no
>> success so far. Can anyone think of any creative ways to suppress this
>> expansion?
>>
>> Thanks,
>
>
> I see what you mean but I can't reproduce your issue:

Hi Ludovic, thanks for the quick response!

Did you have a dummy patch file in the top-level? e.g.:

# cd buildroot
# touch mypatch.patch
# make

For me that causes the patch patterns passed to apply-patches.sh to
look like: mypatch.patch *.patch.arm. The arch specific glob in this
case does not match anything so it remains unexpanded.
