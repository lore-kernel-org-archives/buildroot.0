From: Anand Sivaram <aspnair@gmail.com>
Date: Sat, 12 Nov 2016 13:06:11 +0530
Subject: [Buildroot] Question about Compilation Flags
In-Reply-To: <20161111150343.74bfc8b1@free-electrons.com>
References: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
 <20161111150343.74bfc8b1@free-electrons.com>
Message-ID: <CAHBw83d+5FzcxpBxmeDM=-uUyMyXLw8pDeywoYrF91pV8wR7ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thank you very much for the reply.  I think BR2_TARGET_OPTIMIZATION and
BR2_TARGET_LDFLAGS are
better solutions than what I did in config/Makefile.in

I will try lighttpd.mk changes as you suggested.

These are the numbers I found without changing lighttpd in a special way.

du -ks output/target/ (default buildroot for mips without
function/data/gc-section)
26188   output/target/
du -ks output/target/ (with function/data/gc-sections)
25012   output/target/

That gives a saving of 1176 KB then.

Thanks and Best Regards

Anand





On 11 November 2016 at 19:33, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 11 Nov 2016 14:49:42 +0530, Anand Sivaram wrote:
>
> > File: package/Makefile.in
> > TARGET_CFLAGS += -ffunction-sections -fdata-sections
> > TARGET_LDFLAGS += -Wl,--gc-sections
>
> You can also pass these through "menuconfig", using
> BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS.
>
> > Everything went fine, I saved around 1MB.  But lighttpd with mod-fcgi
> > enabled got SIGSEGV with the above change.
> >
> > I have a question?  Could I disable these flags *only* for lighttpd, that
> > means using the above flags in all packages except lighttpd.
>
> Yes, you can adapt lighttpd.mk for that. You need to do something like
> this:
>
> LIGHTTPD_CONF_ENV = \
>         CFLAGS=$(filter-out -ffunction-sections -fdata-section,$(TARGET_CFLAGS))
> \
>         LDFLAGS=$(filter-out -Wl,--gc-sections,$(TARGET_LDFLAGS))
>
> BTW, how much space did you save by using those options? What was the
> filesystem size before adding those options and after?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161112/ddb43102/attachment.html>
