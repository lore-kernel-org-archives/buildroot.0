From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Mar 2018 09:05:41 +0100
Subject: [Buildroot] [PATCH 1/1] Main Makefile Have "make savedefconfig"
 show where the file is being written to.
In-Reply-To: <87efl3h4pi.fsf@dell.be.48ers.dk>
References: <20180227112818.6766-1-chrismcc@gmail.com>
 <dd0ef897-7b93-4c58-6f6f-a33e33f4e28a@mind.be>
 <87efl3h4pi.fsf@dell.be.48ers.dk>
Message-ID: <eb26582e-f1fe-d7eb-1494-efbeb52733b3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-18 22:21, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 27-02-18 12:28, Christopher McCrory wrote:
>  >> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>  >> ---
>  >> Makefile | 1 +
>  >> 1 file changed, 1 insertion(+)
>  >> 
>  >> diff --git a/Makefile b/Makefile
>  >> index ec39bcdb9c..4ac2435a9c 100644
>  >> --- a/Makefile
>  >> +++ b/Makefile
>  >> @@ -927,6 +927,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
>  >> --savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  >> $(CONFIG_CONFIG_IN)
>  >> @$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
>  >> +	@echo "Saved to $(DEFCONFIG)"
> 
>  >  If BR2_DEFCONFIG is not set, you'll get "Saved to " which is a bit weird. So
>  > change into:
> 
>  > 	@echo "Saved to $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)"
> 
>  >  But now $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) is used 3
>  > times, so perhaps it's worth adding a variable for it. I can't think of a good
>  > name for it unfortunately.
> 
> Perhaps we could just set DEFCONFIG to $(CONFIG_DIR)/defconfig if empty?

 I looked at that, but in the 'make defconfig' rule we have to be able to
distinguish between BR2_DEFCONFIG is set or not. Since BR2_DEFCONFIG may come
out of the .config file, it may or may not be quoted. That's why we need to use
the qstrip'ed version DEFCONFIG in the condition.

 This stuff is complicated :-) It's one of these examples where, when I started
adding the feature, I thought "this is trivial" but then the real world kicks in.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
