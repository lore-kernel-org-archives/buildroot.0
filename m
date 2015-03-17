From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 15:08:12 +0100
Subject: [Buildroot] [PATCHv2] toolchain: fix installing gconv libs with
 multi-arch toolchain
In-Reply-To: <20150308224831.246ff970@free-electrons.com>
References: <1424643784-23210-1-git-send-email-yann.morin.1998@free.fr>
 <20150308224831.246ff970@free-electrons.com>
Message-ID: <20150317140812.GC4729@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-08 22:48 +0100, Thomas Petazzoni spake thusly:
> On Sun, 22 Feb 2015 23:23:04 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> > index 3f9900b..51294c3 100644
> > --- a/toolchain/toolchain.mk
> > +++ b/toolchain/toolchain.mk
> > @@ -17,28 +17,39 @@ endif
> >  ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
> >  GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
> >  define COPY_GCONV_LIBS
> > -	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
> > -		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
> > -				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
> > -		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
> > +	$(Q)machine=$$($(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -dumpmachine); \
> 
> Unless I'm mistaken, this piece of code copying gconv libraries is used
> for both the internal and external toolchain backends, no? If that's
> the case, then using TOOLCHAIN_EXTERNAL_* here seems wrong, no?

Absolutely.

In the meantime, I found out that I could re-use an existing variable,
TOOLCHAIN_EXTERNAL_PREFIX which contains exactly what I expected
"gcc -dumpmachine" to return. So I've switched to using that, and it
"fixes" the use-case for internal toolchains as well as a side effect.

I'll resubmit later today...

> And indeed, the resulting code is not really nice. For sure not worse
> than the average toolchain-external.mk code :-/

Meh... :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
