From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 14:17:26 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
 package/Makefile.in so it exists globally.
In-Reply-To: <20160217094715.19c767b3@free-electrons.com>
References: <20160216161010.779981bb@free-electrons.com>
 <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
 <20160216213554.60f53246@free-electrons.com> <56C3A41B.7070200@mind.be>
 <CAM+bi4t1R+Dd_aF_OHV_MeGRHyFi3PZD5kfwmCqcYtWK=bvS3A@mail.gmail.com>
 <20160217094715.19c767b3@free-electrons.com>
Message-ID: <56D1A1E6.7020601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/16 09:47, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 17 Feb 2016 09:22:48 +0100, Alvaro Gamez wrote:
> 
>> Well, I've been reviewing the original thread (
>> http://lists.busybox.net/pipermail/buildroot/2015-June/130347.html) in
>> order to write a good commit and I've just realized that this patch wasn't
>> in fact written by me, it was written by Thomas in respones to my
>> inquiries, so I think the Signed-off-by line should in fact belong to him,
>> not me. Sorry I took over that, it wasn't my intention.
> 
> Aaah, yes, now I remember.
> 
> The savedefconfig target looks like:
> 
> savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>         @$(COMMON_CONFIG_ENV) $< \
>                 --savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>                 $(CONFIG_CONFIG_IN)
>         @$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
> 
> So it uses the $(SED) variable.
> 
> However, this savedefconfig targets is implemented *outside* of the
> ifeq ($(BR2_HAVE_DOT_CONFIG),y) condition, but the inclusion of
> package/Makefile.in (which defines the SED variable) is only done
> inside the ifeq ($(BR2_HAVE_DOT_CONFIG),y).
> 
> So when you start from scratch and do "make menuconfig savedefconfig",
> BR2_HAVE_DOT_CONFIG is not defined, so package/Makefile.in is not
> included.
> 
> Define SED in the main Makefile is a quick work-around.
> 
> However, it will only fix this specific problem, and I believe if you do:
> 
> 	make menuconfig savedefconfig all
> 
> With the aim of starting the build right after the menuconfig, then it
> will still not work for other reasons.
> 
> I see two possible directions here:
> 
>  1. We decide to really separate targets that can "create" the
>     configuration from the other targets, and in this case, savedefconfig
>     should be defined inside the BR2_HAVE_DOT_CONFIG condition. Which
>     means that "make menuconfig savedefconfig" would no longer work,
>     and you would have to do "make menuconfig" and then "make
>     savedefconfig".
> 
>  2. We decide that all targets should be available at all times, and
>     get rid of this BR2_HAVE_DOT_CONFIG. However, I don't see how this
>     can work since if you do "make menuconfig all", then at the time of
>     "menuconfig", the .config doesn't exist, so it cannot be included
>     by the main Makefile, and therefore when the "all" target will be
>     processed, we won't have all the BR2_* make variables defined.
> 
> So I believe (2) doesn't work, and we should instead go with (1).
> 
> Arnout, what do you think? In addition, I think it would be good t In addition, I think it would be good to  In addition, I think it would be good to o 

 I agree we should go for (1).

 However, this doesn't completely stop the 'make menuconfig savedefconfig': once
a .config file exists, you can still do that. But it could have some funky side
effects (not that I can think of any right away, but it feels a bit iffy). So I
think it would be good to enforce that all the noconfig_targets can only be
called on their own on the command line. This would block completely silly
things like 'make menuconfig defconfig' (it would also block potentially valid
things like 'make foo_defconfig menuconfig', but I think adding an extra '&&
make' in the middle of that is not so painful).


 Regarding (2), it is probably not impossible, because make has this second-pass
mechanism. When you include a makefile (like we do for .config), and that file
is the target of some rule that gets triggered, then all the makefiles will be
re-read after that rule has been executed (but this happens only once, to avoid
infinite recursion). So you could add something like:

.config: $(filter $(noconfig_targets),$(MAKECMDGOALS))
	@:

to re-read the .config. However, I think that's very fragile, difficult to
understand, and not so much added value.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
