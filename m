From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Apr 2014 23:50:51 +0200
Subject: [Buildroot] [PATCH 2/6] system: add selection of a default
	localtime
In-Reply-To: <87txa3a3ym.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 08 Apr 2014 23:47:29 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <a4e40e88137b1d959e165e9720fcbef7286b2b06.1396900553.git.yann.morin.1998@free.fr>
 <87txa3a3ym.fsf@dell.be.48ers.dk>
Message-ID: <87ppkra3t0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 >> --- a/package/tzdata/tzdata.mk
 >> +++ b/package/tzdata/tzdata.mk
 >> @@ -39,8 +39,13 @@ define TZDATA_INSTALL_TARGET_CMDS
 >> cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
 >> cd $(TARGET_DIR)/usr/share/zoneinfo;    \
 >> for zone in posix/*; do                 \
 >> -	    ln -sfn "$${zone}" "$${zone##*/}";    \
 >> +	    ln -sfn "$${zone}" "$${zone##*/}";  \
 >> done
 >> +	if [ -n "$(BR2_TARGET_LOCALTIME)" ]; then                           \
 >> +	    cd $(TARGET_DIR)/etc;                                           \
 >> +	    ln -sf ../usr/share/zoneinfo/$(BR2_TARGET_LOCALTIME) localtime; \
 >> +	    echo "$(BR2_TARGET_LOCALTIME)" >timezone;                       \

 > BR2_TARGET_LOCALTIME is a string kconfig, so it already has quotes
 > around it, and the extra quotes will cancel eachother out.

 > We should imho use qstrip and assign it to a TZDATA_LOCALTIME variable
 > and use that similar to how it is done for TZDATA_ZONELIST.

 > Committed with that fixed, thanks.

 > This also doesn't give very clear error messages if the user misspelled
 > the localtime. Perhaps we should error out with something more sensible?

Hmm, and it doesn't actually work if you use something like
Europe/Copenhagen as those are under /usr/share/zoneinfo/posix :/

-- 
Bye, Peter Korsgaard
