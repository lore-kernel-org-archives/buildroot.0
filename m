From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Oct 2012 22:04:35 +0200
Subject: [Buildroot] [PATCH] lcdapi: new package
In-Reply-To: <CAHt8ZCN5eJbN0e+H1jaDa_nUsSa3WtJPhnaMtjzEsuo-1rPJ_g@mail.gmail.com>
References: <1350482898-5980-1-git-send-email-spdawson@gmail.com>
 <507F111F.1070107@mind.be>
 <CAHt8ZCN5eJbN0e+H1jaDa_nUsSa3WtJPhnaMtjzEsuo-1rPJ_g@mail.gmail.com>
Message-ID: <5081B253.1070503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/12 11:39, Simon Dawson wrote:
> Hi Arnout. Thanks for taking the time to review this.
>
> On 17 October 2012 21:12, Arnout Vandecappelle<arnout@mind.be>  wrote:
>>   Making it inline sounds more appropriate.
>
> Okay; will do so.
>
>>   BTW, did you upstream the patches?
>
> Unfortunately, the upstream project is no longer being actively
> maintained; I have attempted to contact the author, but have had no
> response.
>
> I have actually started work on a fork of the project at
> https://github.com/spdawson/lcdapi; but I thought it best to use the
> original source for the Buildroot package, at least in the first
> instance.

  I don't think that's necessary.  It's better if we don't have to
carry patches in buildroot!

[snip]
>>> +LCDAPI_MAKE_OPT = \
>>> +       $(TARGET_CONFIGURE_OPTS) \
>>> +       LD="$(TARGET_CXX)" \
>>> +       LDFLAGS="$(TARGET_LDFLAGS) -shared"
>>
>>
>>   It would make sense to also add CC="$(TARGET_CXX)" (although not strictly
>> necessary, because gcc recognizes the .cpp extension).
>
> Okay; will do.

  If you're anyway taking over upstream, you could really fix the Makefiles
and use CXX instead of CC!


>>   More importantly, the CFLAGS overrides the CFLAGS of lcdapi's
>> Makefile, and that contains the all-important -fPIC.  I wonder
>> how you got it built without that...  So either:
>>
>> - Set CFLAGS to "$(TARGET_CFLAGS) -fPIC"
>> - Patch the Makefile to append to CFLAGS
>> - Set CC to "$(TARGET_CXX) $(TARGET_CFLAGS)" and leave CFLAGS alone
>
> Okay, will do.

  Again, best to patch the Makefile since you can.


>>   Finally, it would make sense to call it LCDAPI_MAKE_OPTS,
>> similar to TARGET_CONFIGURE_OPTS.
>
> Okay, will do.
>
>>   We would typically use
>>          $(INSTALL) -m 0755 -D $(@D)/lib/liblcdapi.so $(1)/usr/lib
>> (which does the mkdir and the install in one shot).
>
> Okay, will do.
>
>>   But wouldn't it be cleaner to add (and upstream) an 'install' target
>> to the Makefile?
>
> Yes, okay.

  Sorry that I'm giving you more work :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
