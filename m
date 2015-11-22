From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Sun, 22 Nov 2015 18:00:29 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
 hardcoded '-s'
In-Reply-To: <20151122154913.GA3603@free.fr>
References: <1448206276-6260-1-git-send-email-yba@tkos.co.il>
 <20151122154913.GA3603@free.fr>
Message-ID: <alpine.DEB.2.11.1511221751120.17459@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
See inlines below...

On Sun, 22 Nov 2015, Yann E. MORIN wrote:

> Date: Sun, 22 Nov 2015 16:49:13 +0100
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1] INSTALL for autotools packages with
>     hardcoded '-s'
> 
> Jonathan, All,
>
> On 2015-11-22 17:31 +0200, Jonathan Ben-Avraham spake thusly:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> The Makefile.in's of some autotools packages such as yp-tools and ypbind-mt do
>
> Are you planning on submitting those two packages?

Yes, I have already tested them on an unsuspecting client.

> If so, you should probably have sent a patch series with this patch as
> patch 1/3, followed by patches 2/3 and 3/3 to add the two packages.

Ok, that might solve the other problem I have been wrestling with, which 
is how to submit each package separately but add a top-level Config.in 
submenu called "NIS client" beneath "nfs-utils" that has both the yp-tools 
and ypbind-mt packages in the submenu.

> Having this single patch on its own does not make sense. It needs to
> have users for it in the tree.
>
> However... See below...
>
>> not use the "install-sh" script for installing executables but instead call the
>> detected BSD compatible 'install' binary directly with hardcoded '-s' parameter.
>> This results in a build failure when the host 'strip' is invoked on binaries
>> compiled for a different arch. The 'install-without-strip' script removes the
>> '-s' parameter and execs the 'install' binary in PATH to solve this problem.
>> These autotools packages can then be build under Buildroot by specifying
>> <package>_CONF_ENV = INSTALL=support/scripts/install-without-strip
>
> Could you not just set:
>    YP_TOOLS_AUTORECONF = YES
>    YPBIND_MT_AUTORECONF = YES
>
> to force re-generation of the autostuff?

That's exactly what I do, but the problem is that the Makefile.in's have 
the -s parameter hardcoded. This is an old and well-known issue that has a 
patch for each of these packages in Yocto.

> (Note: it will need to depend on host-gettext, since it wants to run
> autotopint)

I will study that again. I had thought that by configuring --without-nls I 
could avoid the gettext dependency. Maybe I didn't look carefully enough.

Many thanks for you input.

  - yba (Jonathan)


> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  support/scripts/install-without-strip |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100755 support/scripts/install-without-strip
>>
>> diff --git a/support/scripts/install-without-strip b/support/scripts/install-without-strip
>> new file mode 100755
>> index 0000000..f167c28
>> --- /dev/null
>> +++ b/support/scripts/install-without-strip
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh -e
>> +# Needed for autotools packages with hardcoded "install -s"
>> +
>> +INSTALL=$(which install)
>> +if [ -x "${INSTALL}" ]
>> +then
>> +	exec ${INSTALL} $(echo ${@} | sed 's/-s//g')
>> +fi
>> +
>> +echo "error: $0 needs an executable \"install\" in PATH"
>> +exit 1
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
