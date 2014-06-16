From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jun 2014 09:34:05 +0200
Subject: [Buildroot] [git commit] hdparm: prevent package makefile from
 stripping the hdparm binary
In-Reply-To: <87d2e9co61.fsf@dell.be.48ers.dk>
References: <20140611210500.36A4A9CFCA@busybox.osuosl.org>	<539E822C.5040708@mind.be>
 <87d2e9co61.fsf@dell.be.48ers.dk>
Message-ID: <539E9DED.3050107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/14 09:24, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 06/11/14 23:03, Peter Korsgaard wrote:
> 
>  >> +++ b/package/hdparm/hdparm.mk
>  >> @@ -12,7 +12,8 @@ HDPARM_LICENSE_FILES = LICENSE.TXT
>  >> define HDPARM_BUILD_CMDS
>  >> $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>  >> CFLAGS="$(TARGET_CFLAGS)" \
>  >> -		LDFLAGS="$(TARGET_LDFLAGS)"
>  >> +		LDFLAGS="$(TARGET_LDFLAGS)" \
>  >> +		STRIP=/bin/true
> 
>  >  Perhaps for consistency we should rename $(TARGET_CROSS)strip to
>  > $(TARGET_CROSS)real-strip and symlink $(TARGET_CROSS)strip to /bin/true?
> 
> Most of these packages presumably default to 'strip' and not
> '$(TARGET_CROSS)strip', so it won't help much.

 Well, at least autotools-based packages will use ${ac_tool_prefix}strip so
they'll refer to the proper strip. And for the really broken packages, we can
symlink $(HOST_DIR)/usr/bin/strip as well. Although, on second thought that may
not be such a good idea since we may want to strip host packages.


 Regards,
 Arnout

>  >  While looking at this, I also notice that in some cases we _do_ pass the real
>  > strip, e.g. in fltk, qt (but not qt5). I guess that's historical accident?
> 
> I would think so. For fltk atleast it dates back from 2008. I'll take a
> look at fixing it up, thanks.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
