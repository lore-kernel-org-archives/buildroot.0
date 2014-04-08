From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 23:47:29 +0200
Subject: [Buildroot] [PATCH 2/6] system: add selection of a default
	localtime
In-Reply-To: <a4e40e88137b1d959e165e9720fcbef7286b2b06.1396900553.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 7 Apr 2014 21:58:04 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <a4e40e88137b1d959e165e9720fcbef7286b2b06.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <87txa3a3ym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > [alexandre.belloni: move from "tzdata" to "system configuration"]
 > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 > [yann.morin.1998 at free.fr: move into the BR2_TARGET_TZ_INFO conditionnal block]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/tzdata/tzdata.mk |  7 ++++++-
 >  system/Config.in         | 14 ++++++++++++++
 >  2 files changed, 20 insertions(+), 1 deletion(-)

 > diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
 > index 5900473..762a31e 100644
 > --- a/package/tzdata/tzdata.mk
 > +++ b/package/tzdata/tzdata.mk
 > @@ -39,8 +39,13 @@ define TZDATA_INSTALL_TARGET_CMDS
 >  	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 >  	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 >  	for zone in posix/*; do                 \
 > -	    ln -sfn "$${zone}" "$${zone##*/}";    \
 > +	    ln -sfn "$${zone}" "$${zone##*/}";  \
 >  	done
 > +	if [ -n "$(BR2_TARGET_LOCALTIME)" ]; then                           \
 > +	    cd $(TARGET_DIR)/etc;                                           \
 > +	    ln -sf ../usr/share/zoneinfo/$(BR2_TARGET_LOCALTIME) localtime; \
 > +	    echo "$(BR2_TARGET_LOCALTIME)" >timezone;                       \

BR2_TARGET_LOCALTIME is a string kconfig, so it already has quotes
around it, and the extra quotes will cancel eachother out.

We should imho use qstrip and assign it to a TZDATA_LOCALTIME variable
and use that similar to how it is done for TZDATA_ZONELIST.

Committed with that fixed, thanks.

This also doesn't give very clear error messages if the user misspelled
the localtime. Perhaps we should error out with something more sensible?

-- 
Bye, Peter Korsgaard
