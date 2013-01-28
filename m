From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 28 Jan 2013 09:47:13 +0100
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <5105ABE8.70409@mind.be>
References: <510550FA.10502@relinux.de> <5105ABE8.70409@mind.be>
Message-ID: <51063B11.7050502@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.01.2013 23:36, schrieb Arnout Vandecappelle:
> On 27/01/13 17:08, Stephan Hoffmann wrote:
>> Hello all,
>>
>> buildroot provides direct calls to the configuration menus for busybox
>> and linux:
>>
>> make linux-menuconfig
>> make busybox-menuconfig
>>
>> Additionally, there is a linux-savedefconfig make target.
>>
>> All these save their output in the build directory, so that all changes
>> get lost when "make clean" is called. Thus I don't think that I am the
>> only one who has been surprised to notice that "make busybox-menuconfig
>> && make clean && make" does not have any effect on busybox's
>> configuration.
>
>  This is a bit a philosophical discussion: should the configuration
> files of linux, busybox, etc. be considered part of the buildroot
> configuration or not? In the former case, they should survive a 'make
> clean', in the latter case they should be removed by 'make clean'.
Hello Arnout,

this is the inconsistency I am pointing to. On the one hand, some
"initial" config for Linux, Busybox and so on are needed. On the other
hand, buildroot provides means to tweak these config files so the
tweaked ones should at least be usable.

"make xconfig && make clean && make" is the general workflow for
tweaking buildroot with the option to leave out "make clean" if one
knows that it isn't needed.

"make busybox-xconfig && make clean & make" just does nothing.

There are undocumented xxx-update-config make targets around, but these
replace the config files stored in the packet directories and thus have
a "make savedefconfig && cp defconfig configs/xxx-defconfig" semantic
neaning that in case messing up the config only git helps to get out
since the original config files are gone.
>
>  I tend to agree that the package configs should be considered part of
> the buildroot config. However, if your buildroot config specifies some
> BR2_PACKAGE_BUSYBOX_CONFIG, then I would expect that after 'make
> clean', that is the config that will be used. 
What is your workflow when tweaking Linux or busybox configuration for a
given project?

My treferred workflow would be:

make xxx-defconfig
do one of
    make xconfig
    make linux-xconfig
    make busybox-xconfig
    make clean
    make
    tweak script to finalize filesysten
until the system works as expected
make savedefconfig
save buildroot, busybox and linux config files to a project-specific place

> More generically, I expect I can do:
>
>  make foo_defconfig
>  Do all kinds of weird stuff that completely messes things up
>  make clean
>  make
In this case you end up with changes in buildroot's config preserved and
all others discarded. Last but not least "make clean" is not only needed
after messing things up, but also, for example, when switching some
system application from busybox to the generic version or vice versa.
>
> and to be back in the same state as 'make foo_defconfig; make'.
That would be the case with my patches.

>
>  Bottom line: I tend to say no to this patch.
>
>
>> I have prepared two patches that save these config files in $(TOPDIR),
>> where buildroot's own config file lives. After "make clean", these files
>> are used instead of those named in the buildroot config.
>
>  buildroot's own config lives in $(CONFIG_DIR).
That's right, thank you. I missed this and will correct my parches.

Regards

Stephan
>
>
>  Regards,
>  Arnout
>
>> Calling "make xxx-defconfig" removes the saved config files, so that
>> again the configuration from buildroot's config file is used.
>>
>> The same issue appears with uClibc, ct-ng and probably others, but I do
>> not think that many users modify these settings.
>>
>> If these patches get accepted I will update the documentation, too.
>>
>> Kind regards
>>
>> Stephan
>>
>
>
