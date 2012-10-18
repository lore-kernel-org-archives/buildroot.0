From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 18 Oct 2012 10:39:54 +0100
Subject: [Buildroot] [PATCH] lcdapi: new package
In-Reply-To: <507F111F.1070107@mind.be>
References: <1350482898-5980-1-git-send-email-spdawson@gmail.com>
 <507F111F.1070107@mind.be>
Message-ID: <CAHt8ZCN5eJbN0e+H1jaDa_nUsSa3WtJPhnaMtjzEsuo-1rPJ_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout. Thanks for taking the time to review this.

On 17 October 2012 21:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Making it inline sounds more appropriate.

Okay; will do so.

>  BTW, did you upstream the patches?

Unfortunately, the upstream project is no longer being actively
maintained; I have attempted to contact the author, but have had no
response.

I have actually started work on a fork of the project at
https://github.com/spdawson/lcdapi; but I thought it best to use the
original source for the Buildroot package, at least in the first
instance.

>> +LCDAPI_DEPENDENCIES = host-lcdapi
>
>
>  Why is this needed?  Or rather: I can build without this.
> If it is not needed, the whole host-lcdapi can be removed BTW.

You're quite right: the host dependency is not required. This was
committed in error; I was using the dependency to trigger a host build
of the package during testing. I will remove the dependency.

>> +LCDAPI_MAKE_OPT = \
>> +       $(TARGET_CONFIGURE_OPTS) \
>> +       LD="$(TARGET_CXX)" \
>> +       LDFLAGS="$(TARGET_LDFLAGS) -shared"
>
>
>  It would make sense to also add CC="$(TARGET_CXX)" (although not strictly
> necessary, because gcc recognizes the .cpp extension).

Okay; will do.

>  More importantly, the CFLAGS overrides the CFLAGS of lcdapi's
> Makefile, and that contains the all-important -fPIC.  I wonder
> how you got it built without that...  So either:
>
> - Set CFLAGS to "$(TARGET_CFLAGS) -fPIC"
> - Patch the Makefile to append to CFLAGS
> - Set CC to "$(TARGET_CXX) $(TARGET_CFLAGS)" and leave CFLAGS alone

Okay, will do.

>  Finally, it would make sense to call it LCDAPI_MAKE_OPTS,
> similar to TARGET_CONFIGURE_OPTS.

Okay, will do.

>  We would typically use
>         $(INSTALL) -m 0755 -D $(@D)/lib/liblcdapi.so $(1)/usr/lib
> (which does the mkdir and the install in one shot).

Okay, will do.

>  But wouldn't it be cleaner to add (and upstream) an 'install' target
> to the Makefile?

Yes, okay.

Simon.
