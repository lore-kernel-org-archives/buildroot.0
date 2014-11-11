From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 22:23:56 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: security bump to version
	1.2-rc1
In-Reply-To: <54627093.3050103@zacarias.com.ar> (Gustavo Zacarias's message of
 "Tue, 11 Nov 2014 17:24:51 -0300")
References: <1415734946-3492-1-git-send-email-gustavo@zacarias.com.ar>
 <87bnodo5p9.fsf@dell.be.48ers.dk> <54627093.3050103@zacarias.com.ar>
Message-ID: <87d28tmnwz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > On 11/11/2014 05:14 PM, Peter Korsgaard wrote:
 >> > +	# libnl has issues when linking statically
 >> > +	# they need fixing in libnl itself
 >> > +	select BR2_PACKAGE_LIBNL if !BR2_PREFER_STATIC_LIB
 >> 
 >> So libnl isn't really a hard dependency? Why do we then force it for
 >> !static?

 > This one is torny i must confess :)
 > libnl isn't a hard dep, but it's recommended for functionality.
 > And also it's brought in by iw anyway, so generally it will always be
 > available, i'm just accounting for it in proper terms (documenting the
 > brokeness for static).
 > It wasn't used in the previous release directly.

Ok. It would be good with a short notice about it in the commit message.

 >> > -ifeq ($(BR2_PACKAGE_SQLITE),y)
 >> > -	AIRCRACK_NG_MAKE_OPTS = sqlite=true
 >> > -	AIRCRACK_NG_MAKE_OPTS += \
 >> > -		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -lpthread)"
 >> > +# Account for libz for openssl, and libpthread in static
 >> > +AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
 >> > +	$(if $(BR2_PREFER_STATIC_LIB),-lpthread)
 >> 
 >> Shouldn't the -lz part also be inside the PREFER_STATIC_LIB conditional?
 >> Or does aircrach-ng use zlib directly? (if so, it should select it and
 >> add it to _DEPENDENCIES)

 > This is from the previous version, so i don't have a hand in it other
 > than adding the comment.
 > Looking at the code it's used directly by wesside-ng so we have a
 > missing zlib select (no problem seen because openssl pulls it in).
 > And it's not accounted for in any docs.
 > I'll stick the select in.

Ok, thanks.

 > Frankly getting aircrack-ng to get to build on static cleanly was very
 > messy (see patches, hacks) and work still needs to be done in libnl-land.
 > I prioritized the security bump over static hence dropped the libnl
 > feature in the process, it was a compromise until i sort the libnl bits out.
 > Regards.

I don't think we need to spend a lot of effort on building something
like this statically if upstream doesn't really support it. I wouldn't
have any problems with making it depend on !STATIC.

-- 
Bye, Peter Korsgaard
