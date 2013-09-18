From: Greg Beresford <greg.beresford@zbdsolutions.com>
Date: Wed, 18 Sep 2013 10:32:50 +0100
Subject: [Buildroot] [PATCH v2] Add support for eglibc-2.17 multiarch
 layout, from Linaro 2013.07+
In-Reply-To: <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
References: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com><5237F574.9070700@mind.be><1379411093-37240-1-git-send-email-greg.beresford@zbdsolutions.com>
 <CA+-urNTYe7NF43KmEQDYVZBsqvgC0w+F7VtEafRUQVxhzO+CNA@mail.gmail.com>
Message-ID: <BF980CD5635D994FA25831A4A9C113BF1D7553BBAE@THHS2E12BE9X.hostedservice2.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank

> -----Original Message-----
> From: Frank Hunleth [mailto:fhunleth at troodon-software.com]
> Sent: 17 September 2013 18:01
> To: Greg Beresford
> Cc: buildroot; Henry Luis
> Subject: Re: [Buildroot] [PATCH v2] Add support for eglibc-2.17 multiarch
> layout, from Linaro 2013.07+
>
> Hi Greg,
>
> On Tue, Sep 17, 2013 at 5:44 AM, Greg Beresford
> <greg.beresford@zbdsolutions.com> wrote:
> > From: Henry Luis <henry@echelon.com>
> >
> > Arch-specific libraries, including libc.so.6, are expected to be in a
> > subdirectory of /lib (e.g. /lib/arm-linux-gnueabihf). This patch
> > changes copy_toolchain_lib_root() in helper.mk to preserve the
> > toolchain sysroot's lib directory structure, except for SUPPORT_LIB_DIR
> > which are still copied directly under DESTDIR.
> >
> > Signed-off-by: Greg Beresford <greg.beresford@zbdsolutions.com>
> > ---
>
> Thanks for posting the patch. I've been trying it out, but I think
> that I'm running into a bigger problem of how the shared library
> search path works now. I.e. /usr/lib is not searched by default
> anymore even though that's where many buildroot packages install their
> libraries.
>
> Here's the new search path:
>
> /lib/arm-linux-gnueabihf/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/neon/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/v7l/
> /usr/lib/arm-linux-gnueabihf/tls/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/neon/
> /usr/lib/arm-linux-gnueabihf/tls/vfp/
> /usr/lib/arm-linux-gnueabihf/tls/
> /usr/lib/arm-linux-gnueabihf/v7l/neon/vfp/
> /usr/lib/arm-linux-gnueabihf/v7l/neon/
> /usr/lib/arm-linux-gnueabihf/v7l/vfp/
> /usr/lib/arm-linux-gnueabihf/v7l/
> /usr/lib/arm-linux-gnueabihf/neon/vfp/
>
> I can think of a few hacks to get around this, but is there a right
> way that I should be configuring buildroot to deal with this
> multiarch/multilib toolchain feature?
>

I've investigated a little more and found that the only reason my setup works is because one of my packages is running ldconfig in my target directory, so the dynamic linker is finding my libraries correctly because they're all listed in /etc/ld.so.cache.

If we're not going to make use of the multi-abi feature of the recent linaro toolchains we should probably have a symlink-based solution as Thomas has suggested.

Regards
Greg


Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. ZBD Displays accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. ZBD Displays Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine Road, Malvern,  Worcestershire, WR14 3SZ, UK

______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
For more information please visit http://www.symanteccloud.com
______________________________________________________________________
