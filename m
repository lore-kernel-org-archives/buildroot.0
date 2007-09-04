From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 5 Sep 2007 00:23:58 +0200
Subject: [Buildroot] [buildroot 0001485]: DirectFB: Download site
	moved	and x11 always required
In-Reply-To: <1188944157.11158.24.camel@aeglos.sweden.atmel.com>
References: <17ac266d02db25430f714153df726c4e@busybox.net>
	<1188944157.11158.24.camel@aeglos.sweden.atmel.com>
Message-ID: <20070904222358.GC11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 05, 2007 at 12:15:57AM +0200, Ulf Samuelsson wrote:
>tis 2007-09-04 klockan 13:59 -0700 skrev bugs at busybox.net:
>> A NOTE has been added to this issue. 
>> ====================================================================== 
>> http://busybox.net/bugs/view.php?id=1485 
>> ====================================================================== 
>> Reported By:                HappyCactus
>> Assigned To:                buildroot
>> ====================================================================== 
>> Project:                    buildroot
>> Issue ID:                   1485
>> Category:                   Architecture Specific
>> Reproducibility:            always
>> Severity:                   minor
>> Priority:                   normal
>> Status:                     assigned
>> ====================================================================== 
>> Date Submitted:             09-04-2007 08:03 PDT
>> Last Modified:              09-04-2007 13:59 PDT
>> ====================================================================== 
>> Summary:                    DirectFB: Download site moved and x11 always
>> required
>> Description: 
>> The directFB main site has removed the 1.0.0 version.
>> Now 1.0.1 is the current stable version.
>> Also, configure do not specify either --enable-x11 or --disable-x11, so
>> that x11 is always required to compile the package.
>> Working patch attached.
>> ====================================================================== 
>> 
>> ---------------------------------------------------------------------- 
>>  bernhardf - 09-04-07 13:59  
>> ---------------------------------------------------------------------- 
>> +ifeq ($(BR2_PACKAGE_XORG7),y)
>> +DIRECTFB_X := --enable-x11
>> +else
>> +DIRECTFB_X := --disable-x11
>> +endif
>> +
>> This is not really accurate:
>> If BR2_PACKAGE_XSERVER_none is y, then disable-x11, else --enable-x11.
>> 
>> Please send patches to the mailing list and only add them to the
>> bugtracker if it is not applied (or explicitely rejected) within a
>> reasonable amount of time, TIA 
>
>
>I will try this:
>
>Index: package/directfb/directfb.mk
>===================================================================
>--- package/directfb/directfb.mk        (revision 19784)
>+++ package/directfb/directfb.mk        (arbetskopia)
>@@ -5,7 +5,7 @@
> #############################################################
> #DIRECTFB_VERSION:=0.9.25.1
> #DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
>-DIRECTFB_VERSION:=1.0.0
>+DIRECTFB_VERSION:=1.0.1
> DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
> DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
> DIRECTFB_CAT:=$(ZCAT)
>@@ -18,6 +18,11 @@
> DIRECTFB_MULTI:=
> DIRECTFB_FUSION:=
> endif
>+ifeq ($(BR2_PACKAGE_XSERVER_none),y)
>+DIRECTFB_X := --disable-x11
>+else
>+DIRECTFB_X := --enable-x11
>+endif

whitespace, please.
> 
> $(DL_DIR)/$(DIRECTFB_SOURCE):
>        $(WGET) -P $(DL_DIR) $(DIRECTFB_SITE)/$(DIRECTFB_SOURCE)
>@@ -55,6 +60,7 @@
>                --with-gfxdrivers=cle266,unichrome \
>                --enable-shared \
>                $(DIRECTFB_MULTI) \
>+               $(DIRECTFB_X) \
>                --enable-jpeg \
>                --enable-png \
>                --enable-linux-input \

Sounds fine to me, please go ahead, Ulf.
PS: didn't look but what does directfb unconditionally enable jpeg? png
may be ok, although i wouldn't force it. And the gfx-drivers should imho
be configurable via the menu and not hardcoded.
