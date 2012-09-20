From: =?utf-8?Q?Thierry_Bultel?= <thierry.bultel@basystemes.fr>
Date: Thu, 20 Sep 2012 13:38:55 +0200
Subject: [Buildroot] thread debugging with target gdb
In-Reply-To: <505A397B.80404@mind.be>
References: <505A397B.80404@mind.be>
Message-ID: <zarafa.505b004f.74f2.799ed96c0a00510d@jacal.basystemes.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I finnally solved my problem, and threads debugging now works fine.

The fix consists in 2 things

1) adding libpthreads_db.so on target
Just like you said, this can be achieved in croostools-ng.mk like this:

ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
CTNG_LIBS_LIB += libthread_db.so
endif

But I would also add:

ifeq ($(BR2_PACKAGE_GDB),y)
CTNG_LIBS_LIB += libthread_db.so
endif

since full gdb definitively needs it. Whatever ORing mecanism should maybe be done, not to add the lib twice,
as options are not exclusive.

2) Not stripping libpthread.so

In the top Makefile:

ifeq ($(BR2_PACKAGE_GDB),y)
BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
endif

Thanks for your help, is there a chance that those fixes get integrated in the mainline ?

Cheers 
Thierry



-----Original message-----
From: Arnout Vandecappelle?<arnout@mind.be>
Sent: Wed 19-Sep-2012 23:30
To: Thierry Bultel <thierry.bultel@basystemes.fr>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] thread debugging with target gdb


On 09/19/12 23:27, Thierry Bultel wrote:
>
> Trying gdbserver is my next step, but I feel pessimistic / my conclusions above.

  Most BR developers use gdbserver only, so that's better supported than full gdb on
the target.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be <http://www.mind.be> 
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle <http://www.linkedin.com/in/arnoutvandecappelle> 
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F ifeq ($(BR2_PACKAGE_GDB),y)
> $(warning "THIERRY")
> BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
> endif
 ifeq ($(BR2_PACKAGE_GDB),y)
> $(warning "THIERRY")
> BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
> endif
> ifeq ($(BR2_PACKAGE_GDB),y)
> $(warning "THIERRY")
> BR2_STRIP_EXCLUDE_FILES += libpthread*.so*
> endif


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120920/bb972315/attachment.html>
