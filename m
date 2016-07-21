From: Romain NAOUR <romain.naour@smile.fr>
Date: Thu, 21 Jul 2016 13:28:22 +0200
Subject: [Buildroot]
 =?utf-8?q?=5BExternal=5D_Re=3A_Issues_with_cross-comp?=
 =?utf-8?q?iling_from_x86=5F64_to_a_different_x86=5F64?=
In-Reply-To: <20160721092222.07ad1f9b@free-electrons.com>
References: <34C69F44FE4EA4498813EAECDBF40C1623A46E39@GUSALE0B.na.utcmail.com>
 <20160720000154.4132543d@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A47405@GUSALE0B.na.utcmail.com>
 <20160720220258.46331635@free-electrons.com>
 <34C69F44FE4EA4498813EAECDBF40C1623A483E0@GUSALE0B.na.utcmail.com>
 <20160721092222.07ad1f9b@free-electrons.com>
Message-ID: <7df6b0fbaba9ff12fc4d1b36fb7d8fea@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christopher, Thomas, All,

Le 2016-07-21 09:22, Thomas Petazzoni a ?crit :

> Hello,
> 
> On Wed, 20 Jul 2016 23:12:13 +0000, Arguin, Christopher P UTAS
> wrote:
> 
>> I just stumbled into the answer to that. I pulled buildroot from git 
>> so
>> I could start making changes, and did a 'mostly-default' build first.
>> Much to my surprise, the ccdv executable didn't get built. Switching
>> from the default uclibc target to glibc target changed that. 
>> Basically,
>> the configure script in ncftp tries it's hardest to build ccdv, but 
>> if
>> it doesn't generate a working executable it gives up on it. In my 
>> case
>> the executable worked well enough if you didn't pass any arguments, 
>> so
>> it passed the configure test... but then died when you try to 
>> actually
>> use it. With uclibc as the target, ccdv may not have been 
>> successfully
>> built because the C library was mismatched.
> 
> Aah, makes sense.

Good catch!

> 
>> Now that I know what to look for, I see that you predicted this a few
>> years ago. From
>> http://lists.busybox.net/pipermail/buildroot/2014-February/089526.html:
>> [1]
>> 
>>> That being said, I agree that the cross-compilation test is stupid:
>>> it builds a program, and tries to run it. If it runs, then the
>>> configure script concludes that we're doing native compilation, if 
>>> it
>>> doesn't run, we're doing cross-compilation. Except that of course
>>> when you're building x86 or x86-64 on x86-64 and both the target and
>>> host use glibc, the program may very well run.
> 
> Wow, I did some useful predictions two years ago that turn out to be
> true today? I wish I had instead predicted the winning numbers at the
> lottery. I would then have been able to work full time on Buildroot...
> or just enjoy Pi&n> das on the beach. That addressed the detection of
> cross-compilation in

Actually I didn't noticed ccdv tool and that it was used and may cause 
some
issue for cross-compiling. As you can see the configure script bundled 
with
the archive have a similar issue, that is why we have to regenerate it 
:-/

>> ncftp, but not the use of the host-tool. I managed to have just the
>> right setup
> ty obscure corner case.
> 
> Indeed. Will you submit a patch for --disable-ccdv ?

I reproduced the issue here and indeed --disable-ccdv fix the build.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
