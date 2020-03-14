From: Andreas Naumann <dev@andin.de>
Date: Sat, 14 Mar 2020 21:58:24 +0100
Subject: [Buildroot] [PATCH v6 05/28] package/qwt: Partially convert to
 qmake infra
In-Reply-To: <20200311221930.4fde6032@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-6-anaumann@ultratronik.de>
 <20200311221930.4fde6032@windsurf>
Message-ID: <1e9bd1b8-2f83-62e1-5f9a-ac880f1482a4@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 11.03.20 22:19, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Feb 2020 22:23:27 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> -define QWT_CONFIGURE_CMDS
>> +define QWT_PRE_CONFIGURE_CMD
>>   	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
>> -	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
>>   endef
>>   
>> -define QWT_BUILD_CMDS
>> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> -endef
>> +QWT_PRE_CONFIGURE_HOOKS += QWT_PRE_CONFIGURE_CMD
> 
> PRE_CONFIGURE_CMD is not a great name of a hook, as it doesn't say what
> it does. So I renamed to QWT_TWEAK_QWTCONFIG_PRI, and applied.

Sounds better, yes.

> 
> Also, why can this package use INSTALL_ROOT in a "normal" way, i.e
> INSTALL_ROOT=$(STAGING_DIR) and INSTALL_ROOT=$(TARGET_DIR) ?

I guess the qwt project does not install anything in host so there's no 
need for us to separate the host from the target files. Which is why we 
cant use the INSTALL_ROOT method for other qt modules (and keep things 
generic).
I didnt entirely understand the additional modification in the staging 
install so just kept the install steps as is. Looking into it now I see 
a 'rm -Rf $(TARGET_DIR)/usr/mkspecs' in the target install which makes 
my assumption above invalid. So yes, maybe the install steps could be 
simplified by using the new pkg-qmake method.

best regards,
Andreas




> 
> Best regards,
> 
> Thomas
> 
