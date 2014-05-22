From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 May 2014 23:52:29 +0200
Subject: [Buildroot] [PATCH] system/timezone: check localtime exists
In-Reply-To: <1400791259-2017-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 22 May 2014 22:40:59 +0200")
References: <1400791259-2017-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87bnupcwgy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > When installing a localtime, check it is a valid timezone.

 > Reported-by: Sagaert Johan <sagaert.johan@skynet.be>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/tz/tz.mk         | 5 +++++
 >  package/tzdata/tzdata.mk | 5 +++++
 >  2 files changed, 10 insertions(+)

 > diff --git a/package/tz/tz.mk b/package/tz/tz.mk
 > index 865ba3b..3198db7 100644
 > --- a/package/tz/tz.mk
 > +++ b/package/tz/tz.mk
 > @@ -27,6 +27,11 @@ define TZ_INSTALL_TARGET_CMDS
 >  	mkdir -p $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 >  	cp -a $(@D)/output/* $(TARGET_DIR)/usr/share/zoneinfo/uclibc
 >  	if [ -n "$(TZ_LOCALTIME)" ]; then                               \
 > +	    if [ ! -f $(TARGET_DIR)/usr/share/zoneinfo/uclibc/$(TZDATA_LOCALTIME) ]; then \
 > +	        printf "'%s' is not a valid timezone\n"                 \
 > +	               "$(TZDATA_LOCALTIME)";                           \

I have extended this to make it a bit more clear what the user should
change:

-               printf "'%s' is not a valid timezone\n"                 \
+               printf "Error: '%s' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting\n" \

And committed, thanks.

-- 
Bye, Peter Korsgaard
