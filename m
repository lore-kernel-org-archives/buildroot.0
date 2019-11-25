From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 25 Nov 2019 17:48:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/systemd: set systemd generators
 instalation as optional choice
In-Reply-To: <6c9fb6a2-aa2d-5179-5478-ef2530d6f1ee@grinn-global.com>
References: <20191117113345.159653-1-b.bilas@grinn-global.com>
 <20191117113345.159653-2-b.bilas@grinn-global.com>
 <2c37cf4c-b2db-027b-1511-f0581a84fffe@mind.be>
 <CAFvCimXzP4TeBhPGzFcDHtd4ZeXwVkf8AoPH3dgze8_o7RCe7g@mail.gmail.com>
 <6c9fb6a2-aa2d-5179-5478-ef2530d6f1ee@grinn-global.com>
Message-ID: <CAFvCimWg5K3mEjR+--+0FPasxQaGdEYwpaj76tEfYTiXHO942Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't understand that remark...

generators are run at every boot and also when "systemctl daemon-reload" is
called
They have nothing to do with the machine-id or the firstboot logic...

Le lun. 25 nov. 2019 ? 17:44, Bartosz Bilas <b.bilas@grinn-global.com> a
?crit :

> Hello guys,
> On 17.11.2019 16:06, J?r?my ROSEN wrote:
>
> overall I'm not very keen on adding options for the various generators...
>
> there are special case where you want to get rid of a specific generator,
> but it's really special and probably better done in a post-image script
>
> detailed answers below
>
> Le dim. 17 nov. 2019 ? 15:12, Arnout Vandecappelle <arnout@mind.be> a
> ?crit :
>
>>
>>
>> On 17/11/2019 12:33, Bartosz Bilas wrote:
>> > Allow the user to choose which systemd generator should be installed
>> > on the target instead of installing all of them by default.
>> > That's usefull in case of when someone is using firstboot condition
>>          useful
>>
>> > and doesn't want to have e.g getty services created automatically during
>> > system boot by systemd-getty-generator. Set them enabled by default to
>> > keep compatibility with old builds.
>> >
>> > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> > ---
>> >  package/systemd/Config.in  | 94 ++++++++++++++++++++++++++++++++++++++
>> >  package/systemd/systemd.mk | 56 +++++++++++++++++++++++
>> >  2 files changed, 150 insertions(+)
>> >
>> > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>> > index fadc1a32c8..052b69f4de 100644
>> > --- a/package/systemd/Config.in
>> > +++ b/package/systemd/Config.in
>> > @@ -112,6 +112,100 @@ config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>> >       default "x64"   if BR2_x86_64
>> >       depends on BR2_PACKAGE_SYSTEMD_BOOT
>> >
>> > +menu systemd-generators
>>
>>  I don't like adding submenus. Instead, I'd just do it with a comment.
>>
>>  However, doesn't all this depend on BR2_PACKAGE_SYSTEMD_FIRSTBOOT? In
>> that
>> case, it could be done with a condition just under that option and the
>> generators would be indented. Although, maybe they don't only get
>> executed on
>> firstboot...
>>
>>
> No... generators are a core feature of systemd, it's not related to
> first-boot in any way that I know
>
>
>
>>  So, then I'd move this section to the end of Config.in, and use a comment
>> instead of a menu.
>>
>> > +config BR2_PACKAGE_SYSTEMD_DEBUG_GENERATOR
>> > +     bool "systemd debug generator"
>> > +     default y
>>
>>  Although this one should default y for backward compatibility, I'm of a
>> mind to
>> change the default here. It doesn't sound like something you want to have
>> on by
>> default.
>>
>>
> Despite its name, this is not a debug tool, but more of a rescue tool. It
> allows you to get a shell back on a
> very broken system, or to prevent a unit from starting from the
> kernel-command-line
>
> This should really be here all the time except on very specific use-cases,
> I don't think making it optional
> is a good idea
>
>
>> > +     help
>> > +       systemd-debug-generator is for enabling a runtime debug
>> > +       shell and masking specific units at boot.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-debug-generator.html
>> > +
>> > +config BR2_PACKAGE_SYSTEMD_FSTAB_GENERATOR
>> > +     bool "systemd fstab generator"
>> > +     default y
>> > +     help
>> > +       systemd-fstab-generator is a generator that translates
>> > +       /etc/fstab into native systemd units early at boot
>> > +       and when configuration of the system manager is reloaded.
>> > +       This will instantiate mount and swap units as necessary.
>>
>>  Makes me realize that we probably shouldn't have an fstab in
>> skeleton-init-systemd...
>>
>> fstab is supported in systemd and it is not a deprecated feature.
> It is the recommended way to automatically mount filesystems at boot.
>
> this one is really fundamental, and should really not be removed. lots of
> things might break.
>
> there are a couple of reasons to use .mount units instead (and the
> fstab-generator simply
> creates .mount units from /etc/fstab) but in the common case you are
> supposed to use /etc/fstab
>
> so again, I don't think this is a good idea.
>
>
>
>
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-fstab-generator.html
>> > +
>> > +config BR2_PACKAGE_SYSTEMD_GETTY_GENERATOR
>> > +     bool "systemd getty generator"
>> > +     default y
>> > +     help
>> > +       systemd-getty-generator is a generator that automatically
>> > +       instantiates serial-getty at .service on the kernel
>> > +       console(s), if they can function as ttys and are not
>> > +       provided by the virtual console subsystem. It will also
>> > +       instantiate serial-getty at .service instances for
>> > +       virtualizer consoles, if execution in a virtualized
>> > +       environment is detected.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-getty-generator.html
>> > +
>>
>
> That one could be made optional, since it's about runtime-detection of the
> right way to start a getty
> (i.e figure out if the console is a serial tty, a normal tty, or a
> vconsole) and in the embedded case
> we usually know what we have
>
> note that it means manually enabling a service instead... which is
> probably harder
>
> but otoh, it's typically very small and it does "the right thing" most of
> the time. So again, probably a
> better fit for a post-image script
>
>
>
>> > +config BR2_PACKAGE_SYSTEMD_GPT_AUTO_GENERATOR
>> > +     bool "systemd gpt auto generator"
>> > +     default y
>>
>>  For this one, I also doubt that we want to have this default on.
>>
>>
> That one can probably be made optional, yes... it saves 34k approximately
>
>
>> > +     help
>> > +       systemd-gpt-auto-generator is a unit generator that
>> > +       automatically discovers root, /home/, /srv/, the EFI
>> > +       System Partition, the Extended Boot Loader Partition and
>> > +       swap partitions and creates mount and swap units for them,
>> > +       based on the partition type GUIDs of GUID partition tables
>> > +       (GPT). It implements the Discoverable Partitions
>> > +       Specification.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-gpt-auto-generator.html
>> > +
>> > +config BR2_PACKAGE_SYSTEMD_RC_LOCAL_GENERATOR
>> > +     bool "systemd rc local generator"
>> > +     default y
>>
>>  Same here. It's pretty useless in Buildroot context.
>>
>>
> this one is already conditional to compiling sysV backward compatibility
> support...
> which i think is always on in buildroot (neet to double-check that)
>
> I think having an option to enable/disable sysV support would be more
> generic and more useful
>
>
>> > +     help
>> > +       systemd-rc-local-generator is a generator that checks
>> > +       whether /etc/rc.local exists and is executable,
>> > +       and if it is pulls the rc-local.service unit into the
>> > +       boot process.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-rc-local-generator.html
>> > +
>> > +config BR2_PACKAGE_SYSTEMD_RUN_GENERATOR
>> > +     bool "systemd run generator"
>> > +     default y
>> > +     help
>> > +       systemd-run-generator is for invoking commands specified
>> > +       on the kernel command line as system service.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-run-generator.html
>> > +
>>
>
> This one could be optional... it's very usefull for containers, less for
> full-blown systems
>
>
>> > +config BR2_PACKAGE_SYSTEMD_SYSTEM_UPDATE_GENERATOR
>> > +     bool "systemd system update generator"
>> > +     default y
>> > +     help
>> > +       systemd-system-update-generator is a generator that
>> > +       automatically redirects the boot process to
>> > +       system-update.target, if /system-update exists.
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-system-update-generator.html
>> > +
>>
>
> this one could be optional
>
>
>> > +config BR2_PACKAGE_SYSTEMD_SYSV_GENERATOR
>> > +     bool "systemd sysv generator"
>> > +     default y
>> > +     help
>> > +       systemd-sysv-generator is a generator that creates wrapper
>> > +       .service units for SysV init scripts in /etc/init.d/* at
>> > +       boot and when configuration of the system manager is
>> > +       reloaded. This will allow systemd(1) to support them
>> > +       similarly to native units/
>> > +
>> > +
>> https://www.freedesktop.org/software/systemd/man/systemd-system-update-generator.html
>> > +
>> > +endmenu
>> > +
>>
>
> Again, i'd rather have a generic way to disable the sysV support at
> compile time...
>
>
>
>
> Ok so overall, I think most generators should stay in and only one or two
> should be made optional...
> Sorry for the negative feedback, but I don't like adding complex
> compilation options that are not supported
> upstream, especially when all generators together wait 272k on my debian
>
> Until we don't decide about the installation machine-id file that patch
> doesn't make any sense due to the impossibility to run those generators at
> all.
>
> Best
> Bartek
>
>
> The few that could legitimately be made optional are easy enough to remove
> in a post-image that I'm not sure
> it's worth the trouble
>
> i'd be ok for a patch doing that, though, but only for the few ones that
> are worth it...
>
> Cheers
> Jeremy
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
>

-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191125/91bcc1e9/attachment.html>
