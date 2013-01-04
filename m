From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 4 Jan 2013 15:17:42 +0100
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50E6BFE2.2090405@zacarias.com.ar>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
Message-ID: <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan, Gustavo, all,

2013/1/4 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 01/03/2013 07:09 PM, Stefan Fr?berg wrote:
>
>> +define DIVINE_STAGING_DIVINE_CONFIG_FIXUP
>> +     $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
>> +     $(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
>> +endef
>> +
>> +DIVINE_POST_INSTALL_STAGING_HOOKS += DIVINE_STAGING_DIVINE_CONFIG_FIXUP
>> +
>
> This could be handled in a generic way for all the packages that ship a
> *-config file.
> Something like:
>
> DIVINE_CONFIG_FIXUP = divine-config
>
> And then do the generic sed magic in package/pkg-generic.mk
> How about that?

We quickly talked about this during the last Buildroot Dev. Days.

IIRC, Thomas and Peter were not very fond of this kind of solution.
(guys, feel free to correct me if I speak with my ass ;)).

btw, afaics:
- *-config provided by the imagemagick package wrap some calls to pkg-config;
- many packages in BR install handwritten scripts like this, as well
as some *.pc files.
So what about just use pkgconf since it's properly handled in BR?
(I agree it may mean patching many packages that only search for
*-config scripts)
- in this patch serie, only libgcrypt does not provide a *.pc file :-(

Regards,

-- 
Samuel
