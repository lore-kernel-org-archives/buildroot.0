From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 25 Oct 2009 14:52:04 +0100
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
 toolchain
In-Reply-To: <878wf0zgn5.fsf@macbook.be.48ers.dk>
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk>
	<1256413962.28475.115.camel@coalu.atr>
	<878wf0zgn5.fsf@macbook.be.48ers.dk>
Message-ID: <1256478724.28475.134.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 24 octobre 2009 ? 22:22 +0200, Peter Korsgaard a ?crit :
> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
> 
>  Lionel> First let me argue that when buildroot is not using an external
>  Lionel> toolchain, the $(STAGING_DIR)/bin and $(STAGING_DIR)/usr/bin
>  Lionel> paths are a part of the TARGET_PATH variable.
> 
> Hmm, you're right - what a mess. There's no good reason why these should
> be different in the regard.
> 
>  Lionel> The script returns paths relative to the host. This is going to
>  Lionel> be a problem when linking the webkit binaries because the
>  Lionel> linker will have to deal with host binaries... That's the same
>  Lionel> kind of problem we are fixing with the libtool patch.
> 
> Yes, but copying the script from staging to host shouldn't change that.

Yeah, that an idea. I don't which one is the cleanest.

> 
>  Lionel> I'm wondering whether adding the following to package/webkit/webkit.mk
>  Lionel> should fix the problem :
> 
>  Lionel> WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config
> 
> If the webkit configure script handles that (didn't check), then that
> would certainly be the easiest/cleanest solution.
> 

Ok, I just tested it and it works.

So the next step would probably be to remove $(STAGING_DIR)/bin and
$(STAGING_DIR)/usr/bin from the TARGET_PATH with source built
toolchains, but I'm pretty sure it's going to break some other packages.

Please find a patch as attachment.

Regards,


-- 
Lionel Landwerlin <llandwerlin@gmail.com>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-Set-icu-config-path.patch
Type: text/x-patch
Size: 748 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091025/02848f92/attachment.bin>
