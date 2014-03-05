From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 5 Mar 2014 15:37:09 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAM+bi4t8Toj7ERf3DR=854xhwAS7-Ubtrr2xTGsfKjk5kRoZHw@mail.gmail.com>
References: <20140305073008.3DAFE101B04@stock.ovh.net>
 <20140305112729.47a9a631@skate>
 <CAM+bi4t8Toj7ERf3DR=854xhwAS7-Ubtrr2xTGsfKjk5kRoZHw@mail.gmail.com>
Message-ID: <CAM+bi4s-yu6kSZgRAjRene3h-C5cVuWGUJYnYNzRxYh7T7910w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all


2014-03-05 11:27 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
>
> /home/test/test/1/output/host/usr/bin/sh-linux-gnu-gcc  -shared
>> -Wl,-soname,libxmlrpc_xmltok.so.3  xmltok.osh xmlrole.osh  -o
>> libxmlrpc_xmltok.so.3.25
>> xmltok.osh: file not recognized: File truncated
>> collect2: error: ld returned 1 exit status
>>
>
I've discovered there is a race condition on libxmlrpc Makefile set.
When I sent this patch I tested it on a single core machine, but when
running on a multicore machine, buildroot has set my jobs level to 4, the
same as in the build failure above.

So, when invoking make -j 1, libxmlrpc builds fine, but with -j 4 it fails.

Upstream tries to support parallel builds, but it still fails due to this
reason.

 I face two options here: should I repair upstream's set of Makefile's or
should I patch buildroots' libxmlrpc.mk in order to force linear build? Is
this even possible, or a good practice, to change BR2_JLEVEL inside
libxmlrpc.mk to avoid this?

Anyway, I think I'm going to try and fix libxmlrpc makefiles, for it seems
to be, although not the fastest approach, the best way for all users of
libxmlrpc, but I am open to modify buildroots' libxmlrpc.mk in order to fix
this by changing JLEVEL as soon as possible.

Regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140305/727ed019/attachment.html>
