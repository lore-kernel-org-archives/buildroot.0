From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Fri, 16 Jan 2009 10:27:31 +0100
Subject: [Buildroot] libglibg2 fails
In-Reply-To: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
References: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1AF338E8A1@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The reason for this is that you have built libiconv and installed the headers.  
However you have not passed the --with-libiconv=gnu to the configure of libglib2.

Are you using an external toolchain?
Are you setting BR2_ENABLE_LOCALE?

Because with an external toolchain you can't set BR2_ENABLE_LOCALE currently (I have hacked a local version for now).  And if BR2_ENABLE_LOCALE is not set then libiconv gets built and your problem arises.

What you could do is update libglib2 to say, if BR2_ENABLE_LOCALE packages+=libiconv and 
GLIB2_CONFIG_OPT+= --with-libiconv=gnu

And that should solve it

Hope this helps
Daniel Laird

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Ulf Samuelsson
Sent: 2009 Jan 16 07:36
To: Buildroot
Subject: [Buildroot] libglibg2 fails

When building libglib2 for both AVR32 and ARM I get the following:

...
gconvert.c:55:2: error: 
   #error GNU libiconv not in use but included iconv.h is from libiconv
make[5]: *** [gconvert.lo] Fel 1
...
make[1]: Leaving directory `<buildroot>/build_avr32/libglib2-2.19.4'
...


Is there anyone capable of building libglib2?

BR
Ulf Samuelsson






_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
