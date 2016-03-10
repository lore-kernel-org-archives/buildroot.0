From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 9 Mar 2016 21:22:07 -0300
Subject: [Buildroot] [PATCH v2] libglib2: improve dev file removal
In-Reply-To: <20160309174749.46cf1ea0@free-electrons.com>
References: <1457541577-21773-1-git-send-email-gustavo@zacarias.com.ar>
 <20160309174749.46cf1ea0@free-electrons.com>
Message-ID: <56E0BE2F.9020202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/16 13:47, Thomas Petazzoni wrote:

> Seems better, at least I understand. There is one minor point I don't
> entirely like is that you make an assumption on the ordering of the
> install target hooks calls.
>
> Therefore, I think I would have preferred:
>
> ifneq ($(BR2_PACKAGE_GDB),y)
> define LIBGLIB2_REMOVE_GDB_FILES
>          rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
> endef
> endif
>
> define LIBGLIB2_REMOVE_DEV_FILES
> 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
> 	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext schemas)
> 	$(LIBGLIB2_REMOVE_GDB_FILES)
> 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
> 	...
> endef
>
> But it's really a minor point, and somewhat pedantic, I admit, so I'm
> also fine with your patch as-is.
>
> Best regards,
>
> Thomas

Hi.
This requires some refinement which i stumbled upon when testing 
gsettings, the schema sources itself (xml files) aren't required, 
however some programs (not yet submitted) require the compiled result, 
which is normally /usr/share/glib-2.0/schemas/gschemas.compiled
But, we don't handle that at all, so it won't work either way.
I'll add the post-processing hook for this to work properly and resend 
both the cleanup plus the compile, which will likely be via host 
glib-compile-schemas from staging schemas (which will require some 
packages to enable staging install).
Regards.
