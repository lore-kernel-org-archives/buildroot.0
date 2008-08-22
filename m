From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Fri, 22 Aug 2008 00:20:20 -0700 (PDT)
Subject: [Buildroot] Building Cairo using DirectFB
In-Reply-To: <1219336896.16845.259.camel@localhost.localdomain>
References: <1218467304.18656.19.camel@localhost.localdomain>
	<1218624948.11802.3.camel@lnx32dtp04>
	<1219336896.16845.259.camel@localhost.localdomain>
Message-ID: <19102617.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Yes that line would cause a problem (sorry)

We are working on a local version.  We tend to use overlays instead of
patches as we have found it works better when trying to see what has changed
when moving forward (especially with our CM system).  This is a left over
from that decision.
I have asked for commit access to buildroot to get as much back from our NXP
buildroot into mainline.  There are very few changes now - the main thing is
updates to packages(current and new) and that we do all our work on
DirectFB.  
This means we are very actively testing DirectFB and DirectFB-GTK so in our
tree GTK-Demo on DirectFB builds and runs whereas in mainline buildroot this
does not work for us (various issues).

Hopefully I will get SVN access and then start narrowing down the list of
differences.

In the mean time let me know if you get DirectFB etc working for you as it
does for us and am happy to help
Dan 


Ormund Williams wrote:
> 
> On Wed, 2008-08-13 at 11:55 +0100, Daniel Laird wrote:
>> The following patch add support for building DirectFB 1.0 or 1.2.X
>> It also stop auto adding packages and turns features on if people
>> have enabled them from menuconfig.
>> 
>>  Config.in   |   27 ++++++--
>>  directfb.mk |  200
>> +++++++++++++++++++++++++++++++++++++++---------------------
>>  2 files changed, 151 insertions(+), 76 deletions(-)
>> 
>> Signed-off-by: daniel.j.laird <daniel.j.laird@nxp.com>
>> 
>> diff -urN buildroot.orig/package/directfb/Config.in
>> buildroot/package/directfb/Config.in
>> --- buildroot.orig/package/directfb/Config.in	2008-08-13
>> 10:44:42.000000000 +0100
>> +++ buildroot/package/directfb/Config.in	2008-08-12 11:58:15.000000000
>> +0100
>> @@ -1,19 +1,34 @@
>>  config BR2_PACKAGE_DIRECTFB
>>  	bool "directfb"
> ...snip...
>> diff -urN buildroot.orig/package/directfb/directfb.mk
>> buildroot/package/directfb/directfb.mk
>> --- buildroot.orig/package/directfb/directfb.mk	2008-08-13
>> 10:44:42.000000000 +0100
>> +++ buildroot/package/directfb/directfb.mk	2008-08-13 11:33:17.000000000
>> +0100
>> @@ -3,27 +3,65 @@
>>  # directfb
>>  #
>>  #############################################################
>> -#DIRECTFB_VERSION:=0.9.25.1
> ...snip...
>> +	$(if $(BR2_PACKAGE_DIRECTFB_MULTI), linux-fusion) \
>> +	$(TARGET_DIR)/usr/lib/libdirectfb.so
>>  
>>  directfb-clean:
>>  	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR)
>> uninstall
>> 
> 
> Thanks Daniel,
> 
> I tried to apply this patch to the latest svn but it failed.  I then
> tried to do it manually but this line fails:
>   cp -R package/directfb/overlay$(DIRECTFB_VERSION)/* $(DIRECTFB_DIR)
> 
> Are you working against the buildroot repository or a fork?
> 
> Cheers
> 
> __
> Ormund
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
View this message in context: http://www.nabble.com/Building-Cairo-using-DirectFB-tp18927643p19102617.html
Sent from the BuildRoot mailing list archive at Nabble.com.
