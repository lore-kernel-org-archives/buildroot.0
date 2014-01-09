From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2014 23:57:42 +0100
Subject: [Buildroot] [PATCH 3/5] package/tzdata: install a default
 localtime
In-Reply-To: <52CED8B3.5090800@mind.be>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
 <52CED8B3.5090800@mind.be>
Message-ID: <20140109225741.GG3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-09 18:13 +0100, Arnout Vandecappelle spake thusly:
> On 07/01/14 23:46, Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Add an option to install a default localtime.
[--SNIP--]
> >+config BR2_PACKAGE_TZDATA_LOCALTIME
> >+	string "default local time"
> >+	help
> >+	  The time zone to install as the default local time, expressed as a
> >+	  tzdata location, such as:
> >+	    GMT, Europe/Paris, America/New_York, Pacific/Wallis...
> 
>  I hope this will not confuse users to think that they can specify multiple
> values separated by a comma...

Now you point me to it, indeed, that may sound confusing.

OTOH, the sentence always use the singular 'a timezone", or "the
timezone", so hopefully this is not so confusing... After all, it does
not make sense to say that the current timezone is a multi-timezone,
doesn't it?

> >diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> >index 1cb5b3f..74263e1 100644
> >--- a/package/tzdata/tzdata.mk
> >+++ b/package/tzdata/tzdata.mk
> >@@ -39,8 +39,14 @@ define TZDATA_INSTALL_TARGET_CMDS
> >  	cp -a $(@D)/_output/* $(TARGET_DIR)/usr/share/zoneinfo
> >  	cd $(TARGET_DIR)/usr/share/zoneinfo;    \
> >  	for zone in posix/*; do                 \
> >-	    ln -sfn "$${zone}" "$${zone##*/}";    \
> >+	    ln -sfn "$${zone}" "$${zone##*/}";  \
> >  	done
> >+	if [ -n "$(BR2_PACKAGE_TZDATA_LOCALTIME)" ]; then                   \
> 
>  Ick, this looks ugly... If it is unset, make will evaluate it to
> 
> 	if [ -n """" ]; then ...
> 
> which is indeed an empty string, but not so nice... IOW, it's missing a
> qstrip.

Doh, I always forget about this one. Sigh... Thanks for pointing this
out.

>  Also, instead of a shell condition I'd prefer a make condition, but that's
> probably a matter of taste.

I also pundered this, but it looke really ugly to me. Besides, we can't
have ifeq-blocks in a define-block, that does not work (IIRC).

> >+	    cd $(TARGET_DIR)/etc;                                           \
> >+	    ln -sf ../usr/share/zoneinfo/$(BR2_PACKAGE_TZDATA_LOCALTIME)    \
> 
>  Same here. But also quotes should be added in case the user put something
> stupid there.

Ditto, I just forget about qtrip everytime.

> >+	           localtime;                                               \
> >+	    echo "$(BR2_PACKAGE_TZDATA_LOCALTIME)" >timezone;               \
> 
>  Same here. The quotes are not actually quoting anything now...

Ditto.

I'll send a fix-patch soon.
Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
