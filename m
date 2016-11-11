From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:03:43 +0100
Subject: [Buildroot] Question about Compilation Flags
In-Reply-To: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
References: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
Message-ID: <20161111150343.74bfc8b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 14:49:42 +0530, Anand Sivaram wrote:

> File: package/Makefile.in
> TARGET_CFLAGS += -ffunction-sections -fdata-sections
> TARGET_LDFLAGS += -Wl,--gc-sections

You can also pass these through "menuconfig", using
BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS.

> Everything went fine, I saved around 1MB.  But lighttpd with mod-fcgi
> enabled got SIGSEGV with the above change.
> 
> I have a question?  Could I disable these flags *only* for lighttpd, that
> means using the above flags in all packages except lighttpd.

Yes, you can adapt lighttpd.mk for that. You need to do something like
this:

LIGHTTPD_CONF_ENV = \
	CFLAGS=$(filter-out -ffunction-sections -fdata-section,$(TARGET_CFLAGS)) \
	LDFLAGS=$(filter-out -Wl,--gc-sections,$(TARGET_LDFLAGS))

BTW, how much space did you save by using those options? What was the
filesystem size before adding those options and after?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
