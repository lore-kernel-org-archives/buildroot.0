From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 5 Jul 2017 10:19:01 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer> <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
Message-ID: <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 July 2017 at 08:31, Markus Mayer <markus.mayer@broadcom.com> wrote:

> I got the error, "Your kernel version is too old and does not have the
> tmon tool.", because it tried building linux-tool-tmon before
> extracting the kernel. Running make a second time succeed, because it
> extracted the kernel right away. This was an Ubuntu box running 16.04.
>
> I will try again to see if I can still reproduce it.
>
> Also, I did figure out why it is sorted differently by "ls". The
> locale is set to en_CA.UTF-8. I thought I had reset the locale.
> Apparently not.
>
> $ echo $LANG
> en_CA.UTF-8
>
> $ ls -l
> total 32
> -rw-rw-r-- 1 mmayer mmayer 2965 Jul  4 11:13 Config.in
> -rw-rw-r-- 1 mmayer mmayer 1084 May  9 10:46 linux-tool-cpupower.mk
> -rw-rw-r-- 1 mmayer mmayer  721 May  9 10:46 linux-tool-gpio.mk
> -rw-rw-r-- 1 mmayer mmayer  730 May  9 10:46 linux-tool-iio.mk
> -rw-rw-r-- 1 mmayer mmayer 4015 May  9 10:46 linux-tool-perf.mk
> -rw-rw-r-- 1 mmayer mmayer 1469 May  9 10:46 linux-tool-selftests.mk
> -rw-rw-r-- 1 mmayer mmayer 1861 Jul  4 11:13 linux-tools.mk
> -rw-rw-r-- 1 mmayer mmayer  832 Jul  4 11:13 linux-tool-tmon.mk
>
> $ LANG=C ls -l
> total 32
> -rw-rw-r-- 1 mmayer mmayer 2965 Jul  4 11:13 Config.in
> -rw-rw-r-- 1 mmayer mmayer 1084 May  9 10:46 linux-tool-cpupower.mk
> -rw-rw-r-- 1 mmayer mmayer  721 May  9 10:46 linux-tool-gpio.mk
> -rw-rw-r-- 1 mmayer mmayer  730 May  9 10:46 linux-tool-iio.mk
> -rw-rw-r-- 1 mmayer mmayer 4015 May  9 10:46 linux-tool-perf.mk
> -rw-rw-r-- 1 mmayer mmayer 1469 May  9 10:46 linux-tool-selftests.mk
> -rw-rw-r-- 1 mmayer mmayer  832 Jul  4 11:13 linux-tool-tmon.mk
> -rw-rw-r-- 1 mmayer mmayer 1861 Jul  4 11:13 linux-tools.mk
>
> I'll experiment more with this and see what I can find out.

Looks like the build is actually succeeding for me now. Not sure what
happened originally when it bailed the way it did. My build must have
been in a weird state. My apologies for the false alarm. I
successfully built arm and arm64.

This means, we don't need patch 1/2 after all.

That said, and while I am a complete buildroot newbie, I do like the
suggestion of creating sub-directories for the tools and including the
makefiles from linux-tools.mk rather than relying on alphabetical
sorting.

Regards,
-Markus
