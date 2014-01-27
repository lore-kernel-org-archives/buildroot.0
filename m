From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 07:53:59 +0100
Subject: [Buildroot] Post build script issue
In-Reply-To: <CAHKzcEOSork9JxSZWsef6m1wmPrZ2z1jEQqaig=LFkysgzqvNg@mail.gmail.com>
References: <CAHKzcEOSork9JxSZWsef6m1wmPrZ2z1jEQqaig=LFkysgzqvNg@mail.gmail.com>
Message-ID: <52E60287.7020305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/01/14 09:23, Waldemar Rymarkiewicz wrote:
> Hi,
>
> Recently, I've tried to use post-script feature and found an issue,
>
> I created foo.sh with 755 mode and configured buildroot to use this
> post-script. However, make failed with the message:
>
>  >>>   Executing post-image script foo.sh
> /bin/bash: foo.sh: command not found
>
> It's because post-script is called in Makefile just by the name assuming
> that the . directory is in your PATH.
>
> target-post-image:
> @$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
> $(call MESSAGE,"Executing post-image script $(s)"); \
> ---->>> $(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>
>
> Therefore, I added '.' dir to my PATH and ran make again. Again I got an
> error.
>
> "You seem to have the current working directory in your PATH environment
> variable. This doesn't work.
> make: *** [core-dependencies] Error 1"
>
> How does it work for you?
>
> Don't you think the Makefile should call the script this way:
>
> -               $(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
> +               $(USER_HOOKS_EXTRA_ENV) ./$(s) $(TARGET_DIR) $(call
> qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))

  ./$(s) is a bad idea since it will break the case when the script is an 
absolute path. But maybe $(abspath $(s)) works?

  Regards,
  Arnout


>
>
> Let me know I will prepare a patch.
>
> Thanks,
> /Waldek
>
>
>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
