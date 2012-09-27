From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Sep 2012 19:30:42 +0300
Subject: [Buildroot] How to enable sighold and sigrelse in uClibc ?
In-Reply-To: <5064763D.8010203@petroprogram.com>
References: <5064763D.8010203@petroprogram.com>
Message-ID: <50647F32.2010209@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I finally found it.

Also "BSD obsolete signal functions" (UCLIBC_HAS_OBSOLETE_BSD_SIGNAL) under
"Advanced Library Settings" must be enabled to make this work.

And looking into lipthread/nptl/sem_open.c I revealed that __fxstat64() is
basically equivalent to fstat64() if Largefile support is enabled in uClibc
and otherwise just fstat().

So I can hack that into my application or maybe directly into sys/stat.h

Case solved :)

27.9.2012 18:52, Stefan Fr?berg kirjoitti:
> Hello everyone
>
> I need to enable sighold() and sigrelse() functions in uClibc (version
> 0.9.33 using NPTL)
> and I have enabled the corresponding UCLIBC_SUSV4_LEGACY (Enable SuSv4
> Legacy or obsolescent functions)
> option in .config.
>
> However, when trying to use those functions in application they are
> undeclared and
> indeed, when checking from uClibc source directory libc/signal I see
> that they are not even compiled
> (no sighold.o and sigrelse.o).
>
> So what else is needed to make sighold.o and sigrelse.o ?
>
> Best regards
> Stefan
>
> P.S:  
> Is there __fxstat64() function somewhere in uClibc ?
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
