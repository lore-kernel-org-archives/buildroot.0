From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 08 Feb 2013 21:26:22 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <20130208163229.553918e3@skate>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
 <20130208163229.553918e3@skate>
Message-ID: <51155F6E.5090806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 16:32, Thomas Petazzoni wrote:
> Dear Laurent Cans,
>
> Thanks, this looks pretty good; A few comments below.

  Yep, don't be discouraged by the large amount of feedback :-)

> On Fri,  8 Feb 2013 17:16:29 +0100, Laurent Cans wrote:
>> Aircrack-ng is a set of tools for auditing wireless security.
>>
>> Although the last version is 1.1, I choose to package last svn version due to a fixed bug which fix a failed compilation.

  It would be good to repeat this comment in the .mk file. That helps to 
see if a certain packaged upstream version is in fact more recent than 
what is already there.

[snip]
>> +ifeq($(BR2_PACKAGE_SQLITE),y)
>> +      AIRCRACK_NG_OPTS = sqlite=true

  I prefer AIRCRACK_NG_MAKE_OPTS.

>> +      AIRCRACK_NG_DEPENDENCIES += sqlite
>> +endif

  I would add an else branch that explicitly sets sqlite=false, to make 
sure it doesn't leak in through the environment.

>
> The src/Makefile contains:
>
> ifeq ($(subst TRUE,true,$(filter TRUE true,$(sqlite) $(SQLITE))),true)
> 	LIBSQL		= -L/usr/local/lib -lsqlite3
> else
> 	LIBSQL		=
> endif
>
> This -L/usr/local/lib isn't really nice since this is not where sqlite
> will be installed, and it may cause issues when cross-compiling.

  The solution is simple:

AIRCRACK_NG_MAKE_OPTS += LIBSQL="-lsqlite3"

(no -L is needed because libsqlite3.a is in the default library search path).

>
>> +
>> +define AIRCRACK_NG_BUILD_CMDS
>> +      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) $(AIRCRACK_NG_OPTS) all
>> +endef
>
> Use $(TARGET_CONFIGURE_OPTS) :
>
> 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(AIRCRACK_NG_OPTS) all

  If it works, I prefer to put the TARGET_CONFIGURE_OPTS in the 
environment instead:

$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all

That gives the Makefile the possibility to append to CFLAGS and LDFLAGS, 
if necessary. However, some Makefiles unconditionally set CFLAGS or 
LDFLAGS (or even CC), in that case passing through the environment 
doesn't work.


  Regards,
  Arnout


> And ditto for the other commands.
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
